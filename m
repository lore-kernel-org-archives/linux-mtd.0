Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0CFC27C6E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJOZQB4gT9kEcqBwy+RR8TgNHSTH637U1fBFZ77XBz0=; b=H14S7JxoiHf13A
	3ujJWQ7OkaUgRuMzd/fNxoUJ5Nn7VmpaAb2tqtt5YU0YFOeUzwvHfcUaYJgEAncWzO4y5Jfzxbcnh
	V7xzKeJyCFxfwbSd+HLEl63MtK3UFmlvpp70D/CVJPEaQyrtsP6ioHNVJmHMhXrbB2FBeV/cs0XLd
	F/dqB7vZ9Bsx+wijYjaYAH9eMDEgutVR5g0CLbb/5mNQhBi8kV5qCFq2EchITtd+PJjSFMOwf9x+m
	NuT1AwjgKX/Psucdqc+9QXn1RsgUPatDwdEmF7VJ1yqIFKYu+mZRd+8p+9zhYps3KuF21SnaxmQqp
	ztGZ2cCh8LhzfvzwR6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7DZ-00000009kzn-3LqK;
	Mon, 17 Jun 2024 07:55:57 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7DX-00000009kyb-0iTf
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 07:55:57 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4415e623653so37857761cf.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2024 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718610952; x=1719215752; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6I7HjTVD0FYGpGJyzdWr9lYyHGbtAeqv6wNa85E5Tlk=;
        b=kde2Gi0dzGwmVuH61qNvwqRS6KjJ9M3gjKx4o5AlmgKD43mlJj2kwo+sqfJNDfOIT4
         BfG7Co85W89bNm96HwWHLkkJtbVxrWyP7VGWeZqvniqqaqC1atqP0+VptFJ7PZOUhUp1
         i5oEBtsbO62FDSKfncOB57UsDm2xNxURwXKyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718610952; x=1719215752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I7HjTVD0FYGpGJyzdWr9lYyHGbtAeqv6wNa85E5Tlk=;
        b=pe1pyzzclklTyYHENGE+6VflWSxcoN+deMYvFniVEX9KOJkMAiTqkZlxO5rc+nVxER
         EqjXdIpbqHdPIeeUwmqtzzIuRa6R7joA2C2mhe/rMlyv0o7VWK5Oe3Q4BIkfz8WX1A+b
         Okyb9zZBfk9QOshEdXCo9Y4Unl47CLIRq9yrV871l3C7aft6NSlAc1jzP5XJ18nWoDzf
         /7Nz8R7oM5GtWGfmOdaYwe3U4HlpIlVigbj79I3Ut2j9lHc9sFTCOxsjzikc+ZfQCFYy
         LIJcmptTiMuljdDnOjWiKPMUn/yroq+vskDQ5/oKvbvBDj8zHwDJQ8+DASXwCAxdqKm+
         ufHw==
X-Forwarded-Encrypted: i=1; AJvYcCVDJEEkfQlr62j2UVKUfKaoWCrrVsVntyaZTz6DW3XeoO3G5KoMcldQTpYtjztGKR6vg60+DZgIXrlgTwl4RDPwE32C3usgxSekA5m1/A==
X-Gm-Message-State: AOJu0YwvbuMuxuqTIxNaAA/JYXV+IWVNWnzLmZyOdoioRBnl/n+U8zQw
	QUFgk2Gtn55TLKF31JLoloFwOJ5wFe9i8ZkLzyEEwFnqYzmYgleuQcQmZfu2Y5I=
X-Google-Smtp-Source: AGHT+IFxBb+fxu+zFP9/mPYH5nZSCdE6S/NGqQ55TdkfvSsNQ6okiuS1Itv2iysUUW0wZGmJIGDYbg==
X-Received: by 2002:ac8:5e11:0:b0:440:10be:3ecf with SMTP id d75a77b69052e-4417ac402c0mr199666251cf.22.1718610952095;
        Mon, 17 Jun 2024 00:55:52 -0700 (PDT)
Received: from localhost ([213.195.124.163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef4eefaesm44094171cf.21.2024.06.17.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 00:55:51 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:55:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 01/26] xen-blkfront: don't disable cache flushes when
 they fail
Message-ID: <Zm_sBInagtSkOZtg@macbook>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_005555_237474_9CA9A3CD 
X-CRM114-Status: GOOD (  13.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMDg6MDQ6MjhBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gYmxrZnJvbnQgYWx3YXlzIGhhZCBhIHJvYnVzdCBuZWdvdGlhdGlvbiBwcm90
b2NvbCBmb3IgZGV0ZWN0aW5nIGEgd3JpdGUKPiBjYWNoZS4gIFN0b3Agc2ltcGx5IGRpc2FibGlu
ZyBjYWNoZSBmbHVzaGVzIGluIHRoZSBibG9jayBsYXllciBhcyB0aGUKPiBmbGFncyBoYW5kbGlu
ZyBpcyBtb3ZpbmcgdG8gdGhlIGF0b21pYyBxdWV1ZSBsaW1pdHMgQVBJIHRoYXQgbmVlZHMKPiB1
c2VyIGNvbnRleHQgdG8gZnJlZXplIHRoZSBxdWV1ZSBmb3IgdGhhdC4gIEluc3RlYWQgaGFuZGxl
IHRoZSBjYXNlCj4gb2YgdGhlIGZlYXR1cmUgZmxhZ3MgY2xlYXJlZCBpbnNpZGUgb2YgYmxrZnJv
bnQuICBUaGlzIHJlbW92ZXMgb2xkCj4gZGVidWcgY29kZSB0byBjaGVjayBmb3Igc3VjaCBhIG1p
c21hdGNoIHdoaWNoIHdhcyBwcmV2aW91c2x5IGltcG9zc2libGUKPiB0byBoaXQsIGluY2x1ZGlu
ZyB0aGUgY2hlY2sgZm9yIHBhc3N0aHJvdWdoIHJlcXVlc3RzIHRoYXQgYmxrZnJvbnQKPiBuZXZl
ciB1c2VkIHRvIHN0YXJ0IHdpdGguCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+CgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
