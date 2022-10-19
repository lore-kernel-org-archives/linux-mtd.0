Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89B9C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=26WLv8Q1bZar7IQYdcjhWP5pP2Dv6e2vDA+ztLrwKUA=; b=4uMlQsPWSuR9dD
	/q5GRXlgLuB+X0MiPNKBMl7eg/uf4QRkOvXlel3lsQ5iIK7bsr3FhVqkIpoqSLJuh+Bi+8B7H2ilz
	S7KGpQh2NnFGWVdXwoVAhbo9qJM3dR/kgPSM2m+T4N2AMZ3tq6nyMKB5NKMvF1RS2wmtJkda/kTxK
	S/9dVrj9KQsCEd58Ck3mEZSrq2AG9e8aa53JJPlsAEG3K6dlV/rKY+S0BwhdOH84N+HGdsGOlDS3U
	Ez3rL9tjw5FrhmGB0KyiJrnxgz8HWFqdP4AmwF6f9fnCTAzIhH9fUoFOntEfwg/PEMmV0FlF30MNj
	U3kyjG38haDGo9G10X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7a5-0011gK-3q; Wed, 19 Oct 2022 11:49:53 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7a0-0011cX-TI
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 11:49:50 +0000
Received: by mail-lj1-x229.google.com with SMTP id c22so20481725lja.6
        for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2022 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/SgthmTOzp3GGabfMw1BGo5g3o2HNTfweNMsL53GOTc=;
        b=XznED3sZp9svoyHkLA1j5DhdbO8l+nPvuyUqWZcMwP52T0KIuuQWMrZIz7p9JrYekv
         sUzIoYPZXBgeqkGX7wYNW9wgLVaWBTZMMYETm/qxREwkGqRI+pg2cmwkNFAvyPUa4PjM
         xpX/x3WKxWVoKPUEV1KEJdoOszoC69e8Afbn7Aum9e0FJYhz9MemAWhhWWqOF/VgTZPc
         qSljtj7HUICXFDKR3YXI7ogC7F3bOK7tCOJ8hq1PgYVSkj/nwVVZAZ4Lja3RcToN9U2I
         eVk/3TWf1bfoMCH67WoNWUvOUyDNPjg0YWCWBwJtm/jGVl7GVSRdg5qrHZRwLblO+iy8
         FeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SgthmTOzp3GGabfMw1BGo5g3o2HNTfweNMsL53GOTc=;
        b=hqpkw96gqpZwwo/J0fyUqfIm3PTkkNXDP012LZko8MDo3i/RdUIkG1gzNT5UWWBcn8
         +ddLAHSo6mspiQHTL8f9cg3TwB60d+t03Pp16BMNYOYHbaIWs388ytCo5eM8b5FQodYK
         LizQ4nPAmz7L8xr0L8C/EaygcZpd7UCAjBRGG8UiSSiW+StLYQ2JiEAaZcrONWLqwuMd
         mK8YhHUxvViFApKYEd7ChZPeRM/zGB79t1bORtZgLSohiKuwXbsYJhUpqGBa9t7+LAFV
         CbCtWMA+JXttf0DJV4WSGz2z/ME4j+9xazoZPVPbavhDRzYDjMBJQLWjLKRTB8BTyhd5
         HsFg==
X-Gm-Message-State: ACrzQf2DhBtBkmixq3LzL7t2E0fYNNiIPgPyIVes0TgXYWN8mbpYmVQ9
	RnMQ4GV56U5hFslBuQXqBSTQe0L8ocI=
X-Google-Smtp-Source: AMsMyM6nCzwdW4mWOBQs58yKiCa3tBpUd6ICc0SZWaZEyY4NDKU/gpSMnAyAhFSQBcd3Hi0b3BAl5g==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id wu9-20020a170906eec900b0073dc369690fmr6449809ejb.767.1666180173514;
        Wed, 19 Oct 2022 04:49:33 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id fg4-20020a056402548400b0045bef7cf489sm10186308edb.89.2022.10.19.04.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 04:49:32 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: mtd: partitions: support marking root device partition
