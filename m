Received: from pd953a1d1.dip.t-dialin.net ([217.83.161.209] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qWdq-0002vB-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 09:56:22 +0000
Message-Id: <200203281000.g2SA0qG16192@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "John Hall" <John.Hall@optionexist.co.uk>
Subject: Re: JFFS2 NAND flash support
Date: Thu, 28 Mar 2002 11:00:52 +0100
Cc: <linux-mtd@lists.infradead.org>
References: <541025071C7AC24C84E9F82296BB9B952CE4@OPTEX1.optex.local>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B952CE4@OPTEX1.optex.local>
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

On Thursday, 28. March 2002 10:41, John Hall wrote:
> Which is the current development branch?
cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login (password: anoncvs)
cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd
 
> Our hardware interface is a btit weird (ALE and CLE are controlled by
> address lines...). I also can get interrupts from the busy pin, so I've
> changed the code so it doesn't do busy waits as nand.c does.
Designed by hardware engineer, who never wrote a line of code :)
Can you please send me your changes. As I will rework the spinlock issue,
I will try to merge it into the current version. 

> OK - I hadn't looked at the latest versions very carefully. Now I've
> looked, I notice that if the erase fails the user callback is not
> called. The documentation on the mtd website seems to imply that you
> should set the status to FAILED and still call the callback. Is that
> correct?
No, doc is out of date
If you return 0 (.i.e. 'request queued OK') you must call the callback.
If you return nonzero (i.e. request not queued) you don't.

> But you're holding a spinlock to ensure that your driver doesn't get
> re-entered. Why do bottom halves need to be disabled at all?
As I said, I will take care of this in the next days.

> I'm just going by the Smartmedia spec. It says the maximum erase time is
> 400ms.
The Smartmedia spec is a general purpose paper. You must always use the chip 
datasheet at least. If the chip does not meet Smartmedia spec, you can 
complain about that, but it does not help you at all. :)
-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
