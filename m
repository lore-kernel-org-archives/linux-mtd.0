Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T22i-0007Wa-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 14:36:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C4D77FE.CCAC1B9F@cerberus.ch> 
References: <3C4D77FE.CCAC1B9F@cerberus.ch> 
To: Daniel Zwirner <daniel.zwirner@cerberus.ch>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Problem with MTD + RPXLite 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 Jan 2002 14:47:51 +0000
Message-ID: <25792.1011710871@redhat.com>
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

daniel.zwirner@cerberus.ch said:
> Last[2] is 198520ff, datum is 19852003 
> Write clean marker to block at 0x003c0000 failed: -5

One of your flash chips isn't accepting the write commands. Can you erase 
it and write to use directly through the /dev/mtd devices, of from the 
bootloader? Is is protected or is Vpen missing?


--
dwmw2
