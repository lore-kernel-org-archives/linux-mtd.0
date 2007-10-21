Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IjVsZ-0002FA-Eu
	for linux-mtd@lists.infradead.org; Sun, 21 Oct 2007 09:09:49 +0100
Date: Sun, 21 Oct 2007 10:08:40 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH] Replace -1 with -EBADMSG in nand error correction code
In-Reply-To: <20071020111344.GF32465@lazybastard.org>
Message-ID: <alpine.LFD.0.9999.0710211007080.22770@localhost.localdomain>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
	<20071020111126.GE32465@lazybastard.org>
	<20071020111344.GF32465@lazybastard.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-503832793-1192954122=:22770"
Cc: David Woodhouse <dwmw2@infradead.org>, Matt Reimer <mreimer@vpop.net>,
	linux-mtd@lists.infradead.org, mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-503832793-1192954122=:22770
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sat, 20 Oct 2007, Jörn Engel wrote:

> Magic numerical values are just bad style.  Particularly so when
> undocumented.

Please resend with a proper Signed-off-by.
Please add my Acked-by as well.

Thanks,

	tglx
--8323328-503832793-1192954122=:22770--
