Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U9Cg-0007oG-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 16:55:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <BB682C76EACAD311A6BD006008F5F7DC0112D50E@mpexchcl.attlabs.att.com> 
References: <BB682C76EACAD311A6BD006008F5F7DC0112D50E@mpexchcl.attlabs.att.com> 
To: "James, Laura" <laurajames@attlabs.att.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with NAND support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 17:01:22 +0100
Message-ID: <19639.997200082@redhat.com>
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


laurajames@attlabs.att.com said:
> We're going to be working on a new board with large amounts of NAND
> flash in the immediate future. It would seem to be a much better idea
> to go with jffs2 than jffs.  What will we need to do to get it
> working? 

> Any pointers you can give will be very much appreciated.

Mainly:

1. Deal with the 10-write-per-page restriction on NAND chips. Probably just 
by keeping track of the number of writes to a page and when dishing out the 
tenth chunk (which will be rare, most nodes will be greater than 1/10 of a 
page) mark the remainder of the page as obsolete.

2. Ideally, we should do ECC instead of just the CRC we have at the moment.
We need to invent two new node types with ECC to parallel the original inode
and dirent nodes.

3. Be better about detecting bad blocks and treating them appropriately. 

--
dwmw2
