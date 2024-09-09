Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658F9CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2vJNS8st8YTadAwJcTnGaY05xe0gxJtF+ugXpwQ/XU=; b=Kth5VV1TyLOdbo
	6pbsuPuTu0jWpLBNapNALBLQey0PIi4sZFiemAj5hNsWlhgr15ZHfvlEZQyDHRpLE/DGRy3/1kyR7
	8VXR5a2ud2cppl+w410Bf4bDJECjWdHzL53kpVNRgr84yN2FNXYV0Wg/RGKNarJLzBxUVxd3eGsZf
	XNm6QLzH4dCEKZ0PIOaZvQLQIyuE0JepyEBwAgYra56NxDIo2ARx8eHJXo6s1mxYcm+5H24TpuAL5
	PT82F8hegNQ5Mix4JGoM6YWBVckBYsmkNtkJB2eqKXGZEVVCZk460Vn+lPr9x3uA/wFflOtC7ITo4
	HsNobTlFiFzQwmNh1oQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYWU-00000000kKN-3d4Q;
	Mon, 09 Sep 2024 07:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYW5-00000000jwn-3R3M
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=; b=UBCRhecaf2DLOuNoG5UCjDSp95
	Oblia/wZehk7o1skrFZQRYbGVg+2m8UNcmndoTKSCbGEflMqhsdKMAN8HxGJNZ/Hf8HQRIluKrchx
	WNFE0XaJ9S4a4hP+Fo86QisnVT8UumgJNfILF3WpZYKrj2N3Y+FJluq1dqrJlswwWb6sJz7zbTzzx
	iAcX4rG7gLN1CXS8roBcqMM2qlm8JjeR1i3vsSRb1xr0PGwlHckQ25zXuicCZftAGQSjWqXYa915u
	a287q7DDvwwAhszoqFMdsT5lTBHd+4FN2J8Rm+i8ixYmpLZvovSd7bxm3ox+uCWI93F6rTHzCNAze
	a0SSJW1w==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVz-00000000Kkc-0UEN
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-371ba7e46easo2611794f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865726; x=1726470526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
        b=jy38x2EQY9kecUCGA/9k/pqPWPluZk4u5ojIJKdSy+x+nMqW+Z22Wk0Y8jWOYBggwH
         XGr7vS8CueJnx7tJNRC61QPFXJjS3ObCF0zHwLXUqHPv9Vgi3U2aJaz+wQUEieISlFEL
         SdaUb3UegFrraKJ2oCLUoixQqdb4Y0lJqMvcSmNMPMSUxtMSoLzkFpkmyJ05pksqyy4f
         xH0uuBBII7+8ji/LbdyY2iKpcwRL1N0itJa0Z10F1Dl38vZENGDORu31UP/FUDES+E+Q
         vJYF1/USLgQikpRnuyaof7ae+x0ZKK8exr6son1R70uiZnY4/3ncz4JKtXYasIvoJLP3
         WWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865726; x=1726470526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
        b=lErMS84IxES/U03+TBtaZsOyD6zriYU7+wSCuBTOV3Ud3WYqwAu49Zjbmf52J16V/V
         a9dM/UaKm+40f3CFjPzYl/xY1TrPaWoK97QPh7j4gC8C5OwFietCovWdVc/an6A+Hss3
         nAM/QB4PfnQpFJR0o5FLcCwootvh8aqzk+enWCgnUORGbW0mvmKb81lZhj4VNuOnIfN4
         IlFHSZvaVc84vAdVEiUK21lvh0p/fD2UclYXVMz+42TAx39HVo8Hl+tdAazfR3Z3bfIm
         m67QdUx5q0toJPeFiUc3fnTEsF83iOTt8c8rmc59eCmw5o7CaxxfPqWMzPs5P2ykVMWl
         G4EA==
X-Forwarded-Encrypted: i=1; AJvYcCWxLDunwmn5gmsGIEZPTH57Sn3OK63+75u46lLQueIP3O1VXOoomDc28wuKSEDR4hbI4Jvs3di5Rls=@lists.infradead.org
X-Gm-Message-State: AOJu0YyC4QbmFJt67SZKCncsWKK49exdtAZDGKK9rAkjQT/xHxVIRT81
	86tOFy8dMJKTcz4bBpzd+u7wVTIVE02ei4XMDZ9RWaK1TEWpXzQpD+Yke5CHmPo=
X-Google-Smtp-Source: AGHT+IH7d2LCOjCEmuJ4w2L75gV8H1NZjK585Hq//GX1VCkES/VJ6SkCqMbky8lLj0QZa/YVXZoH6g==
X-Received: by 2002:a05:6000:e51:b0:371:8f19:bff0 with SMTP id ffacd0b85a97d-378895cc423mr6510141f8f.20.1725865725676;
        Mon, 09 Sep 2024 00:08:45 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:45 -0700 (PDT)
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
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH v2 19/19] prandom: Include <linux/percpu.h> in <linux/prandom.h>
Date: Mon,  9 Sep 2024 09:05:33 +0200
Message-ID: <20240909070742.75425-20-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080847_202345_A8F1FC24 
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

<linux/percpu.h> include was removed from <linux/prandom.h>
in d9f29deb7fe8 ("prandom: Remove unused include") because
this inclusion broke arm64 due to a circular dependency
on include files.

__percpu tag is defined in include/linux/compiler_types.h, so there
is currently no direct need for the inclusion of <linux/percpu.h>.
However, in [1] we would like to repurpose __percpu tag as a named
address space qualifier, where __percpu macro uses defines from
<linux/percpu.h>.

The circular dependency was removed in xxxxxxxxxxxx ("random: Do not
include <linux/prandom.h> in <linux/random.h>") and it cleared
the path for the inclusion of <linux/percpu.h> in <linux/prandom.h>.

This patch is basically a revert of d9f29deb7fe8
("prandom: Remove unused include").

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/prandom.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index f7f1e5251c67..f2ed5b72b3d6 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/once.h>
+#include <linux/percpu.h>
 #include <linux/random.h>
 
 struct rnd_state {
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
