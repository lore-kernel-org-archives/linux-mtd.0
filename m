Received: from mtagate6.de.ibm.com ([195.212.29.155])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW7I9-0000MO-4P
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 10:21:21 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id m7LAKIwF501318
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 10:20:18 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7LAKIVF3903618
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 12:20:18 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7LAKHTb004378
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 12:20:18 +0200
Message-ID: <48AD4160.7000408@de.ibm.com>
Date: Thu, 21 Aug 2008 12:20:16 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
References: <48AD00F8.1030004@gmail.com> <48AD2AFF.5060609@de.ibm.com>
	<1219308560.2988.247.camel@pmac.infradead.org>
In-Reply-To: <1219308560.2988.247.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	carsteno@de.ibm.com, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
>> Jared Hulbert wrote:
>>> Profiling is a fault instrumentation and /proc formating system.
>>> This is used to get an accurate picture of what the pages are actually used.
>>> Using this info the image can be optimized for XIP
> 
>> Exporting profiling data for a file system in another file system 
>> (/proc) seems not very straigtforward to me. I think it is worth 
>> considering to export this information via the same mount point.
> 
> I would have said sysfs, rather than 'the same mount point'.
Well, filesystems are usually not represented in the device model. 
It'd be possible to add a system device for it, but that does'nt feel 
like the right solution to me.
