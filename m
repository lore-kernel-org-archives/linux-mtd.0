Return-Path: <SRS0=fMNX=LS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053C4C49EA5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jun 2021 16:10:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5CB61375
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jun 2021 16:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5CB61375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tcGXAwA+EoCYqrXMkDiosMACPIMxWR5UZXjekMu7zSA=; b=kfiDaQhSdss6CMIEfgIi8dj/LX
	/+Hx/umtpZqfZxo5+d8Zrl3b/aXipvvMMakTcb43/N7mB4lD09Y7kxkvZm8hCGLYONiVaq+K/Xk1d
	nmumRZDeDWDDY7DH6ZsUutMGqivNuj4wFzWZ5wgAORpVFCVrGE9a3nIKKWRVGpux0EakVd4TsBf5N
	vzcVU2r72u/O2o1JGGSFcC58qcTuB/ZDVy748ijjaXuZP4EWCioi+HGkFBU3AFgwH6REGEcfQUYwU
	xCUBAhbM0lJ/Z53OUdx/wJtUYnGrPiQ/bIuaSX4EUzF9envobxsQG39P1kDuNdprqeIL832Mp+Vq/
	n6GXNrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwRuw-00FPaW-Vb; Thu, 24 Jun 2021 16:09:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwRup-00FPZ9-JR
 for linux-mtd@lists.infradead.org; Thu, 24 Jun 2021 16:09:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id n20so9292995edv.8
 for <linux-mtd@lists.infradead.org>; Thu, 24 Jun 2021 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NhXbcWrm933uql/n/aBmpwjEP8OaVS7r8CFi6W764Qg=;
 b=VZiCjLICEcJDJap5vKQBCc3Qflk3UIzrL5NRG54tE6sEHHyIiEORHnWYQYhGU6WWgu
 aDwFIjguK7HxzaRzxMfkfGl6u2zrQnJdYMcYVUYlBFazUWm+IhZ1JCHXihG9BALmb35U
 ujz1VYjEuxriiyZ2iospFGwSKru0bD9+yxd3VvARVFx4autzgPtdPDt6HukzuM+veJR7
 KVqUYu6JBAQbPga4okVnH8aRrY7y5fgGbDgDKVA+6w050uaFWaFrxBSUdPNOJli6tOFc
 iotb3wOzRbQY1edGOqvlMQ48ZSca2nV6jzs2IL+GMIu9i4ENHM1Au2N9JzIED4Lmj7Kx
 I2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NhXbcWrm933uql/n/aBmpwjEP8OaVS7r8CFi6W764Qg=;
 b=MAzzfSB/nV2/5c2m9rBrLNbzsDWVeguFsvvNRq77C4n5iF4ZEC/6jForRN7KHlYAKU
 OFyIiMPYwtZfmxSAXtbuKyn1AYXW6QewnYKYLqKO5FHGAQcxE5F7lFg1vmC3CXWR/I5u
 JALlHiqlVKekC1HTYHb0EvokhxZugHmiccwlJf0y6+tUcy22vUVLGLxTl3xvaMmVxMxr
 WoWH5X9J5U4ob/x2A/6HgX/30x0UIr/RkFgmyp1LGMOFrq4tc9yXsUMyFvcPNX+Mkful
 HgnRsJtghFtLdS7vKvCbXp0wH1p65eNugt6HpsC0g0J9keH7pN2GAmZQF+oOUXgRmNGH
 eg8g==
X-Gm-Message-State: AOAM532YA2pbNH7QUbBkebBRy3h7pNHq/PWRs3LUKMdwy7SH1mXtLuea
 ly5BlhQpNK+cGpLddI4F7Si30TdZKCUiVFODNYv09McY4nex7g==
X-Google-Smtp-Source: ABdhPJyHv3bFXE94qKF4P2jRHaesfIj8LSinkd90w1J4itsRJl2LWlKJS88uPRXvKA6do6N6MinjVkevV4aDe4q8yEE=
X-Received: by 2002:a05:6402:3507:: with SMTP id
 b7mr8403605edd.66.1624550957782; 
 Thu, 24 Jun 2021 09:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiZL4wXc__+Zx+m7TMjUjNq10tykHow3R9AvCknSNR6bQ@mail.gmail.com>
In-Reply-To: <CAOuPNLiZL4wXc__+Zx+m7TMjUjNq10tykHow3R9AvCknSNR6bQ@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 24 Jun 2021 21:39:06 +0530
Message-ID: <CAOuPNLhoLBwksNt+tJ2=hZr-TGHZgEiu7dgk66BUsraGA16Juw@mail.gmail.com>
Subject: Re: Query: UBIFS: How to detect empty volumes
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard@nod.at>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_090919_700320_EC96BE3C 
X-CRM114-Status: GOOD (  13.47  )
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

Hi,

I have one basic query related to UBIFS volumes on a system with NAND partition.
In short, how to detect a particular empty volume inside a system
partition while flashing the partition image?

Suppose I have one big system partition that consists of 4-5 ubi
volumes inside it with varying sizes.
Lets say:
-- System Partition (ubi image)
    - rootfs volume (ro, squashfs)
    - data volume (rw, ubifs)
    - firmware volume (ro, ubifs)
    - some-other volume (ro, squashfs)

Consider that all these could be flashed together as part of
system.ubi image in a single shot from the bootloader.
Now, suppose, one of the volume image (say firmware) is missing or
remains empty (as you know we can have empty volumes).

So, during system image flashing, we wanted to detect if one of the
volume (firmware) is empty.
Since this is an important volume, so we wanted to detect if this
volume is empty/missing we will abort flashing the system partition.
As there is no point in booting the system without this partition.

So, I am exploring options, how can this be detected ?
I mean is there any kind of magic number or header information which
we can read to detect a particular empty volume ?
Can we get any information from just "system.ubi" image to indicate
about the volume information ?
Also it could be possible that 2 or more volumes are empty, but we are
only concerned about one particular volume (firmware), so how to
detect particular volume ?

If anyone has any thoughts about this requirement, please share your opinion.


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
