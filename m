Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKN0b-0007vf-4r
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 05:00:53 +0000
Received: by ggnk1 with SMTP id k1so3898674ggn.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 22:00:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F86416B.4090501@freescale.com>
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>
 <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
 <4F86416B.4090501@freescale.com>
Date: Tue, 17 Apr 2012 22:00:46 -0700
Message-ID: <CAN8TOE_yhvB+xnyS_UZn0ko+QySFZJsYBk5w0PB_O37eZaQj9g@mail.gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 11, 2012 at 7:43 PM, Huang Shijie <b32955@freescale.com> wrote:
>> On Mon, Apr 9, 2012 at 7:56 PM, Huang Shijie<b32955@freescale.com> =A0wr=
ote:
>>>
>>> =A0drivers/mtd/nand/nand_base.c | =A0 43
>>> ++++++++++++++++++++++++++++++++++++++++++
>>> =A01 files changed, 43 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
>>> index 6315b94..8997023 100644
>>> --- a/drivers/mtd/nand/nand_base.c
>>> +++ b/drivers/mtd/nand/nand_base.c
>>> @@ -3028,6 +3028,49 @@ static struct nand_flash_dev
>>> *nand_get_flash_type(struct mtd_info *mtd,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->erasesize =3D (128 =
* 1024)<<
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(((extid=
>> =A01)& =A00x04) | (extid& =A00x03));
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busw =3D 0;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (id_data[0] =3D=3D NAND_MFR_HYN=
IX&& =A0id_data[1] =3D=3D
>>> 0xd7) {
>>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Calc pagesize */
>>
>> I'm not sure this is the beset heuristic. Hynix could easily make a
>> larger chip that has the same decoding table, so we probably shouldn't
>> compare dev_id =3D=3D 0xD7. It actually seems like the decoding table
>> might be intended for all Hynix MLC. What do you think about the
>> following condition?
>>
>> + =A0 =A0 =A0 } else if ((chip->cellinfo& =A0NAND_CI_CELLTYPE_MSK)&&
>> id_data[0] =3D=3D NAND_MFR_HYNIX) {
>
> I am afraid this can not solve the problem.
> The HY27UT088G2M whose id_data[2] is 0x14 DOES not follow your code.
> Please check the datasheet of HY27UT088G2M. ( I ever emailed to you.)
>
> The same issue exits in H627UW08CGFM too.

Ah yes, I overlooked this. My proposal was a bit off-the-cuff. Thanks
for the data sheets, BTW. I need to integrate them into my master
table (and submit them to mtd-www) so that I check them whenever I'm
looking at new Hynix support.

Now that I've given them all a second read, it really looks like this
new Hynix chip actually follows no discernible pattern, which seems to
suggest that we have to know all the chip parameters in order to know
which ID decode table to use...but if we know all the parameters, then
why do we need the table?? (Just being devil's advocate) If I had
samples of all the chips, perhaps I could test some to determine other
patterns, like ID wraparound behavior, but I doubt it...

So really, I'd be interested in asking Hynix (and Toshiba and probably
Samsung, for that matter): what do you expect software developers to
do when you provide datasheets with useless ID decode tables? Are we
supposed to read your mind to determine which chips are supposed to
follow a given decode table?

But seriously: let me know if you have better insight into how to
associate this table with a set of chip IDs. Otherwise, I might as
well finish adding an 8-byte ID table and adding this one chip
manually.

>> BTW, I actually have some patches queued up that I need to complete
>> properly, where I'm trying to clean up and update NAND detection a
>> little. So I basically have this same patch, but rebased on top of
>> some other changes I have ready... I don't mind taking a revised
>> version of yours, or I can try to clean up my series and send it out
>> soon.
>>
> I hope you send it out as soon as possible. :)

I'm trying, but I get very busy with other things :)

Anyway, I'm not very comfortable with the heuristics for this Hynix
decode method, so I don't want to post another patch for it yet. If it
helps, I can submit the other patches soon; they amount to mostly
cleanup (IMO). But at least that way, whoever works on NAND detection
in the near future has the same code base.

Brian
