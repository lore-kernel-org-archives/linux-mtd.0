Received: from e33.co.us.ibm.com ([32.97.110.151])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JA7GQ-0003N1-8n
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 17:20:31 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m02HEb53020130
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jan 2008 12:14:37 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m02HEbJD110374
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jan 2008 10:14:37 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m02HEact029820
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jan 2008 10:14:37 -0700
Date: Wed, 2 Jan 2008 11:13:00 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: David Brown <davidb@davidb.org>
Subject: Re: Does UBI support MLC nand flash?
Message-ID: <20080102111300.544ea5cb@zod.rchland.ibm.com>
In-Reply-To: <20080102165228.GA11327@old.davidb.org>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
	<bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
	<20080102063945.5355d112@zod.rchland.ibm.com>
	<20080102165228.GA11327@old.davidb.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Nancy <nancydreaming@gmail.com>, kmpark@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Jan 2008 08:52:28 -0800
David Brown <davidb@davidb.org> wrote:

> On Wed, Jan 02, 2008 at 06:39:45AM -0600, Josh Boyer wrote:
> >On Wed, 2 Jan 2008 14:19:16 +0800
> >Nancy <nancydreaming@gmail.com> wrote:
> >
> >> oh, forgot to metion UBI.
> >> UBI has two headers for each LED/PED, they are not write at same time.
> >> Is that against MLC nand's no ramdom write and  write only once
> >> permission?
> >
> >Not to my knowledge.  The second header is written to the second page
> >in the block if subpage writes aren't supported by the underlying
> >chip.  That should still work fine for MLC.
> 
> Many MLC devices will not allow you to write to the second page after
> having written to the third or subsequent pages.  Would this still work?

Yes... UBI doesn't write actual data to the blocks until both headers
are in place.

josh
