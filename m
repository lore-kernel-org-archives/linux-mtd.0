Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBgJi-0004dR-EF
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2005 16:44:39 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Sergei Sharonov <Sergei.Sharonov@Halliburton.com>
In-Reply-To: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
References: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
Content-Type: text/plain
Date: Wed, 16 Mar 2005 22:44:33 +0100
Message-Id: <1111009473.4814.128.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: failed write verify causes segmentation fault
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-03-15 at 19:09 -0600, Sergei Sharonov wrote:

> mtd-snapshot-20050123

Bad luck. 

The problem causing your BUG() was fixed on 
Mon Jan 24 21:24:15 2005 UTC 
in MTD CVS. Please update to current CVS Head

tglx
