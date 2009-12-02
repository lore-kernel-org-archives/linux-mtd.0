Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NFpu8-0005wv-VD
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 14:10:11 +0000
Received: by bwz4 with SMTP id 4so199529bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Dec 2009 06:10:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1259307441.7518.6.camel@localhost>
References: <63751.192.168.10.88.1252582264.squirrel@dbdmail.itg.ti.com>
	<ce9ab5790909251957t5598e4efq765f86420426392e@mail.gmail.com>
	<ce9ab5790910260507y2d0067dk1c12f0439c6fe5d7@mail.gmail.com>
	<ce9ab5790911040328p215dede2v37db38a966a5bbd5@mail.gmail.com>
	<20091109205250.GB23952@atomide.com>
	<ce9ab5790911100201j6b1ef5e1g43a992b00e69ade4@mail.gmail.com>
	<ce9ab5790911190608r5b7e8226j3546714957ce70e6@mail.gmail.com>
	<1259075173.29118.20.camel@localhost>
	<ce9ab5790911240725x29b8bd6eq9f9c7a8b21c6786e@mail.gmail.com>
	<1259307441.7518.6.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 2 Dec 2009 19:39:42 +0530
Message-ID: <ce9ab5790912020609i8af0444l54e695f85ea89ba2@mail.gmail.com>
Subject: Re: [PATCH-v6 0/4] OMAP: Adding flash support to SDP, ZOOM2 and LDP
	boards
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Linux MTD <linux-mtd@lists.infradead.org>, vimal singh <vimalsingh@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> >> From 8bc97108cf9c78216f1ea5407ccbd900e6b63dc2 Mon Sep 17 00:00:00 2001
>> >> From: Vimal Singh <vimalsingh@ti.com>
>> >> Date: Thu, 19 Nov 2009 19:28:11 +0530
>> >>
>> >> This patch series adds flash support for NAND (in sdp, zoom and ldp),
>> >> OneNAND and NOR (in sdp)
>> >>
>> >> Tested on Zoom2 and 3430SDP
>> >>
>> >> Vimal Singh (4):
>> >> [PATCH-v6 1/4] OMAP2/3: Add support for flash on SDP boards
>> >> [PATCH-v6 2/4] OMAP3: Add support for NAND on ZOOM/LDP boards
>> >> [PATCH-v6 3/4] OMAP: Zoom2: Enable NAND and JFFS2 support in defconfig
>> >> [PATCH-v6 4/4] OMAP: 3430SDP: Enable NAND in defconfig
>> >

I am going to re-post this patch series again and this time I have
divided this into 3 (for more convenience in reviewing) . Something
like this:

1st series:
This patch series will introduce generic gpmc-nand.c for nand device
related gpmc init.

2nd series:
This patch series will introduce 'board-sdp-flash.c', for flash
devices init on SDP
boards. And will give an example of using 'gpmc-nand.c' and
'board-sdp-flash.c' by
adding flash support to 3430SDP board.

3rd:
This series introduces 'board-zoom-flash.c' for NAND init in ZOOM boards.
Other patches will add NAND support for ZOOM2, ZOOM3 and LDP.

Tony,
Is it ok with you?

-- 
Regards,
Vimal Singh
