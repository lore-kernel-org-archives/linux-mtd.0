Received: from [64.47.34.180] (helo=minotaur.hekimian.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4Ggd-0005bX-AY
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 05:57:40 -0500
Message-ID: <421DB31B.7000900@users.sourceforge.net>
Date: Thu, 24 Feb 2005 05:57:31 -0500
From: Vern Sauder <vsauder@users.sourceforge.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 stats
Reply-To: vsauder@users.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am working on a "failed" PPC system with a 2.4.25 kernel. I saw a 
lockup where the JFFS2 GC took all the CPU time and the application was 
hung. All writes to the file system failed causing catastrophic problems.

On the way to fixing the application to not completely choke and go 
haywire, I updated the MTD and JFFS2 drivers to the snapshot as of 16 
Feb and now I am having different problems. One thing was that the patch 
did not apply cleanly; I had to modify several files to fit it into my 
kernel. I noticed that the mtd driver seems much faster (writes) which 
was one of my main goal. I was testing the FLASH to verify that the 
lockup wasn't the MTD failing to write to the FLASH. There were several 
instances on the FLASH that seemed to show a one bit difference (always 
a zero that should have been a one). The new drivers sped up the 
testing. I fixed some utilities/scripts I was using and it looks like 
the FLASH is writing and reading fine now.

I seem to have lost ZLIB compression. It is enabled but the JFFS2 debug 
says it doesn't know anything about compression 6. It fails to mount it 
as the root fs but it will mount it later but the data is not right 
then. I thought I saw somewhere that there was a /proc entry that showed 
the jffs2 compressors currently loaded. I can't find it now. Is the 
JFFS2_PROC meaningless for the time being?

I am ultimately looking for complete stats on the JFFS2 to tell what is 
going on in terms of fragmentation and GC. Our application may be 
overloading the JFFS2 by writing too fast or something like that. I 
accidentally found significant info from the U-Boot prompt that looks at 
first glance like it is a good start. Does anyone else have such a tool? 
Is it in JFFS2 and I haven't found it yet?

Vern
