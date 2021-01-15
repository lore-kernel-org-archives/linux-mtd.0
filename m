Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBED1C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 15:40:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92794207D0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 15:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92794207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B0EL5iA54+k88Suoc4EiE43C/NV1aiTbPszNhYqLLQ0=; b=FO7jPI404xShNUepRcPn25zNyg
	bQPzLLyg+wgIN4UIOi/oOceYb1nUjIU1XjkZfZZR/grribPe44D4iq/qV16u9BEZsNw9uyMMdub34
	LXh+gS7cGGTm9eTfNQauRtA8+8xNSKAvFS8+dIMA4yGc2TdJrrmUft0ZVOeGw3wy9q0Sah9gRCowW
	CG7zNmq1ECSTE3oqGJ0+oXeKByp645QILPPFqyDapaWZ1i3BleekwGv+/2mBOZfwss566mpeUS9QP
	VgLK2jL4zQcVzzlgnn0wZNGHj5LwHqg+H4XOqGRT2hC/cx85aqt9CVplYQ2cY6pcfYVAK8rpYrZDv
	HYlTxcoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0RC6-0005VA-UL; Fri, 15 Jan 2021 15:39:22 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0RC4-0005UE-C4
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 15:39:21 +0000
Received: by mail-lj1-x22d.google.com with SMTP id e7so10831802ljg.10
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 07:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srgjk5QVmLK3FqpIHac5AnRKp8slJiIMm3vehhv+DqU=;
 b=rvx+H0Qmrb/n8UlxFo7AwfzpD8AvmON747N0xAQWZMOMoqQ0OL0/5baVgkHSaWmC/p
 Mj1BV9d7TQG2L8lnoJfpvQTgZQJsx83QWH+CTBtp26ZXGJep7yS6qnq2uQcnxVIISGLh
 bWK097qEVIUgDIO9Dxgkn5KRuMq+Dj0lsN6WDazstZSuanVzmWYxSHqxilmzB3GWefkk
 TDa0CVDHzn/fuKj7oBfBR4i2EJuKFLh4igDaQ5TbxZ3gEDRNpxGrtuJCaE/AnmRa/utq
 UcGEOA+//9WHn4LKCU/ASjfQ1OllFemiUb0sXAiMnbP5x086r7T+GzIXMwJUlTp8lbiO
 QgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srgjk5QVmLK3FqpIHac5AnRKp8slJiIMm3vehhv+DqU=;
 b=KAPuuDKeoKzTTnyHpCPD1XwYd1VdSgRP8uFfjoPDjfdwCOZJuQUFxtBIfFcthvt0ta
 Y1Pk//ofZFHw3pj/iOfl7apoC5APv5jnE6PZ2J6NEXVLS4l6ElEfALY0KZ1QrFMhI1V9
 RFIN5vl2CO248gN/TiVGmbyVtq223CMNBDbqbPsNmZWHnL8QUNEtu9dl8+04sz6aGt9A
 RVedVBiVI2nWCL6a5yVChlcFi9ocDbwyM6LVpPIfTTAx653R7gV5DnkWx1VBBjxDl+U1
 2DyTkv0MlrpTEWDQlx9HfE2rBd+UuGsdhjydt/ovynu7Hb034bZwMl6zxFn4Hs75hXxe
 QwHg==
X-Gm-Message-State: AOAM532qYcdpYBIwP1pkp94wUJjL8R8cy3JTQKpX/8+tNsg2Ro50ZvUv
 w/YE9q/qc1Js+2ymw86jUIg=
X-Google-Smtp-Source: ABdhPJwZjsLS3nFSwGHZRWYqxl3I/ZmEVsseUeiRs/KOrZkYVTEFxEN9eg31UyjKv5J8wc64/oYLLA==
X-Received: by 2002:a2e:8416:: with SMTP id z22mr5535221ljg.347.1610725155447; 
 Fri, 15 Jan 2021 07:39:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id j2sm931567lfe.134.2021.01.15.07.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:39:14 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: mtd: move partition binding to its own file
