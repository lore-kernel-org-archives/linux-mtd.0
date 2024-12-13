Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48864E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HpkoQxUASZzquYBP5lJMvL9gK/8nECnoesNoN1d8l24=; b=Y+g7k4+ekL1Po1
	Ell8UP3ORL0+z6qqAuVyP8EIEs2aVLgnZ9wgFRKSuEFmQTj7edGEp5VyuqtuiXpziFtP3Lxdhvn6X
	PHAHenjzbAhQSnhqagsIpHzb5s8WkvvAoYhDs7JbdkJrkuVp5b0pHBFylYLpAWyY/MTllzawQ8R2U
	MMLbnjT06ztFoErifMucLN1KAVlqYhW1Qg6eE7J15hnJz/edrjCZUgc6OvmImjX0Tx4hIgOLO1gOK
	Yu/XBFBW6EE58sqRo0FCUQbeHVUAWDUcnDeoFViablHvoNsyjyooKjUxtH1wI+CIxOHvsewcZQ4O/
	5ZkPogx+aUBrIkxhzW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5lm-00000003ptP-36jw;
	Fri, 13 Dec 2024 13:31:50 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5lk-00000003ps7-0qyM
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 13:31:49 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so16368001fa.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734096706; x=1734701506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8vGezj+FvPsrsx1iP6I2a+9DheIuzKo3QurGTmsL4U=;
        b=YGbVnekrEK7Fc32BpFjQVrp7aW/O+E8rXXjwyn6p4ZpxV3595bOAPbOAW+E7gDfkjl
         /YyK25hTyqbb81Z+SNNu/xLgrnSURyQAMtwPYVfSJMh+thmdc+gvCROeu4F4yyVobJBB
         c0MvEkj6Vx4za/h7xKSRG+1kLdYy/SyyrM8/dbSk7mBTcEprfuURg4awTSZv7qx+EELg
         rl5qvOaKATONhT+NA+51/Y2uVwZm4mai+gzZSFv4szwh6m3Tgoq5Qz+5ahdJJmP1tdko
         ZU/iZrl2e1EjkqcNhO/3AD6W/vROL4/vT0TBzUXB2+Oi+GrDI2nez3abGZ3tkc/loHKH
         xBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734096706; x=1734701506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8vGezj+FvPsrsx1iP6I2a+9DheIuzKo3QurGTmsL4U=;
        b=v+ZgS6zSlJU5SdcxHuhLbSML19sLGSurcTWBi2YTt/gG4TEjWI7/CSCRlzpHKZV8xF
         1cJ9PnAg94hCL6yynHjE4Yjz0CnxW55oGYBNCuowm9hMwYyyTOJVYRxYE+ZFg5DcdXmL
         oQHd6kpIKxIwIbjzxbyZpPZ8/X9Q8by3x0V2bolqaTYwVdO3hSLFmKnh6jSRSSKd/5pR
         L0Uw8v0E8st+SuAedQFoccxh2iSDgZJwV6V2zJljC1kSJ9cGYsOji6zsSu5D5Fv9InsA
         SyCUirsQ9/mOLFIIe7g1FbyT2g8l0tvUMuON23XJlAE40C1YnUftr3+eLHqSWYmwkLHo
         Vo/A==
X-Forwarded-Encrypted: i=1; AJvYcCUwih82qjtcJ94JH2xonmKUqXNKgB+SqJpDWbJT9PUBSSqarxGT+gN7gT8GLk0nBhM7TMHQwm9R9ow=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFnHdXbn5swVckLKgqXRXyTpZA+dT0n3dD2bfMcUzR6UF2t4S/
	Stlpj1T4Rw3SWbB2s+vt9WKr5ApqIRzXvzgKXI1Fr9j0NQKJlt4w
X-Gm-Gg: ASbGncsVJ3cjQy3m13risX3V72tCOu1FtzlHNQZPtSVB49i9vDjFzuqtBtDNZp1Lr8y
	9rSAsg5ZcV1J4y+xXCpLP6O/MUXZxLtE1iUKGuloYJ8JvpGgTo6gzmBgi/VuzJn3Nn+zUI70S6z
	iW0n/c28V+41MEBGtQghqaViaYeBdY2ebHQahm4jO8x5tJq1MsLgiJGUpSOIfmiQSXZNiZUonbv
	uitacXiZb0oVrkaA+9a7OeMiUGTD+wDWanxwmHfd7wcfY2SYNOTG1pB3dhMqp8CbBVTuqpoaEXi
	w3Aa6Y2i8ByRasM5Uh5sKZvsKw71SGMJpm+0Qjw=
X-Google-Smtp-Source: AGHT+IHg5SkRLGj2v0fRaKvR1ciqd9sWzNPS3hHT9Z1x6EFPR+BGKSkHeAUDWnuAb8X25f3GMPokKg==
X-Received: by 2002:a05:651c:1a0b:b0:2ff:cb47:3c77 with SMTP id 38308e7fff4ca-3025459d373mr9300491fa.26.1734096705869;
        Fri, 13 Dec 2024 05:31:45 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3849sm26213791fa.52.2024.12.13.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 05:31:43 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] Fix integer overflow in libiniparser.c
Date: Fri, 13 Dec 2024 16:31:56 +0300
Message-Id: <20241213133156.103435-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_053148_254696_3CF206E0 
X-CRM114-Status: GOOD (  10.62  )
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

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 lib/libiniparser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libiniparser.c b/lib/libiniparser.c
index a6ddcc7..2facbde 100644
--- a/lib/libiniparser.c
+++ b/lib/libiniparser.c
@@ -524,7 +524,7 @@ dictionary * iniparser_load(const char * ininame)
         lineno++ ;
         len = (int)strlen(line)-1;
         /* Safety check against buffer overflows */
-        if (line[len]!='\n') {
+        if (len < 0 || line[len]!='\n') {
             fprintf(stderr,
                     "iniparser: input line too long in %s (%d)\n",
                     ininame,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
