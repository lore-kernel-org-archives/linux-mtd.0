Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=amd.ucw.cz)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FNoBc-0005BZ-OV
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 10:38:58 +0100
Date: Mon, 27 Mar 2006 11:38:15 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20060327093815.GB14344@elf.ucw.cz>
References: <20060326122504.GI4053@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060326122504.GI4053@stusta.de>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] drivers/mtd/mtdcore.c: less PROC_FS=n #ifdef's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Ne 26-03-06 14:25:04, Adrian Bunk wrote:
> I'm surprised that kill-ifdefs-in-mtdcorec.patch in -mm that removes
> #ifdef's for the PROC_FS=n case wasn't tested with PROC_FS=n...

Sorry for that, I somehow assumed it was trivial and did not test it
properly.
								Pavel

-- 
Picture of sleeping (Linux) penguin wanted...
