Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N7RIC-0005WJ-Qt
	for linux-mtd@lists.infradead.org; Mon, 09 Nov 2009 10:16:17 +0000
Received: by bwz4 with SMTP id 4so3286877bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Nov 2009 02:16:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790910300142q6062c47p935ae967955f89f@mail.gmail.com>
References: <ce9ab5790910292320x2eef0550pdc3fde5d616ea361@mail.gmail.com>
	<ce9ab5790910300142q6062c47p935ae967955f89f@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 9 Nov 2009 15:45:50 +0530
Message-ID: <ce9ab5790911090215q7a626f8v6159a97dc70265c5@mail.gmail.com>
Subject: Re: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver
To: Artem Bityutskiy <dedekind1@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,
I just saw you have taken 2nd patch from this series to your tree .
Could you please be able to maintain this full series?

Tony,
You may want to look into 1st and 2nd patch in this series.

-vimal

On Fri, Oct 30, 2009 at 2:12 PM, Vimal Singh <vimal.newwork@gmail.com> wrot=
e:
> Looping Linux-omap mailing list.
>
>
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Fri, 30 Oct 2009 11:34:14 +0530
> Subject: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver
>
> This patch series addresses some of the issues in omap nand driver.
>
> Vimal Singh (3):
> =A0Fixing compilation warning for 'nand/omap2.c'
> =A0NAND: OMAP: Fixing omap nand driver, compiled as module
> =A0NAND: OMAP: Simplifying HWECC and removing unnecessary macros
>
> =A0drivers/mtd/nand/omap2.c | =A0315 ++++++++++++++++--------------------=
----------
> =A01 files changed, 108 insertions(+), 207 deletions(-)
>
> --
> Regards,
> Vimal Singh
>
