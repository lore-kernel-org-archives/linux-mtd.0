Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cjGT-0002hG-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 08:35:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02021809481101.00860@thomas> 
References: <02021809481101.00860@thomas>  <02021712440204.08654@thomas> <21587.1013966739@redhat.com> <02021720360705.08654@thomas> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 & NAND 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Feb 2002 08:46:27 +0000
Message-ID: <11512.1014021987@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

gleixner@autronix.de said:
> Would it be ok to use a CONFIG option to tell the chip device driver
> which  OOB configuration to use ?

switch(mtd->ecctype) ?


--
dwmw2
