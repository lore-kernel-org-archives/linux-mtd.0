Received: from harold.telenet-ops.be ([195.130.133.65])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj0Xi-0000AX-FD
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 23:14:26 +0000
Message-ID: <47FAAACB.2060800@telenet.be>
Date: Tue, 08 Apr 2008 01:14:19 +0200
From: =?ISO-8859-1?Q?J=FCrgen_Lambrecht?= <jurgen.lambrecht2@telenet.be>
MIME-Version: 1.0
To: ecos-discuss@ecos.sourceware.org,  linux-mtd@lists.infradead.org
Subject: JFFS2 needs approx 72B of RAM per file
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: j.lambrecht@televic.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello to ecos-discuss and especially linux-mtd,

Tests have revealed to me that jffs2 does not only need raw nodes in RAM 
(I use CYGNUM_FS_JFFS2_RAW_NODE_REF_CACHE_POOL_SIZE to have this 
statically), but also "eats RAM" per file in flash.
I want to remove this allocation, but I don't know if this is possible, 
what are the disadvantages....?
(my basic problem is that I have not enough RAM on my board, but it is 
too late to change HW for the running projects)

After reading some jffs2 documentation, I think that my problem is the 
inode cache?


Kind regards,
Juergen Lambrecht
