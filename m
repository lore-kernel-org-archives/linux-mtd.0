Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMt7F-0005fq-Dm
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 03:42:06 +0000
Received: by lagy4 with SMTP id y4so1250536lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2012 20:42:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120424152855.28df673d@pixies.home.jungo.com>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <1335212069-7450-2-git-send-email-computersforpeace@gmail.com>
 <20120424152855.28df673d@pixies.home.jungo.com>
Date: Tue, 24 Apr 2012 20:42:02 -0700
Message-ID: <CAN8TOE-QLYH27tfizj9TNPQun7dFB8ZGbuzxixxdrDgCs1K4yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: add 'use_oob' argument to NAND
 {read,write}_page interfaces
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, prabhakar@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shmulik,

On Tue, Apr 24, 2012 at 5:28 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> BTW I think you missed one API convertion in gpmi-nand.c: there's a
> call to 'chip->ecc.write_page_raw' not ported.

You're right. Thanks.

> (still not completely happy with my suggestion, as the boolean
> approach is not that elegant as you previously noted...)

I agree, but it seems like the primary alternative (using a 'uint8_t
*oob' parameter) necessitates many hacks such that 'oob' is mostly
reduced to a boolean. So I think I'll try to make the best of a
boolean, since we need *some* solution.

> On Mon, 23 Apr 2012 13:14:28 -0700 Brian Norris <computersforpeace@gmail.=
com> wrote:
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index eb88d8b..c4989b5 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -1066,12 +1066,13 @@ EXPORT_SYMBOL(nand_lock);
>> =A0 * @mtd: mtd info structure
>> =A0 * @chip: nand chip info structure
>> =A0 * @buf: buffer to store read data
>> + * @use_oob: caller expects OOB data read to chip->oob_poi
>> =A0 * @page: page number to read
>> =A0 *
>> =A0 * Not for syndrome calculating ECC controllers, which use a special =
oob layout.
>> =A0 */
>> =A0static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip =
*chip,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int =
page)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, bool=
 use_oob, int page)
>> =A0{
>> =A0 =A0 =A0 chip->read_buf(mtd, buf, mtd->writesize);
>> =A0 =A0 =A0 chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>
> Why don't you adapt 'nand_read_page_raw' (and others) to use the
> 'use_oob' hint?

I think this was because (a) I wasn't really sure what *all* users of
nand_read_page_raw, etc., expected from ecc.read_page_raw, etc., and
(b) I mostly need this patch series for a out-of-tree driver that
doesn't use the nand_base nand_ecc_ctrl functions :)

With proper usage of the 'use_oob' parameter, I think we can be
reasonably sure for (a)...but I'm still fearing random bugs. For
instance, is there any sort of hardware that expects the whole page +
OOB to be read via chip->read_buf() for all reads (note that
nand_read_page_raw may be used for NAND_ECC_HW)?

And (b) is kind of anti-open-source; if I want the interface change
for my driver, it should work reasonably well for others!

> Do you plan to?

Maybe. I find it a little difficult to sort through all the different
functions because as we've seen so far, different users expect
different results from the ecc.read_page, etc., interfaces. I can make
an effort at adapting each of the driver functions, but I'm never 100%
sure of the exact expected behavior without knowing more of the
hardware that uses them... The nand_base.c functions at least might be
manageable.

So I especially don't want to hack at the drivers that I can't build
or test. If there are obvious changes, I might submit a patch with the
prerequisite that someone can give a Tested-by or similar.

> IMO having a parameter called 'use_oob', but not using the parameter
> value is very confusing.
>
> Maybe we need an indication that states "hey, you may skip filling the
> oob_poi if you don't want to, that's okay (but if you'd like to fill
> it for your own purposes, it's okay too)"...
> More of a 'oob_must_be_read' or 'oob_expected' for the read case (and
> 'oob_must_be_written' or 'oob_was_placed' for write).
>
> (tried to come-up with better names, no success ;-)

I'm not sure about the naming. I thought 'use_oob' was better than
'has_oob'. I also was working for name that:

(1) could be used for both read and write
(2) wasn't too long

If I ignore (1) and add in:

(3) an indication that "you may skip filling the oob_poi if you don't
want to" (only when the boolean is false)

then I might come up with something like:

for 'read' functions: oob_expected
for 'write' functions: oob_provided

Or maybe something that hits all (1)-(3): oob_required. Then, saying
"oob_required =3D false" doesn't mean that you *can't* use oob_poi.

>> =A0static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chi=
p *chip,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, =
int page)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, =
bool use_oob, int page)
>> =A0{
>> =A0 =A0 =A0 int i, eccsize =3D chip->ecc.size;
>> =A0 =A0 =A0 int eccbytes =3D chip->ecc.bytes;
>> @@ -1139,7 +1142,7 @@ static int nand_read_page_swecc(struct mtd_info *m=
td, struct nand_chip *chip,
>> =A0 =A0 =A0 uint8_t *ecc_code =3D chip->buffers->ecccode;
>> =A0 =A0 =A0 uint32_t *eccpos =3D chip->ecc.layout->eccpos;
>>
>> - =A0 =A0 chip->ecc.read_page_raw(mtd, chip, buf, page);
>> + =A0 =A0 chip->ecc.read_page_raw(mtd, chip, buf, use_oob, page);
>
> Should pass 'true' instead of 'use_oob'.
> That's because 'nand_read_page_swecc' later uses 'chip->oob_poi' and
> expects it to be read.
> (relevant for few other calls, e.g. nand_write_page_swecc)

Right, thanks. By "few other calls," did you mean that only
nand_write_page_swecc and nand_read_page_swecc were relevant? I didn't
find any others I missed that were used the same way.

> BTW you used 'bool', however convention for some other boolean parameters
> around nand_base.c is 'int'.
> (no preference, just like things consistent)

For reference, are the instances of 'int sndcmd' the only cases of
int-used-as-boolean that you found? bool is clearer IMO, but for the
sake of consistency I can switch. But now I just noticed docg4.c and
denali.c use 'bool'...

Thanks for the review.

Brian
