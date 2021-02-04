Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30020C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 14:00:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF9F64E3F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 14:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF9F64E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOxnhpvY9Q/Ecafjq37dBSSwhTS0IIR/AXugIlDELy4=; b=RC9yic683hnqGHCdZEdE6gTN6t
	BOTpN2TLBUfWxOBSrUNXwjCqvZPEtnQo9CfghrxHVnDmLCjsNiLcwzF7YqPID3lZ0D+ZQOWWc2QXg
	0mlKTFzPFsIx/VlX/lRaewy7qVcIRi8cHMX3MF1/jUVg47Zp/2uLHMz04edEvSQ/6dhMd2WmxFgoV
	uBJG7Rpoow2QwgGLqbYh7qTGbD+8wPAbBgkMDv2Hr1Ye6mxz2z0Iggd8PFwFh7AUx4FTelZJndKlx
	yndH6x54bqiYYOw2l4RrMn+7yv6Pjvwt/1mtgalFLSJkN3MChioT0y1n8NzCKdGcgIDgZsjWIQNXo
	b5CjCXcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7f9m-0008Lg-AY; Thu, 04 Feb 2021 13:58:50 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7f9k-0008LG-Bo
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 13:58:49 +0000
Received: by mail-lj1-x229.google.com with SMTP id u4so3504846ljh.6
 for <linux-mtd@lists.infradead.org>; Thu, 04 Feb 2021 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=V1m6qF4MLwaR/MU3q259CiWKnTFijYK+3f/Jcl5bP54=;
 b=b/h1WMvdO7EvCH8xyZPd58tTfo4LNgfJS/fqc7ag6hUtAi/priXHC9uXAJSdzDdQ7j
 P5PyzfZNdlYu6NByvj3h1Pgyzd1dztGe7nefnqPfcgfNXuNNfCNgZrD9MKbYUbSv5xXh
 rrtEfw5zDlwdAC8d6mvR0nOI9PtwQy07gpEfqO70bNFm12uufjCeNkIGdjzZKVg9gkyR
 qGFWQKbik/BlqhpyOAvDFEJpVIxCeKuvh8Tj3IHAtzIRs39gze3EzXA5/cXk9/rz+c3O
 1yv3sRR106eKsu33r0scPkAJo3zWdja701ytdjNyJDEv2ZmKj44mdkJPhMoOApEXpaTg
 zspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=V1m6qF4MLwaR/MU3q259CiWKnTFijYK+3f/Jcl5bP54=;
 b=toVrmdHmV7Fgd06EJcKCxOvmIkMeEu0YJbxC7Kmnz4sNnQYG4cR5PDndrxU3KbF5zR
 D1ASDdZ5ogS1cG2GuCXFXJC/fBfWEbNFvAUzubDBCZgKV2P4cF4J8GwdTnaZB0GYLJRr
 ce4U1BX8+3U0MMXzFMo/uCWlol3lr43o6jZxkacF5fjTOP+LROAsAj4OBbhmP+4Z1Ujm
 oqdfhJxyEqc65i7HPcSquNw3EMV/x+SWnHytWe8HlZ/NLon2RztJGGZeJ0bB5TsZG+FA
 S8EX4y6GqsTGT7XsdDVFGmpR+5rIjiPsHI6/MKxB32liJJ8TqCRu+mHTT/faApHblxGD
 l25g==
X-Gm-Message-State: AOAM533HfAue/BjAKh/+UFMVbEXjaz56hXTq8n2wZ9qlgvRqk7+3Xuvu
 P/3X66YF1C/4pafQAOIqN4nUjhpEb83Yfg==
X-Google-Smtp-Source: ABdhPJykYwhoz3xvLUH07LVWgQSAAddbriOwgcFYdY92U7qF5gioQFIFOxsNCCL2FUI8F9iw0YN4HA==
X-Received: by 2002:a2e:9dc2:: with SMTP id x2mr4971470ljj.96.1612447126876;
 Thu, 04 Feb 2021 05:58:46 -0800 (PST)
Received: from wbg (h-98-128-228-165.NA.cust.bahnhof.se. [98.128.228.165])
 by smtp.gmail.com with ESMTPSA id m4sm662085ljp.84.2021.02.04.05.58.45
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:58:46 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: []
In-Reply-To: <87a6skynti.fsf@gmail.com>
References: <87a6skynti.fsf@gmail.com>
Date: Thu, 04 Feb 2021 14:58:45 +0100
Message-ID: <877dnoylwq.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_085848_423845_95397658 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 14:17, Joachim Wiberg <troglobit@gmail.com> wrote:
>     mtd: mtd2block: add support for an optional custom MTD label

Ugh, sorry about the noise.  Managed to press send instead of abort.
An actual up-to-date patch for this is incoming though, as RFC.

Regards
 /Joachim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
