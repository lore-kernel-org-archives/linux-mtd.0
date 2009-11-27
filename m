Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDvOX-0008J8-8F
	for linux-mtd@lists.infradead.org; Fri, 27 Nov 2009 07:37:38 +0000
Subject: Re: [PATCH-v6 0/4] OMAP: Adding flash support to SDP, ZOOM2 and
	LDP boards
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790911240725x29b8bd6eq9f9c7a8b21c6786e@mail.gmail.com>
References: <63751.192.168.10.88.1252582264.squirrel@dbdmail.itg.ti.com>
	<ce9ab5790909251957t5598e4efq765f86420426392e@mail.gmail.com>
	<ce9ab5790910260507y2d0067dk1c12f0439c6fe5d7@mail.gmail.com>
	<ce9ab5790911040328p215dede2v37db38a966a5bbd5@mail.gmail.com>
	<20091109205250.GB23952@atomide.com>
	<ce9ab5790911100201j6b1ef5e1g43a992b00e69ade4@mail.gmail.com>
	<ce9ab5790911190608r5b7e8226j3546714957ce70e6@mail.gmail.com>
	<1259075173.29118.20.camel@localhost>
	<ce9ab5790911240725x29b8bd6eq9f9c7a8b21c6786e@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Nov 2009 09:37:21 +0200
Message-Id: <1259307441.7518.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Linux MTD <linux-mtd@lists.infradead.org>, vimal singh <vimalsingh@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-24 at 20:55 +0530, Vimal Singh wrote:
> On Tue, Nov 24, 2009 at 8:36 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2009-11-19 at 19:38 +0530, Vimal Singh wrote:
> >> Here is the v6 of this patch series. I am cc'ing mtd list too this time.
> >>
> >>
> >> From 8bc97108cf9c78216f1ea5407ccbd900e6b63dc2 Mon Sep 17 00:00:00 2001
> >> From: Vimal Singh <vimalsingh@ti.com>
> >> Date: Thu, 19 Nov 2009 19:28:11 +0530
> >>
> >> This patch series adds flash support for NAND (in sdp, zoom and ldp),
> >> OneNAND and NOR (in sdp)
> >>
> >> Tested on Zoom2 and 3430SDP
> >>
> >> Vimal Singh (4):
> >> [PATCH-v6 1/4] OMAP2/3: Add support for flash on SDP boards
> >> [PATCH-v6 2/4] OMAP3: Add support for NAND on ZOOM/LDP boards
> >> [PATCH-v6 3/4] OMAP: Zoom2: Enable NAND and JFFS2 support in defconfig
> >> [PATCH-v6 4/4] OMAP: 3430SDP: Enable NAND in defconfig
> >
> > Is it possible to separate the MTD and OMAP parts?
> 
> 1st patch does migration of gpmc low level calls from omap2.c to gpmc-nand.c.
> I am not sure how we can have separate patches for this.

Ok. It looks like you intend to merge this stuff via linux-omap, which
seems right.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
