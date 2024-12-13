Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25811E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HpkoQxUASZzquYBP5lJMvL9gK/8nECnoesNoN1d8l24=; b=t1Uq2vcQkFf4Jy
	/R8wsXm23I7O5cS/zVpeKYWFGn354HtXS0Npx605ciLX4jgY0aZzGLW8yUyLIYSZKRppx/o3wGkJn
	Fo0sy7vyFpA+mSyYrByd6Pi7FAL+epy1jCPU37yMsB1mRChJF0op8lnKP6voJtEBeRm0hf8ynP67+
	oa0uWsnwkbaIEio97JcsyhtCwvqrmfCaiEgPJ5amdiH3mr4lSQPCTwzbhm+9YxFr4r1zjo8RsyvAV
	HzA4Hy/X/Q5u5pODU2PQxrxhGwttAAeP3KaDu3sKlzX+O7D+4tXi125GeIJZwmM5mSpZlYmyoGg2t
	woNNGwzNL6r8uuEiO94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6A1-00000003v2Q-10Ev;
	Fri, 13 Dec 2024 13:56:53 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM691-00000003uog-41l1
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 13:55:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30225b2586cso28889791fa.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 05:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734098150; x=1734702950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8vGezj+FvPsrsx1iP6I2a+9DheIuzKo3QurGTmsL4U=;
        b=QipJ4asj2TNcDl5lBdrT3Vmwir7Nf3Z9uH7skmS8XLNpBSqgNmryymk5DHekli7OHh
         C8qNZR0URfg24JiipAOFbCH7hFxVvn5Vzi0EHs+0iB7N2a9G4+AppR6SQMpkUDA0xogO
         h68XChlPSoK4s9YMlgtEDYbOtt8A+DZeOviLUBwrq7H3uVzp0+Cq70rdnpUAjzRSMyF1
         TvyYDzETgGQcxey+o0xcI1g3LLec28M+bNpNvwmB3FbQOsb/XvSIcdoWJDnsOEbkIoO0
         DnHQOuUt1Sdcq3ll1tw4P/zNEHaSM9MRLJ7Jz7NcmNW0EU+oLMUqO9Em4ZKpLCgeM1Kh
         /Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734098150; x=1734702950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8vGezj+FvPsrsx1iP6I2a+9DheIuzKo3QurGTmsL4U=;
        b=qGJExQMfMjoD2kPyNKZPCxVY1sEHu2F6CHua7ghEMYFL4akZY4VF0gXK4u/Tz8DYP+
         Cunf4CCrpkWI6DgKpCAFnNIJjUe7psJ+fL3blDOqzM+JzbTp/5Czc5bz7g/l2SNcIwFk
         3yXE5zSDCY/yvwpdD8GyuNx07F/9y3YyGhx+WtbouCBEqhi8jqPRpSgrxkscHgHpy7cC
         NFHR+rP0YKrbvU5adQL0VrOhdnDt4oOXsTo3tafWcuPVLjc4+B/fl5YNdhXBZVLjLKda
         uWfRMlcMItWxl6bofPcUOS1UKaYp0J8Z8DF/VNitt8vCpxWBc9UEAcyyHybLj1F6d0bJ
         3CaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm8xgYwRCd4A2U4hcwidQ6ElMhlZmre+S+DHAwy1K7A9d6zWrnQE++3fF0d9xMwPtN0QUwGRUVQ5k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTe//doWIoTgnKbTB1PNETyUV7NUjEgwj4PKaCrB34F0uM0gzD
	RWOZ9HbBvjOtDFIqhd6DB2Qw5tya7p3vmWexjVrU/kVoOnzaEuSY8KwcA52A3r1udQ==
X-Gm-Gg: ASbGncsHj0rmk51DPhiqxXr6VWC1nvbQZKpByqpUK1xAJePG9ePMtkIenhrnltYmAX+
	R8nQxDz3sQxLUUy/v1+NpQAXHIfsikC6HlTsszRZpf4ZjhEpVjM5VG33VVnZNO76/D1FX+iTg/C
	OoVA2BfSu+ATJtME2JaycR9UTMGlES2nCVsWRK5XpA5CWbpKuFP36oyhadXda1IZcroZg7A1sGw
	KYjRl0ttJ0fbA4/4nkTW8JjaQcD+8ICGyPMPwDlqvYnevNpNssKW0s+yQYJqhduR7wlERyWBs5D
	UMycIBg9VBx+6MCT8UCy/AvX+RvzOUl6tnbdNxw=
X-Google-Smtp-Source: AGHT+IFxkWq/Ey7SUGRPuWk9Xut+gavs0Ch8g/iUoblH/QE5SRs5pVsU9TInz/MIKQkac6vcguwBJw==
X-Received: by 2002:a05:6512:2344:b0:541:1c49:26c with SMTP id 2adb3069b0e04-5411c49030dmr756366e87.24.1734098149748;
        Fri, 13 Dec 2024 05:55:49 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53eaa3bd421sm2067789e87.97.2024.12.13.05.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 05:55:49 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] lib: Fix integer overflow in in libiniparser.c
Date: Fri, 13 Dec 2024 16:56:00 +0300
Message-Id: <20241213135600.109810-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_055551_994451_73854386 
X-CRM114-Status: GOOD (  10.74  )
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
