Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEE2C4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 16:42:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F3D2395C
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 16:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F4w+pDha";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OgFjPH3k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rVwv+TmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F3D2395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fp5ZOCPaeBCA8Weo99VRexAda94tQBlLhzQbevBjJEw=; b=F4w+pDhat7xjDOBSxiOcitj/E
	z/nolomKMELITfn6Lx4P1U1734WkEb3YRgt2kFhi1RKm/vws6yXxrG6+6a8UuCQi5KwvFKfPrGbu6
	g5Fy6c3UKp75ijpfzT8IcPIUJDydr+CyCfdLLcYMRlpsjxXZq11uhh977bt85Ajjk3GZefMMCSSoC
	u+pUok+fXxeSnXQSa6wAourvrExfVVJyNgvcbHRmMwRpxxfI/LbzhPPBb6KXzRAY7pXRi6BHrZ0T+
	Efz0oY/BqDludSsLqpcrUPVfDy9Lr3ZeGbeZeGVupVF5QG41Z6FfW86JMsQikVNnYhgPzoRm3VUOm
	ODkG5wsOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLUIp-0005fX-Vw; Thu, 24 Sep 2020 16:41:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLUIm-0005eu-QH
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 16:41:01 +0000
Subject: Re: [PATCH] mkfs.ubifs: remove OPENSSL_no_config()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600965657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gqu72gyzWrG2K3lEd9VHbZKVTmY4/Wyv9fk9wC8KZJo=;
 b=OgFjPH3kvAnn4IlRH7IROlJ8j4bn06+iD6aR1pTHGLnR+VgiktAdWj0M+hJx5X3QxJxWmr
 9xywCgZbPFKdBEWssYlgdIRliWz1Mm7na/vJKmVK08UWrVy1rQmoY19qgsGrteay/9VNkI
 kwlhThJgEyHfVQh0HMBdS7pK5yXy4p2e5svHF/X1IdUftQs5k7+7aCb4BX4s37PluN7aLm
 pvdWLs3Xdf1FQhCeYRKkvhq+6EYVqr2avtTrw54os9b4/pQPZu/4z+z/R6n+CvVHsuQ64m
 QHturg2Q7yMR0/Q5+SmSbTQxhGtUy8TQO7KcczqSDBLJaVydgWd+CqFa668BGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600965657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gqu72gyzWrG2K3lEd9VHbZKVTmY4/Wyv9fk9wC8KZJo=;
 b=rVwv+TmWzEiwNzi6YAXaLIstz+6p17k6ffWVlCv2MPPxCaDwr814Rm6YQp4DJlLM0R1OAQ
 JvqAhELu6xj2L5AA==
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200724074705.6376-1-bage@linutronix.de>
 <CAFLxGvxwB3Lq6mnTBFyZ4aR+LPS5hwGPCwG+QqLssuT7FRBy_g@mail.gmail.com>
From: Bastian Germann <bage@linutronix.de>
Message-ID: <64f36cbd-9ab5-1b37-c4b3-c33b5daf6df8@linutronix.de>
Date: Thu, 24 Sep 2020 18:40:56 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxwB3Lq6mnTBFyZ4aR+LPS5hwGPCwG+QqLssuT7FRBy_g@mail.gmail.com>
Content-Language: de-DE-frami
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_124100_947909_834D8703 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 25.07.20 um 10:24 schrieb Richard Weinberger:
> On Fri, Jul 24, 2020 at 10:00 AM <bage@linutronix.de> wrote:
>>
>> From: Torben Hohn <torben.hohn@linutronix.de>
>>
>> Especially for the pkcs11 engine, a configuration is required
>> because the provider has to be configured.
>>
>> Its not clear why OPENSSL_no_config() is called.
> 
> My best guess is because on old openssl versions it used to work.
> 
>> Remove OPENSSL_no_config() and call OPENSSL_config(NULL)
>> instead.
> 
> David, can you please check whether this change works with all openssl versions
> we want to support?
> 

Are there any news on this?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
