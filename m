Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYj26-0007kE-LP
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 18:17:11 +0000
Received: by vxd3 with SMTP id 3so3008965vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 11:17:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
	<0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
	<F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
Date: Mon, 20 Jun 2011 14:17:07 -0400
Message-ID: <BANLkTinG8_Lb1GjdVJXmMtQzA=5fNS-S+Q@mail.gmail.com>
Subject: Re: NAND OOB data.
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 20, 2011 at 1:53 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wro=
te:
>
> Okay, so how do I (without the luxury of u-boot), in user or
> kernel space, wipe the OOB data? =A0I'm looking at the code for
> u-boot nand_erase_nand right now. =A0I mean, I'm not above writing
> an userspace app that will do kernel level work for me. =A0I'm okay
> with using /dev/mem and screwing with stuff. =A0Am I on the right
> track? =A0I mean, I hate to go down this road if I'm just heading
> for a dead-end.
>

If you don't have U-Boot, it sounds like you need a Linux equivalent
to U-Boot's "nand scrub" command.  A quick search yields this:

http://patchwork.ozlabs.org/patch/65406/

Then I guess you'd need to set the corresponding flag in your
mtd-utils when doing flash_eraseall.

--=20
Matthew L. Creech
