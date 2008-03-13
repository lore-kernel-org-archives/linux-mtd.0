Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JZlOZ-0004Se-7T
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 11:14:47 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m2DBBB0O026445
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2008 07:11:11 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m2DBBBdU251144
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2008 07:11:11 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m2DBBAfN013472
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2008 07:11:11 -0400
Date: Thu, 13 Mar 2008 06:10:30 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Manuel Sahm <Manuel.Sahm@feig.de>
Subject: Re: mtd-utils 1.0.1 Cross Compile error
Message-ID: <20080313061030.423eaf35@zod.rchland.ibm.com>
In-Reply-To: <47D90489.5090909@feig.de>
References: <47D90489.5090909@feig.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Mar 2008 11:40:09 +0100
Manuel Sahm <Manuel.Sahm@feig.de> wrote:

> Hello,
> 
> I want to CrossCompile mtd-utils 1.0.1 with an ARM Crossompiler but 
> through the process an error occurs:
> 
> mkfs.jffs2.c68:21 sys/acl.h: No such file or directory
> mkfs.jffs2.c: In function 'formalize_posix_acl' :
> .
> .
> .
> .
> 
> with Version 1.0.0 all works ?
> 
> What could be the problem ?

JFFS2 grew ACL support.  Compile with WITHOUT_XATTR=1 and you should be
fine.  Alternatively, install the appropriate headers.

josh
