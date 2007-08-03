Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGwn2-0004Z2-Mr
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 09:02:01 -0400
Date: Fri, 3 Aug 2007 14:58:06 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: carsteno@de.ibm.com
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070803125806.GE19344@lazybastard.org>
References: <20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<46B2E055.9010305@de.ibm.com>
	<20070803091747.GA18735@lazybastard.org>
	<46B30B95.4070706@de.ibm.com>
	<20070803113134.GA19049@lazybastard.org>
	<46B31DE2.3050804@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46B31DE2.3050804@de.ibm.com>
Cc: dhowells <dhowells@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 August 2007 14:21:54 +0200, Carsten Otte wrote:
> 
> Hmm. At least this does'nt seem like something that the xip 
> infrastructure should be concerned with: it will ask for 
> get_xip_page() [or get_xip_pfn()], and return temporary references via 
> put_xip_page/pfn(). The mtd layer has to decide when to pospone 
> get_xip_page() calls and when to ask for references being returned. On 
> the other hand, I think we should make sure get_xip_page() targets may 
> call schedule() in case the page we ask for is currently unavailable 
> while an erase operation is in progress.

Why schedule()?  I believe we should not wait but process the fault
immediatly via one of the methods Jared mentioned:

>> If you get a fault it gets routed to the filesystem .fault or
>> something like that.  The .fault routine can:
>> (a) suspend the erase
>> (b) copy the page to RAM
>> (c) update the pte to point to RAM
>> (d) resume the erase
>> -or-
>> (a) suspend the erase
>> (b) reenable the pte
>> (c) wait a short time
>> (d) disable pte again
>> (e) resume the erase

The second variant could be a bit hairy.  How can one ensure that (c)
only waits a short while and not much longer?  So I tend to prefer the
first variant.

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
