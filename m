Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eGKq-0001TX-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 15:10:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F88wVN7miR9Odutox7n00006a28@hotmail.com> 
References: <F88wVN7miR9Odutox7n00006a28@hotmail.com> 
To: "Brian Peterson" <purdue1996@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 read only file system 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Jan 2003 15:41:28 +0000
Message-ID: <30342.1043941288@passion.cambridge.redhat.com>
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

purdue1996@hotmail.com said:
> Is this a bug or is there something I did incorrectly? or is there a
> utility I can use to correct this at runtime?

This is a bug. I'm not sure why it happens, but it shouldn't be that hard 
(for anyone) to fix, given sufficient time and motivation. The NFTL format 
isn't that complex.

--
dwmw2
