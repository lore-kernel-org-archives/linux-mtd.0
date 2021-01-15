Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7B3C4332D
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 15:40:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1914C207D0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 15:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1914C207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Jk9BGWeUP4NJZ96zW6JqbFWY+M1zIMd8puBgEPGpJ4=; b=2GNgE7tniqaEUSDIfHkPAl+NG
	/zxA8pkYEsoz7KzpbIPTRNpNij/zzxAqqL/I45M+gxlutC3eJpDH1bNqrkKf99ulSTdPEWH+/xDxh
	IXVrCrWXBCV5gyMRSydp3HtBqbyt5nCTcX5mpGdXEp4GSJXF9SAAfkUIxyhNmssrzamRGS1+YVzcv
	pekmmDbmGFvY8AZaLTcsi1YxH10MVGKpxmyU6GeXFBDNwsblPRSBZe1Aggbij9NNN0SFpIqSzNEJC
	Q/bTclIR8OtGn9KAfpCHJSnOjhGE3ybDczqMxCp/paVe/SCKiKJVeVpDMZdfrBiPckXcDKyOId9Pe
	V690EAfpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0RCB-0005XG-G1; Fri, 15 Jan 2021 15:39:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0RC7-0005Ut-FD
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 15:39:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id o19so13760380lfo.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 07:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7im1QXvoU9pnwhNU516Up7aImtiZpLV/k+KA0KsbcAE=;
 b=qbSvhrRlFFWplAJZXDw8nkCVTFgkNpvW+CyQHlqom83lOcBI6lP1ZUAnLA1RwqKiY4
 qots7YAfLkvtJkf9rHTne2G2A+dNqeyMUowh3mIVK7zIGxIOoSz59mfTRn37SiX0z1li
 acO8itK70B+ig9uU27eL9844ScY9NF/rj6Ps6C3YzjwYWjCYPy2CfoEZiQN6/HXomN5j
 7fWKASDPDdbLGFc7lEpd2Dc4rK/zUId06Zlqw3MtFOgn9ebyse4YDzOTmT0er5p3br2B
 quiDC3Zk20fvOrP62KKt9hYM63iuyyOgWDn8Rzk1AQkyxhYUPeF7p6yixV0DSENtNqIs
 k4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7im1QXvoU9pnwhNU516Up7aImtiZpLV/k+KA0KsbcAE=;
 b=hvty2Lt6BUiC8Wm/Zj9hlKq07+moa5tZFI6RPq6Iwxs7u1b1fYee+VGhacAWragJKt
 updTSLLtII/Ac4PawqS/GHFk6Uvvo7y0ooV5TbzchuJHMZyE1do+Kg3a03YhuzZgoDaf
 yewXNsgAOYpJWIzayWZTP4jBs1kT8W82JN+igt41f3qwZPwv4HW1t08vyk5XekrjNDpu
 MfsLqEvEuM2gCwhPOyD1c6acLNIIhO4w9+sOfUKmO3PtK2Y90YWFMrjBg8Lzqtc3q9FE
 cybjX14AEKy0Y4lAFF+I385871s+jE7JxL7VeuoPruzlIQkCqAW4JllSviZPYxV++5v+
 tIYw==
X-Gm-Message-State: AOAM532ycv46FBGQgT0D2dwCkYpOmjAG5xs6OQEE0+aow1qM+go1qHXj
 F0jpi++6iPjRe3S4ta0U5Aw=
X-Google-Smtp-Source: ABdhPJzGH6aFky/BcP4EsxiG2NISHHzisLOpSgA1WLSUZmC8Spq6xttOYv7Ularabh36qAmG5jLxXw==
X-Received: by 2002:a19:9d3:: with SMTP id 202mr5640760lfj.388.1610725160638; 
 Fri, 15 Jan 2021 07:39:20 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id j2sm931567lfe.134.2021.01.15.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:39:20 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] dt-bindings: mtd: add binding from BCM4908 partitions
