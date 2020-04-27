Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C7BC4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6F2214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/igY/3S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C6F2214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2b+4sBa1DtD/rOKp35nsEWEE8DXzWZj38eGWhglknc=; b=V/igY/3SrJX2VX
	P/C6G9XxTnK65zjdipLfVmlpb79dyePbFJYYCbWCX9GuKb69PV0i6FUFPCZ/RAnSwxKIF2KeYwbhG
	IitwKvKA0H9tQrEFCO4lKqXHAmmmgL7E4ahcFbZzBd095yMuhjeQ8+iMA2Hca7cEBztsi4SGauM9j
	MAS0iPGBVyaukozmC1eHqYAUMhaEJokkZ2HMX+nDu/URNf6jx2r3yDOtJm3LJkrTOV2sRp7UbyQkk
	b/+dIwU1vxUiEFcB0WZOh0H8DkYBtSfAhpD+WP+2wdvWRQxpJr6/cVVMSJVkBBZYlPs9vkWkyfM3A
	2PTHxFzcY+EmgSGgU+Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT99G-0003Kf-1i; Mon, 27 Apr 2020 19:10:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT99C-0003K5-Gf
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:10:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BF9392A05B6;
 Mon, 27 Apr 2020 20:10:28 +0100 (BST)
Date: Mon, 27 Apr 2020 21:10:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: Fix mtd not the same name not registered if nvmem
Message-ID: <20200427211024.174f5830@collabora.com>
In-Reply-To: <20200427164922.5829717f@xps13>
References: <20200401100240.445447-1-ribalda@kernel.org>
 <20200402065953.9974-1-ribalda@kernel.org>
 <CAPybu_34nSmbu4JMK-uA3SWrj_eMUftZ8S6zf1Vpg3Etkz3SPw@mail.gmail.com>
 <20200427162222.1c2b2c85@xps13>
 <20200427163711.07614619@collabora.com>
 <20200427164922.5829717f@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_121030_685827_237ED0A7 
X-CRM114-Status: GOOD (  27.51  )
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 16:49:22 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 27 Apr
> 2020 16:37:11 +0200:
> 
> > On Mon, 27 Apr 2020 16:22:22 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Ricardo,
> > > 
> > > Ricardo Ribalda Delgado <ribalda@kernel.org> wrote on Tue, 14 Apr 2020
> > > 15:47:23 +0200:
> > >     
> > > > Ping?
> > > > 
> > > > On Thu, Apr 2, 2020 at 8:59 AM Ricardo Ribalda Delgado
> > > > <ribalda@kernel.org> wrote:      
> > > > >
> > > > > When the nvmem framework is enabled, a nvmem device is created per mtd
> > > > > device/partition.
> > > > >
> > > > > It is not uncommon that a device can have multiple mtd devices with
> > > > > partitions that have the same name. Eg, when there DT overlay is allowed
> > > > > and the same device with mtd is attached twice.
> > > > >
> > > > > Under that circumstances, the mtd fails to register due to a name
> > > > > duplication on the nvmem framework.
> > > > >
> > > > > With this patch we add a _1, _2, _X to the subsequent names if there is
> > > > > a collition, and throw a warning, instead of not starting the mtd
> > > > > device.
> > > > >
> > > > > [    8.948991] sysfs: cannot create duplicate filename '/bus/nvmem/devices/Production Data'
> > > > > [    8.948992] CPU: 7 PID: 246 Comm: systemd-udevd Not tainted 5.5.0-qtec-standard #13
> > > > > [    8.948993] Hardware name: AMD Dibbler/Dibbler, BIOS 05.22.04.0019 10/26/2019
> > > > > [    8.948994] Call Trace:
> > > > > [    8.948996]  dump_stack+0x50/0x70
> > > > > [    8.948998]  sysfs_warn_dup.cold+0x17/0x2d
> > > > > [    8.949000]  sysfs_do_create_link_sd.isra.0+0xc2/0xd0
> > > > > [    8.949002]  bus_add_device+0x74/0x140
> > > > > [    8.949004]  device_add+0x34b/0x850
> > > > > [    8.949006]  nvmem_register.part.0+0x1bf/0x640
> > > > > ...
> > > > > [    8.948926] mtd mtd8: Failed to register NVMEM device
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>      
> > > 
> > > Thanks for proposing this change. Indeed we are aware of the problem
> > > and the best solution that we could come up with was to create an
> > > additional "unique_name" field to the mtd_info structure. This new
> > > field would have the form:
> > > 
> > >     [<parent-unique-name><separator>]<mtd-name>
> > > 
> > > The separator might be '~' (but I am completely open on that), and that
> > > would give for instance:
> > > 
> > >     my-controller~my-device~my-part~mysub-part    
> > 
> > I'd prefer something slightly more standard for the separator, like '/',
> > which is what we usually use when we want to represent a path in a tree.
> > I do agree on the general approach though.  
> 
> I am not sure / is a valid separator here we would use this
> name to create a sysfs entry. Would it work?

Hm, you're probably right, I didn't check how the name was used by
nvmem. I also see that partition names can contain spaces, which is
not that great. So, if we want to use mtd->unique_name we should
probably sanitize it before passing it to nvmem. All this makes me
reconsider your initial proposal: use 'mtdX' as the nvmem name. It's
unique and it's simple enough to not require this extra sanitization
pass, on the other hand, guessing the nvmem partition based on such an
opaque name is not simple, not to mention that the mtd device name can
change depending on the probe order.

I also wonder if creating nvmem devs unconditionally for all mtd
devices is a good idea. Sounds like we should only do that if there's an
explicit request to have one partition exposed as an nvmem.

Note that, no matter what we decide about nvmem, I think having unique
names at the MTD level is a good thing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
