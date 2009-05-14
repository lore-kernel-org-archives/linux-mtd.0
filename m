Received: from n23a.bullet.mail.mud.yahoo.com ([68.142.207.189])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4e2L-0007RP-QL
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 16:44:08 +0000
From: David Brownell <david-b@pacbell.net>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH 1/2] NAND: Adding new ECC mode - NAND_ECC_HW_OOB_FIRST for
	TI DaVinci devices
Date: Thu, 14 May 2009 09:43:57 -0700
References: <1241663350-20416-1-git-send-email-nsnehaprabha@ti.com>
	<200905130203.36445.david-b@pacbell.net>
	<7A436F7769CA33409C6B44B358BFFF0C01135C316D@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C01135C316D@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200905140943.57738.david-b@pacbell.net>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 14 May 2009, Narnakaje, Snehaprabha wrote:
> > > @@ -2678,6 +2723,17 @@ int nand_scan_tail(struct mtd_info *mtd)
> > >     case NAND_ECC_HW3_512:
> > >     case NAND_ECC_HW3_256:
> > 
> > You should reissue the patch against current GIT code.  Those two
> > constants are long gone.
> 
> OK. I am assuming it is linux-mtd next.

Yes, pattch against linux-mtd next.  Those constants are
leftovers from the MVL 2.6.10 code, which should get
removed from the DaVinci tree.