Date: Fri, 15 Jan 2021 16:38:59 +0100
Message-Id: <20210115153901.31052-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_103920_427811_F3A8846A 
X-CRM114-Status: GOOD (  16.95  )
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU2luZ2xlIHBhcnRpdGlv
biBiaW5kaW5nIGlzIHF1aXRlIGNvbW1vbiBhbmQgbWF5IGJlOgoxLiBVc2VkIGJ5IG11bHRpcGxl
IHBhcnNlcnMKMi4gRXh0ZW5kZWQgZm9yIG1vcmUgc3BlY2lmaWMgY2FzZXMKCk1vdmUgaXQgdG8g
c2VwYXJhdGVkIGZpbGUgdG8gYXZvaWQgY29kZSBkdXBsaWNhdGlvbi4KClNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiAuLi4vbXRkL3BhcnRpdGlv
bnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAgICAgfCAzMyArLS0tLS0tLS0tLS0tCiAuLi4vYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgfCA0NyArKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQt
cGFydGl0aW9ucy55YW1sCmluZGV4IDZkNGEzNDUwZTA2NC4uZWE0Y2FjZTZhOTU1IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4
ZWQtcGFydGl0aW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKQEAgLTI3LDM4ICsyNyw3IEBA
IHByb3BlcnRpZXM6CiAKIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiQFswLTlhLWZdKyQiOgotICAg
IGRlc2NyaXB0aW9uOiBub2RlIGRlc2NyaWJpbmcgYSBzaW5nbGUgZmxhc2ggcGFydGl0aW9uCi0g
ICAgdHlwZTogb2JqZWN0Ci0KLSAgICBwcm9wZXJ0aWVzOgotICAgICAgcmVnOgotICAgICAgICBk
ZXNjcmlwdGlvbjogcGFydGl0aW9uJ3Mgb2Zmc2V0IGFuZCBzaXplIHdpdGhpbiB0aGUgZmxhc2gK
LSAgICAgICAgbWF4SXRlbXM6IDEKLQotICAgICAgbGFiZWw6Ci0gICAgICAgIGRlc2NyaXB0aW9u
OiBUaGUgbGFiZWwgLyBuYW1lIGZvciB0aGlzIHBhcnRpdGlvbi4gSWYgb21pdHRlZCwgdGhlIGxh
YmVsCi0gICAgICAgICAgaXMgdGFrZW4gZnJvbSB0aGUgbm9kZSBuYW1lIChleGNsdWRpbmcgdGhl
IHVuaXQgYWRkcmVzcykuCi0KLSAgICAgIHJlYWQtb25seToKLSAgICAgICAgZGVzY3JpcHRpb246
IFRoaXMgcGFyYW1ldGVyLCBpZiBwcmVzZW50LCBpcyBhIGhpbnQgdGhhdCB0aGlzIHBhcnRpdGlv
bgotICAgICAgICAgIHNob3VsZCBvbmx5IGJlIG1vdW50ZWQgcmVhZC1vbmx5LiBUaGlzIGlzIHVz
dWFsbHkgdXNlZCBmb3IgZmxhc2gKLSAgICAgICAgICBwYXJ0aXRpb25zIGNvbnRhaW5pbmcgZWFy
bHktYm9vdCBmaXJtd2FyZSBpbWFnZXMgb3IgZGF0YSB3aGljaCBzaG91bGQKLSAgICAgICAgICBu
b3QgYmUgY2xvYmJlcmVkLgotICAgICAgICB0eXBlOiBib29sZWFuCi0KLSAgICAgIGxvY2s6Ci0g
ICAgICAgIGRlc2NyaXB0aW9uOiBEbyBub3QgdW5sb2NrIHRoZSBwYXJ0aXRpb24gYXQgaW5pdGlh
bGl6YXRpb24gdGltZSAobm90Ci0gICAgICAgICAgc3VwcG9ydGVkIG9uIGFsbCBkZXZpY2VzKQot
ICAgICAgICB0eXBlOiBib29sZWFuCi0KLSAgICAgIHNsYy1tb2RlOgotICAgICAgICBkZXNjcmlw
dGlvbjogVGhpcyBwYXJhbWV0ZXIsIGlmIHByZXNlbnQsIGFsbG93cyBvbmUgdG8gZW11bGF0ZSBT
TEMgbW9kZQotICAgICAgICAgIG9uIGEgcGFydGl0aW9uIGF0dGFjaGVkIHRvIGFuIE1MQyBOQU5E
IHRodXMgbWFraW5nIHRoaXMgcGFydGl0aW9uCi0gICAgICAgICAgaW1tdW5lIHRvIHBhaXJlZC1w
YWdlcyBjb3JydXB0aW9ucwotICAgICAgICB0eXBlOiBib29sZWFuCi0KLSAgICByZXF1aXJlZDoK
LSAgICAgIC0gcmVnCisgICAgJHJlZjogInBhcnRpdGlvbi55YW1sIyIKIAogcmVxdWlyZWQ6CiAg
IC0gIiNhZGRyZXNzLWNlbGxzIgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTFhYzA4MDY0NDI1Ci0tLSAvZGV2L251
bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25z
L3BhcnRpdGlvbi55YW1sCkBAIC0wLDAgKzEsNDcgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1s
IworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
CisKK3RpdGxlOiBQYXJ0aXRpb24KKworZGVzY3JpcHRpb246IHwKKyAgVGhpcyBiaW5kaW5nIGRl
c2NyaWJlcyBhIHNpbmdsZSBmbGFzaCBwYXJ0aXRpb24uIEVhY2ggcGFydGl0aW9uIG11c3QgaGF2
ZSBpdHMKKyAgcmVsYXRpdmUgb2Zmc2V0IGFuZCBzaXplIHNwZWNpZmllZC4gRGVwZW5kaW5nIG9u
IHBhcnRpdGlvbiBmdW5jdGlvbiBleHRyYQorICBwcm9wZXJ0aWVzIGNhbiBiZSB1c2VkLgorCitt
YWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CisKK3By
b3BlcnRpZXM6CisgIHJlZzoKKyAgICBkZXNjcmlwdGlvbjogcGFydGl0aW9uJ3Mgb2Zmc2V0IGFu
ZCBzaXplIHdpdGhpbiB0aGUgZmxhc2gKKyAgICBtYXhJdGVtczogMQorCisgIGxhYmVsOgorICAg
IGRlc2NyaXB0aW9uOiBUaGUgbGFiZWwgLyBuYW1lIGZvciB0aGlzIHBhcnRpdGlvbi4gSWYgb21p
dHRlZCwgdGhlIGxhYmVsCisgICAgICBpcyB0YWtlbiBmcm9tIHRoZSBub2RlIG5hbWUgKGV4Y2x1
ZGluZyB0aGUgdW5pdCBhZGRyZXNzKS4KKworICByZWFkLW9ubHk6CisgICAgZGVzY3JpcHRpb246
IFRoaXMgcGFyYW1ldGVyLCBpZiBwcmVzZW50LCBpcyBhIGhpbnQgdGhhdCB0aGlzIHBhcnRpdGlv
bgorICAgICAgc2hvdWxkIG9ubHkgYmUgbW91bnRlZCByZWFkLW9ubHkuIFRoaXMgaXMgdXN1YWxs
eSB1c2VkIGZvciBmbGFzaAorICAgICAgcGFydGl0aW9ucyBjb250YWluaW5nIGVhcmx5LWJvb3Qg
ZmlybXdhcmUgaW1hZ2VzIG9yIGRhdGEgd2hpY2ggc2hvdWxkCisgICAgICBub3QgYmUgY2xvYmJl
cmVkLgorICAgIHR5cGU6IGJvb2xlYW4KKworICBsb2NrOgorICAgIGRlc2NyaXB0aW9uOiBEbyBu
b3QgdW5sb2NrIHRoZSBwYXJ0aXRpb24gYXQgaW5pdGlhbGl6YXRpb24gdGltZSAobm90CisgICAg
ICBzdXBwb3J0ZWQgb24gYWxsIGRldmljZXMpCisgICAgdHlwZTogYm9vbGVhbgorCisgIHNsYy1t
b2RlOgorICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFtZXRlciwgaWYgcHJlc2VudCwgYWxsb3dz
IG9uZSB0byBlbXVsYXRlIFNMQyBtb2RlCisgICAgICBvbiBhIHBhcnRpdGlvbiBhdHRhY2hlZCB0
byBhbiBNTEMgTkFORCB0aHVzIG1ha2luZyB0aGlzIHBhcnRpdGlvbgorICAgICAgaW1tdW5lIHRv
IHBhaXJlZC1wYWdlcyBjb3JydXB0aW9ucworICAgIHR5cGU6IGJvb2xlYW4KKworcmVxdWlyZWQ6
CisgIC0gcmVnCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCi0tIAoyLjI2LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
