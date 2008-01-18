Received: from e36.co.us.ibm.com ([32.97.110.154])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFqcG-0005Bq-JA
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 12:46:43 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m0ICkTQ9019204
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2008 07:46:29 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m0ICkT2P108086
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2008 05:46:29 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m0ICkTo7028937
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2008 05:46:29 -0700
Date: Fri, 18 Jan 2008 06:44:32 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: vicky <vicky.irobot@gmail.com>
Subject: Re: question about node creation /dev/mtd*
Message-ID: <20080118064432.19233a37@zod.rchland.ibm.com>
In-Reply-To: <479097B7.9050401@gmail.com>
References: <479097B7.9050401@gmail.com>
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

On Fri, 18 Jan 2008 17:42:39 +0530
vicky <vicky.irobot@gmail.com> wrote:

> Hi,
> 
> I have enabled mtd in my config. When I boot from the updated kernel I 
> find that /dev/mtdblock is not created?
> 
> How does the /dev/mtdblock get created? I didn't find this in the 
> init/rcs script. I am under an impression that once the mtd is enabled 
> in the linux
> config file the creation of the corresponding node is taken care in some 
> script.

You need to either have udev running, or create it manually yourself
with mknod (which can be done via a script you write). This is, of
course, assuming you have the mtdblock module loaded or compiled into
your kernel.

josh
