Received: from pd953a2b0.dip.t-dialin.net ([217.83.162.176] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qIjw-000231-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 19:05:44 +0000
Message-Id: <200203271910.g2RJA7d30449@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 NAND flash support
Date: Wed, 27 Mar 2002 20:10:06 +0100
Cc: "John Hall" <John.Hall@optionexist.co.uk>, linux-mtd@lists.infradead.org
References: <200203271816.g2RIGSB30367@thomas.tec.autronix.de> <541025071C7AC24C84E9F82296BB9B950804C4@OPTEX1.optex.local> <11317.1017253584@redhat.com>
In-Reply-To: <11317.1017253584@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wednesday, 27. March 2002 19:26, David Woodhouse wrote:
> gleixner@autronix.de said:
> > There's no better to ensure, that erase read and write can coexist at
> > the  moment. But you're invited to hack a better solution :)
> >
> > I this a new card type ? All chips and card types I know, have maximum
> > block  erase times of 20ms.
>
> Disabling bottom halves for 20ms isn't acceptable. The NOR chip drivers get
> this right - or at least attempt to.
You're right, we should reschedule there. I will take care of this in the 
next days.
-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
