Return-Path: <SRS0=TlnG=ZO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDC8C432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 09:53:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF7C20674
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 09:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1yn3BeQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfeislZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF7C20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJkjkViZKdQr63JViGNrO/d9bVQAPle0w+AIq0I8s6Y=; b=S1yn3BeQ42PGpn
	B0lY56vZsT/+WTiKfiaXMJ6ODsKPjnIPmG9qnWLlbQJgBhqLoETxzIoE19V34n/Y5sCKyb+bmUcWn
	ez15UTcywWQayHy+63K8SXvMlPjqPt3JbiTkJF09kh6zUmnmZti/UmoMegDtJRUHyWA1rTkB0SZTz
	uTwUih0BgZR9+T2zFbU4acNJeX7QwU6NguilQUhOXrS+Y1nhuuOach0shuXD6KcBA44zJA/Y9VTxz
	kb08hk+8UCgsV7rn3LmqJF2pWgO8IWNi0QAvCwv0hTLLoCQH5soV4CjVLibfhG7qrN7Mhol+dXUAz
	V8PfdYfUB1tRhIXcdlww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY5cr-00052X-Dh; Fri, 22 Nov 2019 09:53:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY5co-00051U-Kc
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2019 09:53:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id n188so4912379wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2019 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xh8kC7tDwRZ3oCombv+wQzJ0Jdh8LpQciSTFin/m+b0=;
 b=EfeislZOl2z+MqYAJHYxygzx5SuDztUCV06YV/xIH+M2K7mB1BNbshP1fdODp/nZC5
 cbi1av8xlApeTK1hd4vLEUXvgeTRdcIwbAX2Cv0oMWOeyoD3JLbqUxZ+pKGWqrO98XWE
 pZjMN6TqfJf0affIR2Oo1SFfUf1eV8xN65D9YkeOxJClW87GXUTbC3mMtF/rJRMF1dC/
 JJUk3cjPkpJeFIkrzirIMsh2Z5/5oUJhLQpj4cDaS/sg7zDB6BHpcoumvj1JVMcqydLo
 Z3T/hPNKj3Lr8jj76TgRL4lR479oPHvPPMShRxRfvoIbvJ+/A8Eop5jYE+Mia45QL9nT
 QYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xh8kC7tDwRZ3oCombv+wQzJ0Jdh8LpQciSTFin/m+b0=;
 b=g6lmeqdBag2bH6AK1GqX9vTR4YnKKosVCgzLOFwrvJF8m33bMjrfgydlNXQ+fat+FZ
 iwB/JzuiIbHeoM1Ql3HZgKxaCAMFec6O5BiewvSOZOLklBZB/0nX1m1Xhyl4yg8k9DNG
 91DbDbu8+l7yFikR5ken9mFUEw/wc99ws4mD483ZEsiSfildYB1quauXnGNgkqIPMqMx
 Bfk5qLPL6rONrX8xJt7QZR5Q1V9QqwOYURyQ6HJLG+tNRbN0jDr3FnQAaNNqNKMthJAm
 9fOAoqGPoRnfU0TUqrLcqDrzJaH7YxxVnRi/gaQMB7b6R9ABQE0U20hLaexTPfzVepAR
 v1jw==
X-Gm-Message-State: APjAAAWduBl6F+PudkAqNZAPmhpQHRklrAJlpiMm9G6Sq2nMOUenLg0s
 6BUoJpU1Xll7byLz3KaI5wCU7Kqhg06eFPuxF5Q=
X-Google-Smtp-Source: APXvYqxN0VwyRPHnGAy1FeK7cYQ4W8LLP9rcQyoTKIBQ5HpgUh7O32Nd+C9FmssP7QWy7/LdEdE/oSKkanGRHSOOWH0=
X-Received: by 2002:a1c:8086:: with SMTP id
 b128mr15493568wmd.104.1574416391389; 
 Fri, 22 Nov 2019 01:53:11 -0800 (PST)
MIME-Version: 1.0
References: <CAOfSrV1CNn6EpPkAkP8F2VQUrit_B-t89sSxW=08zyKVOdt9AA@mail.gmail.com>
In-Reply-To: <CAOfSrV1CNn6EpPkAkP8F2VQUrit_B-t89sSxW=08zyKVOdt9AA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 22 Nov 2019 10:53:00 +0100
Message-ID: <CAFLxGvziLKNA0gcPo+EGwfpuv6Fe6=sNOfhEa1DR7sN0oOxzMg@mail.gmail.com>
Subject: Re: mtd-utils io_paral test fails on NAND
To: Otto Blom <oblom586@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_015314_699847_27000CF3 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2019 at 8:54 PM Otto Blom <oblom586@gmail.com> wrote:
>
> Hello All !
>
> A couple of updates on this problem. Turns out io_read also fails in
> the same way as io_paral - A page of data comes back as all zeros.
> Interestingly I added a retry option to see if it is a read or write
> problem and turns out every single time so far the data is correct
> when I read it a second time.
>
> In summary when I run runubitests.sh it passes about 70% of the time,
> io_paral fails 25% and io_read the remaining 5%
>
> Any recommendations on what to try next ?

Test one layer deeper. e.g. flash_readtest.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
