Received: from imladris.infradead.org ([194.205.184.45] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 174hUc-00033H-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 May 2002 13:21:26 +0100
Received: from smtp-1.hut.fi ([130.233.228.91] ident=root)
	by phoenix.infradead.org with esmtp (Exim 3.35 #5)
	id 174hUW-0007e4-00
	for linux-mtd@lists.infradead.org; Mon, 06 May 2002 13:21:20 +0100
Date: Mon, 6 May 2002 15:19:30 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2
Message-ID: <20020506151930.A15109@kosh.hut.fi>
References: <20020503201900.A32761@kosh.hut.fi> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <20020503201900.A32761@kosh.hut.fi> <28528.1020448474@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28528.1020448474@redhat.com>; from dwmw2@infradead.org on Fri, May 03, 2002 at 06:54:34PM +0100
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

> Er, yes, that is concerning. Does it say why? If it's only occasional, then 
> it's almost certainly memory allocation problems. 

I have caught the message 8 times. It doesn't occur rather seldom when I have
been benchmarking JFFS2 over the weekend.

On five cases the first line was "Unknown INCOMPAT nodetype C002 at 0020293C"
(address varies).

On all 8 cases the next lines are "jffs2_do_read_inode(): No data 
nodes found for ino #" then "Eep. read_inode() failed for ino #"

Last year there were two reports about C002 type node: 28 Jun 2001 Frederic 
Giasson, and 08 Aug 2001 Xavier DEBREUIL. Is this the same problem they had?


> It would be useful if you could provide a profiling run from the

Do you mean kernel profiling? I am using JFFS2 on an Arm based device and 
kernel profiling is not available for Arm or is it?

Jarkko lavinen
