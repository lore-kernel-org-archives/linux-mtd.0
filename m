Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FE0C55179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E37F208C7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfG4QNdk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="giuuga+S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E37F208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KHSz2PK3vGFJPgsjMOPNHqJvWuPeLsJ6v8Rb7XTr38Q=; b=yfG4QNdkb1RqMD4KrFhjOWwc6u
	617Wbc0n9ErrMT2FGDhtVw+uztQk4mQy9VWZAcfBDcvJd3/1nC+Yan4yg1aRCdWLhMEuGTwIpWSun
	7VjQUOig+OemYRBJdexdP7NBx1TzfKQ22W9RZPw0zuXiAGQkjE5RHumdy5B1V5l1tbzqfNbIs7xwf
	VCjyKQsVB1YjR07jyuTTzrIlt5V5CmzJtN7u3+6+wEdWR5Le7CtWOCkbby9KS7GgGrY4rp8CxJN/K
	AVrGIH3BEpGXovliMRVMRoQR7yVIqmgPbFmO+03XVm9vXX/tEQ0F55HgL9P7odWegh4gpNedA4+I3
	VcRNsrHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Py-0002Zc-P6; Fri, 06 Nov 2020 21:37:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Pq-0002Vj-D7
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id 33so2753742wrl.7
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWMhK/OvncM3wrg/l2R/3oqz+FYOuFfnAnN4zZZG95g=;
 b=giuuga+Subtfjj4L06B+sRGS3UP4NSvhfj3Dy96cBZOlbr2uIBvVAviwtIhKtM88Oc
 cbGk73Rqe9eUV8XEoW6PRC3Hq0/qxrPOtNJY+y9bTkZ1H4h0mKEFG28iBAIVmBMvK/TT
 DKMvwZVy7/6hnyGbWAA+0+Lx3Ufj+y7so197DYDn6aY2KqlJL0fLvmGfGVaybffQBwK/
 XgpkRd1j/mfFbFkNUr4FkrhZUeQXdyWesLk0vrwqwc28m1BvpQM5ROsMUbdQ3bKKFxxl
 lqG8l4wNNr2nb6nviGQI1WSj51WqGQL4g6hM2WXRfBblkxKdax614UM/3LpGUT1S/JJs
 WHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWMhK/OvncM3wrg/l2R/3oqz+FYOuFfnAnN4zZZG95g=;
 b=EwQsTWTyw8aA5jNZfmw5uff93ZkPOoNUNTCDe6hEVSPPNm1c7W0k1tEXZOtZ3cZgcq
 KUxzoGMOkiEm6fUVP/dVZx6YHQ6eIpCytLr0rJsHRzp/JGaTxvPdbREdoQMyUwFwktja
 1ZFIY5nzIkVHpbIo33sHQHiGe2QO5y/u0fdHRCgotV59ykToKA1hzVgX8OWFrWMTMw3F
 jf6zDitIyjhnC13WE0lGrSFU5IHjKiuI3XKRzU2CFH7YvbeYKy4qQjJcOcV4kKPYLeOH
 lizdZwCSxwC3JRSdOy3ot4A0lb6fb3XJJHcPk+8GcQySRN4iPNKEAd3MgTT9EvWPuBLa
 CAAQ==
X-Gm-Message-State: AOAM531daDXzqUXKRiRmragp1A80uqW0/IVhzX9kbByAXTwmJrjQlDPL
 je21SW9LJ/T6a3BPP/6T4xXrBA==
X-Google-Smtp-Source: ABdhPJwYbbeGzfNSZK1/UV+MifV9QDrLVlkETYPhmljhd2e2p7ph7BVoQ2I52W0yiGbOkeQrcS1TNA==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr108958wrw.123.1604698619742;
 Fri, 06 Nov 2020 13:36:59 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:36:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 00/23] Rid W=1 warnings in MTD
