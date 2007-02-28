Received: from mtagate3.de.ibm.com ([195.212.29.152])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMJyR-0002x3-97
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 08:15:47 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate3.de.ibm.com (8.13.8/8.13.8) with ESMTP id l1S8FVp7060624
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 08:15:31 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1S8FV911532120
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 09:15:31 +0100
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1S8FVBV020144
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 09:15:31 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, dedekind@infradead.org
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
Date: Wed, 28 Feb 2007 09:15:26 +0100
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
	<1172599497.3885.2.camel@zod.rchland.ibm.com>
	<1172599889.17031.9.camel@sauron>
In-Reply-To: <1172599889.17031.9.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702280915.26914.alexs@linux.vnet.ibm.com>
Cc: Christoph Hellwig <hch@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 February 2007, Artem Bityutskiy wrote:
> On Tue, 2007-02-27 at 12:04 -0600, Josh Boyer wrote:
> > On Tue, 2007-02-27 at 19:47 +0200, Artem Bityutskiy wrote:
> > > Hello Alexander,
> > > 
> > > On Tue, 2007-02-27 at 14:50 +0100, Alexander Schmidt wrote:
> > > > UBI should use the kthread API, which makes completions and signal
> > > > handling go away.
> > > 
> > > how feasible and possible is to get rid of this UBI unit altogether?
> > 
> > Depends I suppose.  Is it going to make a large runtime functionality or
> > performance impact if a background thread isn't running?
> 
> Sorry for vagueness, I do not mean to remove th background _process_, we
> really need it. I meant to remove the UBI unit source-wise and use the
> kthread calls directly. I am busy with other stuff right now and wanted
> Alexander to check how much ugliness or niceness we would introduce with
> that change.

Basically, with using the kthread api, it is still neccessary to have the
following functions:

1) start the thread with kthread_create()
2) a main loop for the thread
3) enqueue work in the pending work list
4) kill/stop the thread

As 3) is only done by the wear leveling unit, the code could be moved
there, IMO. Starting and stoping the thread could also be done in the
wl init and close functions, so it seems sensible to move everything to
the wear leveling unit.

A point that causes complexity in the code is that we have two ways of
stopping the thread:

1) If ubi goes into read only mode or if the thread is disabled via sysfs,
the thread is put to sleep, pending works are not finished
2) If ubi is shut down, the thread finishes all pending works and then
exits.

An enhancement here would be to remove the sysfs functionality, and make
the thread exit when going in ro_mode, while still not finishing the
pending work (it is not possible to leave ro_mode during runtime, right?)

Regards,
Alex
