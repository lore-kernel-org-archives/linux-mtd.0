Return-Path: <SRS0=cpaL=4C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C7EC3B1A1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2020 17:11:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96CD20659
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2020 17:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JxHcjExY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="O0QPNcYM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96CD20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8WP6SpSDb81chYyWhTfLBy6yyIyZ1x6Il5Qc+UApO8=; b=JxHcjExYHnyiqe
	o83K+tBRv59Xx86JgeNqqcHHXujnmHi+MlKpZ5c2ZUZbkKV3kFO1p+qYmlLmvLzILJUykbcKgM4cA
	DZ6FCZ68rozi7hnuZD+DaL5LCiI+IOmAyD2VXeMKXvjEuskXqsCFphOWgXPNVPx1kjsfZexv7Bnxa
	sjm0dhas6z2dseG0gIeSJc87aPT3N/JXLW1rJ62YBkfaYKEzkUISdq4U5DA8hnSNw32IXPmlvkcvI
	/CaXt+3vPI3J0S4BeWCFl+A2CRPbwSYSDpqcqdcOAQcQZ8SmiKvtAbFDdLKSebdIw6xtZ14rVlET7
	5mZVbrDxUOVVsvKjeSOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2eUW-0000F1-1V; Fri, 14 Feb 2020 17:11:00 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2eUG-0008ST-3x
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2020 17:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1581700221;
 bh=CB/jvaWBo96vvElchO6vbMU7pp5SiakOX2WgI/elrxk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=O0QPNcYMf9/jcYQiUS409ypfz/BZ+HF0rILIl+sIkBkCfminnZtP7Hn40wYthVPRX
 d63D93syYuoWotMpUTtHopYEbBLdveoFFyYPt5ivOapbJZADVjQ8XZViUoNKOdBeIn
 DCHuhHcFM0itwQeSAOlvU5+wtzkD1BQJuG06/OmA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.12]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1ikiDu22Lr-00IVH5; Fri, 14
 Feb 2020 18:10:21 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] docs: filesystems: link ubifs-authentication.rst
Date: Fri, 14 Feb 2020 18:08:06 +0100
Message-Id: <20200214170833.25803-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214170833.25803-1-j.neuschaefer@gmx.net>
References: <20200214170833.25803-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:d1I+0xGCOx6MEU/g2PFkawbvdBMkXnvhQ+wTl+mYXvNW3XQ9N2T
 ieKNrz4Uw0FUXq5zE+W2x6h/Y1BF9oJiL8cXw4Zxm5MCR+r91juS7OPfLGOV9wIm/0ue+L9
 uOVC148/lbb2CTSIqbOExKZgvQNtNKsmkGShJcSP/IGxR4FCLu+F9ZoqRaHmt1wSZWOZe/K
 pvc+JAfttZsxsFE0CeDNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hbJyRwaE8dU=:iz6hKUflA5q8GHIHUyAt8R
 DusWTtnjhdhTYEsuoQl7gMREyyS3I284UGK54dICTtMA16hD0av37Shw15NrVjigw10wbEKR5
 Sw5JKfImwlDk/F4Jz9iat3YKZwfsN/HW4AkTapSxlkA+jsy25FeLupoUwKZ2UjVGelFQKQjes
 GO7h/cFGji1nH91dbvjbJ1SAyDyodQHy3r9pqXFXF4AQG6sxXKmtEHVKb74qJzv1fRvJFvoT8
 trM6pU1eiCM/l4GFh+qu+B8TECWSshUnCrIMvR38EtxE6r8TuqfYFL3rlNGh9bay+spy144sF
 NsDzM4aLEB1oj6wExmH+0feZ/a/qMLbgtk4TYJY+21DEz0YhIypocvm0emB1/6oqfMaScgrbJ
 eMFN8zLanMjGZtDxLI4/i+z4ngwMRuyDVebiyAT5nmqI//L73VVxzXV2SRqdGP0wSLmjxt6NE
 giCI1ArkOy9RwQvT8zaEYCoiAzzSDnk55abyHIqEz/ekXW4uldC4MomZ5wLx3XvZWTJbfPajY
 TeMsmIwmnA3aJYUdIx78C5feBof1HG3OKRpym5X4ecCJ5TDeeDBM4np1ceO8MFPwyDSSmhfxX
 et4pEh0MehKvNRrcTTOeO90ER1ApjP3Twqawrjw5PX4l1Cs8oEH5oqtnFSkFOi5BMh47qt7NX
 oq0j9Mvxfqf7yBwGe6pq79bqf/jQTWlCmTCRBzF6CJpDCJo1NQt5aiXyQvrPcV9x3/VavNF1F
 8q2/4pIzdseTM2MROC4WzX18PXvK3yO8wS2ykIxgE52L3jtWOlbsbih52SmDdkJo+PMSrIFKN
 0foloOYtYHiblho49yKSdliMQBphu1KUUUA7EC0P3PnOq+7gruqBHsG1M7+p1eDEdoZ7BYFCr
 tMLCbUihroJ+0STQRlYeC51etmm9mBk+6ZKplBz7hCaUwMKBAi0GB88EkMCoWntY8thk191Wp
 Ai64T9TQKOFh1hb+TyGcWetfkuVFhTC3dp/BosR89HuVitbe0Jmf0jROA179+wAaq7g/ByX2N
 ItOwr5OI0D6p27ReuYRnylk4l936sU7idsoJZr16+CLOThjYKRFHpugpQzDd7N25wxYsczgOt
 I9C8/Tdqe264eE7ekaHsNxfaAHCT3t2LCqYsSdbrLrw6G2FjLzEpzhGODVmMK/yciGvM4/N2Z
 26OHOFOrVTz0I3syGlRxPUIHre/vSxyLNiwxaRI7VQNpXpcjTWv0k6C8X2Cj/fYAQOrRWnR87
 Lnl9F6oIge3C31nFP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_091044_448291_073666FC 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Eric Biggers <ebiggers@google.com>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Tobin C. Harding" <tobin@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KLS0tCiBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdCB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxl
c3lzdGVtcy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdApp
bmRleCAzODZlYWFkMDA4YjIuLmFjNTc0ZDUyMWYxMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9maWxlc3lzdGVtcy9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9p
bmRleC5yc3QKQEAgLTQ5LDUgKzQ5LDYgQEAgRG9jdW1lbnRhdGlvbiBmb3IgZmlsZXN5c3RlbSBp
bXBsZW1lbnRhdGlvbnMuCiAgICBhdXRvZnMKICAgIGZ1c2UKICAgIG92ZXJsYXlmcworICAgdWJp
ZnMtYXV0aGVudGljYXRpb24KICAgIHZpcnRpb2ZzCiAgICB2ZmF0Ci0tCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
