Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844EAC00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Axk0399Z1bZZSW7MA80FWeR8alUH/hVbKr81qQDAQfI=; b=ELkOovIFaUV1ty
	VyPeLErBTmN+yS0/9eI4qp/jUqhCV5CJaM0MvK+Kp/4YLH3+ADU5WQ2lHUlRjYlp2xbyem9CboTTH
	fltKjNXNpKrYit+p0P1s7XYuC2iQi9gcnOJ1d6q2Ld0AJvSktasAsOvvogQ2K/shImFekw4s4+PTO
	cubFGFY8FOIkNjZAC/w7usDm10WfdIdH10GG+usa81ENbOsBP9LWy/9LlxYaMgWUfpMH/i+jVVSv6
	M4W7L8g/odKTslZCTrZkSx+eKZN3RS2mvcGbp6uJaFREOYn3fH7izSuN6SyKxuIuTIEVGOPHCrUtb
	gKn9Hg8EcUuQepfUu7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHuJ-00A3GV-1S;
	Tue, 24 Oct 2023 13:57:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHuH-00A3Fc-1c
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 13:57:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6bcdfcde944so1074553b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698155836; x=1698760636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzCyhOIKDXe0/b6oeJdHaO+qjcTlpDN6XzOpBnH1lGc=;
        b=ghabbct4NSQFJFZSfDSvawokvuEXYxKfcRsvbOPFkqZm11MSRPgcPaFB9qg5HHSl8g
         X2yWCiOB3liejAhIL/EWWwZkrtR5xv22DvTs53T/92PgzCdnutf3o5A1jM/sRICsNDf6
         vGITtrgGM3ZMBR8M/s39QfqPjRuoSubaOvEApXPboKENakLjtCRzQmyCpGXGnxqK2T20
         5MGAjpPgMa8FM9U9JFOf+Mx+6C02xmvUpvCP3giJXTPTeCZevw7gFxgiH0snC7/4Z6qZ
         CNCMkGpZ3kQeeO/9sAhif4CE+YKBfPJV05LJe9P9gXf+R1N/TCccTCo65Mxy/fc+AgyJ
         9Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155836; x=1698760636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzCyhOIKDXe0/b6oeJdHaO+qjcTlpDN6XzOpBnH1lGc=;
        b=Y8wlTfzq9JMn2FnMPAlAQZXU4oL53KZNBjwLQMOQrFqcMk4BviPUyk4vRkZW8jWv+P
         1ehtlFdQlerpe1TgURY0e5mJDC8lKQ0HoOP90SfsVSAcYUEFihZpW71r9qecT1Tgehpt
         wtuKigP2RozhUN31HFSuRqJ5jyTgCgROTRra9OeVeSaaK03HU0+jOhgEnJ7Ch4qhxG7g
         ibLoUw4E0IJf5xG81RyoFPz3QLgMHFbJ8k7Ow/gvU1M/kWq9LxxMV+eISxXr92GtATky
         e3cVvRi2s4Gz4GcqmoPfn5z0DUjiHD4O/66tjjd6ssLsibl2kZUXsFTFtRG1xXBw1v/E
         +KqQ==
X-Gm-Message-State: AOJu0YxeZjSUQj+jbQA7omcolF9n4kTNYt/WyvkCqJz3woMWg4wivMmu
	joJihdEwcnFBELgQawqi01MNv46hIwiyTdOYlRs=
X-Google-Smtp-Source: AGHT+IFWrE5MMoCx8goBf0CxfLQ8mzDUd1Z+/OmQDua/oopquA3i2yNiJXGKe5e0G7xZ8YuyCLMneSeQ7yTsr8WS474=
X-Received: by 2002:a05:6a00:212a:b0:6b5:523e:9e9 with SMTP id
 n10-20020a056a00212a00b006b5523e09e9mr11884914pfj.3.1698155835904; Tue, 24
 Oct 2023 06:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <eb48c493-f585-4acf-83cd-e2466e1a4d40@linaro.org>
In-Reply-To: <eb48c493-f585-4acf-83cd-e2466e1a4d40@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Oct 2023 10:57:03 -0300
Message-ID: <CAOMZO5Cy2BGoMVpPzeAAJ8j-QN-fEDmShZE+bbsSqon1Xf6DvA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_065717_542202_65040044 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpPbiBUdWUsIE9jdCAyNCwgMjAyMyBhdCAzOjAx4oCvQU0gVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gSSBzZWUgdGhpcyBpcyBhIGR1
YWwgZGllIGRldmljZS4gRG8gYm90aCBkaWVzIHdvcmsgY29ycmVjdGx5IHdpdGggdGhlCj4gY3Vy
cmVudCBzb2Z0d2FyZT8KCkkgYW0gcnVubmluZyBsaW51eC1uZXh0ICAyMDIzMTAyMy4gSXMgdGhl
cmUgYSB3YXkgdG8gZXhlcmNpc2UgYm90aApkaWVzIHRvIGNvbmZpcm0/CgpUaGFua3MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
