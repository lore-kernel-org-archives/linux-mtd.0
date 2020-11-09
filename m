Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AB1C5517A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB173206C0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y5DbN2Sv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pxyzv6hb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB173206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X9TArvLUAOI/fnF5YNyBENEHLhvoEUC0tT9RNuJkdSA=; b=y5DbN2SvwEg4/Za/pOUsWEspPf
	MYkL+O956b8xEtI73IquqVVI2PLO/D45imLMC1kqz/dZsFyDTzluOm2gtr4s0d0nAMbil5IX8F1Lo
	R/EVCDQpemFRlmNwg2tuhTcXSrHQjWlTSszN4UkeLGt45pzCJ30IrD8YnQUQ1AtXO7IJWs2iMmZDF
	vqocdhcFRPxHdyOXbzS2f/92nBH02wX46FNcwOspDNGNo9XCJNDurUDTq0oxpWgkwWMTT5q5b+FZe
	TyiayEyNnr1GWANXYdEebZLAGW2IC/Y+U2TUHymmgTWpT7Rz/x5zC3NyWIbEPRUzl9q1LTQiBvWG/
	z+NpM0BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBo3-0000nA-6i; Mon, 09 Nov 2020 18:22:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBo0-0000mC-I0
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b8so9810516wrn.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4P2xmgevp6DARNoI93TPQjmwkxCbh1dSMEz+Iq7USWQ=;
 b=Pxyzv6hbcgjcrX05VpRCx6Ets2223lXot8ZTbClQRJLprCn0ly07zluqvcckUwBv2G
 NIq6z87PB5x9f1wUlv638Irwanc+OCehWWNhnOFFti+l0O7APSHjCjOl9+k8Py5fD6m9
 eUpg7v2rXyNZtFFFL5AWVl1eAmjGjlADa7/4FvXsH5K8UheAwCD+/fH3EMyvjWDiOJnR
 o/SHANbbNGirUUevHyRC0LQBOS2jxr2hOW4gi0YMIrz48DvJrVIRIgs8jWlx4/g9EeoX
 e4kt601ZYAkpa0jtbL1BheC/y7YKMhB1t8j8y3TcDYijFThVu98lbFsKHZPh0lS2XuxR
 q3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4P2xmgevp6DARNoI93TPQjmwkxCbh1dSMEz+Iq7USWQ=;
 b=RJ7aFT+gqer2rwdBDW/T6V9KGl/4z/aq2IKgEUhYOxiVDwjxLFebkCLs7PYPKB+t2f
 LyhrocFSRhZZ5kzNAB9mhVCI+fSTvPfTclWAi6k0fZKGTIttU5f5E+38JeBDFQzXNbMa
 Sq2CORQIj1dK0tHt3hRgIwzCzplI+Np4rLOqZS06NCsVW78LuwbgrtNMNWPg/v5zrOGY
 B7z/9jC57o5uz9LljdzmTm7DjgEFXaV2IzwgvOUfYy6b2DhDKWqH7AOtl9wmbz2MiuRd
 ivvkP+pmuEngjXM6f2+MjvC5IU/g+HdPPKZ7IirIwQKDfpzvMUVJzdBlE+HWNnOdCRCt
 aETw==
X-Gm-Message-State: AOAM5317biKzG1kw8BupgiLsDEyNEybg8HgorRlloxYaBw9ZIBcPWI9v
 ALcOt2aFK8tCnWGNjzS66hE1ww==
X-Google-Smtp-Source: ABdhPJxhRwyrEVueE23+RLeJQ/TbrawEL5WZ/GkvIUQxW/l/GeVywuz/qg1kBRs7igqCfZa2ZMZnvw==
X-Received: by 2002:adf:de85:: with SMTP id w5mr4447254wrl.90.1604946133526;
 Mon, 09 Nov 2020 10:22:13 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 00/23] Rid W=1 warnings in MTD
