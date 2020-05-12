Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D797C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:01:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCBF2072B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzbdaAcY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSWdVSN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCBF2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9gfx2rDgVpVlEDkUgq9eeBeUTxSmWzkejhaIuighnw=; b=TzbdaAcYeG1nS/
	j5wlwZIxFjdIDggPoytSeTyIp5+ZnUsYl97/DI0C9MBLese4qZldq51X75rClIwUJVL6fbTtB4DcH
	9zzbMzHqgc+OqGq34LMGAb/Jn3wMom5udRp07aYPAAkpgskk4Gi9kWHr41A9xdkhYb9cyQiH+SrIt
	7jIuP8rCumPTGK4aHY25gSJSIrLwRc39ipWFi5e96yXJ/q6+G1mpga62iED+dn48OSxB8NcLdIDvQ
	16ptO/yN32HcXDG4JYA0Qy9Hqm+qCOuTs2iEt/10z0J/WnbV0q70E0L198MrtqDAPwlQz6Cv7QOCk
	AmkkCCWRfOxFiFhSWKGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYNyN-0002dJ-HD; Tue, 12 May 2020 06:00:59 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYNxx-0002Ca-AF
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 06:00:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id u16so21825220wmc.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 23:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7Lx33UKkxslFdo8QHuCccIO/lqVvcYa4SP0ggmO3GI=;
 b=MSWdVSN2PLhXKmWdXV4InAQUewuHIILW49yuj24ZsC0PAzddqf+XEl8mKq9OYMAHx9
 WRPKn7ulJl19RDPCC0gGmokdlcFpcw9Utp3umxvAeJp6HPJewBiNhXS7H9CVkw18YvvF
 WlcYCfIG1mazchF7psTM+hBBrrhENC07BIJatzDGloq7yZOCD7sGDeBXIOBlmICk+ox0
 e1LHKyn09Nm79Dj3W+80eo71+FEQBVpZGU7HFmnKKh9mgA2grfZ/oAhzyN6eTHuijB3p
 XUpag0snJKkOQpuhPOeEyDL6AY838LBXSBF1feLHar3QK8VOhYWoHHeaxc9cnG5ActsN
 lF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7Lx33UKkxslFdo8QHuCccIO/lqVvcYa4SP0ggmO3GI=;
 b=lUe/nraeGu2ihTusA1agda0Dg3hcu3kZ2+AyqA6kEdMVPcCC1ccczlAsLO208Bwy3e
 TpIHe7p/EQFETB8dWyNvQYSs5B/POyWRhKEISZcLHW4hvs3bn2CnMNIAIW6sBkTXYtNp
 DVDOxwWzGQytzG4vgGZoPAbA9QgNHVfvIbn/9RL7AYhRzbxXL8fupRGRSzxQbbsPu8HX
 GtHTCCoSwxO0/UhsPZi+7jPl32Yg9yL+IYUGc1GgszZVrSEDKFx9zGlumsvdKwPSRqCT
 EdoQcHEhxYGBPBsIf+RTgle7ehhiUyAURmGvQLBM84vFpSY3XAG+yGjPcvroooJLM5rX
 sUEw==
X-Gm-Message-State: AGi0PubREuM0dOQhhaQT6o9MsycTmWgkIrcXTB98hZI1XAVtPjo+PjoB
 GnPZi4UWMLmb/nDd32RZgub3k+IRx/8=
X-Google-Smtp-Source: APiQypLR46CdyNcJlUI6nV5xgk1vjwfU9n2fBxYWf/SpCFTUy+EEps+/pDPxhOqWbF8EwnSlai0XgQ==
X-Received: by 2002:a1c:7fc6:: with SMTP id a189mr34970700wmd.27.1589263232092; 
 Mon, 11 May 2020 23:00:32 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:00:31 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 08:00:23 +0200
Message-Id: <20200512060023.684871-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_230033_354396_772484BD 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIGN1cnJlbnQgY29kZSBnZW5lcmF0ZXMgOCBvb2Igc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04
ClMyCTktMTUKUzMJMTYtMjEKRUNDCTIyLTI0ClM0CTI1LTMxClM1CTMyLTM3CkVDQwkzOC00MApT
Ngk0MS00NwpTNwk0OC01MwpFQ0MJNTQtNTYKUzgJNTctNjMKCkNoYW5nZSBpdCBieSBtZXJnaW5n
IGNvbnRpbnVvdXMgc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04ClMyCTktMjEKRUNDCTIyLTI0ClMz
CTI1LTM3CkVDQwkzOC00MApTNAk0MS01MwpFQ0MJNTQtNTYKUzUJNTctNjMKCkZpeGVzOiBlZjVl
ZWVhNmU5MTEgKCJtdGQ6IG5hbmQ6IGJyY206IHN3aXRjaCB0byBtdGRfb29ibGF5b3V0X29wcyIp
ClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5j
b20+Ci0tLQogdjM6IGludmVydCBwYXRjaCBvcmRlcgogdjI6IGtlZXAgb3JpZ2luYWwgY29tbWVu
dCBhbmQgZml4IGNvcnJlY3RseSBza2lwIGJ5dGUgNiBmb3Igc21hbGwtcGFnZSBuYW5kCgogZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDM3ICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IDFjMTA3
MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKQEAgLTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1t
aW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAlz
dHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7CiAJaW50IHNhcyA9IGNmZy0+
c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVfMWs7CiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7CisJdTMyIG5leHQ7
CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICogMikKKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMp
CiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIp
ICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNhcyk7CisJaWYgKHNlY3Rpb24gPCBzZWN0b3Jz
KQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlvbiAmIDEpIHsKLQkJb29icmVnaW9uLT5vZmZz
ZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGggPSA3OworCWlmIChzZWN0aW9uKSB7CisJCW9v
YnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBzYXMpICsgOTsKIAl9IGVsc2Ugewot
CQlvb2JyZWdpb24tPmxlbmd0aCA9IDY7Ci0KLQkJLyogRmlyc3Qgc2VjdG9yIG9mIGVhY2ggcGFn
ZSBtYXkgaGF2ZSBCQkkgKi8KLQkJaWYgKCFzZWN0aW9uKSB7Ci0JCQkvKgotCQkJICogU21hbGwt
cGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3aGlsZSBsYXJnZS1wYWdlCi0JCQkgKiBOQU5E
IHVzZSBieXRlcyAwIGFuZCAxLgotCQkJICovCi0JCQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIp
IHsKLQkJCQlvb2JyZWdpb24tPm9mZnNldCArPSAyOwotCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09
IDI7Ci0JCQl9IGVsc2UgewotCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoLS07Ci0JCQl9CisJCS8qCisJ
CSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hpbGUgbGFyZ2UtcGFnZQor
CQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgorCQkgKi8KKwkJaWYgKGNmZy0+cGFnZV9zaXpl
ID4gNTEyKSB7CisJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7CisJCX0gZWxzZSB7CisJCQlvb2Jy
ZWdpb24tPm9mZnNldCA9IDA7CisJCQluZXh0LS07CiAJCX0KIAl9CiAKKwlvb2JyZWdpb24tPmxl
bmd0aCA9IG5leHQgLSBvb2JyZWdpb24tPm9mZnNldDsKKwogCXJldHVybiAwOwogfQogCi0tIAoy
LjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
