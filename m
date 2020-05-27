Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C31C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 09:21:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B202072D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 09:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHNmZFCQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B202072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTt07DUZYyXlyYxEMXenFusn3cBaq4Cy2iTMoC9GYSA=; b=qHNmZFCQluv52j
	0LEqLZRrg2mx87UOLm7BeHfa5Z9sp64fhPKlLELeFOXiClqAi97fQV9icpvMsvQGLVSpw6onm3jRc
	5HfVdqSjan5lW4rM+HvfzWphx+VxNR2Hp2W3N55a9N0PaqLDLG0jHK/7IPrQIG5J357AesmX3J2OH
	dLhD6QYE77UAr65w3IqJatNUijZOGwP/MTmdkbBesAggdGGXSybWC+KIB+b7xu2LgQY4WBEB/bg2b
	3QnJyBBQSejDMup0UzeLZXqEAjbb79az5mYKEwHi1QvWUcmpybYIx+WQsqheuSEQ+qE5S4ILiq7qc
	PhfSyPjzmfa/J1er64mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdsEx-0003nU-5q; Wed, 27 May 2020 09:20:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdsEt-0003nB-Sa
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 09:20:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4669E2A36FE;
 Wed, 27 May 2020 10:20:40 +0100 (BST)
Date: Wed, 27 May 2020 11:20:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare
 methods to avoid race condition
Message-ID: <20200527112036.69506ed5@collabora.com>
In-Reply-To: <5a3cd626-fb5c-d87c-9cfa-3992caad3ebe@hisilicon.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
 <20200526114348.6295df6b@collabora.com>
 <5a3cd626-fb5c-d87c-9cfa-3992caad3ebe@hisilicon.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_022044_056426_0CD038BF 
X-CRM114-Status: GOOD (  28.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 john.garry@huawei.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 May 2020 16:55:00 +0800
Yicong Yang <yangyicong@hisilicon.com> wrote:

> Hi Boris,
> 
> 
> On 2020/5/26 17:43, Boris Brezillon wrote:
> > On Thu, 21 May 2020 19:23:51 +0800
> > Yicong Yang <yangyicong@hisilicon.com> wrote:
> >  
> >> The controller can be shared with the firmware, which may cause race
> >> problems. As most read/write/erase/lock/unlock of spi-nor flash are
> >> composed of a set of operations, while the firmware may use the controller
> >> and start its own operation in the middle of the process started by the
> >> kernel driver, which may lead to the kernel driver's function broken.
> >>
> >> Bit[20] in HISI_SFC_V3XX_CMD_CFG register plays a role of a lock, to
> >> protect the controller from firmware access, which means the firmware
> >> cannot reach the controller if the driver set the bit. Add prepare/
> >> unprepare methods for the controller, we'll hold the lock in prepare
> >> method and release it in unprepare method, which will solve the race
> >> issue.  
> > Okay, so it looks like what we really need is a way to pass sequences
> > (multiple operations) that are expected to be issued without
> > interruptions. I'd prefer extending the spi_mem interface to allow that:
> >
> > int spi_mem_exec_sequence(struct spi_mem *spimem,
> > 			  unsigned int num_ops,
> > 		  	  const struct spi_mem_op *ops);
> >
> > struct spi_controller_mem_ops {
> > 	...
> > 	int (*exec_sequence)(struct spi_mem *mem,
> > 			     unsigned int num_ops,
> > 			     const struct spi_mem_op *op);
> > 	...
> > };  
> 
> The prepare/unprepare hooks is just like what spi_nor_controller_ops provides.
> Alternatively we can use the interface you suggested, and it'll require
> upper layer(spi-nor framework, etc) to pack the operations before call
> spi_mem_exec_sequence().

We have to patch the upper layers anyway, right?

> 
> 
> >
> > The prepare/unprepare hooks are a bit too vague. Alternatively, we
> > could add functions to grab/release the controller lock, but I'm not
> > sure that's what we want since some controllers might be able to address
> > several devices in parallel, and locking the whole controller at the
> > spi-nor level would prevent that.  
> 
> I suppose the method is optional and device may choose to use it or not
> following their own design. And the implementation is rather controller
> specific, they may choose to lock the whole controller or only the desired
> device to operate. 

Yes, this is what I'm complaining about. How can the upper layer know
when it should call prepare/unprepare? Let's take the SPI NAND case,
should we prepare before loading a page in the cache and unprepare
after we're done reading the page, or should we unprepare just after
the page has been loaded in the cache? BTW, you've not patched the SPI
NAND layer to call ->prepare/unprepare().

> 
> 
> >
> > BTW, I don't know all the details about this lock or what this FW is
> > exactly (where it's running, what's his priority, what kind of
> > synchronization exists between Linux and the FW, ...), but I'm worried
> > about potential deadlocks here.  
> 
> For SFC controller, both firmware and the kernel driver will require the
> lock before a sequence of operations, and single operations like register
> access for spi-nor flash is implemented atomically. Once the lock is held
> by firmware/driver, then the controller cannot perform the operations sent
> by the other one unless the lock is released.

Yes, that's my point. What prevents the FW from preempting Linux while
it's holding the lock and waiting indefinitely on this lock. Is the FW
running on a separate core? Don't you have other IPs with the same kind
of locks leading to issues if locks are not taken/released in the same
order? ...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
