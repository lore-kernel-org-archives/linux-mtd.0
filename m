Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8xOc-0004UO-Rq
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 13:08:19 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m5ID8F6A006290
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:08:15 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m5ID8FI2202002
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:08:15 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m5ID8Fcs011225
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:08:15 -0400
Date: Wed, 18 Jun 2008 09:06:09 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: [PATCH] [MTD-UTILS] mkfs.jffs2: Remove Incorrect Find Optimization
Message-ID: <20080618090609.329c2030@zod.rchland.ibm.com>
In-Reply-To: <1213371989-23442-1-git-send-email-gerickson@nuovations.com>
References: <1213371989-23442-1-git-send-email-gerickson@nuovations.com>
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

On Fri, 13 Jun 2008 08:46:29 -0700
Grant Erickson <gerickson@nuovations.com> wrote:

> Remove performance optimization in find_filesystem_entry that prevented 
> the successful simultaneous use of --root and --devtable where the 
> latter is only used to fix-up permissions and ownership and to create 
> device nodes.
> 
> As it stood, the performance optimization prevented a successful find 
> where directory recursion was required or where the file being searched 
> for had any mode permission bits set.
> 
> See http://lists.infradead.org/pipermail/linux-mtd/2008-June/021997.html
> for additional information.
> 
> Signed-off-by: Grant Erickson <gerickson@nuovations.com>

applied.

josh