Date: Fri, 15 Jan 2021 16:39:00 +0100
Message-Id: <20210115153901.31052-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153901.31052-1-zajec5@gmail.com>
References: <20210115153901.31052-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_103923_656923_4ADEEC07 
X-CRM114-Status: GOOD (  15.28  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQkNNNDkwOCB1c2VzIGZp
eGVkIHBhcnRpdGlvbnMgbGF5b3V0IGJ1dCBmdW5jdGlvbiBvZiBzb21lIHBhcnRpdGlvbnMgbWF5
CnZhcnkuIFNvbWUgZGV2aWNlcyB1c2UgbXVsdGlwbGUgZmlybXdhcmUgcGFydGl0aW9ucyBhbmQg
dGhvc2Ugc2hvdWxkIGJlCm1hcmtlZCB0byBsZXQgc3lzdGVtIGRpc2NvdmVyIHRoZWlyIHB1cnBv
c2UuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0t
LQogLi4uL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbCAgIHwgNjggKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFy
dGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL2JyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi40MDkwYjYxYTNkYTcKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4
LXBhcnRpdGlvbnMueWFtbApAQCAtMCwwICsxLDY4IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgt
cGFydGl0aW9ucy55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBCcm9hZGNvbSBCQ000OTA4IHBhcnRpdGlvbmluZwor
CitkZXNjcmlwdGlvbjogfAorICBCcm9hZGNvbSBCQ000OTA4IENGRSBib290bG9hZGVyIHN1cHBv
cnRzIHR3byBmaXJtd2FyZSBwYXJ0aXRpb25zLiBPbmUgaXMgdXNlZAorICBmb3IgcmVndWxhciBi
b290aW5nLCB0aGUgb3RoZXIgaXMgdHJlYXRlZCBhcyBmYWxsYmFjay4KKworICBUaGlzIGJpbmRp
bmcgYWxsb3dzIGRlZmluaW5nIGFsbCBmaXhlZCBwYXJ0aXRpb25zIGFuZCBtYXJraW5nIHRob3Nl
IGNvbnRhaW5pbmcKKyAgZmlybXdhcmUuIFN5c3RlbSBjYW4gdXNlIHRoYXQgaW5mb3JtYXRpb24g
ZS5nLiBmb3IgYm9vdGluZyBvciBmbGFzaGluZworICBwdXJwb3Nlcy4KKworbWFpbnRhaW5lcnM6
CisgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorCitwcm9wZXJ0aWVzOgor
ICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBicmNtLGJjbTQ5MDgtcGFydGl0aW9ucworCisgICIj
YWRkcmVzcy1jZWxscyI6IHRydWUKKworICAiI3NpemUtY2VsbHMiOiB0cnVlCisKK3BhdHRlcm5Q
cm9wZXJ0aWVzOgorICAiQFswLTlhLWZdKyQiOgorICAgIGFsbE9mOgorICAgICAgLSAkcmVmOiAi
cGFydGl0aW9uLnlhbWwjIgorICAgICAgLSBwcm9wZXJ0aWVzOgorICAgICAgICAgIGNvbXBhdGli
bGU6CisgICAgICAgICAgICBjb25zdDogYnJjbSxiY200OTA4LWZpcm13YXJlCisKK3JlcXVpcmVk
OgorICAtICIjYWRkcmVzcy1jZWxscyIKKyAgLSAiI3NpemUtY2VsbHMiCisKK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgcGFydGl0aW9ucyB7Cisg
ICAgICAgIGNvbXBhdGlibGUgPSAiYnJjbSxiY200OTA4LXBhcnRpdGlvbnMiOworICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAg
ICAgcGFydGl0aW9uQDAgeworICAgICAgICAgICAgbGFiZWwgPSAiY2Zlcm9tIjsKKyAgICAgICAg
ICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+OworICAgICAgICB9OworCisgICAgICAgIHBhcnRpdGlv
bkAxMDAwMDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLGJjbTQ5MDgtZmlybXdh
cmUiOworICAgICAgICAgICAgcmVnID0gPDB4MTAwMDAwIDB4ZjAwMDAwPjsKKyAgICAgICAgfTsK
KworICAgICAgICBwYXJ0aXRpb25AMTAwMDAwMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImJyY20sYmNtNDkwOC1maXJtd2FyZSI7CisgICAgICAgICAgICByZWcgPSA8MHgxMDAwMDAwIDB4
ZjAwMDAwPjsKKyAgICAgICAgfTsKKworICAgICAgICBwYXJ0aXRpb25AMWYwMDAwMCB7CisgICAg
ICAgICAgICBsYWJlbCA9ICJjYWxpYnJhdGlvbiI7CisgICAgICAgICAgICByZWcgPSA8MHgxZjAw
MDAwIDB4MTAwMDAwPjsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4yNi4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
