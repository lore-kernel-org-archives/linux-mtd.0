Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACC0C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D68B20734
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIfwWyhp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXUhQiZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D68B20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYW0a7zvF0swbhCfj4arxdGuFHYcQPjrdl3K2/9/sA4=; b=dIfwWyhpyPgvTX
	UJcrfstIuIsorUpMpp+/D4FBhHF4JHzn58ne1ocyOfceOtOstdyKxAajCYac1T9xH/dfIyZCdXU+B
	8L8QwQp6bnPfcb1jvWbLTOCahSwZ6XXaUK7BogFe/o0KUKHPnJJdkXqPeYN+KfPHi+HOCdmhMavOL
	UGr2nfaru2TuA5cfAiTXBGxY942XKTiHKDVEGs69XjM8sfcyoJmrPnNnS9vec3Y1Tin60Td/p8Fl+
	m6iMFeA6RBazikzlpJ6B5RMFzk+XMmxwaIx2CaS7OyMmP4eTwpvB82v/6bi0Spk0JMpGJe51agvOe
	mtPrYq6zndwpZgyx2Jpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jffDK-0001Ur-Hj; Mon, 01 Jun 2020 07:50:30 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jffDG-0001SQ-KD
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 07:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590997819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IuO46ycNz8mneB+aXPJm85h+RFJWz/TY+HoUCs4wBY8=;
 b=bXUhQiZjg4RExx35olI9uHu8hNZuI13hBU/j9ggN0PSiG7O3jDU3uBLDWAMjaROfkVmBOv
 c3mzkdqdgTZjJFZw4jt9pFXxnGgID6WOeJ8Z8nXy6wRlJBYo0Dxkot81NF1KBbBAzP/7qz
 5GhTbk3820CzY5ca6vT4FYhgYW6paE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-5Kga0UcWNre1R3UidKM26A-1; Mon, 01 Jun 2020 03:50:13 -0400
X-MC-Unique: 5Kga0UcWNre1R3UidKM26A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42EB9100CCC2;
 Mon,  1 Jun 2020 07:50:12 +0000 (UTC)
Received: from T590 (ovpn-13-152.pek2.redhat.com [10.72.13.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A29C78EA8;
 Mon,  1 Jun 2020 07:50:01 +0000 (UTC)
Date: Mon, 1 Jun 2020 15:49:57 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] block: Flag elevators suitable for single queue
Message-ID: <20200601074957.GE1181806@T590>
References: <20200528081003.238804-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528081003.238804-1-linus.walleij@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_005026_738439_99D2A259 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 Paolo Valente <paolo.valente@linaro.org>, linux-mmc@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <jthumshirn@suse.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 28, 2020 at 10:10:03AM +0200, Linus Walleij wrote:
> The Kyber block scheduler is not suitable for single hardware
> queue devices, so add a new flag for single hardware queue
> devices and add that to the deadline and BFQ schedulers
> so the Kyber scheduler will not be selected for single queue
> devices.

The above may not be true for some single hw queue high performance HBA(
such as megasas), which can get better performance from none, so it is
reasonable to get better performance from kyber, see 6ce3dd6eec11 ("blk-mq:
issue directly if hw queue isn't busy in case of 'none'"), and the
following link:

https://lore.kernel.org/linux-block/20180710010331.27479-1-ming.lei@redhat.com/

Thanks, 
Ming


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
