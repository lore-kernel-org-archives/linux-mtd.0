Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F79C001DD
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pg1KpuuhTDUCI6qaplZSd68cHFL6jrnUtWq+0KHZjjw=; b=yXbxrmBa8WzmCw
	2qlT3mp0aNpRqxehIfpBltcThPyBf/qbnTb9vcoWLhWToZ1hUbV6mynp8LufjmtpSUCQq2A9j9tTL
	j9SIz7eket+mf8Q0zb0AW6pNIJZBlMQqFw/Na1Et0V01MqKR6vHXDVPZI/K72cLjqZeZJWz1WrZp5
	2n3huqwHBdeBv5hXDnn3ywYzC10lznsOH85l9JbQKt0ZqhARvkCsRiMQ1OeBLS6W0aHb1UpMVubkP
	YPoQJJPUiBp3O4m1c//qE8C19SDnVyskUGSZfSQTabXtiAViYQVXWqbFDMKdlceOJFqc9omRsmihy
	irD5wcEd83bzHQsKi5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDuB2-00B6hI-2C;
	Mon, 26 Jun 2023 21:55:16 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDuAy-00B6gR-2R;
	Mon, 26 Jun 2023 21:55:15 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso2104433e87.0;
        Mon, 26 Jun 2023 14:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687816508; x=1690408508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xeTVPn3rI6euHlbfgKeZisbySltCuL+CYAo/n2Br8P4=;
        b=suUjawGReGtdeF23f7YxHAxxvx4UBYVRPpQjYSoxEAXAy/DPD5nCmlYvmlDHJnvDRn
         GZxk2LxL4M3ni62ERZ//rbCu4NxTOHD/tWeJbDG0Bf16zkgrQBNW9E98g9M2yHUdaAXa
         LWA1vl1sG0/X34MirJDAfT6RrX8li1BBmu1Jtk6Ytmhij2CULYz8iyE9N8f5+Hn8Tq7c
         DgmsMyPJMSWv/azjQDRs2ieS6qcziGK0lE2RsbAhfBebM30RY1D5FD1BWZE3jJcypEhM
         lYEAXEDJ2YjDPCgo8Lf0uSH0lDIQV43dV674hMxVR+h6GtqyG77SARE/k42R730slaZS
         p8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687816508; x=1690408508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeTVPn3rI6euHlbfgKeZisbySltCuL+CYAo/n2Br8P4=;
        b=TpCh2pNycCR461CmhxWaTbMUMsGfn2WFyQxlKbJIWOrTqQR3YyvO0YAXxpqqsGfjNn
         C/L1N5AtfGq5ympdu8d0FODGlhq3uTzIaBBGF+srb/46otckNNeT8J8aayk7XNol4EDK
         zi0q18mEav7cZ9TnDBLf7GHiz1gFbIKbQp247cutU4EYLzzZME/7JvMg+L4gbrxZWdjE
         j9uH96mhKFqKTS2iA4v93rzEIAGvOhcpaV/98xHVXOs6H4jrBCtn4VAla1k4PnPLN6kk
         kofz+77xkihPq5wZCW3bvVAgHl4cPriPcITm0svo/Xh/rcuZS+yo6iCnZ1FgwlR3VD4u
         aRKw==
X-Gm-Message-State: AC+VfDxJIMwO4QaEAnhRMxDxVe02GlSncu/Q9b3z/OerPKroF0FEwe1W
	P+SRlu6Z1usQ+87xw6zJJJU=
X-Google-Smtp-Source: ACHHUZ7ACBYjcKdK/Hp0kN+8eoP8jLQOTZ8r0wVecCSNchgJEcJQ/kGsLBF8Zs+uJImWGR2MyWT1iw==
X-Received: by 2002:a05:6512:3f05:b0:4fb:752c:3240 with SMTP id y5-20020a0565123f0500b004fb752c3240mr2276537lfa.68.1687816508041;
        Mon, 26 Jun 2023 14:55:08 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x20-20020a19f614000000b004f840965b51sm1272837lfe.148.2023.06.26.14.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 14:55:07 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3] dt-bindings: nvmem: fixed-cell: add compatible for MAC cells
