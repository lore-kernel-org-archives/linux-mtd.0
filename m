Received: from e32.co.us.ibm.com ([32.97.110.150])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HKKeC-0002nC-Pf
	for linux-mtd@lists.infradead.org; Thu, 22 Feb 2007 20:34:41 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.12.11.20060308/8.13.8) with ESMTP id
	l1MKRVhV023795
	for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2007 15:27:31 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1MKSLQF378254
	for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2007 13:28:21 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1MKSLw5020207
	for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2007 13:28:21 -0700
Subject: Re: nand with pcmcia interface
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: girish@picopeta.com
In-Reply-To: <45DDE566.6040206@picopeta.com>
References: <45DDE566.6040206@picopeta.com>
Content-Type: text/plain
Date: Thu, 22 Feb 2007 14:29:23 -0600
Message-Id: <1172176163.24204.204.camel@zod.rchland.ibm.com>
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

On Fri, 2007-02-23 at 00:18 +0530, Girish wrote:
> Hi all ,
>     I am writing a driver for 256MB Micron Nand flash On PXA270 board 
> through PCMCIA interface as decribed in 
> "http://download.intel.com/design/pca/applicationsprocessors/applnots/28014402.pdf". 
> So I am trying it out in u-boot first. I wrote a u-boot command called 
> mynand which writes the command at 0x30000000 (socket1 of pcmcia), data 
> at 0x20000000(socket0 of pcmcia) and address at 0x20000040(i.e 
> Address6=ALE). But u-boot hangs whenever I try to access pcmcia socket 
> addresses i.e. 0x20000000 or 0x30000000. And I did "md 0x20000000" It too hangs the u-boot. 
> Please suggest me how to go on further.

You should ask about this on the u-boot mailing list.

josh
