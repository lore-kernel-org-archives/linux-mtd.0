Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eJiX-0001v3-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 18:47:17 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9J008UFK9N6X@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 30 Jan 2003 20:17:48 +0100 (MET)
Date: Thu, 30 Jan 2003 20:16:00 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Bad Block Handling in jffs2
In-reply-to: <03E2B9D1.52EE4DE7.0265FBE9@netscape.net>
To: Kschoo70C@netscape.net, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301302016.00528.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <03E2B9D1.52EE4DE7.0265FBE9@netscape.net>
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

On Thursday 30 January 2003 17:17, Kschoo70C@netscape.net wrote:
>    In http://www.linux-mtd.infradead.org/tech/nand.html, it is stated that
>
>    "if you have a bad block on your chip, just skip this block and copy
>    the data to the next block. JFFS2 is able to handle this gap.".
That's correct.

>    So, I write a program to skip the bad block, and copy the data to the
> next block. The missing file seems to appear on the file system now, the
> size looks correct. But when I diff the binary of the file to that of
> original, they are different and the binary failed to execute.
Strange.
Have you built your fs-image with the correct block size ?

>    I don't know much about jffs2 bad block handling, the only information I
> have is as mentioned above. Am I missing any other information ?
No

>    Is anyone manage to transfer an image to the nand device that has bad
> blocks without losing any files ?
Yes, I do

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
