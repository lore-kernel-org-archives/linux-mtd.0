Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbILM-0007eo-Og
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 10:28:47 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=[::1])
	by emc.emcraft.com with esmtp (Exim 4.10) id 1FbIIn-0002MV-00
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 18:26:05 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 3 May 2006 18:28:51 +0400
References: <200605031556.37660.atrey@emcraft.com> <44589BCE.2060402@yandex.ru>
In-Reply-To: <44589BCE.2060402@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605031828.51552.atrey@emcraft.com>
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 May 2006 16:02, Artem B. Bityutskiy wrote:
> Can it happen with a real-life flash device? If it can, we have to 
> switch to 64-bit versions.

I think it can happen. I can imagine at least one scenario where such 
situation can occur. Of course, in normal circumstances it is hardly possible 
but in the case of a powerfail it can be.
	1. Assume, upon a call to jffs2_commit_write() function the
	f->highest_version has the maximum value.
	2. jffs2_commit_write() increments f->highest_version which becomes 0.
	3. jffs2_commit_write() invokes jffs2_write_dnode() with version=0.

	5. Powerfail before obsoleting least recent overlapping nodes.

	6. After reset, the scan process finds two(if were only one node for the
	commited page before) valid nodes wich refer to the same region. It places
	the least recent node which has the maximum version number at the end of
	the node list.
	7. When jffs2_read_inode() function is invoked, the node with the biggest
	version number is added last, thus, obsoleting all overlapping nodes.
	The most recent inode is obsoleted as well. --> Bug.

As a workaround I suggest to obsolete previous nodes before writing the new 
one. In case of powerfail there will be holes in data which can be easily 
recognized during inode reading.

--
Regards,
Dmitry