Date: Fri,  6 Nov 2020 21:36:32 +0000
Message-Id: <20201106213655.1838861-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163702_486694_834C9F97 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sergey Lapin <slapin@ossfans.org>, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Choudary Kalluri <punnaia@xilinx.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Sumit Semwal <sumit.semwal@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Dan Brown <dan_brown@ieee.org>, linux-samsung-soc@vger.kernel.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Gleixner <gleixner@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Dmitriy B <rzk333@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Jochen=20Sch=C3=A4uble?= <psionic@psionic.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Nicolas Pitre <nico@fluxnic.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 Jian Zhang <jzhang@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCnYxID0+IHYyOgogIC0gQWRkZWQg
dGFncwogIC0gU2F0aXNmaWVkIE1pcXVlbCdzIHJldmlldyBjb21tZW50cwoKTGVlIEpvbmVzICgy
Myk6CiAgbXRkOiBtdGRwYXJ0OiBGaXggbWlzZG9jdW1lbnRlZCBmdW5jdGlvbiBwYXJhbWV0ZXIg
J210ZCcKICBtdGQ6IGRldmljZXM6IHBocmFtOiBGaWxlIGhlYWRlcnMgYXJlIG5vdCBnb29kIGNh
bmRpZGF0ZXMgZm9yCiAgICBrZXJuZWwtZG9jCiAgbXRkOiBuYW5kOiBvbmVuYW5kOiBvbmVuYW5k
X2Jhc2U6IEZpeCBleHBlY3RlZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKICBtdGQ6IGRldmljZXM6
IGRvY2czOiBGaXgga2VybmVsLWRvYyAnYmFkIGxpbmUnIGFuZCAnZXhjZXNzaXZlIGRvYycKICAg
IGlzc3VlcwogIG10ZDogbXRkY29yZTogRml4IG1pc3NwZWxsZWQgZnVuY3Rpb24gcGFyYW1ldGVy
ICdzZWN0aW9uJwogIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYnQ6IEZpeCBleHBlY3Rl
ZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKICBtdGQ6IHNwaS1ub3I6IGNvbnRyb2xsZXJzOiBoaXNp
LXNmYzogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MKICBtdGQ6IHViaTogYnVpbGQ6
IERvY3VtZW50ICd1YmlfbnVtJyBpbiBzdHJ1Y3QgbXRkX2Rldl9wYXJhbQogIG10ZDogbmFuZDog
c3BpOiB0b3NoaWJhOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYyBoZWFkZXIKICBt
dGQ6IHViaToga2FwaTogQ29ycmVjdCBkb2N1bWVudGF0aW9uIGZvciAndWJpX2xlYl9yZWFkX3Nn
J3MgJ3NnbCcKICAgIHBhcmFtZXRlcgogIG10ZDogdWJpOiBlYmE6IEZpeCBhIGNvdXBsZSBvZiBt
aXNkb2N1bWVudGF0aW9uIGlzc3VlcwogIG10ZDogdWJpOiB3bDogRml4IGEgY291cGxlIG9mIGtl
cm5lbC1kb2MgaXNzdWVzCiAgbXRkOiBuYW5kOiByYXc6IGJyY21uYW5kOiBicmNtbmFuZDogRGVt
b3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MKICAgIGhlYWRlcnMKICBtdGQ6IHViaTogZ2x1
ZWJpOiBGaXggbWlzbmFtZWQgZnVuY3Rpb24gcGFyYW1ldGVyIGRvY3VtZW50YXRpb24KICBtdGQ6
IG5hbmQ6IHJhdzogZGlza29uY2hpcDogTWFya2luZyB1bnVzZWQgdmFyaWFibGVzIGFzCiAgICBf
X2Fsd2F5c191bnVzZWQKICBtdGQ6IG5hbmQ6IHJhdzogY2FmZV9uYW5kOiBSZW1vdmUgc3VwZXJm
bHVvdXMgcGFyYW0gZG9jIGFuZCBhZGQKICAgIGFub3RoZXIKICBtdGQ6IG5hbmQ6IHJhdzogczNj
MjQxMDogQWRkIGRvY3VtZW50YXRpb24gZm9yIDIgbWlzc2luZyBzdHJ1Y3QKICAgIG1lbWJlcnMK
ICBtdGQ6IG5hbmQ6IHJhdzogb21hcF9lbG06IEZpbmlzaCBoYWxmIHBvcHVsYXRlZCBmdW5jdGlv
biBoZWFkZXIsCiAgICBkZW1vdGUgZW1wdHkgb25lcwogIG10ZDogbmFuZDogcmF3OiBvbWFwMjog
Rml4IGEgYnVuY2ggb2Yga2VybmVsLWRvYyBtaXNkZW1lYW5vdXJzCiAgbXRkOiBuYW5kOiByYXc6
IHN1bnhpX25hbmQ6IERvY3VtZW50ICdzdW54aV9uZmMncyAnY2FwcycgbWVtYmVyCiAgbXRkOiBu
YW5kOiByYXc6IGFyYXNhbi1uYW5kLWNvbnRyb2xsZXI6IERvY3VtZW50ICdhbmZjX29wJ3MgJ2J1
ZicKICAgIG1lbWJlcgogIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYXNlOiBGaXggc29t
ZSBrZXJuZWwtZG9jIG1pc2RlbWVhbm91cnMKICBtdGQ6IGRldmljZXM6IHBvd2VybnZfZmxhc2g6
IEFkZCBmdW5jdGlvbiBuYW1lcyB0byBoZWFkZXJzIGFuZCBmaXgKICAgICdkZXYnCgogZHJpdmVy
cy9tdGQvZGV2aWNlcy9kb2NnMy5jICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJz
L210ZC9kZXZpY2VzL3BocmFtLmMgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
bXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jICAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9t
dGQvbXRkY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210
ZC9tdGRwYXJ0LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyAgICAgICB8IDQ0NCArKysrKysrKystLS0tLS0t
LS0KIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2JidC5jICAgICAgICB8ICAzMiAr
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgICAxICsK
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgICAgICB8ICAgNiArLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgICAgICAgICAgICAgIHwgICAyICstCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmMgICAgICAgICAgICAgfCAgIDQgKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMgICAgICAgICAgICAgICAgICB8ICAxOCArLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYyAgICAgICAgICAgICAgIHwgICA3ICstCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9zM2MyNDEwLmMgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJz
L210ZC9uYW5kL3NwaS90b3NoaWJhLmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
bXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYyAgICB8ICAgMiArLQogZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvbXRk
L3ViaS9lYmEuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9tdGQv
dWJpL2dsdWViaS5jICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC91
Ymkva2FwaS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL3Vi
aS93bC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogMjIgZmlsZXMgY2hhbmdl
ZCwgMjc4IGluc2VydGlvbnMoKyksIDI3MiBkZWxldGlvbnMoLSkKCkNjOiBBZHJpYW4gSHVudGVy
IDxleHQtYWRyaWFuLmh1bnRlckBub2tpYS5jb20+CkNjOiBiY20ta2VybmVsLWZlZWRiYWNrLWxp
c3RAYnJvYWRjb20uY29tCkNjOiBCZW4gRG9va3MgPGJlbkBzaW10ZWMuY28udWs+CkNjOiBCZW5q
YW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+CkNjOiBCb3JpcyBC
UkVaSUxMT04gPGIuYnJlemlsbG9uLmRldkBnbWFpbC5jb20+CkNjOiBCb3JpcyBCcmV6aWxsb24g
PGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRl
cnNmb3JwZWFjZUBnbWFpbC5jb20+CkNjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+CkNj
OiBDaG91ZGFyeSBLYWxsdXJpIDxwdW5uYWlhQHhpbGlueC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbiBCcm93biA8ZGFuX2Jyb3du
QGllZWUub3JnPgpDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgpDYzog
RG1pdHJpeSBCIDxyemszMzNAZ21haWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRl
PgpDYzogSmlhbiBaaGFuZyA8anpoYW5nQHRpLmNvbT4KQ2M6ICJKb2NoZW4gU2Now6R1YmxlIiA8
cHNpb25pY0Bwc2lvbmljLmRlPgpDYzogS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+
CkNjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CkNjOiBLdWtqaW4gS2lt
IDxrZ2VuZUBrZXJuZWwub3JnPgpDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1z
dW5nLmNvbT4KQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzog
bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIu
a2VybmVsLm9yZwpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogTWlj
aGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PgpDYzogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KQ2M6IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2Fz
dXJlQHhpbGlueC5jb20+CkNjOiBOaWNvbGFzIFBpdHJlIDxuaWNvQGZsdXhuaWMubmV0PgpDYzog
UGF1bCBNYWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPgpDYzogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+CkNjOiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgpDYzogUm9iZXJ0IEphcnptaWsgPHJv
YmVydC5qYXJ6bWlrQGZyZWUuZnI+CkNjOiBTZXJnZXkgTGFwaW4gPHNsYXBpbkBvc3NmYW5zLm9y
Zz4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBUaG9tYXMg
R2xlaXhuZXIgPGdsZWl4bmVyQGxpbnV0cm9uaXguZGU+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4KQ2M6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9j
aGlwLmNvbT4KQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IFlv
c2hpbyBGdXJ1eWFtYSA8eXRjLW1iLXlmdXJ1eWFtYTdAa2lveGlhLmNvbT4KLS0gCjIuMjUuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