Date: Mon, 26 Jun 2023 23:54:50 +0200
Message-Id: <20230626215450.30573-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_145512_816319_EDF5C79A 
X-CRM114-Status: GOOD (  16.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQSBsb3Qgb2YgaG9tZSBy
b3V0ZXJzIGhhdmUgTlZNRU0gZml4ZWQgY2VsbHMgY29udGFpbmluZyBNQUMgYWRkcmVzcyB0aGF0
Cm5lZWQgc29tZSBmdXJ0aGVyIHByb2Nlc3NpbmcuIEluIH45OSUgY2FzZXMgTUFDIG5lZWRzIHRv
IGJlOgoxLiBPcHRpb25hbGx5IHBhcnNlZCBmcm9tIEFTQ0lJIGZvcm1hdAoyLiBJbmNyZWFzZWQg
YnkgYSB2ZW5kb3ItcGlja2VkIHZhbHVlCgpUaGVyZSB3YXMgYWxyZWFkeSBhbiBhdHRlbXB0IHRv
IGRlc2lnbiBhIGJpbmRpbmcgZm9yIHRoYXQgYXQgTlZNRU0KZGV2aWNlIGxldmVsIGluIHRoZSBw
YXN0LiBJdCB3YXNuJ3QgYWNjZXB0ZWQgdGhvdWdoIGFzIGl0IGRpZG4ndCByZWFsbHkKZml0IE5W
TUVNIGRldmljZSBsYXllci4KClRoZSBpbnRyb2R1Y3Rpb24gb2YgTlZNRU0gZml4ZWQtY2VsbHMg
bGF5b3V0IHNlZW1zIHRvIGJlIGFuIG9wcG9ydHVuaXR5CnRvIHByb3ZpZGUgYSByZWxldmFudCBi
aW5kaW5nIGluIGEgY2xlYW4gd2F5LgoKVGhpcyBjb21taXQgYWRkcyBhICpnZW5lcmljKiBjb21w
YXRpYmxlIHN0cmluZzogIm1hYy1iYXNlIi4gQXMgYWx3YXlzIGl0Cm5lZWRzIHRvIGJlIGNhcmVm
dWxseSByZXZpZXdlZC4KCk9wZW5XcnQgcHJvamVjdCBjdXJyZW50bHkgc3VwcG9ydHMgfjMwMCBo
b21lIHJvdXRlcnMgdGhhdCBoYXZlIE5WTUVNCmNlbGwgd2l0aCBiaW5hcnktc3RvcmVkIGJhc2Ug
TUFDLlQgaG9zZSBkZXZpY2VzIGFyZSBtYW51ZmFjdHVyZWQgYnkKbXVsdGlwbGUgdmVuZG9ycy4g
VGhlcmUgYXJlIFRQLUxpbmsgZGV2aWNlcyAoNzYgb2YgdGhlbSksIE5ldGdlYXIgKDE5KSwKRC1M
aW5rICgxMSksIE9wZW5NZXNoICg5KSwgRW5HZW5pdXMgKDgpLCBHTC5pTmV0ICg4KSwgWlRFICg3
KSwKWGlhb21pICg1KSwgVWJpcXVpdGkgKDYpIGFuZCBtb3JlLiBUaG9zZSBkZXZpY2VzIGRvbid0
IHNoYXJlIGFuCmFyY2hpdGVjdHVyZSBvciBTb0MuCgpBbm90aGVyIDIwMCBkZXZpY2VzIGhhdmUg
YmFzZSBNQUMgc3RvcmVkIGluIGFuIEFTQ0lJIGZvcm1hdCAobm90IGFsbAp0aG9zZSBkZXZpY2Vz
IGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gRFQgdGhvdWdoKS4KCkl0IHdvdWxkIGJlIGltcHJhY3Rp
Y2FsIHRvIHByb3ZpZGUgdW5pcXVlICJjb21wYXRpYmxlIiBzdHJpbmdzIGZvciBOVk1FTQpsYXlv
dXRzIG9mIGFsbCB0aG9zZSBkZXZpY2VzLiBJdCBzZWVtcyBsaWtlIGEgdmFsaWQgY2FzZSBmb3Ig
YWxsb3dpbmcgYQpnZW5lcmljIGJpbmRpbmcgaW5zdGVhZC4gRXZlbiBpZiB0aGlzIGJpbmRpbmcg
d2lsbCBub3QgYmUgc3VmZmljaWVudCBmb3IKc29tZSBmdXJ0aGVyIGRldmljZXMgaXQgc2VlbXMg
dG8gYmUgdXNlZnVsIGVub3VnaCBhcyBpdCBpcy4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tClYyOiBEcm9wICJtYWMtYXNjaWkiIGFzIGxlbmd0
aCBjYW4gYmUgY2hlY2tlZCBpbnN0ZWFkCiAgICBGaXggImFsbE9mIiBieSBhZGRpbmcgcmVxdWly
ZWQ6IFsgY29tcGF0aWJsZSBdClYzOiBGaXggY2VsbCBsZW5ndGggaW4gImRlc2NyaXB0aW9uIiAo
dGhhbmsgeW91IFJvYiEpCi0tLQogLi4uL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2Vs
bC55YW1sICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL252bWVtL2xh
eW91dHMvZml4ZWQtbGF5b3V0LnlhbWwgIHwgMTIgKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS9udm1lbS55YW1sICAgICAgfCAgNSArKystCiAzIGZpbGVzIGNoYW5nZWQs
IDQyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1jZWxsLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1jZWxs
LnlhbWwKaW5kZXggZTY5ODA5ODQ1MGUxLi5hYzIzODFlNjYwMjcgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWNlbGwueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9m
aXhlZC1jZWxsLnlhbWwKQEAgLTExLDYgKzExLDE1IEBAIG1haW50YWluZXJzOgogICAtIFNyaW5p
dmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KIAogcHJvcGVy
dGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gY29uc3Q6IG1hYy1iYXNl
CisgICAgICAgIGRlc2NyaXB0aW9uOiA+CisgICAgICAgICAgQ2VsbCB3aXRoIGJhc2UgTUFDIGFk
ZHJlc3MgdG8gYmUgdXNlZCBmb3IgY2FsY3VsYXRpbmcgZXh0cmEgcmVsYXRpdmUKKyAgICAgICAg
ICBhZGRyZXNzZXMuCisgICAgICAgICAgSXQgY2FuIGJlIHN0b3JlZCBpbiBhIHBsYWluIGJpbmFy
eSBmb3JtYXQgKGNlbGwgbGVuZ3RoIDYpIG9yIGFzIGFuCisgICAgICAgICAgQVNDSUkgdGV4dCBs
aWtlICIwMDoxMToyMjozMzo0NDo1NSIgKGNlbGwgbGVuZ3RoIDE3KS4KKwogICByZWc6CiAgICAg
bWF4SXRlbXM6IDEKIApAQCAtMjUsNiArMzQsMjMgQEAgcHJvcGVydGllczoKICAgICAgICAgZGVz
Y3JpcHRpb246CiAgICAgICAgICAgU2l6ZSBpbiBiaXQgd2l0aGluIHRoZSBhZGRyZXNzIHJhbmdl
IHNwZWNpZmllZCBieSByZWcuCiAKK2FsbE9mOgorICAtIGlmOgorICAgICAgcmVxdWlyZWQ6IFsg
Y29tcGF0aWJsZSBdCisgICAgdGhlbjoKKyAgICAgIGlmOgorICAgICAgICBwcm9wZXJ0aWVzOgor
ICAgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAg
ICAgY29uc3Q6IG1hYy1iYXNlCisgICAgICB0aGVuOgorICAgICAgICBwcm9wZXJ0aWVzOgorICAg
ICAgICAgICIjbnZtZW0tY2VsbC1jZWxscyI6CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhl
IGZpcnN0IGFyZ3VtZW50IGlzIGEgTUFDIGFkZHJlc3Mgb2Zmc2V0LgorICAgICAgICAgICAgY29u
c3Q6IDEKKyAgICAgICAgcmVxdWlyZWQ6CisgICAgICAgICAgLSAiI252bWVtLWNlbGwtY2VsbHMi
CisKIHJlcXVpcmVkOgogICAtIHJlZwogCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlvdXQueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWxheW91dC55YW1s
CmluZGV4IGMyNzE1MzdkMDcxNC4uYjNhMDllODg2NGYxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlvdXQueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhl
ZC1sYXlvdXQueWFtbApAQCAtNDQsNiArNDQsMTggQEAgZXhhbXBsZXM6CiAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+OwogICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKIAorICAgICAgICBt
YWNAMTAwIHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWFjLWJhc2UiOworICAgICAgICAg
ICAgcmVnID0gPDB4MTAwIDB4Yz47CisgICAgICAgICAgICAjbnZtZW0tY2VsbC1jZWxscyA9IDwx
PjsKKyAgICAgICAgfTsKKworICAgICAgICBtYWNAMTEwIHsKKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibWFjLWJhc2UiOworICAgICAgICAgICAgcmVnID0gPDB4MTEwIDB4MTE+OworICAgICAg
ICAgICAgI252bWVtLWNlbGwtY2VsbHMgPSA8MT47CisgICAgICAgIH07CisKICAgICAgICAgY2Fs
aWJyYXRpb25ANDAwMCB7CiAgICAgICAgICAgICByZWcgPSA8MHg0MDAwIDB4MTAwPjsKICAgICAg
ICAgfTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS9udm1lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252
bWVtLnlhbWwKaW5kZXggOTgwMjQ0MTAwNjkwLi45ZjkyMWQ5NDAxNDIgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sCkBAIC00OSw3
ICs0OSwxMCBAQCBwcm9wZXJ0aWVzOgogcGF0dGVyblByb3BlcnRpZXM6CiAgICJAWzAtOWEtZl0r
KCxbMC03XSk/JCI6CiAgICAgdHlwZTogb2JqZWN0Ci0gICAgJHJlZjogbGF5b3V0cy9maXhlZC1j
ZWxsLnlhbWwKKyAgICBhbGxPZjoKKyAgICAgIC0gJHJlZjogbGF5b3V0cy9maXhlZC1jZWxsLnlh
bWwKKyAgICAgIC0gcHJvcGVydGllczoKKyAgICAgICAgICBjb21wYXRpYmxlOiBmYWxzZQogICAg
IGRlcHJlY2F0ZWQ6IHRydWUKIAogYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKLS0gCjIuMzUu
MwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
