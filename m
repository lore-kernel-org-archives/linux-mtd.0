Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HM6jS-00078a-QC
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 18:07:27 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1RI5000010481
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:05:00 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1RI4xL5529096
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 11:04:59 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1RI4xPh008841
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 11:04:59 -0700
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1172598460.17031.4.camel@sauron>
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
	<1172598460.17031.4.camel@sauron>
Content-Type: text/plain
Date: Tue, 27 Feb 2007 12:04:57 -0600
Message-Id: <1172599497.3885.2.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Christoph Hellwig <hch@infradead.org>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-02-27 at 19:47 +0200, Artem Bityutskiy wrote:
> Hello Alexander,
> 
> On Tue, 2007-02-27 at 14:50 +0100, Alexander Schmidt wrote:
> > UBI should use the kthread API, which makes completions and signal
> > handling go away.
> 
> how feasible and possible is to get rid of this UBI unit altogether?

Depends I suppose.  Is it going to make a large runtime functionality or
performance impact if a background thread isn't running?

josh
