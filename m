Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DO5x-0007tc-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 11:23:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001601c0fb03$b2e9bbf0$230d0dc3@Athlon> 
References: <001601c0fb03$b2e9bbf0$230d0dc3@Athlon> 
To: "Paolo Marini" <paolom@prisma-eng.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: endian problem ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Jun 2001 11:28:46 +0100
Message-ID: <15774.993205726@redhat.com>
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

paolom@prisma-eng.it said:
> I am trying to have a working JFFS2 on an RPX-CLLF card (Motorola 860,
> big endian).

> It happens that every time I mount the jfss2, the flash gets
> formatted. I dumped the flash block, and the bytes seem to be in the
> wrong order (e.g. magic number and nodetype swapped, and also magic
> number with the two bytes swapped). I tested it against a jffs2 image
> build for big endian with mkfs.jffs2, and the order of bytes is
> reversed. Reading a flash block containing e.g. card FW is ok. I am
> using the latest mtd on a 2.4.2 kernel. 

Update to v1.13 of rpxlite.c. You'll probably need to enable 
CONFIG_MTD_CFI_ADV_OPTIONS and then choose the CONFIG_MTD_CFI_LE_BYTE_SWAP 
option too.

--
dwmw2
