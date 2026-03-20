Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EC91099B2D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQJhG3yI671d08dmLbmsoCE9UnzC3REAekIWFt47zfI=; b=T5E0ZoviTW3Ibr
	MLrwywPPYg+loePRs8JWgx4ae//hnnTV+gOGJMNmp44AKU7uRjgiukxCk2aYrNEXke/18RzVzJwrO
	J94Q9RFYwzMWT5SvBYhl482Wu3bxwB72LA2IU2QCaedsXi0izynb0iuxf9PdY58faDvXpD4mkOnI6
	pRKTAlkZu3kIQ/IJQULCzWrkgFXb5lf3FWL9HIR2dwEwOQKbAlN00H8/qq9MCZCdjKbc0kqH6pKyv
	tSD4ObzoaaiZP6TaIcTIp8qTaYHBXIYP1jlawLDAuhDEPQROz+gDSmU4rVFlBvjQCtNVYq14qc5lJ
	ttCFBzqjf5LHCW3dzShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eIU-0000000DM1f-0V28;
	Fri, 20 Mar 2026 18:10:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eIP-0000000DLyt-0RRi
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 18:10:08 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82418b0178cso1218718b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2026 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774030204; x=1774635004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMdcBuBMskRutNA8N3biKduuLjw+8mQjfcLCAfh2HNM=;
        b=CP5XYIiyliyH8GD0Z5u9/G09z6QWrJWMZuVk+FVxxoKrr2k8BD3IKJi46z+6zb5FWx
         rQqKn2emHPAq+SHRsR701nzox1XAI1L6L9jB2R4hKgg4oRUsX1xhSVP+jANXkkpRJvxd
         ncWa8aBQU//WIUk9LE72zvzII3TqQ3dfCj80P6AoCp3BjEwgCYgN7FUi1yJZ5lvf6HIf
         +5mch4dP82VQWjcaZJi8sLn80rsvnYvC9DnNacJzWUHncQKLO6/AdTs2C3YddC6uUuX7
         hZIWjYMZqa9QNEME6bOYVa0CMKBpqbbkC1aYYm4i27kSdivBTNRWKiMa1w+OtM+oDHEd
         sH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030204; x=1774635004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UMdcBuBMskRutNA8N3biKduuLjw+8mQjfcLCAfh2HNM=;
        b=kbc2LUgH1Qh5yD1dOPaCbV6ZBzp0w1inhwQoZVYsclEr0tYI2hB+95w7X9ctZd8DZK
         LljmnkmzMZBqK6iHbYQjnz/iyCUt4Nkl4pkO6Kfq1wG7D48E23v7v/ais66L1UlqqPGp
         tppDI5bkVZC7QWZew/FS8ViFpCBAvTskHGEbpIZVJeUiad8dcZClUeBm+JIVbGbvhxuh
         xfJjrgVsO1AbVW0hvPj7W4Z79tVSo8IMPXpJQjNGSfrB3ypAUDL8eI5DRSiXP1fqsBG1
         y0nigLhhUvrixUSBcYrs1XIk6DJCAtvwfeFUzQowq0padAf4Jy4U1h+op6a9L+02fBrc
         mYqA==
X-Forwarded-Encrypted: i=1; AJvYcCXltsJuWh7XUtbExQlzOkKIC9FtVVJ/ufHNO7DYmu2UsDgVjbOxAZVYa/ja5H46/lHNMoIyV7EkJnw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDXv51d53OGaIqeG+pDJJGX0DJS0WCrB+Qdu4l2alX7yfDsbb3
	1cxP0gDeMeE94OtgHC1LOF/3nQIg674u7lXk+p49vjGgGkitNjvUWq3Q
