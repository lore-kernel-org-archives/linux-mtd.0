Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF3606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gALYVSeB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzD5rd0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O2RBlBR3ABIB6tSSUQrLsq1CoZVT3UTK9/LfXK9Bx3Y=; b=gALYVSeBtqlMDlwcECK1i6SoUu
	h34fbXKiKyitrkP9JoQDmo08vRupbDpfjs36M0rPrCewfme02KEXYVCX2IAWHibwKo1i1cujzMS6w
	mSyT5YUlSWnqEsd3LOvhPrfoLkBnCkM0rhjW5/VK6ZVqsxxmQGC9MBlwemjXmvYLh4m3tKgLsmZTf
	3XAhHrvalwyBKCw5Q6jELg3Ff/T5GZUbngPfzj4h3HfbnBSjIVTwpYZ5JrJubFsEDIQLh4ouF394r
	Qwy5SwAPdj85142Ylc+iKC0AhIU0BHx8hSgUPh9X4tzpqAwa2n8K3tJxibm4Xx6XjDRl+Ip0sTfcj
	6WTl0NeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxPc-0000000GfrJ-1OWj;
	Fri, 27 Nov 2026 14:58:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxPb-0000000Gfqs-0g7B;
	Fri, 27 Nov 2026 14:58:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6147E605E3;
	Fri, 27 Nov 2026 14:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D9A1F00897;
	Fri, 27 Nov 2026 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791534;
	bh=9EdxXWF0MoQta2ocUjikzENKESzXNTXPeM81HlznVmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzD5rd0s0Z04M6LYUY7OeLU2Arm74Odj6rXpmxsA0tQ5uvzfJbJqxeHU06nMJbm/r
	 CLkWXeqrqDZQlmjgfqnCNd9EU0noBkWRT9v+21PNsD/GBMm4m2LXMZmQm99QkEQOKJ
	 YkfZgNH0uhJXwYwlhYz2MxWEUumYNi/9iEaY6kOlTcek7JcfQD8EeFPy8YqV3MH7oI
	 G3Tw0s5VriahDWUQK/EA963+RvOQx2L67HhYbVmKtnEcQnQe1iP9gDwsp52z1yDSWY
	 1nV5KVzk8VgWiUtqccPHyvvFzfZfDv2JB6u1q0J+4cYf7CN6uQyrR98OwYyfHPaW+b
	 e+YwVYoGkcA6w==
Message-ID: <sashiko-outbox-237651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 22/35] spi: nxp-xspi: Reject mixed DTR modes
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Feng Chen" <feng.chen@amlogic.com>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, "Han Xu" <han.xu@nxp.com>, "Conor Dooley" <conor.dooley@microchip.com>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, "Daire McNamara" <daire.mcnamara@microchip.com>, "Haibo
 Chen" <haibo.chen@nxp.com>, "Jyan Chou" <jyanchou@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Yogesh Gaur" <yogeshgaur.83@gmail.com>, "Chris
 Packham" <chris.packham@alliedtelesis.co.nz>, =?utf-8?b?Sm9uYXRoYW4gTmV1?=
 =?utf-8?b?c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, "Michal Simek" <michal.simek@amd.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-22-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
 <20261127-macronix-upstreaming-spi-mem-cycles-v2-22-5c93f5e5d630@bootlin.com>
