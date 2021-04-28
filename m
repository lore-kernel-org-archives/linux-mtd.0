Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1181C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 15:39:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2858E6023C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 15:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2858E6023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c6zuLrKncjHrSaDz1KvJaKFV63lTKwLnvCcB0LTO90A=; b=iinabQR/MDc0xkAevt5lnGntg
	XV2qXCKo8xQDAKwo+ZYoDlDIYVobYYl9jD7n/LG48wP5mfMd1JVpTv5MpwitrV+4a6imIBI3Q5k6E
	VQDq1ZBE1nk6Ct2EnBY/c5EDrIjEK73I6c4k+aVRsWFQrE3wWs21prPJimtW5omDqFHEQGutsZ02C
	/gVuVL3xlJVFGzrS533rSTjh1vB2Dm8mCv42S/XO8Wx61hVqRVEouv932ECN6qf3AQKrTP/ala7yA
	VjnDX1cO+oxva3sgQuACFq+klmIfiqx5yzC1joEVO5jIwXqVS8bxlMv76qmRoMs4NHRSJJVQdmPBz
	EebFAf3QQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbmGj-003llY-PS; Wed, 28 Apr 2021 15:38:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmGM-003lg3-7L
 for linux-mtd@desiato.infradead.org; Wed, 28 Apr 2021 15:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SLEOlFo5zp9WVatlWokRO7XLf1rQZdLEFMPyIaFMtL4=; b=ux86JnzDdwzKWkfJxyl9vy64Ck
 chd3HULoRhKhj0I31rLGB7/6NxGIoysMekmS0AsHBoINHn8Hxq8DM9aDk/giXiox3R1gLu0ysiz1+
 zbDDQ9zGEvrGf6Z/h8EAVE6fuFwiPik2JczYb3FeQyE5SMOBCvpDquV/kHHHsncrNv0CovpV1rG30
 wf/9LIU+bJCvGk4gqTMxIDsMtxpda8fVVflhAAi9LjX2QZYkbqObdSrgmPVpgJrc44ss4yHEvKpwb
 8Lj+eSDf9rrWVlAQlQVxsDjSB+ZRUlnRZh5yanAwJ0CMZmvzQCrDHtOujBrZEODQPG5YneQ5CHhNt
 HIEzJw8Q==;
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmGJ-00HZcq-Fv
 for linux-mtd@lists.infradead.org; Wed, 28 Apr 2021 15:38:04 +0000
Received: by mail-oi1-x234.google.com with SMTP id m13so63426394oiw.13
 for <linux-mtd@lists.infradead.org>; Wed, 28 Apr 2021 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SLEOlFo5zp9WVatlWokRO7XLf1rQZdLEFMPyIaFMtL4=;
 b=ZqonFTtUw99OuJ2hfDUb8RkfWD8kgdOUI9ehks1B6auTSR+M73KLdCqy9uNIiGL92z
 cvDvGSL0L1YTIOW6t3nShGPMrWGWqk1JoBQqq7yE7hXKaDd1iBmynnxjQwvdK58HgeCc
 1HtDCxXDEIvPNQslhUe1MdWOgGoq/6TGbptaB92U4GbqpfNHIqWL8cTM34jptB1Qdrnt
 WR7/vTe98aFqx4Vcyo0DHtPc0+Zf9OYiuS79JhUKltRWiImY7lTxJ+QPPo38487f+2wB
 rjoKsPKwSsbXW4S4H9lRL2GcHwAGdCwPpr77hNK8IqCaIrSGrHzh91Jf02qocJEuns/g
 hQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLEOlFo5zp9WVatlWokRO7XLf1rQZdLEFMPyIaFMtL4=;
 b=nY100tzwF305XDLaRwOjnQb/Zv4xv5eLN+vA/Z+d7lQjRoXDT6G6tiNPy0L9K6JMiN
 cisPvaJ9BNM2X1XSosqIgSM131+RK4eaGlQyHnjicl8PSiaT+zvytr67YY1vPyH+xgR3
 O6lC522aPSjsFESG/Ecvbuer31NjEs9CQ/WSipx0H5ljPy8FgRFrFZ5ez+WZM8VFs5OI
 tRH2+G0PKJ8ryhhx7Et1AyzIrM4/Aumy2H9/kVVlHMUc+70SXsXUZAcsdhc06JG/CN27
 WJ0+zYuInTRUuyP+wEVK6p1cFGp3M5jQ8LS0oc2x+iVKQX4FXA1++ZhPGhEG2ukZ4GjI
 cEUA==
X-Gm-Message-State: AOAM532+LjGk0rYHCrrk6uVuBCNNW2pn2tzWP4OQPvw/XXizJS+0/9TY
 VlTbI0++kjwSqWD+bPRvd0yOgnnWPA5yuNpBXlQHHQ==
X-Google-Smtp-Source: ABdhPJxGOrqNk0Xk0VH1RsXq1v4lBe4McnXwsgMJTZwZB5AujhXvdBUIZFO77fJP4Bwlq/8UGv6W2E3xOiCeXu85HGw=
X-Received: by 2002:aca:5756:: with SMTP id l83mr3583333oib.90.1619624279060; 
 Wed, 28 Apr 2021 08:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210428052725.530939-1-awill@google.com>
 <dd33cf8d3a78d60eebbb6f1be90cb7d3@walle.cc>
In-Reply-To: <dd33cf8d3a78d60eebbb6f1be90cb7d3@walle.cc>
From: Alexander Williams <awill@google.com>
Date: Wed, 28 Apr 2021 08:37:47 -0700
Message-ID: <CACqsJN-Vernbp5kJc+qZ6nUW50xPWz_9DznLDjtTu=btSra09Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Export SFDP access to sysfs
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_083803_568709_AFCF76A2 
X-CRM114-Status: GOOD (  14.79  )
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

On Wed, Apr 28, 2021 at 12:58 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi Alexander,
>
> Am 2021-04-28 07:27, schrieb Alexander Williams:
> > Add the ability to specify a technology-specific attribute_group, and
> > expose the SFDP through spi-nor's private group. This enables user
> > space
> > to have full access to the contents of the SFDP, so all information is
> > available without regard for whether the kernel supports parsing it.
>
> Please see:
> https://lore.kernel.org/linux-mtd/20210318092406.5340-1-michael@walle.cc/

Thanks for the pointer! Sorry I didn't see that patch series already: My search
skills need some work... In any case, there's no good reason for me to duplicate
work.

I should probably comment on that series directly, but I'll note that one thing
I tried to do with the sysfs attributes here was avoid racing with user space.
The uevent is suppressed until all the related files are created in sysfs. See
http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/ for
Greg's explanation of a scenario.

- Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
