Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DGNqA-0005G3-QL
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 16:01:35 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j2TL1WFZ008029
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 16:01:32 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j2TL1WXA225288
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 16:01:32 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2TL1W6U025342
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 16:01:32 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050329T223730-617@post.gmane.org>
References: <loom.20050329T223730-617@post.gmane.org>
Content-Type: text/plain
Date: Tue, 29 Mar 2005 15:00:58 -0600
Message-Id: <1112130058.7509.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: try_to_freeze() missing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-03-29 at 20:55 +0000, Sergei Sharonov wrote:
> Hi,
> 
> compiling linux 2.6.10 with mtd snapshot from yesterday (2/28/2005) fails with 
> undefined reference to try_to_freeze(). According to linux cross-reference
> try_to_freeze first appears in 2.6.11
> mtd is uses in jffs2/background.c
> I understand that we do not want to support ancient kernels but that seems
> a bit extreme ;-)

This got fixed in CVS today I think.  CVS up and it should be fixed in
include/linux/mtd/compatmac.h

josh
