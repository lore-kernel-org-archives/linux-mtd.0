Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq8QW-0003yN-P3
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 08:27:45 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e34.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kB1DRcxQ007657
	for <linux-mtd@lists.infradead.org>; Fri, 1 Dec 2006 08:27:38 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kB1DRbXV460292
	for <linux-mtd@lists.infradead.org>; Fri, 1 Dec 2006 06:27:37 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kB1DRbvK030814
	for <linux-mtd@lists.infradead.org>; Fri, 1 Dec 2006 06:27:37 -0700
Subject: Re: mkfs.jffs
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Darshak <darshak@elitecore.com>
In-Reply-To: <000901c71549$4d730d10$3d0fa8c0@elitecore1561>
References: <000901c71549$4d730d10$3d0fa8c0@elitecore1561>
Content-Type: text/plain
Date: Fri, 01 Dec 2006 07:27:48 -0600
Message-Id: <1164979668.13143.14.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
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

On Fri, 2006-12-01 at 18:34 +0530, Darshak wrote:
> 
> 
> 
> Hi ,
> I have compiled kernel [ 2.4.33 ] with jffs support.But I am not able to
> find command mkfs.jffs/2 how could i enable this ?

It's part of the mtd-utils package.  Most Linux distributions have this
already packaged.  If not, it's available at:

ftp://ftp.infradead.org/pub/mtd-utils/

josh
