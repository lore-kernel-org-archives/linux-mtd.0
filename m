Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BThBd-0004ZP-Jf
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 09:14:14 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200405281244.57973.tglx@linutronix.de>
References: <1085737289.5617.3.camel@adh>
	<200405281227.34312.tglx@linutronix.de> <1085740962.5617.9.camel@adh>
	<200405281244.57973.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1085750049.26119.198.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 28 May 2004 14:14:10 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large flash concatenation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-05-28 at 12:44 +0200, Thomas Gleixner wrote:
> The snapshot is outdated due to the same reason. I'm building one and putting 
> it somewhere for download.

The snapshots stopped working because CVS doesn't handle pserver on
IPv6. Anonymous CVS access is now done over SSH:

	export CVS_RSH=`which ssh`
	cvs -d :ext:anoncvs@cvs.infradead.org:/home/cvs co mtd

The snapshots should be up to date again starting from tonight's.

-- 
dwmw2
