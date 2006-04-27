Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FZ179-00079W-I3
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 03:40:48 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=localhost)
	by emc.emcraft.com with esmtp (Exim 4.10) id 1FZ14j-0003Ds-00
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 11:38:09 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 27 Apr 2006 11:40:37 +0400
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200604271140.37488.atrey@emcraft.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: JFFS2: scan leaves dirent for inode which has no valid data nodes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am running Linux 2.4.26 for MIPS-4k custom board and has the problem wich 
appears from time to time on one of the JFFS2 partitions.

The partition is mounted to /etc mount point. The following screenshot shows 
the problem (I have changed the real file name for confidentiality).

# touch /etc/any.file
touch: /etc/any.file: Input/output error
# echo ddd > /etc/any.file
/etc/any.file: cannot create (Input/output error)

It is worth to note, that 'ls' utility doesn't show this file in the list.

I have made a dump of the partition and examined it. I have found that there 
is a valid dirent for the file and there is no valid data nodes (all are 
obsolete).

The curcumstances that proceeded the appearance of the situation are unknown. 
It is also unknown was it a powerfail or it was a normal functioning.

My questions are:

1. Should the scan process during mounting mark as obsolete dirent nodes which 
has no valid data nodes?
2. Is this a bug when such dirent exists and there is no chanse to 
create/read/write a file with the same name?

I have browsed the mailing list archive and haven't found (or just missed) the 
problem in it. Maybe the problem were resolved in more recent 2.4.x kernels.

Any information would be appreciated.

Thanks,
Dmitry
