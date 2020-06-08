Return-Path: <SRS0=yUT7=7V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082E8C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 09:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB359206D5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 09:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3XYfhVN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSoehG0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB359206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OuMUHoc8ZxuEVpEftgU/fB5FA0VVOJSzUucYGP2Ur3c=; b=H3XYfhVNcnstU7
	+idGmPY+JKvrIc2xUoQFhHmH7kvFtAwor67wTWpRkotDvwA0d2vs/k2zLdZv+FZU07Xkk6cS6EUMm
	itwokHbbOX9OkbKSmNwhQob3d+oe197rl0qRRB4TtBMHzUhOVnTAK/fz63getmW3psPn2esI2s3FU
	PIgOXWAsc08fnRLaw+x7wd4QpVU5g+7ngqzYnOPZjFZsoVQriLMBcuAuff/TOJcpVsX4SZIQglslI
	PXktPdvZIb6Saq/fqfaaySrNUDzv5A3+LtWn85AcQkJhS3VcZnO404T+C/5zfCN4QwymfG3NmWjG+
	V+I0RWnOUtAVAn+sQyRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiEHF-0002xm-1J; Mon, 08 Jun 2020 09:41:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiEH3-0002mb-SD; Mon, 08 Jun 2020 09:40:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id q25so15828981wmj.0;
 Mon, 08 Jun 2020 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+F6VpU2DhJ38D1OzhvVOMkYO64zmbpsjhAiXZI8h3vs=;
 b=iSoehG0/Vz0/hFRBTy05XlPZguWhE683LXK3Skhpl3x5As15/po8UkSHDk2lk6nX8s
 EmfTIGxZrRzy+4Uca9R+I+lMk+JJxO3pNYIKfGX3M1SHybTaTwQodmZK/e5QQjH3apXb
 bjYRtAiGQhKAH6ksUDm69xag6askBl3VCWymf/c94eoGYsBLlEsrhMmyU5sJ67PqcxTr
 gYo6AGAKfXOjpMVuQAcG8+RqQV7WapOqkbXqQCK1NLL4ysw+n/WlrdzAdYYGMFB2iuLt
 oQKy8A7deCvfHilqoP1TXjVWcSElvG3lhEVBjqOWdLkk/n+7n4+c++GQx9oZ5+w8zVTD
 5VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+F6VpU2DhJ38D1OzhvVOMkYO64zmbpsjhAiXZI8h3vs=;
 b=d8lVZAfUnVnC6BhR0lyeRiY+i0TjpDY4iRyYIUcz8yo5cQHABfmXLJ+sc4erBUVTmQ
 kVKZT+VTzzpxCXUTyCphps5HCFdHU0FcDXtWcYlitv20Vjj5/029l+hMxv+oPcXcYZit
 WNMkt0PX7Z4wEAdCDYTae6yyjGTZmR+BoUm3QEw9q8k+eiCzKkIKFi1ntlaCY1nRoj7M
 Kh1WktM2dKsS6TzK4elOZ7AmpYvR5ThXr4kXjOo2SI6+gdNi7SA0CtDlU0LgPDH3pu6a
 uXkepyvTPrEeC1O7wYaUoD4XWUC+5qjmBNMkDOQuJGFZc9/sekcGBlb678cybJk2ysKj
 zARQ==
X-Gm-Message-State: AOAM530XgvOAizP6IfNrJ7S9y7VQMehk+tAxTejciKCqZdZYYq/b4zYE
 ooHxkfMewcwnWuWx37YTtcI=
X-Google-Smtp-Source: ABdhPJwwSZuP+bLORdgzdVpGe4oKaJlyNkuAUhDK5qX4qEIjzSeAk+d6t6RgsEH1l8fS5REb59KWjg==
X-Received: by 2002:a1c:f401:: with SMTP id z1mr14952827wma.44.1591609256454; 
 Mon, 08 Jun 2020 02:40:56 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net.
 [83.49.61.28])
 by smtp.gmail.com with ESMTPSA id a3sm22096479wrp.91.2020.06.08.02.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:40:55 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: tsbogend@alpha.franken.de, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: parsers: bcm63xx: simplify CFE detection
Date: Mon,  8 Jun 2020 11:40:51 +0200
Message-Id: <20200608094053.3381512-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_024057_910781_C8F0D41E 
X-CRM114-Status: UNSURE (   6.32  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW5zdGVhZCBvZiB0cnlpbmcgdG8gcGFyc2UgQ0ZFIHZlcnNpb24gc3RyaW5nLCB3aGljaCBpcyBj
dXN0b21pemVkIGJ5IHNvbWUKdmVuZG9ycywgbGV0J3MganVzdCBjaGVjayB0aGF0ICJDRkUxIiB3
YXMgcGFzc2VkIG9uIGFyZ3VtZW50IDMuCgrDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgKDIpOgog
IE1JUFM6IEJDTTYzeHg6IGFkZCBoZWxwZXIgZnVuY3Rpb24gdG8gZGV0ZWN0IENGRQogIG10ZDog
cGFyc2VyczogYmNtNjN4eDogc2ltcGxpZnkgQ0ZFIGRldGVjdGlvbgoKIC4uLi9pbmNsdWRlL2Fz
bS9tYWNoLWJjbTYzeHgvYmNtNjN4eF9ib2FyZC5oICB8ICA2ICsrKysKIGRyaXZlcnMvbXRkL3Bh
cnNlcnMvYmNtNjN4eHBhcnQuYyAgICAgICAgICAgICB8IDI4ICsrLS0tLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCi0tIAoy
LjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
