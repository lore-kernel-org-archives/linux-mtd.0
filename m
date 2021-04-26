Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6113C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 07:47:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725016115B
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 07:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725016115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=945BtwL9vgeiDNQCexZ4R212o9l+eJfzTwRiFWddUMg=; b=d8KRccu5yXa2ZtfkmlEpmZ+Uv
	xy9ryVtFZSr4ObQSzpLHGHZ4szLX6gaTZf4lIBjdVZESbjcofDH2y3eIzw/Iv7g0k+w1g66xrcXRF
	4dUwwdS/MWEU/G8rweOVsCti5sdEtiMwBINzhUXFp4b9ZVOK8h9R1Zr204MD5uOYZEuLkqziJvQzm
	QNBYbzqM+eu7L/+7n8GtJSDi1OF6q2t9F20DQdTQgnFJAMg97nchBkPUMxpXLP/0o0a1f/rcagKH1
	zEmGdIXhhO1DjMiJDMJ/TGWPUmDIseTgSU5ZHPcoOYCsf4Y8dwp5OCBMLIgVZhAgYK3aLue/Qukma
	JrW7tcJ1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lavwc-0079zR-FN; Mon, 26 Apr 2021 07:46:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lavwb-0079yy-5x
 for linux-mtd@desiato.infradead.org; Mon, 26 Apr 2021 07:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9AdJMoYPBl3Z5Zio9ck1KLt6M+3zzcFR0rywHxTwa9c=; b=enKDaO3rF6ugdH5emptn6dL/km
 fuhnA/ztIsvgx/E/1AESdxb+X1Ts4tVU77oVsWAIhih2IwnLqdOOrU4xIxbieRhn4mSMLYkxsgF1G
 e4yxHAXJP7Ra1PnGlQc89+zPj/HW5bv5f3UB9kMA2/AxagCNQIRS98gDR3QZk3gH0cjUdsIVyT3u4
 xvoOCb9qOxrr8P5soV9z7eVq7YI+B6fsmTHHQjUCc16EIBggBZYglyO8sk6TTEK0ZSXFi6LRPyEe1
 L9LMwffSsdJtkSb4Vhys5n+NhP2pJAW4IIdJapJBCqqgM5KZgpJjBm1F1uyMGhAAsvXmh0V2hnQ7E
 SwzlhgpQ==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lavwY-00Fnop-NG
 for linux-mtd@lists.infradead.org; Mon, 26 Apr 2021 07:46:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id y3so28241348eds.5
 for <linux-mtd@lists.infradead.org>; Mon, 26 Apr 2021 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9AdJMoYPBl3Z5Zio9ck1KLt6M+3zzcFR0rywHxTwa9c=;
 b=BdE7/IFwaZCrkfwI3Gq+949jgF9Z1VJGx0rHfR7jCTOa9LxluWsyj6yzpHby6VYRDb
 YYkFClh4cNrmDSmzwArzJwJEUljIf6zjXytNeoNe0WP3qsDCPGeHQuh9kg/YWJAnILLI
 c8f+hHett96uxMh1S8QQsaIqYbsvb+OexobB0ILi5SR3AVZeFRDBwGNZfEOP7r5p036R
 O1yYHSB1j7J0vIBZdc3DVMGBkhALQ4ptJ5bUwb0cvsqzdJm80zUJp0MuJzdLN0fQSKC5
 PdqdEqd7fki0mmlgCCzcfjoZOVkedRkELnGCSngIytofByPlF+jL4YhY0IuBoFd/+UpI
 Qk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AdJMoYPBl3Z5Zio9ck1KLt6M+3zzcFR0rywHxTwa9c=;
 b=VmBkcP85a5q3tm+GetvTwK55LQY9tZrn1Qik50vHObasFncXZrs9IDHjo1GOZaX3dx
 7ZnwgoYDYJAc0lhPpMZWT7jlMY6g4rJO3wes57XyW68SSSqyQG8TEI0XBj80oBJeME9A
 9aG8RLJ5Hv73ZUS8WYRBvOXvcaS89wuiGP8K9p14FHRtYD31tOZs2lln/KZ0bGoNJ6ep
 4EsNcs/J48+DeCO/IjdLyP3asrwH0xMW5MggU0YewT0M/xzTeLaQhSViWQQjD/uTXwe9
 Enpy6XQ+ac0SqlyZwFdaAWg9NtGNPjr5cXBZ+xSYjCWAmzoLo+ynogo+plS/GY4NL2Xu
 vsDQ==
X-Gm-Message-State: AOAM5323lwRm9RXpYfRnWq3VuWBWUPFReGFaX6yL6CGVrGhr3evJiYhQ
 y2jCr8nv2oOPFaJNZAzXgPlu8V4JX04pZiXm05S2k4Y=
X-Google-Smtp-Source: ABdhPJyqvQVMtofuVBy8cA/Zy+sgx2jHD4bCfxl/w+7tTn5PO9OxED4mRclsIf0IRuawcRjW6tnwcoUCylS1yuLF3xg=
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr5276015edt.55.1619423162936;
 Mon, 26 Apr 2021 00:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210316141916.447493-1-rsalvaterra@gmail.com>
 <CALjTZvaX8miSycr4oGmF_rGN4KWWBzfyBj1-7jefT=Uz3w9Oww@mail.gmail.com>
In-Reply-To: <CALjTZvaX8miSycr4oGmF_rGN4KWWBzfyBj1-7jefT=Uz3w9Oww@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 26 Apr 2021 08:45:51 +0100
Message-ID: <CALjTZvZ_MNp_0EgichkgWbQ-6htvHRQmUGb0tV+-1D98fS-JBg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] jffs2: add support for zstd compression
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lizhe67@huawei.com, christian.brauner@ubuntu.com, gustavoars@kernel.org, 
 trix@redhat.com, keescook@chromium.org, dwmw2@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_004610_767645_8542A2E7 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

On Thu, 25 Mar 2021 at 14:47, Rui Salvaterra <rsalvaterra@gmail.com> wrote:
>
> Friendly ping (and also cc'ing dwmw2).

Ping^2, now the merge window is closed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
