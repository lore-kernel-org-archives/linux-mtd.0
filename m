Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8xOv-0004Vw-Gr
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 13:08:37 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m5ID8b5R007195
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:08:37 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m5ID8bIB223484
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:08:37 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m5ID8aSl028514
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:08:36 -0400
Date: Wed, 18 Jun 2008 09:06:30 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: [PATCH] [MTD-UTILS] mkfs.jffs2: Add Support for Symlinks to
	Device Table
Message-ID: <20080618090630.2eaf0e97@zod.rchland.ibm.com>
In-Reply-To: <1213371997-23465-1-git-send-email-gerickson@nuovations.com>
References: <1213371997-23465-1-git-send-email-gerickson@nuovations.com>
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

On Fri, 13 Jun 2008 08:46:37 -0700
Grant Erickson <gerickson@nuovations.com> wrote:

> Added support for symbolic links to the grammar of the device table file 
> such that links that already exist in the root working directory may 
> have their permissions and ownership changed. Creating symbolic links 
> anew is still unsupported.
> 
> Added a note to this effect in the manual reference page.
> 
> Print out the type character when encountering an unsupported file type 
> (e.g. symbolic links when created anew).
> 
> Signed-off-by: Grant Erickson <gerickson@nuovations.com>

applied.

josh
