Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB13AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 00:50:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8273160F58
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 00:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8273160F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6hf2ixx+p2e+FIbipw60KrrEdpJv30Jk+EwtbWnLo0=; b=m2pVyntdANTd5Y
	NZYfK9UxUWdFBx61EiONWwtRQGHrlkbZh1qgDXMn4w0GRzIUgg4J7V+/geYK4GyHaYxa2NHh8NDSh
	4yWYBfMbMnVDxA/FUgpgU6gvwK+Q5/lGAoUR0eI5enSKPlojKwFwzAfpDiOXAfkP1JboxwncDKuOB
	bMGosFgNE9NKO0rZiO7mZhlmAvDzXxIRQ1gojwIEo0BnWmonLUCFYjp0ujhu0/oxcHkk10eGefuGy
	OoTnyxZlSuSv95qtDBukQb+YX4pOUgoJiql7LblyJkON61CmhAilpp+s/MVdpU79uD4tbuB8RyaGt
	RUzOwChWnCUt+LaGTnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4T8-003g6q-KL; Wed, 03 Nov 2021 00:49:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4Sz-003g3U-3T
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 00:49:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id t21so1355160plr.6
 for <linux-mtd@lists.infradead.org>; Tue, 02 Nov 2021 17:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kZZrLtjwjEJ3IPsG9yhz+Qsv7Mbcxqz9ceN0wVwrxJA=;
 b=JRgj/olnX5KG4c7O7Xm0Jry+oiIPPVRs0ttrw6gNfqqnI1KamWVto+1Pxon2fIWDB1
 x1F3THYxTFa5CE7AzpmpAplt8VFcFKfqy3d3MAGp0s5nJkBUy9JedsZ+4OS6KUAKM+vB
 DvCegoQKw1vFIw4wXLe3UECLM26Wd75Cn2MgSkM0NOQW/tEUxE7RV1jJdp+3GjtYuyB8
 qk4COR6f2KXYi8/R57t9nLZVLeQ2fx8WIoFzd2PpFjGLiu6nnZ/mrHGax9Rr3YH4SIxn
 s76DGqePmbOMyvjyajU4ySIeJgRloDb6/b5JkF/zEIEF+UPqSUTfuYb6YiGVu536BR06
 QRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZZrLtjwjEJ3IPsG9yhz+Qsv7Mbcxqz9ceN0wVwrxJA=;
 b=YnAa+rQtUjxSv73/t2Quoocu1qx4G402PsEp1m2ErgpViWcFoGQl0hRZLPJmbaRXz3
 fCry5mSvouU3ZHpI38OOxwf5RpTwsaXZdfBVW3Y4x6ISUzH9dXSwuJLuh0H8+LBR0S1Z
 P+JfSXxI4v1TZV0gGsDh4q9w7iYgnc7fpJ4EqwR2iHDbw3BW1W0I3GsmOydy03STn+a6
 wHfSaiFIjjVg8qrO9JUAejFjQA+b+Z/4PA+yqL0n2Qe0UwMGhwrfltxveWo6yRsWgPCG
 jz4ErjED+c8LW0E1gwKnjy/8qS6ANtJZMqzUCKk1ahr6dgtK8voGOLWGU9hHLrWwYw85
 iRYw==
X-Gm-Message-State: AOAM531EC3MwdEapBV0RhjYhqPv28WAxCIo2TpHT7X5eB0wwjfuRYFoi
 a4Ix8ILZn8eHpfCideSOZX4shRhFQscCoZj1gqAA4A==
X-Google-Smtp-Source: ABdhPJwbP41jEB/HwdZ/jyTpqMsXVbZeJ+GyahtI6BJWNgrRKpi/yor5GNtI40x53AU7YBTd151lFNCU4w2eHv7w/mI=
X-Received: by 2002:a17:90b:3b88:: with SMTP id
 pc8mr10700972pjb.93.1635900563928; 
 Tue, 02 Nov 2021 17:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
 <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
 <YYHTejXKvsGoDlOa@bombadil.infradead.org>
In-Reply-To: <YYHTejXKvsGoDlOa@bombadil.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 2 Nov 2021 17:49:12 -0700
Message-ID: <CAPcyv4h1dqBm71OQ_A5Qv4agT3PhV7uoojmSB1pEpS-CXaWb5w@mail.gmail.com>
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, 
 Nitin Gupta <ngupta@vflare.org>, senozhatsky@chromium.org, 
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com, vigneshr@ti.com,
 Vishal L Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 "Weiny, Ira" <ira.weiny@intel.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mtd@lists.infradead.org, 
 Linux NVDIMM <nvdimm@lists.linux.dev>, linux-nvme@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_174925_224112_CB7BE571 
X-CRM114-Status: GOOD (  24.23  )
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

On Tue, Nov 2, 2021 at 5:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Fri, Oct 15, 2021 at 05:13:48PM -0700, Dan Williams wrote:
> > On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > >
> > > If nd_integrity_init() fails we'd get del_gendisk() called,
> > > but that's not correct as we should only call that if we're
> > > done with device_add_disk(). Fix this by providing unwinding
> > > prior to the devm call being registered and moving the devm
> > > registration to the very end.
> > >
> > > This should fix calling del_gendisk() if nd_integrity_init()
> > > fails. I only spotted this issue through code inspection. It
> > > does not fix any real world bug.
> > >
> >
> > Just fyi, I'm preparing patches to delete this driver completely as it
> > is unused by any shipping platform. I hope to get that removal into
> > v5.16.
>
> Curious if are you going to nuking it on v5.16? Otherwise it would stand
> in the way of the last few patches to add __must_check for the final
> add_disk() error handling changes.

True, I don't think I can get it nuked in time, so you can add my
Reviewed-by for this one.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
