Received: from mtagate8.de.ibm.com ([195.212.29.157])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGs4I-0006QA-Jv
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 08:59:35 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id l737xJXv257428
	for <linux-mtd@lists.infradead.org>; Fri, 3 Aug 2007 07:59:19 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l737xJYr1851530
	for <linux-mtd@lists.infradead.org>; Fri, 3 Aug 2007 09:59:19 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l737xIDc021310
	for <linux-mtd@lists.infradead.org>; Fri, 3 Aug 2007 09:59:19 +0200
Message-ID: <46B2E055.9010305@de.ibm.com>
Date: Fri, 03 Aug 2007 09:59:17 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
In-Reply-To: <6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> Maybe I wasn't so clear.  Assuming the MTD is going to do an erase you would:
> 
> (a) zap all page affected by block erase
> (b) identify all pte's mapped to the affected region
> (c) modify these pte's so they now trigger a fault
> (d) wait for completion of erase
> (c) reestablish valid pte mappings
Ah. Now I can see the light. Sounds like an acceptable approach to me.

> If you get a fault it gets routed to the filesystem .fault or
> something like that.  The .fault routine can:
> (a) suspend the erase
> (b) copy the page to RAM
> (c) update the pte to point to RAM
> (d) resume the erase
> -or-
> (a) suspend the erase
> (b) reenable the pte
> (c) wait a short time
> (d) disable pte again
> (e) resume the erase
Why don't we wait til the erase is completed?

so long,
Carsten
