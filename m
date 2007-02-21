Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJtEG-0001ct-Hn
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 15:18:05 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1LFHd4n005514
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 10:17:39 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1LFHc7W512592
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 08:17:38 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1LFHcND012254
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 08:17:38 -0700
Subject: Re: [PATCH] [MTD] CHIPS: oops in cfi_amdstd_sync
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070221145420.GD464@lazybastard.org>
References: <758a2bbf0702201746p3959235ele3db9b600a9f8104@mail.gmail.com>
	<20070221145420.GD464@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 21 Feb 2007 09:18:40 -0600
Message-Id: <1172071120.24204.167.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vijay Sampath <vsampath@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-21 at 14:54 +0000, Jörn Engel wrote:
> On Tue, 20 February 2007 17:46:13 -0800, Vijay Sampath wrote:
> > 
> > The files cfi_cmdset_0002.c and cfi_cmdset_0020.c do not initialize
> > their wait queues like is done in cfi_cmdset_0001.c. This causes an
> > oops when the wait queue is accessed. I have copied the code from
> > cfi_cmdset_0001.c that is pertinent to initialization of the wait
> > queue.
> 
> Patch looks good, but I can no longer test it.  Josh may still have
> access to some commandset 20 chips.  Josh, any objections?

The patch looks good to me as well.  No access to those chips anymore,
but I have no objections.

josh
