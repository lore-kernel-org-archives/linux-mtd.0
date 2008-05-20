Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JySJG-0003If-9v
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 13:55:27 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m4KDgmNs019565
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2008 09:42:48 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m4KDghfR034878
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2008 07:42:43 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m4KDgg1h024845
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2008 07:42:42 -0600
Date: Tue, 20 May 2008 08:38:25 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Manuel Sahm <Manuel.Sahm@feig.de>
Subject: Re: nandwrite fails
Message-ID: <20080520083825.69d62aa3@zod.rchland.ibm.com>
In-Reply-To: <4832CECB.8080302@feig.de>
References: <4832CECB.8080302@feig.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 May 2008 15:14:51 +0200
Manuel Sahm <Manuel.Sahm@feig.de> wrote:

> Hello,
> 
> I successfully created a jffs2 image with mkfs.jffs2.
> 
> If I want to use nadwrite to write this image to the device:
> 
> MEMSETTOOBSEL: Inappropriate ioctl for device
> 
> I use the latest kernel 2.6.25.3 -> MEMSETTOOBSEL isn?t implemented 
> anymore in the kernel !!!!!
> 
> What could I do ??????

We can pray that Thomas talks to his engineer and sends out a
fix for it.  It's been broken that way for quite some time.

josh
