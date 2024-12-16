Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C5E7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qLqpGXpW6Ag6TyOVcCMDuW5nrflAbZcynye3Dpaj3Us=; b=2L077GsTc0DVMJ
	aKLay+7VdTRb9hzG1uvziDQypplfqNBff0LbZWyxpwcvnUzTCYb+uX6mGEEtJ4Yle3CbcFZ2EGoDT
	f1/3MffkeGjk/VEmIbA+UZmU2Iwd3p8knDUQxTxU5LdLF8iOLiqIWbu433KK+05nNS1DJWC8G7zpn
	TQnEgcNNzKYKPPfBKQ77XHIdrnNCM8QGGfmzLghLyZ3DljerGOTZU9zvkeyx5q9/yBoob/6E26xl8
	aWZMzSaw8SxCsU8uv/JpuONptYAZbJIyy9SqqJsOdcMwspu7ZlJuzEiSlP3OdBrfJS1e01w2tgwgZ
	afUMj8LGwNsQj5vp1rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9mn-00000009uSO-2Yvn;
	Mon, 16 Dec 2024 12:01:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9j3-00000009tzF-0B7A
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 11:57:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401e6efffcso4702612e87.3
        for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 03:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734350243; x=1734955043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEFykvRv0vdfn9qrN/qUJVT0DIuTpivJPESm8WKK+4o=;
        b=LLSKhRqysThg2tokcx+XXCKxpwAidsPsMy1S1tBJ1HuHYmF/6u0dsSlPmVECezr3v6
         wl3yzNkKg5DxHGnEcQjCIs8+QLBmSiJG7jcqzWdwnruy5zqTX+g9WkWj9EyMHkB2vcAj
         yLMbK2bgrXdZmmymK5i5GZRsf6AuQPkNs3MBw7PuDfW0sc1bE15s72xB0xlHUu29ffay
         JrNx4zjstT6Y7025mYFivQXgiPtIbytXpA++BqH43skRyeC3LaCvtf8SjFhODLrEQAAF
         F+Kng4vgi0uQ8Cqq/MzukkVFzW8dvLbkzhjlRzCLRrHz7IA8rBpVG9gKOYvgQmrEOTPp
         OlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734350243; x=1734955043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEFykvRv0vdfn9qrN/qUJVT0DIuTpivJPESm8WKK+4o=;
        b=D7LmolgS+omdTjEjRFphcb1cfcCZ8igagNwAEPpqvrSzp3yJaZoJCrTcQLsM9mPvCC
         znXDhXYUhcuQ51MZarxle6C0whiovYgtf7ceaiZS7Crx07IZ8Ya26xqaFUUR+9nXwgB1
         SI8/FbQEmB67/5gIo5uOHLM9x6YBb3lJeCFbbE5m1CNSn0tRhCTsT8syEvHyI3OZLuGB
         6TvvLo/Mwa17MGg8rQE83j6SFXk3eETWcEvczL8/Vju7Ep6oEPilIDwNcXp7vBz6iofi
         CqT619Z17E9yDjbRvql/EVW5AtRtlTVgdd0tSWmCu88zM3Q/yR/famw+lo9juRlcKHnd
         OqXw==
X-Forwarded-Encrypted: i=1; AJvYcCVVVB72ZTAPWhZXiN2Fq0ZErHv+64oB5mk+lxsPlMESRfprbzLV5d1UfZivUrBvbxfer9yn4Wd3xRk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXUTu9iRKzNOzgzkiR57jqPKKxE5xT1PthKTCEMhEVwJ/EbYww
	wJrjQfAIrSI3fthbt+oYUWwcCQW5QlyJlSLYbNQtJSInPGkMXY0p
X-Gm-Gg: ASbGncsU8hpsGzjhTvCbeKfm3chTOdHeViFvC7R9tcszAoPRctWNBphMMS3Hf+ZAtdS
	+jhLOiKSLIF2/PaCvpBG7QRt89h9igSWLtfYuxXyYD+wTxJXicgwXWqlAnmDQmm52qjwQcz9yMi
	1gKjaBoKSElgM07TWHjoQtKP10XskwiaqQPIAJspZC9zkZ1dNFOkviVbxyeQ+a/2AGG3aGosq+G
	AwshNiirzN7T7sk4u2ppdJrs0KCxx78t5QSnub+LnPiryPRh6vMRXxCoTKKLUQxD/N9E8fS/ELv
	dLxoYZ4rrUBeiyNege/1EnE0TNyHtAAcMdU4lOU=
X-Google-Smtp-Source: AGHT+IFLJROnRDcETIYVlM1wucYlyEdTfr/ykKDboA1YfuWurOmhKOolFR9gNW32Mntj0/bgT/DBQg==
X-Received: by 2002:a05:6512:1195:b0:53f:f074:801c with SMTP id 2adb3069b0e04-54090595904mr3627513e87.41.1734350242500;
        Mon, 16 Dec 2024 03:57:22 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c16890sm828020e87.225.2024.12.16.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:57:22 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] lib: Fix integer overflow in in libiniparser.c
Date: Mon, 16 Dec 2024 14:57:38 +0300
Message-Id: <20241216115738.65009-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_035725_130284_1D915B31 
X-CRM114-Status: GOOD (  11.02  )
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

Report of the static analyzer:
Possible integer underflow: left operand is tainted.
An integer underflow may occur due to arithmetic operation (subtraction) between values
{ [-2147483648, 2147483647] } and '1', where the first value comes from the expression '(int)strlen(line)'

Corrections explained:
Modified logic toskip empty lines immediately, reducing unnecessary processing.- Ensured safety by validating len >= 0 before accessing line[len] to avoid out-of-bounds access.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.co

---
 lib/libiniparser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libiniparser.c b/lib/libiniparser.c
index a6ddcc7..9790c75 100644
--- a/lib/libiniparser.c
+++ b/lib/libiniparser.c
@@ -540,7 +540,7 @@ dictionary * iniparser_load(const char * ininame)
             len-- ;
         }
         /* Detect multi-line */
-        if (line[len]=='\\') {
+        if (len >= 0 && line[len]=='\\') {
             /* Multi-line value */
             last=len ;
             continue ;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
