Return-Path: <SRS0=uc3S=LA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC5BC47096
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Jun 2021 16:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2490B613D4
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Jun 2021 16:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2490B613D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pjmti8gdBvk3OyWgAmB8htDEW5BJ5Yz+dwUvED5INOs=; b=I0VKxBrdrvGxsva+InntxrL2f9
	Vn/XJV/PQ7ulmquNR+r3voEE2CGh1MGO6E5uWYs/of9HrIDnqJkNfY+h2ox9pMmt4PVKutlOKJqpy
	vi2oNdCKIjlPAYqc9v04ZoAtBYZQISQNAXJP/ywrmjvGphmNi0IXjwKzEu7OOBIAWYUvv5vi6B/tr
	Um/DhbN6RIwV6h4fZ/E7gaLsxi8QlOFARmegWOL4EI8EDqK6xaWQ3e+A0pRWxy8uq0L/F4X0cR1EQ
	DCw8+eA8t7TQmvCBLROCsw71kJQoh6mZELGNsvWsu3SARW2zAe1qUhPUP3iOY6ku15SVI0X1Sv2/T
	aH9RKPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvB9-000VdO-1B; Sun, 06 Jun 2021 15:59:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvB2-000Vd2-RS
 for linux-mtd@bombadil.infradead.org; Sun, 06 Jun 2021 15:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=xdRwc0+fblxjQWSVfAPrq01sy/g65/LWQdwS7diPzUY=; b=RvNcIfOg5he7n2s7JHDwQwMsUb
 CcsUaraj9QikvzUVMg5uaZVxCkfUMNQpaQoSlSwpFt8En2sRCM3NnRZMB+TpNhFzfHmMKG/4QmVWD
 gCRylCpd2RxMohedFycN/JmPwi64URVSbmxExLKam6OQFwHVi2N5sD9jwXDe8EtAAA/oB8PR9GaaH
 81bj3Hi0GApRdsWIMvWsT4imii1ALjOAkwG/eKwvQ5JhVh4A9McAwOX5gB0KW+xEHm5Q+zGPNdNaj
 3+RxDUZtyJrK0//PQYuM0gsnGyORNLu/D139Iz76bmVhQgjZJrrEjMdarouhAZYzFh+UMlCC+cVvz
 GBTLTYTQ==;
Received: from [2602:306:c5a2:a380:d04c:9a1:1990:7d22]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvAk-0044Sh-0J; Sun, 06 Jun 2021 15:58:53 +0000
Subject: Re: [PATCH 10/30] ps3disk: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal"
 <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-11-hch@lst.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <c9d63809-a7cc-8907-6065-f14add05a5dc@infradead.org>
Date: Sun, 6 Jun 2021 08:58:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602065345.355274-11-hch@lst.de>
Content-Language: en-US
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

Hi Christoph,

On 6/1/21 11:53 PM, Christoph Hellwig wrote:
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
> 
>  drivers/block/ps3disk.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)

I tested your alloc_disk-part2 branch on PS3, and it seemed to be working OK.

Tested-by: Geoff Levand <geoff@infradead.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