X-Gm-Gg: ATEYQzzMARESn2NBeGLSbDKH/OLdgZagLVNtGeOz9t1eaviX3lIDKsbEnsmucRsX5xj
	MRkhrhoec7dYF94dx5Xe6VkvhZ6cr6NgYrTcGqNiiF6D2NUJMZiTJH7alFyv1HZnc/T+OSQrJAt
	Vp+vdbP06s1a70i1SfTVbiJ2wWE2zZs6QDIlw0VPEDE/yrZtsfGz6oznHW7mRAOl0ZACKWaSBDd
	u4V+E9LR/qvRJpu4EMBsH0x6MkFrEPm5ftSUuSt+8E0RZwqup9rp36gwdIUpVS2X42/U1QRtyQJ
	wzjMb/HsAL7NLkkcz0CElOkbIV7A/Ur/elPlTJyQbzWP89GhCjacca8ggbIYnk7UUXoFQIad2yG
	Q5rqE2kcMUoBHLGIy8L7UcoW2sb4Bk+nTNyo54fJNWEU0f1E+sdeBUXJP0uJ3sqdh202wKadrbG
	HuN38+76c7Ux1lTN/KrdoyFI5TJewDW1ILFATTHtUk58l5RNeqBgNClaaEK6t1qQg401HAr21s1
	DkUmslPJkdnM7MZw1TK4mCP7M8yvNZYzmumWpo=
X-Received: by 2002:a05:6a00:2d05:b0:82a:6125:728f with SMTP id d2e1a72fcca58-82a8c22de9emr3410942b3a.10.1774030204035;
        Fri, 20 Mar 2026 11:10:04 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040d7e56sm2582318b3a.40.2026.03.20.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:10:03 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: richard@nod.at,
	akpm@linux-foundation.org
Cc: chengzhihao1@huawei.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 2/2] lib/list_sort: Remove dummy cmp() calls to speed up merge_final()
Date: Fri, 20 Mar 2026 18:09:38 +0000
Message-ID: <20260320180938.1827148-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320180938.1827148-1-visitorckw@gmail.com>
References: <20260320180938.1827148-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_111007_245773_87EEE347 
X-CRM114-Status: GOOD (  13.38  )
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

Historically, list_sort() implemented a hack in merge_final():
    if (unlikely(!++count))
        cmp(priv, b, b);

This was introduced 16 years ago in commit 835cc0c8477f ("lib: more
scalable list_sort()") so that callers could periodically invoke
cond_resched() within their comparison functions when merging highly
unbalanced lists.

An audit of the kernel tree reveals that fs/ubifs/ was the sole user
of this mechanism. Recent discussions and inspections by Richard
Weinberger confirm that UBIFS lists are strictly bounded in size (a few
thousand elements at most), meaning it does not strictly rely on these
dummy callbacks to prevent soft lockups.

For the vast majority of list_sort() users (such as block layer IO
schedulers and file systems), this hack results in completely wasted
function calls. In the worst-case scenario (merging an already sorted
list where 'a' is exhausted quickly), it results in approximately
(N/2)/256 unnecessary cmp() invocations.

Remove the dummy cmp(priv, b, b) fallback from merge_final(). This
saves unnecessary function calls, avoids branching overhead in the
tight loop, and slightly speeds up the final merge step for all generic
list_sort() users.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/list_sort.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/lib/list_sort.c b/lib/list_sort.c
index a310ecb7ccc0..e8ff17c9b2d0 100644
--- a/lib/list_sort.c
+++ b/lib/list_sort.c
@@ -76,15 +76,6 @@ static void merge_final(void *priv, list_cmp_func_t cmp, struct list_head *head,
 	/* Finish linking remainder of list b on to tail */
 	tail->next = b;
 	do {
-		/*
-		 * If the merge is highly unbalanced (e.g. the input is
-		 * already sorted), this loop may run many iterations.
-		 * Continue callbacks to the client even though no
-		 * element comparison is needed, so the client's cmp()
-		 * routine can invoke cond_resched() periodically.
-		 */
-		if (unlikely(!++count))
-			cmp(priv, b, b);
 		b->prev = tail;
 		tail = b;
 		b = b->next;
-- 
2.53.0.959.g497ff81fa9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
