Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178yN3-0007c4-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 08:11:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000d01c1fded$191704e0$5116933e@g9p8w1> 
References: <000d01c1fded$191704e0$5116933e@g9p8w1> 
To: "Olivier ERIBON" <olivier.eribon@free.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand flash driver problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 18 May 2002 08:11:11 +0100
Message-ID: <10635.1021705871@redhat.com>
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

You don't get an error when you try to overwrite the flash - you just set 
bits which were a 1 to 0. We don't keep track of writes.

You'd need to provide the full debug output of JFFS while you're writing 
and subsequently reading the file which got corrupted -- and you'd have to 
find someone who still cares about JFFS1 to look at it. Or switch to JFFS2.

--
dwmw2
