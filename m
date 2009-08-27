Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgjpR-0006T4-Tb
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 18:36:14 +0000
Received: from mail-sj1-12.sj.broadcom.com (mail-sj1-12.sj.broadcom.com
	[10.16.128.215]) by mail-irva-13.broadcom.com (Postfix) with ESMTP id
	1BB7174D03 for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2009
	11:36:00 -0700 (PDT)
Received: from lxrmn-wrlinux01.ric.broadcom.com (
	lxrmn-wrlinux01.ric.broadcom.com [10.136.64.23]) by
	mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id C68F420501 for
	<linux-mtd@lists.infradead.org>; Thu, 27 Aug 2009 11:35:59 -0700 (PDT)
Received: from lxrmn-wrlinux01.ric.broadcom.com (
	lxrmn-wrlinux01.ric.broadcom.com [127.0.0.1]) by
	lxrmn-wrlinux01.ric.broadcom.com (8.14.3/8.14.3) with ESMTP id
	n7RIZxR2004903 for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2009
	11:35:59 -0700
Received: (from leochen@localhost) by lxrmn-wrlinux01.ric.broadcom.com (
	8.14.3/8.14.3/Submit) id n7RIZxZj004902 for
	linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 11:35:59 -0700
Date: Thu, 27 Aug 2009 11:35:58 -0700
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v5] [MTD] BCMRING: mtd nand umi driver support
Message-ID: <20090827183558.GB4222@broadcom.com>
References: <20090821221701.GF14815@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20090821221701.GF14815@broadcom.com>
Content-Type: text/plain;
 charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

As our bcmring code have been merged by Russell into linux-next repo, we really
need this mtd driver be merged into the kenrel as well to get a
working system.
So, I just want to know if our patch for bcmring mtd driver is accepted or not.
If not, what shall we improve? If yes, when can we get our code into linux-next repos?
Or we have to submit the patch to any tracking system?

Thanks for your advice.

best,

Leo

On Fri, Aug 21, 2009 at 03:17:01PM -0700, Leo (Hao) Chen wrote:
> Hi,
> 
> I'd submit the latest version of our patch to support mtd nand driver
> for bcmring arch. This patch is against the latest git tree and
> passed the checkpatch.pl script. The patch set of bcmring arch. support
> has been accepted by Russell in linux-arm-kernel. Russell told me
> that the mtd nand driver support of bcmring should go through the linux-mtd list.
> So, I submit my mtd nand driver patch here again.
> Thanks for all the review comments before.
> I've fixed all the bugs, coding style errors/warnings and split the inline functions
> into separate C file.
> 
> Please review it again and let us know if there is any other problem.
> If it is okay, can this patch be accepted?
> 
> Thanks,
> 
> Leo
> 
