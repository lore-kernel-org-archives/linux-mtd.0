Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D8CCF2C4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 23:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KNlm/UQkIxF64UVz/KrYkiyTVo0NzL4xYrEpUKNrpIg=; b=IwLSBxEtkMvghj
	MySm9JQjR8BcBPsRfVLQsr/3xjx+ed+Vi9p7FAyb6iuteSMhsK9xeGvTFpK2sBa86MhuqV1GogAFs
	fQOoV/Ftid2mgl0Dulvqr2bLm/1hwBiJxsiOkAkXPHIWjk5d7XstTfCFj35D7jG4qVUE9IIcVdCGe
	pqVXiJsVZeSFTsFP5LVhhxyEIwS8wplMNAelcbbZAJQsXIbFklP2BHXFDV/SJK1eVk5uEeI1IWTR0
	ra0ZkZCJ+ZoX3I3CDBagRL0JctAU/ToCED0mmhF3HR3O1Z+tNtYfqWjlO+0/FfUP4aFgLDr6XEknW
	BYYUbnuJsWdCGrlpkk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIEHV-00000005MDJ-26NF;
	Sat, 17 Oct 2026 23:57:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIEHS-00000005MCz-3cVn
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 23:57:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso7317505e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792281456; x=1792886256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pex06CPzZvFqO9bOYfRUEtlWF/y2fI6jKIVDllT5g/E=;
        b=kzWYn5Z53eh2lYUyKhXswxFnWecze/+v44kROKXYq3346h2CdTq7A5gkjUe7E1gT6y
         +zSUAGo2/OVzx8EDgYD8w/m83XlLO4AioHdFlFRjPT0+onjra6UmkG12Pn2EW/O54OST
         RCBYbu2/t86M0xHldkIdhgUythi/doavNun8gJh3Qs21tTuoeNRJWbU4E4izjLoEhoAS
         EfmuMW2K8clo9kFjIXpIFK2MpXu2NF1yf3xnrglo64ud54mEsXnZqgQQFoXZhPiNtLuw
         fNXfHde86ImEPn4us1w+F9mNDUWPuosVxrzxUsc8PJJgXoNmDwP2Thsv9hFl0UvI8+fR
         4kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281456; x=1792886256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pex06CPzZvFqO9bOYfRUEtlWF/y2fI6jKIVDllT5g/E=;
        b=l4R1pPUgIRWRw3+/6i8rhKl4xst/jMWknEA4DYt3y+qUEdIbCEQPPFyx1SjDrRbGa4
         6By+FZrxKuVlDhso1wPka5cTx9SIBGTDrzt8ONnVCLyfk9bf51BrnJc3FykX8PsHRue2
         PmLLPetLigXiPwr3zSyh5QezNLZ532/J2UfW+npIl7m7Hpi09iBqD3csSfXUKGJItIZb
         5qZKDJVd5dxoVeecPemEpVyoP5lFeuvnVOvULyesU4sfoc51j0CkGmuh4y9Ua186L8R9
         FhEZoBiR7VuJIQZKhWw7xw+r0gXIUedFIjeeTU8sNYR7fgr8gnwb4uTv3G4LakvCqs4Y
         oRjg==
X-Gm-Message-State: AFq9FYIEFArhk/84Z013XuaB6/iRZrEo3hhJwwYLc8rjxoSUi08/n/Gq
	8ca7K3ZHFL7YdX92dZMd52nt+78LKohZZ/M2ALdKDyrD3RhUYaCE1Wum
X-Gm-Gg: AYBFou2fgE6bmR33c2J4b74q+dBE0VSJ8UpyB1HhVVGq7VPqz6GM5sNwWlWGXeAhRWi
	qYP6Oe520u/lfHW08ng1rRsGeZkUEryKrz166by8EsQ/NS7hgPJ0vzfUU4N2cErNDXq5Kj4n/Em
	Kn/cZi2LmrDWtj5r+n5Wgbf95eEfHhbGYiuoMEj5TCXGhSQfjgrHoqM6CvxUnPBooo8xX/kpCUP
	GCmjzPrRiuQHw3u9cjQrDZdCvpYGQrTS+hnlQafHIni9y0PXA7FLX1ywxmXa125pkz/V4P3uuC+
	mRvN7JewvsBG+dKx5/s/dUd40nrFQ6PfsY9azoxy5cPl/16zw1m/iNUQMaLKy+LJk26ZVFwOCNs
	3YcqlnNsgzH1BrKssOKKOg32r5ccblvzyqrQ+hji92T87cjcBRvZ7DHFCdgs/nDxP9Ns2magfHx
	K8Ec8aBaTb76kKaAz3FYmHCcbAORxsNr+BbaAfMVqX+96FgE2MK30nvLaEaKHNEgMuCqTl4HtDX
	fAtOtjsVrEQEH/UNeD0hpCmRTGBfqS01nrj4alLp/y4dqDrnFR7eqwNAiv90HPR4JQS
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr80634935e9.20.1792281455606;
        Sat, 17 Oct 2026 16:57:35 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf05009csm139331075e9.10.2026.10.17.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:57:35 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	stable@vger.kernel.org,
	syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Subject: [PATCH] mtd: phram: fix name leak when phram_setup() fails
Date: Sun, 18 Oct 2026 00:57:33 +0100
Message-Id: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_165738_927001_89BA962F 
X-CRM114-Status: GOOD (  13.48  )
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

parse_err() is a macro that prints the message and then does "return 1".
phram_setup() still uses it after parse_name() has allocated the device
name, with a "goto error" right after each call. That goto is never
reached, so the kfree(name) under the error label never runs and the
name leaks every time one of these checks fails.

syzbot hit this by writing "p0,0x8000000000000000,0" to
/sys/module/phram/parameters/phram. The zero length fails the
erasesize/len check and the "p0" string is leaked.

Use pr_err() for these five messages so we really jump to the error
label and free the name. This also means the real error code goes back
to the caller instead of 1, which sysfs returned to userspace as if one
byte had been written.

Fixes: 49c64df88057 ("mtd: phram: fix a double free issue in error path")
Cc: stable@vger.kernel.org
Reported-by: syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/mtd/devices/phram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7aed57b31967 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -289,34 +289,34 @@ static int phram_setup(const char *val)
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
-		parse_err("illegal start address\n");
+		pr_err("illegal start address\n");
 		goto error;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
-		parse_err("illegal device length\n");
+		pr_err("illegal device length\n");
 		goto error;
 	}
 
 	if (token[3]) {
 		ret = parse_num64(&erasesize, token[3]);
 		if (ret) {
-			parse_err("illegal erasesize\n");
+			pr_err("illegal erasesize\n");
 			goto error;
 		}
 	}
 
 	if (len == 0 || erasesize == 0 || erasesize > len
 	    || erasesize > UINT_MAX) {
-		parse_err("illegal erasesize or len\n");
+		pr_err("illegal erasesize or len\n");
 		ret = -EINVAL;
 		goto error;
 	}
 
 	div_u64_rem(len, (uint32_t)erasesize, &rem);
 	if (rem) {
-		parse_err("len is not multiple of erasesize\n");
+		pr_err("len is not multiple of erasesize\n");
 		ret = -EINVAL;
 		goto error;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
