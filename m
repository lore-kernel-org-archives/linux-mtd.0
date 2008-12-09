Received: from e31.co.us.ibm.com ([32.97.110.149])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9tKs-0005RP-2q
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 03:32:34 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mB93VDpe027578
	for <linux-mtd@lists.infradead.org>; Mon, 8 Dec 2008 20:31:13 -0700
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mB93WV0O211406
	for <linux-mtd@lists.infradead.org>; Mon, 8 Dec 2008 20:32:31 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mB93WVjK000383
	for <linux-mtd@lists.infradead.org>; Mon, 8 Dec 2008 20:32:31 -0700
Date: Mon, 8 Dec 2008 22:32:27 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Sean MacLennan <smaclennan@pikatech.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081208223227.19a702a9@zod.rchland.ibm.com>
In-Reply-To: <20081208214512.461276d2@lappy.seanm.ca>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
	<20081204090107.20269571@zod.rchland.ibm.com>
	<20081208193446.37e27e26@lappy.seanm.ca>
	<20081209021115.GA13948@oksana.dev.rtsoft.ru>
	<20081208214512.461276d2@lappy.seanm.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, avorontsov@ru.mvista.com,
	linux-mtd@lists.infradead.org, devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 Dec 2008 21:45:12 -0500
Sean MacLennan <smaclennan@pikatech.com> wrote:

> On Tue, 9 Dec 2008 05:11:15 +0300
> "Anton Vorontsov" <avorontsov@ru.mvista.com> wrote:
> 
> > So this is a controller with partitions? ;-)
> 
> Actually, I did it this way to mimic the look of the NOR. Really, we
> shouldn't care about the NAND chip.

Except there is no controller in front of the NOR.  It's all just
MMIOs.  With NDFC, there is a controller, you have to do things to it
to talk to different chips, etc.

josh
