Received: from mail015.syd.optusnet.com.au ([210.49.20.173])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Hcj1-0007LI-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 04:53:43 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail015.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g5B3rb621042
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 13:53:38 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=bigpond.com)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17Hciu-0002X4-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 13:53:36 +1000
Message-ID: <3D057440.5000104@bigpond.com>
Date: Tue, 11 Jun 2002 13:53:36 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DOC2000 partitiioning question
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

I've got a single DOC2000 in PowerPC embedded system.  I want to have 3 
seperate partiton, one which is read-only and the other two read-write. 
 I've been told that this is easy to do from the filesystem level but 
the underlying NFTL stuff can still swap bits a pieces underneath the 
read-only partition.  I think what I'm after is the ability to create 3 
"virtual disk devices" with single partions on each, as apposed to 1 
disk device with 3 partions.

Is this doable ?
Is it reliable ?
Where can I find information on this (Howtos, etc).

What are the most suitable filesystems to place on  DOC for reliability 
(ext2, ext3, JFFS, JFFS2 ...) ?
Is a journalling file system suitable for a device such as a DOC ?
Are flash file systems suitable for a DOC or are they desinged for 
ordinary flash chips ?

Is there a way to search the linux-mtd archives ?
I couldn't find anything on the web site (except browsing).

Thanks for any help or pointers,
Brendan Simon.
