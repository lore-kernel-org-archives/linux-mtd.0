Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88444E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn4/Le8mZoCSNgTH0a9fQbfFBen4RDKi9+WGZVMKnFw=; b=qXTyhLSL2ihZ7a
	uG10I5sjLTstPxyYE9Ynvxu5LJv+AR3sMj3tgPQ0CW87V3JlPxN7GZOYrzAswvnawCgph/S8HURBM
	Z82Oh+cn1+4uTKlMHL1krIJXC/yTefrYI8cwb4/kUg/sERKxt4ps2B/E/RMmyOJnO6xuiwyR16807
	sogr+mZsUdnaBrPdZRVeyxXjBAwd7s4CLGojnfMvwhNqumFq0dgj+Myfsq5IwlD+rPgIcdAo3l/lK
	H2ECEdq2Gl1/ZangJQ1QWmbgEHfMD9FFZ7sXUs1bdDWggUnD0hxN4VaigDa3O3CObitVcSMQuDimJ
	WwQTmYcBkTjdsIHdphvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHC-00000000wfl-2Kvq;
	Mon, 09 Sep 2024 07:57:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGj-00000000wC9-4Buo
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so3047195e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868624; x=1726473424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
        b=YejW01D7T6zGC1bRQ693eqvhheH7cBlVbYR8zikmafZ+wZ+0HFCYFtSD2M8cT1XAsm
         4RK73xPSpMhQI49dnebxJYniQW4f4Tzmoum832ghvIvsJs5Dk+diupwsvB52q8qvc2KF
         R7HBvr9gIKhShdjlqWSXygNJybEsicRoaNA6mx7R8Q+mQjZgbYDBUXuhkhQYhMQzA69j
         PzM7F7rOmfMn+PhiTLvpPUcTR/0qmT7MKFTY7dPw5swWJOg/G/XMf4P9Hz3CPgirO943
         ufJQRntgPd5CydouFeE0UUj4T+inrTS+RTSdKZf5bYqbSxIbdgEIVdQ08+OTbGYg7wxG
         VjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868624; x=1726473424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
        b=m0pnFF8AHSfOUniBURB8HZtIH8Nm7RMRe7UhnVfY962eJ4ZYpl/0HU+jqscMYva9fU
         nqYhxuPAmjzuvhJZOaaq5YCRXWyWAFU6hjTy/i4SG0gk0qB+iS0rsXtX/ccTq6kQP4jy
         TasRoNiD2tv26FRkd0SIwqTchqSxAVBtAmsolbKct8Mqwd06ooofRyAL+eqVC7NIbFwg
         P8RiMfxAV1Wt2+zZnTz0tSjytTHAEpjUY3neACpbUj5NFdmfv3N40FbUxiLthxafvZXP
         7Wv1dBfWCUChb8KYkeCSmAFGCfoEQwHOKbA62EiSrqgx3ZwDVMde69u/wWXqwL3SYFgA
         mG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZUQiTTX06/znolkK8v0U7DJSHeafn9Kb7SyHg/Hxug4gDL6BiAB8VDnMJMNO7VDbyydEUs6gtAg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxBeRRX6msPjvjOzIJvMvNhX3M+oQzjwvtJINaB6Kxd9D2kCNR
	qKmERYBJJ3AtGtIjCWYmzAb0/geWA8qgfhz1UnZOiwcX/lCevxV9
X-Google-Smtp-Source: AGHT+IHsh4JSj0n795jllGPCHtcshmYEB9h2vcO7+qPsciOrvVvisGOWJv6LsOPnSs3/6a6/hCfK3Q==
X-Received: by 2002:a05:6000:bca:b0:374:c847:848 with SMTP id ffacd0b85a97d-378896a5c24mr6994466f8f.36.1725868623978;
        Mon, 09 Sep 2024 00:57:03 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:03 -0700 (PDT)
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
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Subject: [PATCH RESEND v2 11/19] kunit: string-stream-test: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:54 +0200
Message-ID: <20240909075641.258968-12-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005706_439231_27B3298F 
X-CRM114-Status: UNSURE (   9.61  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: Rae Moar <rmoar@google.com>
---
 lib/kunit/string-stream-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/string-stream-test.c b/lib/kunit/string-stream-test.c
index 7511442ea98f..7734e33156f9 100644
--- a/lib/kunit/string-stream-test.c
+++ b/lib/kunit/string-stream-test.c
@@ -9,6 +9,7 @@
 #include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/ktime.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
