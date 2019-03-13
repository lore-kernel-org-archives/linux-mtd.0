Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF80C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 21:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787D72054F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 21:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+CQpwGj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dw4nOA4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787D72054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRZKG4oGmCF+V/glTe0Y5LhkJ3i8k5hJz3rJEmZH1kU=; b=m+CQpwGjQhHixm
	iphZ8NedpDiWyegRr08oqrffJ5kbtahlNl/agxCrPkkkrPBdRj0OOlwoW4ZNab9qcUlul7uVm9123
	v6aKt127gfDBbSusedNd2lVgzwX9403W35GhmxCsprrYo4arLQd/aJ+T4eTcogk0ACi5fvaA748ek
	Aol+Bn6RD8aWaXmjxTd9guGPpUJvXtli+j4wVdVnZzjo7nt2s5Pa4v1UzfUVvUlLV9fPjU7qjLJPL
	2PRRI5EstXpMLQ2MCKMhUCBLjqQMvNRzkvwsQMG54LszpHNt5JR6cymZlW5td9iCWf0KGDl2J0sBS
	GlTTt7zgQNbS8VELwTnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4BL9-0002Ns-7d; Wed, 13 Mar 2019 21:23:07 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4BL6-0002N4-MX
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 21:23:05 +0000
Received: by mail-lj1-x242.google.com with SMTP id z25so2919616ljk.8
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2019 14:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNEikCodmZqH4zF8Gz55GcHQf7DQSqntUXKPuV9Vin8=;
 b=dw4nOA4YROGvoREvqGV8tMQ4CtVoyh/kk/h+Jtw0pOfwgYTDqNzrSPzvu7J7NFGySY
 zR9ziMTeWSGEKqctkj8EnradHa4zskTl5iBLYiaRWKtMskfToVEN56c1WMr7c9hQxvYM
 r4hKc4h7iAluA2XanuAbHTUPsCfAB/0dvrSJ76pqh1kHCFLlyRCO95mWtcJJbu+/fdNc
 fS4Ygz4vH8LKJptmxJugzXworUgYURnWvNXsihqkZj/uC53QSk2bbSjMP7GeKOuTlga5
 Bp0oInRta9d3zFNQSD1oR/aCreTuTl4F9h4G06G9605ivH4JNIhhO/LXOPyKV5QmWXPw
 x/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNEikCodmZqH4zF8Gz55GcHQf7DQSqntUXKPuV9Vin8=;
 b=Wx6MFj9VrNn8rIKgVaFVucYnjAd0VQT1gkCiFcqAZy6HIhItLzU0rJlBZVVcFnJPXJ
 tW5ajDNb1B++5K/cG7lq2vYoL4QklCyI/4oU7qIgDk6W/cdDpXM9TD8KhtVJBD1F+89s
 aawDjVXSiGfXLhZ2vXZt0mcqrBPQJ4wLZ0gYaxmxJPT7fROGEWoXSD/ZoXjCHeqh80yV
 sbS3HIz/ZjK0n1FUyFhfqng3WyIe2FfdewhsGXBOCUuiG66qD306zclVrbZ5wPcLAMOF
 38EHvrUiFLjZyRMh9KiAqkOiDvJcqiZcze6lCd/5ZqV68DaygApNgqeBRRMz4R3783ZJ
 fFIA==
X-Gm-Message-State: APjAAAUBGN0aT0Yt0qg4V/wBhSMnOT/i6MOVNAku9I/5qjQbFY3IQTp5
 Yw0fipZRYL1P8HbZDXhmeaHZxJyxf3wNxya8uuMfjQ==
X-Google-Smtp-Source: APXvYqxkA/I+2bG8ZDDwVX2pbXeMPqGzk62G6EJ5BZsx/f4mtwBsyEZnZ/o/c8OixTY6y5mHDSG6D5hvtS2EyzO+2n8=
X-Received: by 2002:a2e:90cd:: with SMTP id o13mr13179047ljg.153.1552512181003; 
 Wed, 13 Mar 2019 14:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190313211901.607575-1-arnd@arndb.de>
In-Reply-To: <20190313211901.607575-1-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Mar 2019 22:22:49 +0100
Message-ID: <CACRpkdYeyaahQfE=uKVZQRwJGrhTZqAPHhq9yXEB7pFgwJ8-OA@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of_gemini: remove extranous __xipram
 annotation
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_142304_799892_D23FD5CC 
X-CRM114-Status: GOOD (  12.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 13, 2019 at 10:19 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Marking a local variable as __xipram causes a warning because of the
> noinline attribute:
>
> drivers/mtd/maps/physmap-gemini.c:89:11: error: '__noinline__' attribute only applies to functions [-Werror,-Wignored-attributes]
>         map_word __xipram ret;
>                  ^
> include/linux/mtd/xip.h:34:18: note: expanded from macro '__xipram'
>  #define __xipram noinline __attribute__ ((__section__ (".xiptext")))
>
> I can't see any reason for the anotation anyway, so just remove it here.
>
> Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
