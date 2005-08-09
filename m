Received: from omx1-ext.sgi.com ([192.48.179.11] helo=omx1.americas.sgi.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2XAd-0005do-7V
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2005 17:41:44 +0100
Received: from flecktone.americas.sgi.com (flecktone.americas.sgi.com
	[198.149.16.15])
	by omx1.americas.sgi.com (8.12.10/8.12.9/linux-outbound_gateway-1.1)
	with ESMTP id j79GfXxT006163
	for <linux-mtd@lists.infradead.org>; Tue, 9 Aug 2005 11:41:33 -0500
Received: from moose.americas.sgi.com (moose.americas.sgi.com [137.38.224.25])
	by flecktone.americas.sgi.com (8.12.9/8.12.10/SGI_generic_relay-1.2)
	with ESMTP id j79GfXDN13897171 for <linux-mtd@lists.infradead.org>;
	Tue, 9 Aug 2005 11:41:33 -0500 (CDT)
Received: from [137.38.88.32] (lnx-ssh.americas.sgi.com [137.38.88.32]) by
	moose.americas.sgi.com (8.12.9/ASC-news-1.4) with ESMTP id
	j79GfXi41898880 for <linux-mtd@lists.infradead.org>;
	Tue, 9 Aug 2005 11:41:33 -0500 (CDT)
Message-ID: <42F8DCBD.2020407@sgi.com>
Date: Tue, 09 Aug 2005 11:41:33 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Erasing NAND bad blocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Yes, I do know that erasing NAND flash blocks that are marked bad
is a VERY BAD IDEA.....I'm asking the question regarding a
specific HW/SW debug situation.......)

In the course of bringing up new hardware with NAND flash attached
I have had occasions where a software bug will cause a NAND-based
filesystem (such as YAFFS) to mark *all* of the blocks in a filesystem
as bad.  In the past, I have hacked the nand_erase() function to
allow erasing of bad blocks, then wrote a custom app to scan the OOB
data, doing a MEM_ERASE for blocks that had been marked bad by the FS.
Just wondering.....has anyone else
run into this situation, and is there a more graceful way of doing
this (i.e. without hacking the MTD NAND driver)?

Thanks!
Steve

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
