Received: from na3sys009aog104.obsmtp.com ([74.125.149.73])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9czq-0007kG-5S
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 12:47:07 +0000
Received: by vxb41 with SMTP id 41so5542190vxb.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 05:47:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DA41687.30702@denx.de>
References: <1302372335-30232-1-git-send-email-sbabic@denx.de>
	<1302372335-30232-6-git-send-email-sbabic@denx.de>
	<BANLkTi=e7Zsk6maA_-O4j7mf_VzeRsPT=w@mail.gmail.com>
	<4DA41687.30702@denx.de>
Date: Tue, 12 Apr 2011 08:47:00 -0400
Message-ID: <BANLkTimgheyvmn6wN0of3CYGYA_ZN-SAWg@mail.gmail.com>
Subject: Re: [PATCH 6/6] EA20: do not use subpage write for NAND
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Stefano Babic <sbabic@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Jon Povey <jon.povey@racelogic.co.uk>,
	Sandeep Paulraj <s-paulraj@ti.com>, u-boot@lists.denx.de,
	linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 12, 2011 at 5:08 AM, Stefano Babic <sbabic@denx.de> wrote:
> Ben Gardiner wrote:
>> Thanks for sharing this patch -- I have been using the "-O 2048" (VID
>> header offset) option to prevent subpages here.
>
> Yes, this works too, at least with Linux.

(being picky / for archival purposes) In u-boot, specifying the VID
header offset as an argument to the ubi attach command -- i.e. 'ubi
part <mtd_partition> 2048' -- also works (on da850evm, at least).


> [...]
>> First let me say that I would be happy to have a fix for this merged
>> -- so I think the change is "good enough" since it makes UBI work
>> without specifying a VID header offset equal to the NAND page size.
>> What follows is more topical musings that any particular criticisms
>> that should be considered blockers of your patch.
>>
>> I'm wondering about the long-term path for davinci NAND and subpage writ=
es...
>>
>> But the sentiment I've heard about adding an exception to
>> NAND_CHIPOPTIONS_MSK as above is that we are mixing features of the
>> NAND chip and features of the NAND controller (If you have a modern
>> SLC NAND then your chip probably supports subpage writes whereas it is
>> the controller that needs to be limited).
>
> That is true. With this patch I constrained the SLC NAND on my board to
> be considered as MLC, as a MLC NAND cannot be accessed in subpage mode.
>
> However, I set also a CONFIG_SYS_NAND_NO_SUBPAGE, and instead of
> dropping the option in the mask we could protect the code where the
> option is checked. In other words, we could change nand_base.c in this wa=
y:
>
> #ifndef CONFIG_SYS_NAND_NO_SUBPAGE
> =A0 =A0 =A0 =A0if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
> =A0 =A0 =A0 =A0 =A0 =A0!(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch(chip->ecc.steps) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 2:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->subpage_sft =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 4:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 8:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 16:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->subpage_sft =3D 2;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> #endif
>
> Then it could be clearer that the restriction is due to the NAND
> controller, and not to the chip itself.

I agree -- it keeps the chip and controller options separated.

>> What's more is that the davinci nand controller could do subpage
>> writing if the writing operation were informed of the extents of the
>> subpage being written instead of being handed a buffer with 0xFF in
>> the non-target page areas. Which, I believe is Artem's primary
>> motivation for the introduction of nand_write_subpage() to the davinci
>> NAND controller driver [2].
>
> Well, of course, if the davinci NAND can handle subpages, we can remove
> the limitation. What do you think to add this patch in the way I suggest
> now (without touching NAND_CHIPOPTIONS_MSK, that makes the MTD
> inconsistent with Linux) until a subpage_write is added to davinci ?

Yes, I like the way your proposed changes disabled subpage
initialization instead of adding an exception to the chip options
mask. I'm still OK with merging a patch to disable subpage writes on
da850 -- as an interim solution. i.e. until a subpage_write is added
to the mtd subsystem, and davinci-nand has an override and u-boot gets
a similar change.

>> So if the nand_write_subpage family of functions was introduced to the
>> Linux kernel instead of adding another exception to
>> NAND_CHIPOPTIONS_MSK then we would have 3 ways to use UBI on davinci
>> NAND:
>> 1) no patch: VID offset <page size> required
>> 2) chip NAND_NO_SUBPAGE_WRITE patch
>> 3) subpage writes support with nand_write_subpage()
>>
>> systems with 2) or 3) could always use UBI as in 1) and a UBI volume
>> made with 2) would need to be attached as in 1) on systems with 2) or
>> 3) ; but a UBI volume made with 3) could not be used on systems with
>> 1) or 2) which means that we could not make use of the efficiency
>> benefits of nand_write_subpage() if/when it is available on systems
>> which need access to UBI from U-boot.
>
> I agree with your analyses. As personal feeling, solution one has the
> drawback that it cannot be used in u-boot, and it seems to me very easy
> to have a wrong UBI on the target. We can consider 2) as temporary
> solution, until 3) is available.

Thanks for confirming, Stefano.

I'm not intimately familiar with the ea20 so there could be additional
quirks in the way -- but I can say that option 1) works in u-boot on
the da850evm (+UI board). I use 'ubi part ubi_part 2048' -- ubi_part
is the mtdpart name of my ubi part :)

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
