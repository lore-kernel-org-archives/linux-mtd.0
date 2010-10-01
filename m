Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1Tmd-0003V5-3r
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 00:47:31 +0000
Received: by qyk31 with SMTP id 31so774757qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 17:47:30 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285829792.11684.47.camel@localhost>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
	<1285822785.11684.11.camel@localhost>
	<AANLkTimzVA06P8GR4Gy_2PSFDXKnzTOHPj2qr+_X__zw@mail.gmail.com>
	<1285825735.11684.22.camel@localhost>
	<AANLkTi=E6qy2sBq1thXMUWfxSbCuNZDUOmmGT8o0j0hW@mail.gmail.com>
	<1285826499.11684.24.camel@localhost>
	<AANLkTin0Fxd+oSEMNNc6zdNusJUUPRaZ1vgPR1vvThXi@mail.gmail.com>
	<1285829792.11684.47.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 30 Sep 2010 20:47:09 -0400
Message-ID: <AANLkTi=n8UC7OWdugvRAQgtK=1VVf80hgWDo5d3HfH0i@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd-utils: new memory wrappers
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 30, 2010 at 02:56, Artem Bityutskiy wrote:
> On Thu, 2010-09-30 at 02:18 -0400, Mike Frysinger wrote:
>> nice: use -ffunction-sections -fdata-sections -Wl,--gc-sections.
>> additional advantage of saving space across all linked in library code
>> and not just common.h stuff.
>
> Sorry, I never dealt with -ffunction-sections stuff, I do not know the
> price of this, so I basically cannot judge. But of course removing
> unused code is a good thing to do. So you seem to be more competent in
> these question, just go ahead with you nice cleanups!

i get nice results even now with these options.

total shrinkage in bytes: 103298(.text) 1344(.data) 128(.bss)

individual totals:
docfdisk -42 -16
doc_loadbios -42 -16
flashcp -34 -8
flash_erase -4746 -32
flash_info -42 -16
flash_lock -42 -16
flash_otp_dump -42 -16
flash_otp_info -34 -16
flash_unlock -42 -16
ftl_check -42 -16
ftl_format -42 -16
jffs2dump -34 -16
mkfs.jffs2 -1466 -32
mkfs.ubifs -5106 -24
mtd_debug -66 -16
nanddump -34 -16
nandtest -66 -16
nandwrite -34 -32 -32
nftldump -34 -16 -32
nftl_format -42 -16
recv_image -914 -16 -32
rfddump -34 -16
rfdformat -34 -16
serve_image -2770 -16 -32
sumtool -66 -32
ubirsvol -5514 -80
ubicrc32 -1794 -56
mtdinfo -14298 -88
ubimkvol -5258 -72
ubiupdatevol -7986 -80
ubinize -1866 -48
ubirename -6586 -72
ubidetach -9842 -80
ubirmvol -6170 -72
ubiformat -15018 -56
ubinfo -5002 -88
ubiattach -8114 -88
-mike
