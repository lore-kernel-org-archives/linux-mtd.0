Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cy4LW-0002zJ-8w
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 03:34:15 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Cy4K3-0003WL-LP
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 09:32:43 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Feb 2005 09:32:43 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Feb 2005 09:32:43 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Mon, 07 Feb 2005 09:33:48 +0100
Message-ID: <cu7934$irr$1@sea.gmane.org>
References: <ctsr0r$94m$1@sea.gmane.org>
	<20050206220713.D99FE15504@desire.actrix.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050206220713.D99FE15504@desire.actrix.co.nz>
Sender: news <news@sea.gmane.org>
Subject: Re: Writing frequently to NAND - wearing, caching?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>>I have an application which may need to write states frequently to my
>>nand-fs in order to have these states in case of powerdown.
>>But I'm a bit concerned about wearing the nand if I write to frequently.

>>So, if I only need to write, say, 100 bytes every second, how often will
>>this actually be flushed to the nand?
>>Is there a maximum commit/flush frequency built in the driver? Or can
>>this be configured?

> It depends on what fs you're using.
> With YAFFS, and I believe JFFS2 too, there is no reason to worry about flash 
> "wearing out".  I have done accelerated lifetime tests on NAND using YAFFS 
> and in one test wrote 130GB to NAND without any data loss, bad blocks 
> happening etc.
Now, that's a lot :-)
I'm using JFFS2 - so hopefully you're right...

> The NAND writes whenever the file system tells it to, so again your question 
> is FS dependent, but all file systems that are NAND-friendly should handle 
> the load you mention with no problems.
And that is JFFS2 - but since it's a journaling fs it must commit the 
journal, as well, every now and then...

// Martin
