Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E20C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 20:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qCxUt6DsDBh6r7sbt3oOnX5V2rt2OKBcTb8c6RroBtg=; b=vXJbPB06v23X0Q
	YyNu1ouQVzZ1nsUzTXObpTeugEeoHeIrBYah4Z2tiqdmjYWTFsXlEXFIbq54uVDo6x94c7X64S6Jg
	Acc5p9BwvTtczZz+UJM9KabYwgAbSnG2/cBNaxMK9dwD2cJINEMXvVrtMKWa0zgnXgsdAqZ7gAeAT
	DMmVd3JWbIkoocvVSKoRlPuWtcmKvpPzzo4z13KEVVhfQlSiEQRmlEVF++Btm/rg85zCZdqlrOp36
	fqQeUon53SgbT/a4u/zljMRUw8xQWYo6oaVXPR9/bTz0cRKod/V+irg4h4GBmvlddHwJV0PmOexg9
	UMZDS8tLlxa/Ns3tLlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NjF-00As1r-PA; Thu, 08 Dec 2022 20:42:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NVm-00Ai9y-4L
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 20:28:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id qk9so6755323ejc.3
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 12:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3XAlWDTwUy+qPERwsjX/N6IA9+HXDNBP1lE9yvcMsw=;
        b=RZmfjQenTaKPwkX673GVZVHPwq+AtNve08oJLxpuW2Uy1RNGLRDbRDFPZJdaPgUYrd
         lAAYPa5RYWLR0A3ngRAICrfd10N8oi2MOLL4JmxBQlzgGlYZi3UJwAXztM+NJq6+XDUu
         3HM8aJ4wskTcSUVIA5cO2sR3SlJ+kGl9YQfQo6T87Up6dKDfdUxKe/P1VEddFyqayA8m
         IXXOI6SGmMVWYNKiC/Ah6goMwRmzEWLTg4vCdFBYiNx7gt4WMogJpK6TTwZhXXzhexCH
         KCHPDLpZwdKMXEUTLZmNr1u0IPX3+lk9N2KBNWTgQWNpx6Kp6FH9Ro27JR9a/SxPQrGd
         +mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3XAlWDTwUy+qPERwsjX/N6IA9+HXDNBP1lE9yvcMsw=;
        b=BagoctK4ZqRa+WKWYAXBqV+hzO89Cygp2em2c+lSgOpWC+45FDfrx8Vc76WJdAWE0x
         8hSsIkbDFhQqY3sNvdGP7y3390CmH+FYP3PGl1KQmyz6HYX29cfGjid8t3OETQMVn4WP
         LOYk/TsTcqHeV2ZGgEsjCV3sicEh2pf1lePSeF3exY1z+fGNmdBDzkQ5QlTDWxdwyyQ1
         6VpAH8uBWRKLQllHp+nlUI6mEkYihMxFy/+a6C7yWjZOr524nm7Opc7x1TN4leURzvD6
         ZD3f5f1fY8g7M1W5hkd7kUMlE7V+lWL0I+Tl28fZS79KCmAtjg00WFFy4E+y583bpOQR
         eNnw==
X-Gm-Message-State: ANoB5pneJdhFYN3CupsxsQw/BSqTLqJGtPC/O/CUOXUMfJk+HNCyZK50
	Ay6aqaAjZtFKVAdZbuzSHeQ=
X-Google-Smtp-Source: AA0mqf4fbW7udj0MMSsIORZ6NVRqkAFwYdeNjP4TlyfgNvUqOSLVTKP7XXw42rkomFIPB5wyMEMGMw==
X-Received: by 2002:a17:906:3917:b0:7bf:1081:9472 with SMTP id f23-20020a170906391700b007bf10819472mr2614605eje.69.1670531332474;
        Thu, 08 Dec 2022 12:28:52 -0800 (PST)
Received: from [172.22.204.227] (ppp85-140-58-71.pppoe.mtu-net.ru. [85.140.58.71])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709063e0500b007ae32daf4b9sm8868052eji.106.2022.12.08.12.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 12:28:52 -0800 (PST)
Message-ID: <805fe58e-690f-6a3f-5ebf-2f6f6e6e4599@gmail.com>
Date: Thu, 8 Dec 2022 23:28:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH v2] mtd: parsers: scpart: fix __udivdi3 undefined on mips
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_122854_245087_FB28C09A 
X-CRM114-Status: GOOD (  11.41  )
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

This fixes the following compile error on mips architecture with clang
version 16.0.0 reported by the 0-DAY CI Kernel Test Service:
   ld.lld: error: undefined symbol: __udivdi3
   referenced by scpart.c
   mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a

As a workaround this makes 'offs' a 32-bit type. This is enough, because
the mtd containing partition table practically does not exceed 1 MB. We
can revert this when the [Link] has been resolved.

Link: https://github.com/ClangBuiltLinux/linux/issues/1635
Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---
 drivers/mtd/parsers/scpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index 02601bb33de4..6e5e11c37078 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -50,7 +50,7 @@ static int scpart_scan_partmap(struct mtd_info *master, loff_t partmap_offs,
 	int cnt = 0;
 	int res = 0;
 	int res2;
-	loff_t offs;
+	uint32_t offs;
 	size_t retlen;
 	struct sc_part_desc *pdesc = NULL;
 	struct sc_part_desc *tmpdesc;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
