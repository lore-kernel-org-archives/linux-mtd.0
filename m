Received: from e31.co.us.ibm.com ([32.97.110.149])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8FCR-0000rf-8Y
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 08:52:16 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6ACqBXm005492
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2007 08:52:11 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l6ACqA24198472
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2007 06:52:10 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6ACqA3w001935
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2007 06:52:10 -0600
Subject: Re: [RFC/PATCH] Ubi-Utils: add compare feature
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: haver@ipnet.vnet.ibm.com
In-Reply-To: <1184050337.5944.2.camel@august>
References: <200707092132.02839.alexs@linux.vnet.ibm.com>
	<1184050337.5944.2.camel@august>
Content-Type: text/plain
Date: Tue, 10 Jul 2007 07:52:09 -0500
Message-Id: <1184071929.32199.0.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-10 at 08:52 +0200, Frank Haverkamp wrote:
> Hi Alex,
> 
> On Mon, 2007-07-09 at 21:32 +0200, Alexander Schmidt wrote:
> > +#define COMPARE_BUFFER_SIZE 1024
> 
> I think using the something like 2KiB or even the 128KiB would be nicer.
> 
> > +
> >  static const char copyright [] __unused =
> >         "Copyright (c) International Business Machines Corp., 2006";
> 2007

And drop the (c) part.  It's not legally valid.

josh
