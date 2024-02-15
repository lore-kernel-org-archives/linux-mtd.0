Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6098C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElF4isrWb2M3zqR+4XuRVvQuK4miesYoqxrAOW4CO2A=; b=TJA9NMtUZcfE6w
	T4rsZW9O/Z/spi/5vjezjXtKXNdgyWvL2i5f0vwLPprhKLe011QRVzQDJ/2sZKgK8LHPqu6xA5HTB
	fyMi27tDmAIECXD34+e5l9viKXYm3KZNweQQWnQwpnDy9FgRA3W6BkIlS7yHWULTrnzXAdwX5xe/4
	7Wr35PvfcasVCRyvXr+rLmAzzL23E4N0bhOCTNF6dv+LCwJ4AGD/G6aJjTLl4pWbLUO06Ic8l4DuG
	uSx7y7f2gdo7nMzgeuF9voDuvhwU6T9BJYg54/e6TBAjbnmtKG0z/mRk4tOSPymfM5sSIAA7P3JB2
	ZDMNsE56PsMVzwE9rh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raf0D-0000000H4IR-2CMa;
	Thu, 15 Feb 2024 16:54:25 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raf08-0000000H4Dr-3ZPM
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 16:54:23 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-607e54b6cf5so3493567b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 08:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708016059; x=1708620859; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEQiCmvhKfS0/A0znECfTzFjRTV/dZsqotvM6rEKanU=;
        b=Exe4lzIIrRJz+iT6qn8Eav2n4uCIrh5SSRmHOU27joo2HvELYACceh9JKum7sRTiQ+
         C0YFnvvCV9qK3JvyNYFwjyfaTB0LIJIeIY5KRZBylhLwKWZIn9vB1fHYnSXJtcuDVu5h
         69jQ/OJU9V0HsY12dwwLctRBjPkMAGENxPhUIiJtRkuYH5KHmRnmE6B4AATqmIlClxcI
         ebKUTbngixQVmrqMvRKa6W8DYEFaY5kKNw+SiXHJeBy+puEUFtju+Udf1P3uPU98dPb2
         aZc8HpcooSJFvribF0v3opiFqLrGO0nZ9h3Nw1IxSUBBHyCLHblefQ0KDbSgBwI5acq4
         rFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016059; x=1708620859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEQiCmvhKfS0/A0znECfTzFjRTV/dZsqotvM6rEKanU=;
        b=B3QDc9j04LlZIysmUqN3j5p9A4uMgBNDq3FnUIRLaXj4DUi4AYfhdEZvsWTWOjql9f
         qYcSOemm8zX0kdkoShof6mdL/alc5DTFEYrZphNQHIco/B+Wt7pCEOuzN5s+07obpFat
         +2zoYpVx3CpGmzbFipmKn40PrQoDG/wWflNbMDP1t8T8eqQJIxmJlf4qTfiOXPoYbXDH
         x34rusJ1HPdJ3g+Vq+4Ie0CfzDwCaWLW5pg4Ew2lAQt2p2uhUiNgGVyBPkOG+3xGLcYz
         u/Bzk0yz1SBDebPFmHvzN/tZHFjMxfls49z+Vr6WyjrMWgr0zEw87aDoU4GYwMKUGqNR
         JDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF2P+s8+VjgfkWMPgp4zPdA7q/TYqQlc2UC2PhJwa2vvotU79Vqki9sCY3kiB5tbERei8D4JZwer5BxALq+XGgS03kB9ytFdXpeHtQqA==
X-Gm-Message-State: AOJu0Yz7o4kUvlVMd7zA/fa/XD2S6ZGZalxgPz3BvtGz+4TEnbtId6aQ
	X3Ac1t8b6Mqry1QOld+ZqkK19s7z4XZVomw33EowwAnMUSsjFNekBeMi7zXSjLyFgGw8xSIZNGu
	R4DXYO7FAIGhj9myA5sWMBRHGdMO7sC3UmzNh3Q==
X-Google-Smtp-Source: AGHT+IF28WiAUAxb9BXDQ9j656YBYmKEubg2qRwCcoIKEiRoMN+j/rX1+ioqB8yOfGTSrxa8mYZDRwHKLR7BN/dl2kA=
X-Received: by 2002:a81:b717:0:b0:607:c65a:ba02 with SMTP id
 v23-20020a81b717000000b00607c65aba02mr1752372ywh.17.1708016059449; Thu, 15
 Feb 2024 08:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAPDyKFqPnC9jwWnoVz+UVJJ_SGYnB4CrB8jmJOSxCnT7AYQrKg@mail.gmail.com> <20240215164942.GA19722@lst.de>
In-Reply-To: <20240215164942.GA19722@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:53:43 +0100
Message-ID: <CAPDyKFpSNL28sWqNMY9Y2+tP9VMd_Wabnw1hVjQ-g0RfKCUVgQ@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_085421_134439_B2DCC850 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, 15 Feb 2024 at 17:49, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Feb 15, 2024 at 05:40:37PM +0100, Ulf Hansson wrote:
> > Looks like $subject patch, patch11 and patch12  have already been
> > queued up as they are cooking linux-next. Normally I prefer to funnel
> > these via my mmc tree, to avoid potential conflicts (mostly for mmc,
> > where more active developments are ongoing).
>
> None of this is in my fresh linux-next pull, which would be rather
> surprising anyway as I've just sent them out and Jens isn't that
> quick to merge unreviewed series :)

Weird. :-)

>
> That being said it depends on prep patches in the block tree and thus
> I'd prefer merging this entire series through that tree.

Okay, in that case, np! Next time, it would be nice to get that
information upfront in a cover-letter or similar.

If not too late, feel free to add my acks on the three patches for mmc
and memstick.

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
