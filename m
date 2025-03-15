Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713F9C35FF1
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAckkvzbCcR5ldEsP7lJmHuGyxQYrRgcFxmXgcllGX4=; b=isnSPe3uZ2HL/V
	JpD7xqpqMQupCIx2rqCmt7sE1D3TEtX73GjuoJPcCUlF2D8Y55vnUfNMRmITnPDW+GX5v6jynRukw
	wbbg+euWLcFTUfxEDaFL++XAuPdmNpnfCy68EehMD/cHDK8GMJ0kwcRigvIa/W0NPvqwvH+V5tM/P
	I27oETHHXvokzcHRdGjqgAdmB+nXFwwwbG/7pLXaDGHHi2VFXZV2m/fnqcYSK8J7JbgiioPcdr3d7
	WCmrN4Pw4T4+8IaAZHHGcN7HpmAoAvTDCPu2dbB9V59kTKhmrAwavb3LTm63mALSzGdqduSMBxGwt
	rsXsrvp03FEWGIADrNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOnt-0000000GDDZ-2xRW;
	Sat, 15 Mar 2025 10:31:41 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOml-0000000GCxe-2fod
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ayt9c9VcjdzGiGYnOCGmRVfzRz7oGOaoohPPJPGpvn4=; b=QkrRlbZ8QyuE5/CeNrCop+ohMu
	tPZEVciX5Qfm8Fq+DkbhrRTkiv+VrMN6hBqxvWoTrjhCRHl29Y8NAcgmhGqsxz3rWA+YK/7COuBt9
	fCHdrNJ92ezMTuVviacr76sDOeg86huI43qiogTuzq9KqH2GohDSOm0nYpDGwvF2Hj008M5AtYY3s
	+JrcpLsLiNr4HiunkdvuPX9kha7bNh914kIwi5bpvLvvWLDEgTqAS0Cszh0XV14XDFIcaEDhXWYSo
	2kOgsI75/zTP1/zYIuFCjPoVTKhrib3YT358anlEyQyG+hCc8DgYr1UQjIAUCV0qjN0dUA6ikx2pr
	K3bY48sw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOmZ-006p8x-3B;
	Sat, 15 Mar 2025 18:30:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:19 +0800
Date: Sat, 15 Mar 2025 18:30:19 +0800
Message-Id: <5360493c41a4ebc12ba2a8a0908cde53117a06fb.1742034499.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1742034499.git.herbert@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 01/14] xfrm: ipcomp: Call pskb_may_pull in ipcomp_input
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033031_671522_CB2F041D 
X-CRM114-Status: UNSURE (   9.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If a malformed packet is received there may not be enough data
to pull.  This isn't a problem in practice because the caller
has already done xfrm_parse_spi which in effect does the same
thing.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Acked-by: Steffen Klassert <steffen.klassert@secunet.com>
---
 net/xfrm/xfrm_ipcomp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
index 9c0fa0e1786a..43eae94e4b0e 100644
--- a/net/xfrm/xfrm_ipcomp.c
+++ b/net/xfrm/xfrm_ipcomp.c
@@ -97,6 +97,9 @@ int ipcomp_input(struct xfrm_state *x, struct sk_buff *skb)
 	int err = -ENOMEM;
 	struct ip_comp_hdr *ipch;
 
+	if (!pskb_may_pull(skb, sizeof(*ipch)))
+		return -EINVAL;
+
 	if (skb_linearize_cow(skb))
 		goto out;
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