Date: Fri, 27 Nov 2026 14:58:51 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiBueHAteHNwaTog
aW5jb25zaXN0ZW50IERUUiBkZXRlY3Rpb24gaW4KICBueHBfeHNwaV9zdXBwb3J0c19vcCgpCi0t
Cgpjb21taXQgY2U4ZDdhM2ZmNWZiZTllYzUxYTZkM2ExNzJkNGI3ODkxYWFmNjJjMQpBdXRob3I6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpzcGk6IG54cC14c3Bp
OiBSZWplY3QgbWl4ZWQgRFRSIG1vZGVzCgpUaGlzIGNvbW1pdCB1cGRhdGVzIG54cF94c3BpX3N1
cHBvcnRzX29wKCkgdG8gcmVqZWN0IFNQSSBtZW1vcnkgb3BlcmF0aW9ucwp0aGF0IG1peCBEVFIg
YW5kIFNEUiBwaGFzZXMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktbnhwLXhzcGku
YyBiL2RyaXZlcnMvc3BpL3NwaS1ueHAteHNwaS5jCj4gaW5kZXggY2NkMDBjNzQ0ZDE4Ni4uZjJh
ODQ3YjVmZDI3ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbnhwLXhzcGkuYwo+ICsr
KyBiL2RyaXZlcnMvc3BpL3NwaS1ueHAteHNwaS5jCj4gQEAgLTM4NSw4ICszODUsMTggQEAgc3Rh
dGljIGJvb2wgbnhwX3hzcGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiAgCQkJ
CSBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4gIHsKPiAgCXN0cnVjdCBueHBfeHNwaSAq
eHNwaSA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKG1lbS0+c3BpLT5jb250cm9sbGVyKTsK
PiArCWJvb2wgYWxsX3RydWUsIGFsbF9mYWxzZTsKPiAgCWludCByZXQ7Cj4gIAo+ICsJYWxsX3Ry
dWUgPSBvcC0+Y21kLmR0ciAmJgo+ICsJCSAgICghb3AtPmFkZHIubmJ5dGVzIHx8IG9wLT5hZGRy
LmR0cikgJiYKPiArCQkgICAoIW9wLT5kYXRhLm5ieXRlcyB8fCBvcC0+ZGF0YS5kdHIpOwo+ICsK
PiArCWFsbF9mYWxzZSA9ICFvcC0+Y21kLmR0ciAmJiAhb3AtPmFkZHIuZHRyICYmICFvcC0+ZGF0
YS5kdHI7Cj4gKwo+ICsJaWYgKCFhbGxfdHJ1ZSAmJiAhYWxsX2ZhbHNlKQo+ICsJCXJldHVybiBm
YWxzZTsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgRFRSIGNoZWNrIG1hdGNoIGhvdyBu
eHBfeHNwaV9zZWxlY3RfbWVtKCkgZGV0ZWN0cyBEVFIgb3BlcmF0aW9ucwphbmQgaG93IHRoZSBk
dW1teSBwaGFzZSBpcyB2YWxpZGF0ZWQ/CgpJbiBueHBfeHNwaV9zZWxlY3RfbWVtKCksIG9wX2lz
X2R0ciByZXF1aXJlcyBkdHIgdG8gYmUgc2V0IG9uIGFsbCBmb3VyCnBoYXNlcyB1bmNvbmRpdGlv
bmFsbHk6Cgpkcml2ZXJzL3NwaS9zcGktbnhwLXhzcGkuYzpueHBfeHNwaV9zZWxlY3RfbWVtKCkg
ewogICAgLi4uCgkvKiB4c3BpIG9ubHkgc3VwcG9ydCBvbmUgRFRSIG1vZGU6IDhELThELThEICov
Cglib29sIG9wX2lzX2R0ciA9IG9wLT5jbWQuZHRyICYmIG9wLT5hZGRyLmR0ciAmJiBvcC0+ZHVt
bXkuZHRyICYmIG9wLT5kYXRhLmR0cjsKICAgIC4uLgp9CgpTdGFuZGFyZCBPY3RhbCBEVFIgdGVt
cGxhdGVzIHRoYXQgb21pdCBhbiBhZGRyZXNzLCBkdW1teSwgb3IgZGF0YSBwaGFzZQooc3VjaCBh
cyBTUElOQU5EX1BST0dfTE9BRF84RF84RF84RF9PUCBvciBTUElOQU5EX1dSX0VOXzhEXzBfMF9P
UCkgbGVhdmUKZHRyIGFzIGZhbHNlIG9uIHRoZSB1bnVzZWQgcGhhc2UgdmlhIFNQSV9NRU1fT1Bf
Tk9fRFVNTVksClNQSV9NRU1fT1BfTk9fQUREUiwgb3IgU1BJX01FTV9PUF9OT19EQVRBLiAgVGhv
c2Ugb3BlcmF0aW9ucyBwYXNzCmFsbF90cnVlIGhlcmUsIGFuZCBueHBfeHNwaV9wcmVwYXJlX2x1
dCgpIGVtaXRzIEREUiBMVVQgaW5zdHJ1Y3Rpb25zIGZvcgp0aGUgYWN0aXZlIHBoYXNlcywgYnV0
IG54cF94c3BpX3NlbGVjdF9tZW0oKSBldmFsdWF0ZXMgb3BfaXNfZHRyIGFzIGZhbHNlCmFuZCBj
YWxscyBueHBfeHNwaV9kaXNhYmxlX2RkcigpLgoKSW4gYWRkaXRpb24sIG5laXRoZXIgYWxsX3Ry
dWUgbm9yIGFsbF9mYWxzZSBjaGVja3Mgb3AtPmR1bW15LmR0ciB3aGVuCm9wLT5kdW1teS5uY3lj
bGVzID4gMC4gIEJlY2F1c2UgdGhpcyBkcml2ZXIgc2V0cyBkdW1teV9jeWNsZXMgPSB0cnVlIGlu
Cm54cF94c3BpX21lbV9jYXBzLCBzcGlfbWVtX2NvbnZlcnRfZHVtbXkoKSBjbGVhcnMgb3AtPmR1
bW15Lm5ieXRlcyB0byAwCmJlZm9yZSBueHBfeHNwaV9zdXBwb3J0c19vcCgpIGFuZCBzcGlfbWVt
X2RlZmF1bHRfc3VwcG9ydHNfb3AoKSBydW4sIHNvIGEKbWlzbWF0Y2hlZCBvcC0+ZHVtbXkuZHRy
IGlzIG5vdCBjYXVnaHQgYnkgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkKZWl0aGVyLgoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MTEyNy1tYWNyb25peC11cHN0cmVhbWluZy1zcGktbWVtLWN5Y2xlcy12Mi0wLTVjOTNmNWU1
ZDYzMEBib290bGluLmNvbT9wYXJ0PTIyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
