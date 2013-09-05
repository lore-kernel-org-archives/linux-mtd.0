Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHScT-0008QQ-CA
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2013 06:00:41 +0000
Message-ID: <52281E4B.5030901@freescale.com>
Date: Thu, 5 Sep 2013 14:01:47 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309041600.37107.marex@denx.de>
 <20130905024145.GA5913@gmail.com> <201309041638.52680.marex@denx.de>
 <522755DC.4000301@digi.com>
In-Reply-To: <522755DC.4000301@digi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>,
 "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8804=E6=97=A5 23:46, Hector Palacios =E5=86=
=99=E9=81=93:
> Dear Marek,
>
> On 09/04/2013 04:38 PM, Marek Vasut wrote:
>> Dear Huang Shijie,
>>
>>> On Wed, Sep 04, 2013 at 04:00:36PM +0200, Marek Vasut wrote:
>>>> Dear Huang Shijie,
>>>> How come hector was then able to write his JFFS2 partition ?
>>>
>>> If he uses the gpmi, he should not write the JFFS2, since the gpmi
>>> does not support the jffs2. He will get the failure in the end.
>>
>> Hector, can you comment on this?
>
> I don't think I'm following these comments. The facts are:
> 1) A JFFS2 filesystem image written with nandwrite (mtd-utils v1.5.0)
> a) does not mount on kernel v3.10
> b) mounts OK on linux-next kernel (v3.12) with the patchset [1] from=20
> Huang
> (actually I didn't use linux-next but instead a v3.10 where I merged=20
> all the commits done to MTD in linux-next, which are a lot).
>
> 2) A JFFS2 filesystem image written with U-Boot v2013.01
> a) mounts OK on old FSL kernel 2.6.35
> b) does not mount on kernel v3.10 (neither on v3.8, I believe).
> c) does not mount on linux-next with the patchset [1]
The gpmi driver in FSL kernel 2.6.35 is different from the linux-next or=20
linux v3.10.

We have abandoned the old gpmi driver, and we use the same gpmi code in=20
current FSL kernel.

Since we swtich to the upstream gpmi code, and it could not support the=20
jffs2,

and that's why you mount always failed.


>
> [1]=20
> http://lists.infradead.org/pipermail/linux-mtd/2013-August/048360.html
>
> Marek, could you please confirm 2b on your side, just in case I'm=20
> doing anything wrong in my custom U-Boot?
>
>
>>>>> So the jffs2 support is compatiable all the time.
>>>>
>>>> Is the old Freescale 2.6.35 GPMI NAND format compatible with the one
>>>> after applying this patchset?
>>>
>>> Not compatible.
>>>
>>> This patch set is still underreview.
>>
>> So this patch breaks compatiblity with FSL kernel release? This needs=20
>> fixing,
>> otherwise it's impossible to do a drop-in replacement for the ancient=20
>> FSL
>> kernel.
>>
>>>>>> that I could mount with Linux 3.7 and earlier?
>>>>>
>>>>> I think the mount can be succeeded.
>>>>
>>>> Ok, does that mean that we need this patchset in U-Boot in order to
>>>> properly write JFFS2 onto GPMI NAND there? Is that the message you
>>>> wanted to relay to us?
>>>
>>> Besides this patchset, the u-boot needs more patches to sync with the
>>> kernel mtd code. Such as the full-id features.
>>
>> Can you elaborate on this more? This is very vague, I would like to=20
>> know what
>> exactly is missing.
>
92a2645 mtd: add 4 Toshiba nand chips for the full-id case
ec6e87e mtd: add the support to parse out the full-id nand type
f22d5f6 mtd: add new fields to nand_flash_dev{}

2febcdf mtd: gpmi: set the BCH's geometry with the ecc info
d1048aa mtd: add the ecc info for some full-id nand chips
5721934 mtd: parse out the ECC info for the full-id nand chips
2dc0bdd mtd: add ECC info for nand_flash_dev{}
e2985fc mtd: replace the hardcode with the onfi_feature()
6dcbe0c mtd: get the ECC info from the Extended Parameter Page
5b40db6 mtd: add a helper to get the supported features for ONFI nand
5138a98 mtd: add data structures for Extended Parameter Page
10c86ba mtd: get the ECC info from the parameter page for ONFI nand
4cfeca2 mtd: add datasheet's ECC information to nand_chip{}

> Yes, please, we need more details. This seems to be related with how=20
> the MTD drivers (in Linux and in U-Boot) access the OOB area to store=20
> the JFFS2 cleanmarkers, right?
>
> The error I'm receiving from the kernel is at fs/jffs2/wbuf.c
>
> if (!oinfo || oinfo->oobavail =3D=3D 0) {
> pr_err("inconsistent device description\n");
> return -EINVAL;
> }
Before apply the patches above, the gpmi will use all the oob, so=20
"oinfo->oobavail =3D=3D 0" becomes true.

After apply the patches, the gpmi will not use all the oob for the ONFI=20
SLC nand or the full-id nand,
and it can supports the jffs2 when you apply the other SLC/MLC patchset.


thanks
Huang Shijie
