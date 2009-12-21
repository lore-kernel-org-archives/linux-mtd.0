Received: from [213.115.205.20] (helo=gw1.transmode.se)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NMlEU-0007gS-PT
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 16:35:47 +0000
In-Reply-To: <OF63BC8AF9.696ABE45-ON65257693.00540662-65257693.00577600@lntemsys.com>
References: <OF63BC8AF9.696ABE45-ON65257693.00540662-65257693.00577600@lntemsys.com>
Subject: Re: Trying to reduce booting time with JFFS2 summary.
To: Dhinakaran K <Dhinakaran.K@Lntemsys.com>
Message-ID: <OFD91999A2.82AB1C2B-ONC1257693.005A58BD-C1257693.005AEF17@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 21 Dec 2009 17:33:14 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Prashant Alange <Prashant.Alange@Lntemsys.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Dhinakaran K <Dhinakaran.K@Lntemsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Hi ALL,
>         I'm trying to reduce linux booting time, using JFFS2 block summary
> option, but unfortunately unable to do so. Below is description of my
> setup and test procedure. Please comment / suggest.
>
> SETUP:
>         Processor       :       MPC8313e
>         OS              :       linux-2.6.20  (Freescale-LTIB

You probably got too old kernel, I submitted an optimisation some time ago
that optimised scanning of empty blocks. Before that optimisation it was
slower to mount an nearly empty FS than it was to mount a almost full FS.

Summary didn't help me either and summary might slow your
mount down as it cannot make nodes obsolete on flash.

    Jocke
