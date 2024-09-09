Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51248E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UqjpPr9wGgiuSnaZY+Kim99mLnGxibgsg3S4LmtBPQ=; b=T2/b6iuZTH9TpZ
	zbTqZ29dNXpQPYHwJatpcNrAgJhMEvZZN9hYSr6DMcz14pZlTTZ2xSd3tn1OXnDCzCWndUQgq3nJc
	vw8gLh/PxiihWmgmHv+P/4qiJM4RJeTGeMUXnl6npa0DbQOuH9tkob3JxLnd3DSz/dtULJxtddLFM
	+vRjs95L7L6H9Mc13oPbxPWQ4CdsdRJUIepioRbEP2i3bR1kkKmNd+0T0zf5JVXVdicd3VIJzO+tx
	qCyDvENUiHHAVPTXGBNDeg+IQ8zUcJhGPpwLMbCvUKNyo3bavgvPybAWeFc79zMtT5Sxla4FJAsoW
	sPf3fE+XdWjY8y8A7tdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHV-00000000wvu-35oT;
	Mon, 09 Sep 2024 07:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGx-00000000wQY-0Fku
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=; b=F1k/cu5gH0TQ460BPau5klITxJ
	lkt66pYeDUYEtYhioktENwrODPRzZAc+0SzUB1yPremurCn1pYruKI9McUvYbaZNecoM+8Bpqa9Zi
	iIXC6sYPQCL2xH8VYd/h4a6VTj4BoLAV1Unqw38mssUtLoomduwub7UfxOlMUSNdntb8+ZYkHPkzi
	Kuv6UfGmMjngNTmd/KL4l1TtNSJfqqAo2BQcSTocFrLnPg4teF4jFA2sL2I9AEGlgKznVfoEbiu6A
	OrridB4ivzAAxHv+aKaRSvfRGuTDY5aiVQc/ahBfOwNpKTD2lOzcZbvAXqvdpvaa73NMsqsSoIxRl
	3pCNNUqw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGt-00000000LWb-3v4I
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-374bd0da617so2459031f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868633; x=1726473433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
        b=N2pptkRNbE1Dkc79UarzaU5uzs8LWa+zTmt9o34LohHDXvXAzDlgkroHoxbNOVXhq+
         QniAu9MLx1FEQfKzIOLbqxl2B+uYvHPuFgtIDgDRetY+w8Se1rtIqis9Wu13NI5uvL8b
         fNa8QMEzVUkElB+YS3cZN0EqUEbxovRaikpm3Jq90yvXdU7au3JF9famNZifUbDUJoh8
         9CcNeRa6hCkMbCPT4XRDSw5CX3deQUSVprkhsu3NI29wWIsG6lMsTkJUgTWJ3Iw5Izhn
         CG3LobyA4FUnVGOH+j0WcGKtKSHwbfDOs4SofYJVPNBaZuQyfpTDKo62DREfxGFtwif+
         cHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868633; x=1726473433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
        b=fCE2nQH82Hpin0BFmX2nKw5ZgZ65IPsPlR31OvIy0v8ljOQG2xAETKRUIEQCUMEhX1
         Q+RnoCVPYUHdf8IeiOr/4eBhbqyTcybMxozpRnr69UGG846+QEXAc6WoStC3ab+Tsnm0
         6REulx3kky71M3aRLg9gqPldMdoG1cyAdb/Rc0Cl8U4Ke4/pOl1U3BcbIoNzmxAWVDR0
         x1nCkfxpxJ3lfqVNqSZi01dvAs7SI12gxEdv4NSlR1GoB3cW/xzo6XZQIurg19BaVL/q
         Ue5olzj+PfyFRR4RcKJWa/z3UBIlf6Leb5RKxQrRv9NpQmud+aLWWiQ7El+NBWeG2PPa
         MxpA==
X-Forwarded-Encrypted: i=1; AJvYcCUGBfLFlPCo05nASPnA5ptaHEXLlUxlVKJYGVLotgInQupRDKufc7gKV2zvYrM6BIMmAnJGLrGSZoM=@lists.infradead.org
X-Gm-Message-State: AOJu0YycHI5oBmhiAjVb1A4WF016G3qM/HCPTbHSGQtUnGPWLSCk1UEa
	tN5JLIEoSQP8FWLXiXzDSc4BRmQHjMck5hEDgfC77rk9Skt+PN/W
X-Google-Smtp-Source: AGHT+IFm2UQfjMo+cDUf0j3lnU/Cm4mT7+HmOHGv2OWxiL1EKdqFzUE8umAkuhmwVoyX5BX+6CelaQ==
X-Received: by 2002:a5d:6184:0:b0:368:64e:a7dd with SMTP id ffacd0b85a97d-378896a5c88mr6503932f8f.53.1725868633211;
        Mon, 09 Sep 2024 00:57:13 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:12 -0700 (PDT)
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
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RESEND v2 17/19] netem: Include <linux/prandom.h> in sch_netem.c
Date: Mon,  9 Sep 2024 09:54:00 +0200
Message-ID: <20240909075641.258968-18-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085716_007887_593CE3A6 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Include <linux/prandom.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/sched/sch_netem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 0f8d581438c3..2d919f590772 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -17,6 +17,7 @@
 #include <linux/errno.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
+#include <linux/prandom.h>
 #include <linux/rtnetlink.h>
 #include <linux/reciprocal_div.h>
 #include <linux/rbtree.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