Date: Mon,  9 Nov 2020 18:21:43 +0000
Message-Id: <20201109182206.3037326-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132216_900500_90B9A1CF 
X-CRM114-Status: GOOD (  17.86  )
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
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCnYyID0+IHYzOgogIC0gUmV3b3Jk
ZWQgc3ViamVjdCBsaW5lcwoKdjEgPT4gdjI6CiAgLSBBZGRlZCB0YWdzCiAgLSBTYXRpc2ZpZWQg
TWlxdWVsJ3MgcmV2aWV3IGNvbW1lbnRzCiAgCkxlZSBKb25lcyAoMjMpOgogIG10ZDogbXRkcGFy
dDogRml4IG1pc2RvY3VtZW50ZWQgZnVuY3Rpb24gcGFyYW1ldGVyICdtdGQnCiAgbXRkOiBkZXZp
Y2VzOiBwaHJhbTogRmlsZSBoZWFkZXJzIGFyZSBub3QgZ29vZCBjYW5kaWRhdGVzIGZvcgogICAg
a2VybmVsLWRvYwogIG10ZDogb25lbmFuZDogb25lbmFuZF9iYXNlOiBGaXggZXhwZWN0ZWQga2Vy
bmVsLWRvYyBmb3JtYXR0aW5nCiAgbXRkOiBkZXZpY2VzOiBkb2NnMzogRml4IGtlcm5lbC1kb2Mg
J2JhZCBsaW5lJyBhbmQgJ2V4Y2Vzc2l2ZSBkb2MnCiAgICBpc3N1ZXMKICBtdGQ6IEZpeCBtaXNz
cGVsbGVkIGZ1bmN0aW9uIHBhcmFtZXRlciAnc2VjdGlvbicKICBtdGQ6IG9uZW5hbmQ6IG9uZW5h
bmRfYmJ0OiBGaXggZXhwZWN0ZWQga2VybmVsLWRvYyBmb3JtYXR0aW5nCiAgbXRkOiBzcGktbm9y
OiBoaXNpLXNmYzogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MKICBtdGQ6IHViaTog
YnVpbGQ6IERvY3VtZW50ICd1YmlfbnVtJyBpbiBzdHJ1Y3QgbXRkX2Rldl9wYXJhbQogIG10ZDog
c3BpbmFuZDogdG9zaGliYTogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVy
CiAgbXRkOiB1Ymk6IGthcGk6IENvcnJlY3QgZG9jdW1lbnRhdGlvbiBmb3IgJ3ViaV9sZWJfcmVh
ZF9zZydzICdzZ2wnCiAgICBwYXJhbWV0ZXIKICBtdGQ6IHViaTogZWJhOiBGaXggYSBjb3VwbGUg
b2YgbWlzZG9jdW1lbnRhdGlvbiBpc3N1ZXMKICBtdGQ6IHViaTogd2w6IEZpeCBhIGNvdXBsZSBv
ZiBrZXJuZWwtZG9jIGlzc3VlcwogIG10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IERlbW90ZSBub24t
Y29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcnMKICBtdGQ6IHViaTogZ2x1ZWJpOiBGaXggbWlz
bmFtZWQgZnVuY3Rpb24gcGFyYW1ldGVyIGRvY3VtZW50YXRpb24KICBtdGQ6IHJhd25hbmQ6IGRp
c2tvbmNoaXA6IE1hcmtpbmcgdW51c2VkIHZhcmlhYmxlcyBhcyBfX2Fsd2F5c191bnVzZWQKICBt
dGQ6IHJhd25hbmQ6IGNhZmVfbmFuZDogUmVtb3ZlIHN1cGVyZmx1b3VzIHBhcmFtIGRvYyBhbmQg
YWRkIGFub3RoZXIKICBtdGQ6IHJhd25hbmQ6IHMzYzI0MTA6IEFkZCBkb2N1bWVudGF0aW9uIGZv
ciAyIG1pc3Npbmcgc3RydWN0IG1lbWJlcnMKICBtdGQ6IHJhd25hbmQ6IG9tYXBfZWxtOiBGaW5p
c2ggaGFsZiBwb3B1bGF0ZWQgZnVuY3Rpb24gaGVhZGVyLCBkZW1vdGUKICAgIGVtcHR5IG9uZXMK
ICBtdGQ6IHJhd25hbmQ6IG9tYXAyOiBGaXggYSBidW5jaCBvZiBrZXJuZWwtZG9jIG1pc2RlbWVh
bm91cnMKICBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBEb2N1bWVudCAnc3VueGlfbmZjJ3MgJ2NhcHMn
IG1lbWJlcgogIG10ZDogcmF3bmFuZDogYXJhc2FuOiBEb2N1bWVudCAnYW5mY19vcCdzICdidWYn
IG1lbWJlcgogIG10ZDogb25lbmFuZDogRml4IHNvbWUga2VybmVsLWRvYyBtaXNkZW1lYW5vdXJz
CiAgbXRkOiBkZXZpY2VzOiBwb3dlcm52X2ZsYXNoOiBBZGQgZnVuY3Rpb24gbmFtZXMgdG8gaGVh
ZGVycyBhbmQgZml4CiAgICAnZGV2JwoKIGRyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuYyAgICAg
ICAgICAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9kZXZpY2VzL3Bvd2VybnZfZmxhc2gu
YyAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbXRkcGFydC5jICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNl
LmMgICAgICAgfCA0NDQgKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL29uZW5h
bmQvb25lbmFuZF9iYnQuYyAgICAgICAgfCAgMzIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Fy
YXNhbi1uYW5kLWNvbnRyb2xsZXIuYyB8ICAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVf
bmFuZC5jICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29u
Y2hpcC5jICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5j
ICAgICAgICAgICAgICAgICAgfCAgMTggKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXBfZWxt
LmMgICAgICAgICAgICAgICB8ICAgNyArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvczNjMjQxMC5j
ICAgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5k
LmMgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jICAg
ICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hp
c2ktc2ZjLmMgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL210ZC91YmkvZWJhLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvbXRkL3ViaS9nbHVlYmkuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvdWJpL2thcGkuYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC91Ymkvd2wuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDMgKy0KIDIyIGZpbGVzIGNoYW5nZWQsIDI3OCBpbnNlcnRpb25zKCspLCAyNzIg
ZGVsZXRpb25zKC0pCgpDYzogQWRyaWFuIEh1bnRlciA8ZXh0LWFkcmlhbi5odW50ZXJAbm9raWEu
Y29tPgpDYzogYmNtLWtlcm5lbC1mZWVkYmFjay1saXN0QGJyb2FkY29tLmNvbQpDYzogQmVuIERv
b2tzIDxiZW5Ac2ltdGVjLmNvLnVrPgpDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBr
ZXJuZWwuY3Jhc2hpbmcub3JnPgpDYzogQm9yaXMgQlJFWklMTE9OIDxiLmJyZXppbGxvbi5kZXZA
Z21haWwuY29tPgpDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3Jh
LmNvbT4KQ2M6IEJyaWFuIE5vcnJpcyA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPgpDYzog
Q2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgpDYzogQ2hvdWRhcnkgS2FsbHVyaSA8cHVubmFp
YUB4aWxpbnguY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYW4gQnJvd24gPGRhbl9icm93bkBpZWVlLm9yZz4KQ2M6IERhdmlkIFdvb2Ro
b3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IERtaXRyaXkgQiA8cnprMzMzQGdtYWlsLmNv
bT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEZyaWVkZXIgU2NocmVt
cGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4KQ2M6IEppYW4gWmhhbmcgPGp6aGFuZ0B0
aS5jb20+CkNjOiAiSm9jaGVuIFNjaMOkdWJsZSIgPHBzaW9uaWNAcHNpb25pYy5kZT4KQ2M6IEth
bWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29tPgpDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPgpDYzogS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4KQ2M6IEt5
dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBsaW5hcm8tbW0tc2ln
QGxpc3RzLmxpbmFyby5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1h
bi5pZC5hdT4KQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CkNj
OiBOYWdhIFN1cmVzaGt1bWFyIFJlbGxpIDxuYWdhc3VyZUB4aWxpbnguY29tPgpDYzogTmljb2xh
cyBQaXRyZSA8bmljb0BmbHV4bmljLm5ldD4KQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVsdXNAc2Ft
YmEub3JnPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IFFp
YW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KQ2M6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgpDYzog
U2VyZ2V5IExhcGluIDxzbGFwaW5Ab3NzZmFucy5vcmc+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDxnbGVpeG5lckBsaW51dHJv
bml4LmRlPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBUdWRv
ciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+CkNjOiBWaWduZXNoIFJhZ2hh
dmVuZHJhIDx2aWduZXNockB0aS5jb20+CkNjOiBZb3NoaW8gRnVydXlhbWEgPHl0Yy1tYi15ZnVy
dXlhbWE3QGtpb3hpYS5jb20+Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