Date: Wed, 19 Oct 2022 13:48:54 +0200
Message-Id: <20221019114855.31639-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_044948_986646_B9BFCD2A 
X-CRM114-Status: GOOD (  13.91  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTGludXggbmVlZHMgdG8g
a25vdyB3aGF0IHRvIHVzZSBhcyByb290IGRldmljZS4gT24gZW1iZWRkZWQgZGV2aWNlcyB3aXRo
CmZsYXNoIHRoZSBvbmx5IGNvbW1vbiB3YXkgdG8gc3BlY2lmeSB0aGF0IGlzIGNtZGxpbmUgJiBy
b290PSBwYXJhbWV0ZXIuCgpUaGF0IHNvbHV0aW9uIHdvcmtzIHdpdGggVS1Cb290IHdoaWNoIGlz
IExpbnV4ICYgY21kbGluZSBhd2FyZSBidXQgaXNuJ3QKYXZhaWxhYmxlIHdpdGggYWxsIG1hcmtl
dCBib290bG9hZGVycy4gQWxzbyB0aGF0IG1ldGhvZCBpcyBmcmFnaWxlOgoxLiBSZXF1aXJlcyBz
cGVjaWZpYyBwcm9iaW5nIG9yZGVyIG9uIG11bHRpLWZsYXNoIGRldmljZXMKMi4gVXNlcyBoYXJk
Y29kZWQgcGFydGl0aW9ucyBpbmRleGVzCgpBIGxvdCBvZiBkZXZpY2VzIHVzZSBkaWZmZXJlbnQg
cGFydGl0aW9uaW5nIG1ldGhvZHMuIEl0IG1heSBiZQoiZml4ZWQtcGFydGl0aW9ucyIgb3Igc29t
ZSBkeW5hbWljIHBhcnRpdGlvbmluZyAoZS5nLiBiYXNlZCBvbiBwYXJ0cwp0YWJsZSkuIEZvciBz
dWNoIGNhc2VzIGFsbG93ICJsaW51eCxyb290LWRldmljZSIgcHJvcGVydHkgdG8gbWFyawpjb3Jy
ZWN0IGZsYXNoIHBhcnRpdGlvbi4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFm
YWxAbWlsZWNraS5wbD4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9u
cy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgIHwgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCAgICAgICAgIHwgNCArKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0
aW9ucy55YW1sCmluZGV4IGFkM2NjZDI1MDgwMi4uZTYyNzA4NWRmNGZjIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFy
dGl0aW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKQEAgLTg0LDYgKzg0LDcgQEAgZXhhbXBs
ZXM6CiAgICAgICAgIHBhcnRpdGlvbkAwIHsKICAgICAgICAgICAgIGxhYmVsID0gImZpbGVzeXN0
ZW0iOwogICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgxIDB4MDAwMDAwMDA+OworICAg
ICAgICAgICAgbGludXgscm9vdC1kZXZpY2U7CiAgICAgICAgIH07CiAgICAgfTsKIApkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Bh
cnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL3BhcnRpdGlvbi55YW1sCmluZGV4IGYxYTAyZDg0MGIxMi4uNjcxOTA2YWNmMWJkIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCkBAIC01Miw2ICs1MiwxMCBAQCBwcm9wZXJ0
aWVzOgogICAgICAgaW1tdW5lIHRvIHBhaXJlZC1wYWdlcyBjb3JydXB0aW9ucwogICAgIHR5cGU6
IGJvb2xlYW4KIAorICBsaW51eCxyb290LWRldmljZToKKyAgICBkZXNjcmlwdGlvbjogTWFya3Mg
cGFydGl0aW9uIHRoYXQgaXMgYSByb290IGRldmljZSB3aXRoIGZpbGVzeXN0ZW0gdG8gbW91bnQK
KyAgICAgIGFuZCBib290IHVzZXIgc3BhY2UgZnJvbQorCiBpZjoKICAgbm90OgogICAgIHJlcXVp
cmVkOiBbIHJlZyBdCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
