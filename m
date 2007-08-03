Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGu9f-0001t0-WE
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 06:13:21 -0400
Date: Fri, 3 Aug 2007 11:17:48 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: carsteno@de.ibm.com
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070803091747.GA18735@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<46B2E055.9010305@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46B2E055.9010305@de.ibm.com>
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

On Fri, 3 August 2007 09:59:17 +0200, Carsten Otte wrote:
> Jared Hulbert wrote:
> 
> >If you get a fault it gets routed to the filesystem .fault or
> >something like that.  The .fault routine can:
> >(a) suspend the erase
> >(b) copy the page to RAM
> >(c) update the pte to point to RAM
> >(d) resume the erase
> >-or-
> >(a) suspend the erase
> >(b) reenable the pte
> >(c) wait a short time
> >(d) disable pte again
> >(e) resume the erase
> Why don't we wait til the erase is completed?

An erase can take up to 5 seconds.

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
