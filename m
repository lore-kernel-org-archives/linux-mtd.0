Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw6hk-0002Ae-Sb
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 17:41:06 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j11Megbs002996
	for <linux-mtd@lists.infradead.org>; Tue, 1 Feb 2005 17:40:42 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j11MegY7114150
	for <linux-mtd@lists.infradead.org>; Tue, 1 Feb 2005 17:40:42 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j11MegDO025839
	for <linux-mtd@lists.infradead.org>; Tue, 1 Feb 2005 17:40:42 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Tue, 01 Feb 2005 16:40:36 -0600
Message-Id: <1107297636.8235.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-01 at 11:00 +0200, Andrew Victor wrote:
> 
> Configuration (Config.in and Kconfig) and Makefiles updated.

Cool.

> 
> Padding nodes are only skipped for DataFlash devices - no longer breaks
> the NOR ECC flash support.

Looks better.  Thanks!

josh
