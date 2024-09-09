Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED22E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AuGuIrd3O7BGX/VF4ZmuMGTmEYcI+O08b9xnbyzNig=; b=4COTgaeXyQZfw9
	eLnfZmvf5li+IPorH2Y+2NuKMxiP5hVtdEPWK6YoNZUSUWbT4O6KOu/iB+BKVq4vqymO+BOmrW1c/
	QcJeBcMTTBp3e6HFwvG9CmIZ2SFwaEsQScQdgd5mVNR/7Gr/RwOsZjNmpMmwpMbVuF0j6Pvo6u2cH
	wMQYLs9kcf/H61pNaAg89zA53cm6n7MA+nGuDkshaFwNaskyqrUvShY5A/ZB3RDpjCQuhIgL3kO+U
	1iUNd6ptQLFXFfmyxT4ZrD4mI7+hMHGc78qtrtnyoUPTO/aurNgOoBmxKNmUE8FT+ngdjnzVt78Cd
	4+Q9kD86atNz1cJksIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHI-00000000wlD-2h81;
	Mon, 09 Sep 2024 07:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGs-00000000wMN-2rFW
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=; b=JT8GLODw+gUSfJK/dD/fOyLu6c
	g+3eDXRQ22j4ODohwzGJP7hMIFHBKa03Dtsnufis4XG598joNEFOQr+fLHMj55TO0n9PtOnv8MojO
	6ocvgErKG3JbqMa4nO/EilI9fvOxABCL8x3r+jZGfj5Rg1TZE/JsNBk+uCMz2emnYg6fsWg61FNbF
	wS4dNJ98nQNJpATdUkI0SLRtuurWogXLJ+XxvZcxSLRounkxQAIp0LjooWmEfGtHdZML7xwAPZfQv
	Vfuz6yXA+QAjFJV2nkiTqxwwjsRVbXmKMS5L6q/3jfSflH9Wf40/8MnIrOIuXD0AsNx6ew6kfxtY4
	IdLcJ/fg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGp-00000000LUi-1g7i
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so4666125e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868629; x=1726473429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
        b=HfwFO1GAjtAcnC8gPkJ/O+r8hMOiVUxDtTSq1/iKZ1HBtPQh0EhgmyqMGGb+RWjWw9
         Gx7snVhid+ngw7H+QRGNFY5E2zduhyjTfALqUJG8goulyMUwfpnCPui9adBu2oxemVOO
         eJBJyOIu8UUuDNamaXSYWE6ZYQLW+Yh8JfZIX+vxl0h6qijMQcSwngEvTvXV5k0wymXZ
         dh6C9GGnes9qqY1T4OF5+lQlZNfcDmH9Yn3CN9HNQoqNkIzPNzcU25BB+ehlf8DMNYOv
         g6jWLZeRcdoDq/CX3pD2NNe287sF2oMwm1tWjm9SRq4jOeaf4BDXpIdofEV+5U3tn24p
         LgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868629; x=1726473429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
        b=QidT+4eqJ/ronFh313fx8ZN614/rx9JsOZRCX3izN0JUWXrVLBw8VNWfZT5NMpAPti
         VxkuX4m/WYL2OzWfz6CPwsmOBTGb2gm09znngy9M4c488Aam7iDRGPqMxJlawbzhteXH
         0AZMNBLyyaNaffEdJx2vHyWACiVLJPOSSYC3gJKDgRniFcYOGarEOOGBIB2jk5ixFB7A
         yb5Z5W+8QjZtwBZXx11xckL6AtKJ84MVQUP9jAyH6/iCkcTXdph/K7moOgW9SDLeqLCL
         DEPztyZnJdZeS5FjTj+X2BN4zV5cUdKtGuR9aRYcpZaLmU7tTcIZyANCJUn4i3fw04zi
         rtFw==
X-Forwarded-Encrypted: i=1; AJvYcCVBFMTuXtSz9JM6ewgB+HsGaRaEvJBmfs+DXWGn3fMtmRFtwhWGad5QHkOo3j+f+8JUOoUZvxZzTQM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZkqAMo7/BbBoIinxWBc1ujj7Ik5h/87Ow/bPNMhacIIkF0gT0
	xWmIPn8X76xGC7zj1lqCGihLHp97UMs4P/gCWaERnKnJ8a6fZyF3
X-Google-Smtp-Source: AGHT+IETjLR+Br4j1eN9qUmeGiXMn0hxIOR/FMqY6EotNIPlACrNl22bd9oFTjuVkMYBJaH0OQXWXQ==
X-Received: by 2002:a05:6000:136e:b0:374:c911:7749 with SMTP id ffacd0b85a97d-3788967950bmr5536942f8f.49.1725868628808;
        Mon, 09 Sep 2024 00:57:08 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:08 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH RESEND v2 14/19] bpf/tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:57 +0200
Message-ID: <20240909075641.258968-15-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085711_512236_CEA253E7 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
---
 lib/test_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index ca4b0eea81a2..eb4a1915e4d2 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -14,7 +14,7 @@
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
 #include <linux/if_vlan.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/highmem.h>
 #include <linux/sched.h>
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
