Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8KFW-0005yW-EG
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 10:34:27 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D8K3I-0001qZ-0D
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 16:21:48 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2005 16:21:47 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2005 16:21:47 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Mon, 07 Mar 2005 16:18:52 +0100
Message-ID: <d0hr2a$mi1$1@sea.gmane.org>
References: <d01lkf$v0d$1@sea.gmane.org> <d04hdb$8k1$1@sea.gmane.org>
	<Pine.LNX.4.58.0503031038120.26599@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0503031038120.26599@phoenix.infradead.org>
Sender: news <news@sea.gmane.org>
Subject: Re: Cannot remove child "XXX", ino #13, because it doesn't exist
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>>The problem arose after creating a directory in my JFFS2 NAND fs, and 
>>creating some 1000 (small) files in it. After rebooting I removed the 
>>entire directory, and at the next reboot I got the error.
> Is it real to look at JFFS2 debugging output?
After updating the mtd-code from CVS (2005-03-04) this problem is no 
longer reproducable...
Is there a better snapshot than CVS HEAD regarding stability?

// Martin
