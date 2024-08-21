Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58EFC5320E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gim4qI/4z7d6D0h9E4fJXAUi5dOSmrcQvmV4w+G94mk=; b=pmLrOlWG0tG4Mr
	EB+IxnYybsHd6JNVQHHPQeie9juk+YH5QIo5p1dWEbqItPX3YYkEfGIMaLelsKqx+GUyXh+ov2+vI
	NqZa9xORqG08agjnKGOe4f+Q9gSpu/0W8BAU2a0x5MP1I7avkqwYrg726OjXe/qshHXdjnRDyj19X
	0IWw9trCjVsowYC4MXNaWkqWj34vwW3TTi3sU0z7Kzw9sFHxiw6ZjqEgg4qVWZp3BJX9jqBpLL5Aw
	qmYsVz0uoOpc2OeO29Th3tNu99UpL34eC/iYqSnUjLFdkxfbWJ6wKfvlVZgXruWU3QP6+zUZM4aTJ
	yG0arNGIRI4nEzrcTQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglCE-000000095nC-1jP3;
	Wed, 21 Aug 2024 13:16:18 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglB5-000000095L5-3iO0
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 13:15:09 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e1661dcbc2fso1098516276.0
        for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2024 06:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724246107; x=1724850907; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ND82RYn7MaNSpzb7NAOhxgHIKl6E8lI43wkdqiWtnl8=;
        b=pD/6aEyf/Mtef85JrZ6/0izuHY+AjCbQzOamZmYohvMaEKu4FxrYa+FbQZkYeLsb8I
         EiK1B8FvKQ40LzhgHIn1yx/Po9yHa5rp3Y7Tr6izK0Ab50MZCBl3VWJA0DHYdXZJ43dw
         TgYBehcY9IIBlMsujMDCPyqxbK3EKeoPSrd5VygCsZT2fWRALTjJP92gEIDq8PZNjbLR
         aQ2btKm8O4ZhXgrVtVWD9aN8kSXJ+DNifhIceP1n/Du0vWdzcTLwJ/VWDYVJvqC5s+2Z
         nqz75wfIDhjGK+vDu2qiDvx0fOt7677+nIAGPvkWgszCz7FaKXrEbS9TDxpq+PiVR1p6
         WLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724246107; x=1724850907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ND82RYn7MaNSpzb7NAOhxgHIKl6E8lI43wkdqiWtnl8=;
        b=E8Ql/5Q20TmT3MScRrWEe85WNi1twtEz9AedrA0nCXsMKxw60JWCk91uZr8KzFUlKF
         w2WYSmA1XEefvp8SZaZpFNnNkyp1bwN+DxCa3KBXKurqX0FrJJ5E/Jl/qnKqv+5hwerx
         7TfpwT4JLJ1juH8KISNTpPviMCagLUxrN0Ba0EGhBPPV9siZPHp/9I9xPNZcYlzHorcK
         bpd9DQfHiI0gRAF0GovABcwo9W/k//NJoIztd/IoezcdjD5d2QlNRpt3aGU7gB2RNfCZ
         QIsaYvDwxY7t/7n1xI6kbgYqgtiO3DwyJpR0/9sIeliEW6zIeBPbgs9cIeDAdEIWG/TE
         PayQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ip3CuHFckBBqaD8W7e0vNuwi1aM9DtwuvK8/zu/yUDhYs+Ez0O9stxCPmfZ4krxoBqPID077ia8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLDx0dWtj8rHQJePsPRZdPr52p41czlQ3p+g8acn06+jUOCroF
	NxU7xdnypVOJB4mqRBACHrE5HLhiO4sr1bsFyrpg83DyMyrmCxHFOEjL38xJdPaAZO+aPMG0+hL
	OzjMfY0V5kYyk5xXJzXk73Wwpehf9r/3pmsOdVQ==
X-Google-Smtp-Source: AGHT+IHMFrZYqcZ+YKGN6ef7K45igq5+avAhanl2GUzgRB1IEkFvh06daR52Rd2yBylT0BHej583UvwMIolio13isH8=
X-Received: by 2002:a05:6902:1244:b0:e0e:8319:c6e4 with SMTP id
 3f1490d57ef6-e16663ec35cmr2880278276.8.1724246106550; Wed, 21 Aug 2024
 06:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240809172106.25892-1-ansuelsmth@gmail.com> <20240809172106.25892-4-ansuelsmth@gmail.com>
 <20240813200734.GA1659224-robh@kernel.org> <66c5b8ec.5d0a0220.11ef1f.b572@mx.google.com>
In-Reply-To: <66c5b8ec.5d0a0220.11ef1f.b572@mx.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Aug 2024 15:14:29 +0200
Message-ID: <CAPDyKFq0cR10d1jUc5gnoUR5P=cbDEZy2iA-HOq9oNcWZevbDg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: mmc: add property for partitions node
 in mmc-card node
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Joern Engel <joern@lazybastard.org>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Saravana Kannan <saravanak@google.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_061507_950567_DD36E4B4 
X-CRM114-Status: GOOD (  39.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 21 Aug 2024 at 11:52, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Tue, Aug 13, 2024 at 02:07:34PM -0600, Rob Herring wrote:
> > On Fri, Aug 09, 2024 at 07:21:01PM +0200, Christian Marangi wrote:
> > > Add property for defining partitions node in mmc-card node to define
> > > partitions in DT by the use of the block2mtd module to use block
> > > devices as MTD.
> >
> > You justified patch 1 saying eMMC already supported this, but then here
> > you add support.
> >
> > Both are a NAK for me as both already have a way to describe partitions
> > with GPT.
> >
>
> I think this got a bit confused and hope we can find a way to add
> support for this.
>
> What is "already supported" is assigning an OF node so driver can
> reference it. This patch was just adding the nodes in the schema to say
> that partitions can be defined.
>
> I think what is not clear is that block devices might be used as raw
> devices without a partition table defined in the device. In such case
> it's the kernel that define a fixed partition table.
>
> One example is [1] where the partition table is provided by cmdline.
> Similar to cmdlinepart MTD parser.
>
> The use of block2mtd is just to make use of the MTD parser system.
>
> Considering
> - eMMC is soldered to the device (no dynamic scan)
> - cmdline might be not tunable and hardcoding it might also be
>   problematic (as some cmdline needs to be used)
> - concept of fixed partition for block device is already a thing and
>   used a lot (android AFAIK)

Sorry for sidestepping your discussion, but I just wanted to add a few comments.

It's not clear to me why we need something different than what we
already have today.

If it's a partuuid/uuid/label or a fixed block-partition from the
command line, we still need to know what partition we shall use for
what. So why is this problem different from how we manage filesystem
mounts, for example?

>
> I think it should be acceptable to introduce in DT support for defining
> fixed partition for block devices and some kind of parser system similar
> to MTD. What do you think? Would this be more acceptable? Idea is to
> just have a DT schema that makes use of the values that can be set in
> [1].

In DT we can describe that there is an eMMC card soldered to the
board, because it's a description of the HW. But describing what
stored inside the eMMC-flash doesn't belong in DT.

>
> Hope we can find a solution to this, I'm totally OK for dropping NVMe as
> I understand it's PCIe stuff and very dynamic but OEM are making lots of
> use of eMMC and are starting to use these strange way (block2mtd) as we
> currently don't give a proper and easy solution for the task.

I certainly appreciate that you are trying to solve the fragmentation
issue around this, but it looks like we need a different approach than
using DT to describe partitions.

>
> [1] https://github.com/torvalds/linux/blob/master/Documentation/block/cmdline-partition.rst
>

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
