Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA3FE6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGpobesyMPxo2EzYhky7qpMYd1pQ3Q2JKtnh4eDLf5Y=; b=1dXoSspjvf8pIc
	Y5fECewoKgNaTvKPkzANrnRSqkUVwv3nACEOg5mSNSbcL1CzjaOj/IBJ8fvuUsfW4j4rN2TNsLh6f
	E2hePFRbGaiLqIaM5+5gw6sqCqKaeIiJRW9iakFE/o+WRpaijLudmeMkGZOnwPWeuHHOr6LDdyUfv
	y3PuRmg9vKJCWB/YlfNKbX/9tuyAeU9Ga6C5LzJJspl5WDJqeEEVcrWUALgbJt86vgy11cYd+uuvJ
	W8U5igg/kNjcIJinb9HEzud2gyiTFgiq9zQjmETBZ+/xRQyXpz5oBHED2brBc7F2xh/ZUinSsx3UN
	vlBpIrPfKPk9Q0kXGhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGy-00000000wRt-0j2U;
	Mon, 09 Sep 2024 07:57:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGl-00000000wDl-0LqL
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=; b=E635laW1j+zN5m4Um3KWYd1Buj
	aH4OWC1cvY9a3vy0yi+bWc5CIiHgOyGTlPsc6mfvWLXqHwZIQZdaXusXNr6UBQtgxg1X1p+yZOPYi
	+6CZyMZc8VZip4H1mrfnFiT2R/olABLsqPGloEA7cjMHcA4ryuBAl/91DWyYtVsqaIH3TVz+E43Mp
	njC+DFByweRK8V2W2dTd3m9G4suksHjDKNuagV3Q03RXAVAKz82xJNcew/hvrMm9XFTRLyl0pPy6s
	JDjiWqesoQCd3XQc8hRD3Gzv1dEYsvf5ih0xjEPj68ipQ1kT2kiQZCyOpYsNjYGNzCdONbxZ6S6nd
	WXA2Zcyw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGg-00000000LQM-3Tjj
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-371941bbfb0so2365837f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868621; x=1726473421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
        b=i8p+eq8c8qDyIKWbV9th5a6CqK/H8XWzWpqHaI7CjJpusK88mQwFeTCbJpKb+Frk9L
         HOKorAE7qfdBx/hI5RlcVBtEpFkYX9fw4L/9uag9VKbdSN2hSfqwe0G8vP6Ib/hLIEIe
         /rcTXW1wic/nRewX4YDtsPUziXApKdX0lT+l28QKXwlxpfnluqD+5IZP+NOw2fuGX/fr
         dTjGb302XV3OFQaZK+0S6UaAWPzMfxjshjWNtpU+asuWsZNAqU6ibAU5aCyX0Lyz7Lzd
         ZmpT9q0b5jBgtFKLcaHxawxn+iUwAULPtPakxooWMMr8vUimS7tisHcyl6WfSkOo9exs
         U+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868621; x=1726473421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
        b=gC7A1xHU++JKlGjemPCyLUlB4BcpPqAnJi1pESKrKDiJbaPHZtIKF864XFgWotq94S
         MFhnmNFoDA1zxDQin+xkQO30+2ADW5LZvIqLT7TSY0w1gn6IxX4QF3SDY6DY0lC8YYef
         b31rR8ZbokqELConpmM9tP0TEFueE7j+XdMxArpt1YeNrImT42QAN0Jc+1MMsNSlRCBC
         xFW15fyzKwb7+uJdqZkIzvHl6Ev3HbcD8wYSOgcfOfkurivFse5N46uZOPW8G+fKzi3z
         vAt7pAatDRE4qG3orDNIm0jkQSLQPl4rbyJuVUpGliuwAxxvkXgxD2UAmGGTPEbKnDlP
         Zg9g==
X-Forwarded-Encrypted: i=1; AJvYcCWEIn+aNHKpr8H0qL0DVSDk593y2/ER9vQiW9SuU9RfZm/groTj5rHZv9lQnOmwzhUd8+lB2rIJPlg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0e0jA+sJvwT0QxiHv/3JsIl2kR6Q2Z/fSMtOVl0iSILXNF6+1
	TKQJDDnRmgnvKAgKmr1tcR+9Jp61zxeCgumgISJkL8RSiU1viXio
X-Google-Smtp-Source: AGHT+IEqjD0pfE9Tv+DdK7SKAV5je4YjRSRbb8e9vECs6S3GOh1jf14emjKYBkmnsY1RroQpxtUgAg==
X-Received: by 2002:adf:f64f:0:b0:374:c977:363 with SMTP id ffacd0b85a97d-3789268f0a6mr3668337f8f.24.1725868621057;
        Mon, 09 Sep 2024 00:57:01 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:00 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH RESEND v2 09/19] bpf: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:52 +0200
Message-ID: <20240909075641.258968-10-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085702_959885_645648E9 
X-CRM114-Status: GOOD (  11.25  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
---
 kernel/bpf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 7ee62e38faf0..3f0d1eb7f5b0 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -21,7 +21,7 @@
 #include <linux/filter.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
 #include <linux/objtool.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
