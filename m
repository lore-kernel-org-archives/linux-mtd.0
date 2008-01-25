Received: from e35.co.us.ibm.com ([32.97.110.153])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JIWBC-0003E7-Bb
	for linux-mtd@lists.infradead.org; Fri, 25 Jan 2008 21:33:49 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m0PLSoa2012212
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2008 16:28:50 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m0PLSnJN073284
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2008 14:28:49 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m0PLSnao016101
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2008 14:28:49 -0700
Date: Fri, 25 Jan 2008 15:28:29 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] UBI: introduce atomic LEB change ioctl
Message-ID: <20080125152829.591def16@zod.rchland.ibm.com>
In-Reply-To: <20080124165453.30169.40332.sendpatchset@golum>
References: <20080124165453.30169.40332.sendpatchset@golum>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 24 Jan 2008 18:54:53 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:

> >From e405cf1dc645e7931df0e47ee7408d5251e2d9d0 Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Thu, 24 Jan 2008 16:15:14 +0200
> Subject: [PATCH] UBI: introduce atomic LEB change ioctl
> 
> We have to be able to change individual LEBs for utilities like
> ubifsck, ubifstune. For example, ubifsck has to be able to fix
> errors on the media, ubifstune has to be able to change the
> the superblock, hence this ioctl.

Could you explain a bit more?  What exactly does "atomic" mean?

This seems like it's similar to volume update, only on a LEB level
right? If so, could you make volume update just use this or somehow
combine them?

Maybe I've just been away from UBI too long.  It sounds cool, but I
don't fully understand what the intention is.

josh
