Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1ByVTz-0000Uv-71
	for linux-mtd@lists.infradead.org; Sat, 21 Aug 2004 09:00:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: xuelu@xuelu.org
In-Reply-To: <001c01c48739$b268e140$0600a8c0@fujitsu>
References: <001c01c48739$b268e140$0600a8c0@fujitsu>
Content-Type: text/plain
Message-Id: <1093092820.11658.719.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Sat, 21 Aug 2004 14:53:40 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Hello,About jffs2 on NAND,on S3C2410
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-08-21 at 06:45, xuelu@xuelu.org wrote:
> I am using Samsung SMDK S3C2410 with one 64MB SM card,MIZI linux, Linux
> version 2.4.18-rmk7-pxa1 with jffs2 compiled in.Now I meet one problem of
> erase jffs2 filesystem on SM card.
> I use vivi to part the SM card as the same size above and specify
> the "data" to jffs2:
> I cvs the recently source code,cross-compiled the util dir in the
> mtd's source tree.

1. We don't know anything about MIZI Linux and vivi
2. 2.4.18 is a kernel from the last century and more than obsolete
3. MTD utils in current CVS have evolved over time. So it's rather
expected that they wont work with old and obsolete code.

Use a up to date and supported kernel.

tglx
