Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I5LBJ-00066M-So
	for linux-mtd@lists.infradead.org; Mon, 02 Jul 2007 13:39:08 +0100
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l62CcxbF001730
	for <linux-mtd@lists.infradead.org>; Mon, 2 Jul 2007 08:38:59 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l62CcxEq256982
	for <linux-mtd@lists.infradead.org>; Mon, 2 Jul 2007 06:38:59 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l62CcxQI005040
	for <linux-mtd@lists.infradead.org>; Mon, 2 Jul 2007 06:38:59 -0600
Subject: Re: NAND Driver in case of NAND Flash Controller
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: brraju@hyd.hellosoft.com
In-Reply-To: <4688DC5D.3070909@hyd.hellosoft.com>
References: <4688DC5D.3070909@hyd.hellosoft.com>
Content-Type: text/plain
Date: Mon, 02 Jul 2007 07:38:58 -0500
Message-Id: <1183379938.13031.1.camel@weaponx.rchland.ibm.com>
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

On Mon, 2007-07-02 at 16:37 +0530, Ranga Raju B wrote:
> Hi,
>     I need to write a Linux MTD NAND Driver for an SoC. It has NAND 
> Flash Controller (ARASAN NAND Flash Controller) and I am using a 2Gb 
> Micron NAND Flash. The MTD drivers I currently see in the Linux tree are 
> basically having the NAND Flash connected directly to the processors 
> using GPIO or Address Lines. In this case it is appropriate to write 
> callback functions for
> 
> hwcontrol
> dev_ready
> write_byte
> read_byte
> verify_byte
> write_buf
> read_buf
> verify_buf
> 
> Since the IO data lines and control lines are controlled directly by the 
> processor.
> 
> In case of NAND flash controller we don't have this controller. We need 
> to program only the registers and we can get status only from the status 
> registers. We have data ports
> which can take only 512 bytes at a time. Has anyone written the Linux 
> driver for this kind of situation?
> 
> I have control only at stage 1. Which are nothing but memory mapped 
> interface.
> 
>                 1                                             2
>    ARM  --->  NAND Flash Controller   ---> NAND Flash
> 
> I don't  know  where to start this driver. I intend to use JFFS2 over 
> MTD partitions.

Take a look at the NDFC driver in drivers/mtd/nand/.  It is a NAND
controller found on some PowerPC 4xx chips and operates similar to what
you've described.  You might find it helpful when writing a driver for
your NAND controller.

josh
