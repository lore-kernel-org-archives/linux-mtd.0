Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38090CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AuGuIrd3O7BGX/VF4ZmuMGTmEYcI+O08b9xnbyzNig=; b=ND9L86qX1I/EMr
	1Kkil11ZyYeWk85KnzE0R9EHgku7IMF1XooRv3lIMq2tdCaphFgqO3Rh7f07Uq+HuzUniLLkH+u3L
	6OLWkVE6BCeYGj1wTYZiPdaQi9CgZ1H8ng9lq6E/TyI0VxrHQspHDuf2E5iQSjq6TsxASufc1tZw4
	20/DY7KbEcbXVPvcsq9HckqSAYuIDF5l1iJCni4oZBi39g5cYVWsmg1Rr2AmUuwJEg0qI7ohiBRZr
	boek+hqqdu9LOuVTirWWovt26fEtZvwr+tetbaNQavZR2RNbFJynfzF5MmBXY4KQIHOG8WcH56unp
	abN1nLh2r3H/bG7aTEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYWI-00000000k9V-0gre;
	Mon, 09 Sep 2024 07:09:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVz-00000000jrm-2Bjd
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=; b=i9pb2jb85/bZMb28Sz6xjYCENL
	h8CChiBIgCtUWgt9bo9y6auKMbFNnJstjW58zC8s/Kca4TC9N1Xhkhgj0n/nrI2f+uiBpGObpF6I2
	nRxsPlOehxH9tOHPl29tFm6wAIHd9hoAOXgooUG6h6RBVNoF9xRPFbHU8A0YyDPK4leZKrPZFhJtj
	cbm+bIfJrD2vWpbwZLt94hkj23+dwiEmCEVxmy+CQO8tSbJaI5BJIuTFIz97QG0FweVrVYhaX4lyL
	PVZx/YqEgqh9hv27iqM7gxejy3N6nJ65B4ijqJQ14cjCFi4xYGmLzMYlBhWCy+kCBSmy6mr/uJdVN
	dXAZE4dA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVt-00000000Ke6-3nQk
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so2573752f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865719; x=1726470519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
        b=GbCNs8IwZqVdznP1l5Bw3iBx4Lm4BV3t0SHgMW8ZPuoYQBOMwcjN3tx9bZNuIUSXpm
         4zDAFJ+FgtG9phUrdJvVI3+SdE/FBWtiTuwejRrpNQ+NHVnEHlRpBNV2ti7y6Ez7nVLF
         LkUVMg1Txfcmy9SRwMRrXJB46ps9TVHGAMn1z8Uhc/9aNdBCRXC5rLU5ZNZJtwFZQblo
         XKUDa+e7ABFKFjyMQp9ADfQPYOJoecYqjZ6oTj1c+XxNwvb2BIoYcc73J/yWjh5KYaOH
         DVALOPTAymJL4ck5OLLUNZFtFTkJhX4mmk/5Q/8MF8HDnYZdL7cjKpuPk6Q8ah34fTfS
         SzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865719; x=1726470519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaLYxtWkb9UDRswjf7QQ6H+2Ezg3Jw4reUgYCP+x518=;
        b=nwJKqe4ZQDv9KPHblt6Oyh498XUXWyq4QGR/mju22xA0CXc8oM+rFG/k4SbWD3EdAW
         RQ5jSOBRH8iOYq9M5vvwk5gZigfQMqTxAOUH04nkbtNcZv42MZXW842K2/526V397vC8
         C/987cMP9c0ZUgdQrjGP84js0HUI6KeP/2Z7jcK4jo22FoTQNZOKwc59lEaP4fdmCKPh
         gogtxW9VqlGv5V5UpInYWbDbV3SUYKGrpNaUzcIT9Pn4gPVa0H8W+pVvH2fWfcnpd8wr
         80TFlKu7FFK8bRU6NRZ8cja/aDgw+mSIbbz2tmozvC5lKlHmxwlIwbbSYvO/X0T/1n5D
         6Frg==
X-Forwarded-Encrypted: i=1; AJvYcCWXU9P4gMx7pHvSiVP4QtFcHOtdAyaooxeKj5SKCSwU0IcNLPfszkFavQwbVpaPp11YZJ4/+i6Mn+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHPznrlJrzQJHMVDZuEJQEqO1za2MJCZmUBVfy9wvSG+iq5KpM
	8rVAgzdcoKPaaSjdlmWHcXAIKj0IYVYiCd6g2u03hG7fKbizQ1Cd
X-Google-Smtp-Source: AGHT+IEQLNSW+PIzTLcAW22XrPAIo5gWgIG/codxPwAybXuXAtbQozQUICUfaqd7uB8QyM9Iess0AA==
X-Received: by 2002:a5d:46ca:0:b0:377:9867:9028 with SMTP id ffacd0b85a97d-3788967aaffmr6190593f8f.44.1725865718527;
        Mon, 09 Sep 2024 00:08:38 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:38 -0700 (PDT)
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
Subject: [PATCH v2 14/19] bpf/tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:28 +0200
Message-ID: <20240909070742.75425-15-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080841_977282_0B8837D4 
X-CRM114-Status: GOOD (  12.11  )
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
