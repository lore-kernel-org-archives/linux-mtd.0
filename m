Received: from mtagate5.de.ibm.com ([195.212.29.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IHw7P-0002Xq-6Y
	for linux-mtd@lists.infradead.org; Mon, 06 Aug 2007 07:31:08 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id l766UqnK111424
	for <linux-mtd@lists.infradead.org>; Mon, 6 Aug 2007 06:30:52 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l766UqUJ2220286
	for <linux-mtd@lists.infradead.org>; Mon, 6 Aug 2007 08:30:52 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l766UmWt012604
	for <linux-mtd@lists.infradead.org>; Mon, 6 Aug 2007 08:30:49 +0200
Message-ID: <46B6C011.4020503@de.ibm.com>
Date: Mon, 06 Aug 2007 08:30:41 +0200
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
	<1186146543.2931.82.camel@pmac.infradead.org>
	<20070803131815.GG19344@lazybastard.org>
	<6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
In-Reply-To: <6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
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
> Hmmm, we'd definitely benefit from having a hook in idle to trigger
> the erase to resume.  Having hooks for entry into kernel space sounds
> interesting, but if you leave it too quickly and suspend the erase you
> don't make forward progress.  However, I'm not sure how you'd
> determine whether a given process can continue without suspending the
> erase.

*shrug*. I'd rather want to go a path without hooks, like the one 
David's suggesting. Hooks are known to be highly flammable on lkml.
