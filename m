Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qI7z-0001zZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 18:26:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203271816.g2RIGSB30367@thomas.tec.autronix.de> 
References: <200203271816.g2RIGSB30367@thomas.tec.autronix.de>  <541025071C7AC24C84E9F82296BB9B950804C4@OPTEX1.optex.local> 
To: gleixner@autronix.de
Cc: "John Hall" <John.Hall@optionexist.co.uk>,
    linux-mtd@lists.infradead.org
Subject: Re: JFFS2 NAND flash support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Mar 2002 18:26:24 +0000
Message-ID: <11317.1017253584@redhat.com>
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
> There's no better to ensure, that erase read and write can coexist at
> the  moment. But you're invited to hack a better solution :)

> I this a new card type ? All chips and card types I know, have maximum
> block  erase times of 20ms.

Disabling bottom halves for 20ms isn't acceptable. The NOR chip drivers get 
this right - or at least attempt to.

--
dwmw2
