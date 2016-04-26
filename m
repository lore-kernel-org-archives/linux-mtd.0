Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxIJ-0008Iv-Am
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:20:27 +0000
Subject: Re: [U-Boot] Porting Linux's MTD/NAND changes into U-Boot
To: hs@denx.de, Tom Rini <trini@konsulko.com>
References: <20160425164314.15c3fc94@bbrezillon>
 <20160425173646.GM3732@bill-the-cat> <571EFA04.4000803@denx.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Scott Wood <oss@buserror.net>, u-boot@lists.denx.de,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Scott Wood <scottwood@freescale.com>, Alexander Kaplan <alex@nextthing.co>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <571F16A1.70800@nod.at>
Date: Tue, 26 Apr 2016 09:20:01 +0200
MIME-Version: 1.0
In-Reply-To: <571EFA04.4000803@denx.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.04.2016 um 07:17 schrieb Heiko Schocher:
> Also, as the UBI/UIFS case may show, it is not always a trivial job
> to do such a sync, as concepts in Linux changes ...

While we are at it, how do you QA?
Did you ever port port UBI or MTD tests to u-boot and let them run?
Maybe there are more issues hidden which didn't came up in quick "builds and boots a kernel" tests. ;-)
As you offer the full UBI and UBIFS feature sets advanced users may get surprised.

Thanks,
//richard
