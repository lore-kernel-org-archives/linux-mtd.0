Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gi8Iz-0006mW-OI
	for linux-mtd@lists.infradead.org; Thu, 09 Nov 2006 06:42:54 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA9BgWC6008287
	for <linux-mtd@lists.infradead.org>; Thu, 9 Nov 2006 06:42:32 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA9BgWpL097108
	for <linux-mtd@lists.infradead.org>; Thu, 9 Nov 2006 06:42:32 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA9BgV60031062
	for <linux-mtd@lists.infradead.org>; Thu, 9 Nov 2006 06:42:31 -0500
Subject: Re: Mtd driver for P30 flash
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: ayoub zaki <ayoub_zaki@yahoo.fr>
In-Reply-To: <20061109095052.62796.qmail@web26613.mail.ukl.yahoo.com>
References: <20061109095052.62796.qmail@web26613.mail.ukl.yahoo.com>
Content-Type: text/plain
Date: Thu, 09 Nov 2006 05:42:38 -0600
Message-Id: <1163072558.7368.9.camel@zod.rchland.ibm.com>
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

On Thu, 2006-11-09 at 09:50 +0000, ayoub zaki wrote:
> hello all,
> 
> 
> 
> I'm using a montavista linux kernel based on linux-2.4.20,
> unfortunatelly my Intel P30 flash is not recognised by the mtd driver.
> 

Because 2.4.20 is very very old and P30 is relatively new.  Support for
it went in around 2.6.16.

> 
> Is there any patch available for the Mtd driver for this linux version?

No.  http://linux-mtd.infradead.org/source.html#kernelversions

> ( We don't plan to upgrade to linux-2.6 which does not support our processor ixp2351)

Perhaps you could ask MontaVista for a patch for your kernel.

josh
