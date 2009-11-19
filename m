Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NB7xz-0003kJ-GG
	for linux-mtd@lists.infradead.org; Thu, 19 Nov 2009 14:26:40 +0000
Received: by bwz4 with SMTP id 4so2758824bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Nov 2009 06:26:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B055493.70009@ti.com>
References: <63751.192.168.10.88.1252582264.squirrel@dbdmail.itg.ti.com>
	<ce9ab5790909251957t5598e4efq765f86420426392e@mail.gmail.com>
	<ce9ab5790910260507y2d0067dk1c12f0439c6fe5d7@mail.gmail.com>
	<ce9ab5790911040328p215dede2v37db38a966a5bbd5@mail.gmail.com>
	<20091109205250.GB23952@atomide.com>
	<ce9ab5790911100201j6b1ef5e1g43a992b00e69ade4@mail.gmail.com>
	<ce9ab5790911190608r5b7e8226j3546714957ce70e6@mail.gmail.com>
	<ce9ab5790911190611r63830a5dxa7e2eab5f053c2a7@mail.gmail.com>
	<4B055493.70009@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 19 Nov 2009 19:56:14 +0530
Message-ID: <ce9ab5790911190626w6f726f3cle61e703a7c3cfd42@mail.gmail.com>
Subject: Re: [PATCH-v6 0/4] OMAP: Adding flash support to SDP, ZOOM2 and LDP
	boards
To: Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Linux MTD <linux-mtd@lists.infradead.org>, "Singh,
	Vimal" <vimalsingh@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2009 at 7:52 PM, Nishanth Menon <nm@ti.com> wrote:
> Vimal Singh had written, on 11/19/2009 08:11 AM, the following:
> [...]
>
>>>
>>> v4-v5:
>>> [PATCH-v5 1/4] OMAP2/3: Add support for flash on SDP boards:
>>> Implemented Tony's comments.
>>
>> =A0arch/arm/configs/omap_3430sdp_defconfig =A0 =A0 =A0| =A0140 +++++++--=
--
>> =A0arch/arm/configs/omap_zoom2_defconfig =A0 =A0 =A0 =A0| =A0344
>> +++++++++++++++++++-------
>
> how about zoom3 and sdp3630?

I do not have these boards. Could someone test for these and drop a
patch for same?

>
>> =A0arch/arm/mach-omap2/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A08 +
>> =A0arch/arm/mach-omap2/board-2430sdp.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +
>> =A0arch/arm/mach-omap2/board-3430sdp.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +
>> =A0arch/arm/mach-omap2/board-ldp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02=
 +
>> =A0arch/arm/mach-omap2/board-sdp-flash.c =A0 =A0 =A0 =A0| =A0315
>> +++++++++++++++++++++++
>> =A0arch/arm/mach-omap2/board-zoom-flash.c =A0 =A0 =A0 | =A0 92 +++++++
>> =A0arch/arm/mach-omap2/board-zoom-peripherals.c | =A0 =A02 +
>> =A0arch/arm/mach-omap2/gpmc-nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0128 +=
+++++++++
>> =A0arch/arm/plat-omap/include/plat/board-sdp.h =A0| =A0 15 ++
>> =A0arch/arm/plat-omap/include/plat/board-zoom.h | =A0 36 +++
>> =A0arch/arm/plat-omap/include/plat/gpmc.h =A0 =A0 =A0 | =A0 =A04 +-
>> =A0arch/arm/plat-omap/include/plat/nand.h =A0 =A0 =A0 | =A0 =A06 +
>> =A0drivers/mtd/nand/omap2.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 33 +--
>> =A015 files changed, 969 insertions(+), 160 deletions(-)
>> =A0create mode 100644 arch/arm/mach-omap2/board-sdp-flash.c
>> =A0create mode 100644 arch/arm/mach-omap2/board-zoom-flash.c
>> =A0create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
>> =A0create mode 100644 arch/arm/plat-omap/include/plat/board-sdp.h
>> =A0create mode 100644 arch/arm/plat-omap/include/plat/board-zoom.h
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> Regards,
> Nishanth Menon
>



--=20
Regards,
Vimal Singh
