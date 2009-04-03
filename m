Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LplhH-0004vX-3f
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 15:52:55 +0000
Received: from mgw-mx09.nokia.com ([192.100.105.134])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	n33Emfrn000636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Fri, 3 Apr 2009 17:48:43 +0300
Subject: Re: Re: Re: Create, Flash and Mount UBIFS Images
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manuel Sahm <Manuel.Sahm@feig.de>
In-Reply-To: <49D607C7.187F.00BC.1@feig.de>
References: <49D4BF5A.187F.00BC.1@feig.de>
	<1238674916.20906.93.camel@localhost.localdomain>
	<49D5D7AE.187F.00BC.1@feig.de>
	<1238747429.20906.149.camel@localhost.localdomain>
	<49D607C7.187F.00BC.1@feig.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Apr 2009 17:41:18 +0300
Message-Id: <1238769678.20906.166.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-04-03 at 12:57 +0200, Manuel Sahm wrote:
> Hello,
>  
> concerning the autoresize flag:
>  
> As far as I understand:
> If a partition is 40 MiB, I have to set the vol_size < Partition size,
> and set the autoresize flag to use the whole Partition size of 40 MiB.
> right ?

Yes.

> Is it correct that the resize depends on the value -c of the mkfs.ubifs
> program ?

The autoresize is UBI thing. -c is UBIFS thing. Yes, -c defines
maximum UBIFS size in LEBs. Make it larger, e.g. -c 511 if you
are concerned.

> --> (40MiB / 129024)+1 = c     --> c=326
> With c=326 the autoresize feature should make the ubifs use the whole
> partitoon sizue of 40 MiB - right ?

Not exactly. But kind of. You should distinguish between UBI and
UBIFS - they are different thing. UBIFS does not know anuthing about
MTD partition, it knows only about UBI space, which is less than
partition space.

But just use -c511, it is safe. UBIFS overhead increases considerably
when this -c value goes over a power-of-2 boundary. So there is not 
that much difference between -c 326 and -c 512.

> concerning the kernel command parameter:
> Is it possible to define the ubi device number trough the kernel
> command line argument, like it is possible through the ubiattach program
> ?
> Example: ubi.mtd=4 is actually attached to /dev/ubi1 and /dev/ubi1_0.
> I want to have /dev/ubi4 and /dev/ubi4_0
> 
> possible ?

Hmm, not really. We did not think about this. May be you may add
this feature - should not be too difficult.
 
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
