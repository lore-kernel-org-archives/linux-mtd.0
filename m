Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VCZI-0003Qo-OL
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 16:52:20 +0100
Date: Wed, 25 Jun 2003 16:52:34 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: paul.vangool@rinconnetworks.com
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <20030625154815.GA15437@rinconnetworks.com>
Message-Id: <0985322B-A725-11D7-A51A-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: No space left on almost empty JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wednesday, Jun 25, 2003, at 16:48 Europe/London, Paul van Gool wrote:

> Hi,
>
> I have created an small and almost empty JFFS2 filesystem and have put 
> it
> on my flash.

JFFS2 filesystems require a certain number of erase blocks reserved for
garbage collection before you can write anything to them.

128k is only one erase block for most CFI flashes and is thus far too 
small
to have the five(?) free blocks that are required.  There was talk of 
proving
the GC for two free blocks, but either way, one block is not (and never 
will
be) enough.

-Jas.
