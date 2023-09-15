Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B6CD37A7
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SoWv8za3oTEf2lrYv4AD3jG0yTgACgX7FZuG8zkn5wU=; b=alybFyZ9JFzuzJ
	rhx/HQebFGJBlzVxN4a6nwmA3kEPyZ6D6AQrIcjm3P220fzwDN8o2iT0wC83Q8LVpqPujxq4KW6Ec
	IK3Op1l0IK1BdaT+08Gw+kj9J9UzuFjEJhg5GJDFzx26sGsUvZQMFZoRVMPENUkkRrwGTl2K2wYNl
	M071ghSq5t1BRDHm8Qim/9NuSCdvMGUirrsnhEiA0fMO6QDcsfcOFzcTHUXYafWmQjCw805YCIVCl
	Kgxm6GAbMyT3ns22dL2itxgdVSFIrIcbSDDoTmbl8Rfxc0kWQcrbnn0opz/NHOAyeFLo8gych22wV
	rmhfuyoj38/XtkK5enLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBC-00BIlN-0p;
	Fri, 15 Sep 2023 20:12:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFB8-00BIjw-36
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68fc9a4ebe9so2317605b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808757; x=1695413557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrBmIK/7ZBFkfIJ+GoT9lofYoxjkLNz9RY+nH/vRJ5g=;
        b=chBpK19i1E+t8PWLWHqSV1zB7O7/cKwLgFn02gHUvuS4CP6zO6s4bsgDAOnMTnhe0R
         h31aJ3HrFyluRFr5UK5f2yVYPRPUrM/3taVzVz6s2cdqclZ6WcKY0IgJCgmnkvg4S8Am
         6xm+MbyNpHQKM13QpD0DOIbI9hbfyAgB064QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808757; x=1695413557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrBmIK/7ZBFkfIJ+GoT9lofYoxjkLNz9RY+nH/vRJ5g=;
        b=nlbhf9xQkaE/ckjTyRXAAcKDaR+vjllOYznCUigTp4xf9kVF29KfgodNowJ2O8dkr1
         pbwd7hGiHdn7QuevcO7Lz5aG3VuyfiX40QcfhSMDBjWsyyz3WL+WlMUyYp5is+PqhMl5
         Q7RxIvs1m3OzqGNuAHe9PrsJmNaG9XOb1yjLK29iIIxTTsFnd8YWS2+7L386sTts+pzm
         9qVPVd9V7YYfS4PI4Wb75RGA8yNeSZhN7CJIJ7rl81R8gPUGqS2hQcbJ5sDO7C96/K6M
         NIV4OIhwdXAgoHJ84vngPdkhI37i1ElgEduk8OBU7hm1D1yzRYq9U1ovj5Xj20fujpk3
         Icow==
X-Gm-Message-State: AOJu0Yxh2oR+jCWsz+J1C8ii1JGAhWKEGoQ1edfG+294B4BtHINhXNmt
	jIOY1AyP8wdR+0GKh1ivRDx6F4CBeK8Bnjs277o=
X-Google-Smtp-Source: AGHT+IHaSepHftYvn6j1J/8NjB2sQp1S0SXdFatkZesmqR96Dm0a8qXQYyp/030E766wL+sQ438gNQ==
X-Received: by 2002:a05:6a00:1490:b0:690:454a:dc7b with SMTP id v16-20020a056a00149000b00690454adc7bmr3035526pfu.28.1694808757000;
        Fri, 15 Sep 2023 13:12:37 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k192-20020a636fc9000000b0055bf13811f5sm2994033pgc.15.2023.09.15.13.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Kees Cook <keescook@chromium.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: ingenic: Annotate struct ingenic_nfc with __counted_by
Date: Fri, 15 Sep 2023 13:12:35 -0700
Message-Id: <20230915201234.never.868-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=keescook@chromium.org;
 h=from:subject:message-id; bh=u7N1dQwnfrzLeR4rYuLcrvgfoIzHpMlv8osLJuSY2+Y=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqzjowlIzJmYXlgsM3m8LT0SCSdfQTsxoB/i
 acbRSZ+5eeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6swAKCRCJcvTf3G3A
 JsI5EACJLga/jCgx7S0K+M8EI9/HpJJsQ4twNYBlge15BlTjzWL6+s3zgE5f7UOcVRpkq67GHb+
 FeToD49bp07c9OF4Y2xbpjHB/lYhHing/bv51pliDDUlQLsWicGBOoaC2GT6lwt4fwpqSDtOa9A
 TA8a1qAJT9wj2WwiEU0Zj8IG49xkuILQt2a6r/pd5AgQQa/FUwVr15kSK7RmRRBejWggW+3rhCa
 rSgdqJU36g/RBkZcBEQHdRUimIo0VAeZ9ksIsMsxNhv3mxG4m9PXWkwjhDvGrmx+oK7OKRoTu2k
 2b37q/dOck12rVK7Zp7OSOXKN09n1QsFSsw20fa4OPreJeAcpFZMJIJPaMZoNvIrcK6RFg0WJQ1
 pDaE7yH8U+FQPEIKFguHdPM1dKoDzLxtbmLgyIguyoTQr5el7bk3wxn8X53JOGpA24BQxsHR8nL
 WygbnLNvYhmDscT7wuWQ8ROnjn25sZUe5TZsLWij0dZdYprGIOy7I5CNhKmP0M3znYsHEJG4/Fh
 kk175ctq9KqoZmyeJFNBddnk+nbM0Cve21DvPxLyd2Al1nEp8yF9gZzqm6fHeT560E3Vg88ih4b
 YvODs23KDa5lanCSm99HJ7GXcQAXIj3w2WYkXFMQXl7bUZ+xamamKcWJeD14/oVwjqAkI2rGARw
 G1gmn7q 2KMQ5WVQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131239_000510_A8A84ACE 
X-CRM114-Status: GOOD (  12.81  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ingenic_nfc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 6748226b8bd1..ce9ef4e65597 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -46,7 +46,7 @@ struct ingenic_nfc {
 	struct nand_controller controller;
 	unsigned int num_banks;
 	struct list_head chips;
-	struct ingenic_nand_cs cs[];
+	struct ingenic_nand_cs cs[] __counted_by(num_banks);
 };
 
 struct ingenic_nand {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
