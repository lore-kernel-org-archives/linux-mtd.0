Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E7AC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAXUmuMka35q59xJ7GBgl9m7FppdrqK+cIGbWIi99zw=; b=npJrLfChoeSc6m
	W8dpu46YxYSHF4G+143ud7N9qgZxI/8j5pxIpwMKSWWejv0J8NMNd0/WjgXyDVVdiRhpsFOAmrNzg
	vxscoT2KaCuP7dEKWlgau6CSSJ80ayd565KGb8cfvjob3YBfKc1bR1yS0QT1FzVLCzTne6bf0/3CO
	Q1/BaBqNM2ge/LMp8uQmc5kyegB6RxreGCAM5wReTCbYWiQSUOm+7779TakTUdt1P47w+YmExJRrt
	EYZLsHMTwo4Ysmv4VWZLMB1k7znA879ycl8hz5x9owtr/0AMb9mihxboYIHYLr3b29IKUaSfnHl5V
	j/7daLclEJka4CRDfdUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okezy-002jKF-8L; Tue, 18 Oct 2022 05:18:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okezv-002jJo-QX
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 05:18:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a26so29563161ejc.4
        for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2022 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j73kGLh0CnJEA8KnzgX0A0r/cABVpro+6vQk9HncJpg=;
        b=HPM+bXAoy7ZCGnX1ENmyyLnoOj1MsxDh81UXLrwDS6oDXnjQIF0tR9ya+iaMncS7Py
         Yofod3cbYMmVsroPLZTZafFGdSJa8LYW4YszWMIsoCg1RsItyNAKxSK6+E2al7e9WSr5
         cUo+0BkCq/IETi8paiV2XEzNTTx7nH7M3QoPI3KE4J/AF4C5ogYMgzRPGuRYwRDrWMC1
         yd9/mou9OQXgcPwrmF9/CKtiBxJo6USDFx4pBzsBfHsgxbk08nKUuAdM0k14q5ZLl7Vg
         ejhBTU42HrIQVOfSVQ/Weul9Mg0lax4uRy1dnt6TFdfp5LmdtczQ2w90FQYt/RxI5nsn
         wFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j73kGLh0CnJEA8KnzgX0A0r/cABVpro+6vQk9HncJpg=;
        b=T5X0+Mfp7Byq73rKqJvRdij6dX+iHk9VlQ+qu6CTQ2qUQGrcyfdPFPqsw1RX3DAHWw
         IosVT1zyEYImNPY+rwQJVO6KDQaojCBQmp4gOr+GRhi+6De6xmfcosD6kG9RSZPRw/Np
         S7zlzRdyZjH6yu1kkVHluq6mci1GSP0upiuIbZQcGo1lAQfdU1dUm+ksVWezPA5gJ0R+
         L9U8NYCatd7Pp/R5cVcwaWLRMNZYku8MMfXvIipPbQAc5pLXwxV5lUKUzrFwX8ouZKBx
         Z+PvhQ+BiVoUx7BTgh8xEXFSwlBzlwWLgON7kZVRWTOQUQKXxAKDrIgaXB2iptSKebBR
         y+cA==
X-Gm-Message-State: ACrzQf1akmaeTJwlbNGWCVeSYgMerNhckMeIst35t8VRQ+Oi4H7cOj7g
	UXgMHFQVNQF9gBJAeNMO2bI=
X-Google-Smtp-Source: AMsMyM7DQM4qAkztotBGoCndm0OpFV4XYyapcgIRc7FaoNgsz+rqrtoXt5hCvVJsWqhdQaouCxCgJw==
X-Received: by 2002:a17:907:94d1:b0:790:65a:3a18 with SMTP id dn17-20020a17090794d100b00790065a3a18mr914228ejc.428.1666070314483;
        Mon, 17 Oct 2022 22:18:34 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090657c800b0078c1e174e11sm6908594ejr.136.2022.10.17.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:18:33 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Han Xu <han.xu@nxp.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 6.1 FIX] mtd: core: add missing of_node_get() in dynamic partitions code
Date: Tue, 18 Oct 2022 07:18:22 +0200
Message-Id: <20221018051822.28685-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_221839_906053_F83ED57E 
X-CRM114-Status: GOOD (  14.95  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBmaXhlcyB1bmJh
bGFuY2VkIG9mX25vZGVfcHV0KCk6ClsgICAgMS4wNzg5MTBdIDYgY21kbGluZXBhcnQgcGFydGl0
aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIGdwbWktbmFuZApbICAgIDEuMDg1MTE2XSBDcmVhdGlu
ZyA2IE1URCBwYXJ0aXRpb25zIG9uICJncG1pLW5hbmQiOgpbICAgIDEuMDkwMTgxXSAweDAwMDAw
MDAwMDAwMC0weDAwMDAwODAwMDAwMCA6ICJuYW5kYm9vdCIKWyAgICAxLjA5Njk1Ml0gMHgwMDAw
MDgwMDAwMDAtMHgwMDAwMDkwMDAwMDAgOiAibmFuZGZpdCIKWyAgICAxLjEwMzU0N10gMHgwMDAw
MDkwMDAwMDAtMHgwMDAwMGIwMDAwMDAgOiAibmFuZGtlcm5lbCIKWyAgICAxLjExMDMxN10gMHgw
MDAwMGIwMDAwMDAtMHgwMDAwMGMwMDAwMDAgOiAibmFuZGR0YiIKWyAgICAxLjExNTUyNV0gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgICAgMS4xMjAxNDFdIHJlZmNvdW50
X3Q6IGFkZGl0aW9uIG9uIDA7IHVzZS1hZnRlci1mcmVlLgpbICAgIDEuMTI1MzI4XSBXQVJOSU5H
OiBDUFU6IDAgUElEOiAxIGF0IGxpYi9yZWZjb3VudC5jOjI1IHJlZmNvdW50X3dhcm5fc2F0dXJh
dGUrMHhkYy8weDE0OApbICAgIDEuMTMzNTI4XSBNb2R1bGVzIGxpbmtlZCBpbjoKWyAgICAxLjEz
NjU4OV0gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi4wLjAtcmM3
LW5leHQtMjAyMjA5MzAtMDQ1NDMtZzhjZjNmNwpbICAgIDEuMTQ2MzQyXSBIYXJkd2FyZSBuYW1l
OiBGcmVlc2NhbGUgaS5NWDhEWEwgRERSM0wgRVZLIChEVCkKWyAgICAxLjE1MTk5OV0gcHN0YXRl
OiA2MDAwMDBjNSAoblpDdiBkYUlGIC1QQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0p
ClsgICAgMS4xNTg5NjVdIHBjIDogcmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGRjLzB4MTQ4Clsg
ICAgMS4xNjM3NjBdIGxyIDogcmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGRjLzB4MTQ4ClsgICAg
MS4xNjg1NTZdIHNwIDogZmZmZjgwMDAwOWRkYjA4MApbICAgIDEuMTcxODY2XSB4Mjk6IGZmZmY4
MDAwMDlkZGIwODAgeDI4OiBmZmZmODAwMDA5ZGRiMzVhIHgyNzogMDAwMDAwMDAwMDAwMDAwMgpb
ICAgIDEuMTc5MDE1XSB4MjY6IGZmZmY4MDAwMDk4YjA2YWQgeDI1OiBmZmZmZmZmZmZmZmZmZmZm
IHgyNDogZmZmZjBhMDBmZmZmZmYwNQpbICAgIDEuMTg2MTY1XSB4MjM6IGZmZmYwMDAwMWZkZjY0
NzAgeDIyOiBmZmZmODAwMDA5ZGRiMzY3IHgyMTogMDAwMDAwMDAwMDAwMDAwMApbICAgIDEuMTkz
MzE0XSB4MjA6IGZmZmYwMDAwMWZkZmViZTggeDE5OiBmZmZmMDAwMDFmZGZlYzUwIHgxODogZmZm
ZmZmZmZmZmZmZmZmZgpbICAgIDEuMjAwNDY0XSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2OiAw
MDAwMDAwMDAwMDAwMTE4IHgxNTogMDAwMDAwMDAwMDAwMDAwNApbICAgIDEuMjA3NjE0XSB4MTQ6
IDAwMDAwMDAwMDAwMDBmZmYgeDEzOiBmZmZmODAwMDA5YmNhMjQ4IHgxMjogMDAwMDAwMDAwMDAw
MDAwMwpbICAgIDEuMjE0NzY0XSB4MTE6IDAwMDAwMDAwZmZmZmVmZmYgeDEwOiBjMDAwMDAwMGZm
ZmZlZmZmIHg5IDogNDc2MmNiMmNjYjUyZGUwMApbICAgIDEuMjIxOTE0XSB4OCA6IDQ3NjJjYjJj
Y2I1MmRlMDAgeDcgOiAyMDVkMzEzNDMxMzAzMjMxIHg2IDogMzEyZTMxMjAyMDIwMjA1YgpbICAg
IDEuMjI5MDYzXSB4NSA6IGZmZmY4MDAwMDlkNTVjMWYgeDQgOiAwMDAwMDAwMDAwMDAwMDAxIHgz
IDogMDAwMDAwMDAwMDAwMDAwMApbICAgIDEuMjM2MjEzXSB4MiA6IDAwMDAwMDAwMDAwMDAwMDAg
eDEgOiBmZmZmODAwMDA5OTU0YmU2IHgwIDogMDAwMDAwMDAwMDAwMDAyYQpbICAgIDEuMjQzMzY1
XSBDYWxsIHRyYWNlOgpbICAgIDEuMjQ1ODA2XSAgcmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGRj
LzB4MTQ4ClsgICAgMS4yNTAyNTNdICBrb2JqZWN0X2dldCsweDk4LzB4OWMKWyAgICAxLjI1MzY1
OF0gIG9mX25vZGVfZ2V0KzB4MjAvMHgzNApbICAgIDEuMjU3MDcyXSAgb2ZfZndub2RlX2dldCsw
eDNjLzB4NTQKWyAgICAxLjI2MDY1Ml0gIGZ3bm9kZV9nZXRfbnRoX3BhcmVudCsweGQ4LzB4ZjQK
WyAgICAxLjI2NDkyNl0gIGZ3bm9kZV9mdWxsX25hbWVfc3RyaW5nKzB4M2MvMHhiNApbICAgIDEu
MjY5MzczXSAgZGV2aWNlX25vZGVfc3RyaW5nKzB4NDk4LzB4NWI0ClsgICAgMS4yNzM1NjFdICBw
b2ludGVyKzB4NDFjLzB4NWQwClsgICAgMS4yNzY3OTNdICB2c25wcmludGYrMHg0ZDgvMHg2OTQK
WyAgICAxLjI4MDE5OF0gIHZwcmludGtfc3RvcmUrMHgxNjQvMHg1MjgKWyAgICAxLjI4Mzk1MV0g
IHZwcmludGtfZW1pdCsweDk4LzB4MTY0ClsgICAgMS4yODc1MzBdICB2cHJpbnRrX2RlZmF1bHQr
MHg0NC8weDZjClsgICAgMS4yOTEyODRdICB2cHJpbnRrKzB4ZjAvMHgxMzQKWyAgICAxLjI5NDQy
OF0gIF9wcmludGsrMHg1NC8weDdjClsgICAgMS4yOTc0ODZdICBvZl9ub2RlX3JlbGVhc2UrMHhl
OC8weDEyOApbICAgIDEuMzAxMzI2XSAga29iamVjdF9wdXQrMHg5OC8weGZjClsgICAgMS4zMDQ3
MzJdICBvZl9ub2RlX3B1dCsweDFjLzB4MjgKWyAgICAxLjMwODEzN10gIGFkZF9tdGRfZGV2aWNl
KzB4NDg0LzB4NmQ0ClsgICAgMS4zMTE5NzddICBhZGRfbXRkX3BhcnRpdGlvbnMrMHhmMC8weDFk
MApbICAgIDEuMzE2MDc4XSAgcGFyc2VfbXRkX3BhcnRpdGlvbnMrMHg0NWMvMHg1MTgKWyAgICAx
LjMyMDQzOV0gIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIrMHhiMC8weDI3NApbICAgIDEuMzI1
MTQ3XSAgZ3BtaV9uYW5kX3Byb2JlKzB4NTFjLzB4NjUwClsgICAgMS4zMjkwNzRdICBwbGF0Zm9y
bV9wcm9iZSsweGE4LzB4ZDAKWyAgICAxLjMzMjc0MF0gIHJlYWxseV9wcm9iZSsweDEzMC8weDMz
NApbICAgIDEuMzM2NDA2XSAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4YjQvMHhlMApbICAgIDEu
MzQwNjgxXSAgZHJpdmVyX3Byb2JlX2RldmljZSsweDNjLzB4MWY4ClsgICAgMS4zNDQ4NjldICBf
X2RyaXZlcl9hdHRhY2grMHhkYy8weDFhNApbICAgIDEuMzQ4NzA4XSAgYnVzX2Zvcl9lYWNoX2Rl
disweDgwLzB4Y2MKWyAgICAxLjM1MjU0OF0gIGRyaXZlcl9hdHRhY2grMHgyNC8weDMwClsgICAg
MS4zNTYxMjddICBidXNfYWRkX2RyaXZlcisweDEwOC8weDFmNApbICAgIDEuMzU5OTY3XSAgZHJp
dmVyX3JlZ2lzdGVyKzB4NzgvMHgxMTQKWyAgICAxLjM2MzgwN10gIF9fcGxhdGZvcm1fZHJpdmVy
X3JlZ2lzdGVyKzB4MjQvMHgzMApbICAgIDEuMzY4NTE1XSAgZ3BtaV9uYW5kX2RyaXZlcl9pbml0
KzB4MWMvMHgyOApbICAgIDEuMzcyNzk4XSAgZG9fb25lX2luaXRjYWxsKzB4YmMvMHgyMzgKWyAg
ICAxLjM3NjYzOF0gIGRvX2luaXRjYWxsX2xldmVsKzB4OTQvMHhiNApbICAgIDEuMzgwNTY1XSAg
ZG9faW5pdGNhbGxzKzB4NTQvMHg5NApbICAgIDEuMzg0MDU4XSAgZG9fYmFzaWNfc2V0dXArMHgx
Yy8weDI4ClsgICAgMS4zODc3MjRdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDExMC8weDE4OApb
ICAgIDEuMzkyMDg0XSAga2VybmVsX2luaXQrMHgyMC8weDFhMApbICAgIDEuMzk1NTc4XSAgcmV0
X2Zyb21fZm9yaysweDEwLzB4MjAKWyAgICAxLjM5OTE1N10gLS0tWyBlbmQgdHJhY2UgMDAwMDAw
MDAwMDAwMDAwMCBdLS0tClsgICAgMS40MDM3ODJdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQoKUmVwb3J0ZWQtYnk6IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+CkZpeGVzOiBh
ZDliMTBkMWVhYWRhMTY5ICgibXRkOiBjb3JlOiBpbnRyb2R1Y2Ugb2Ygc3VwcG9ydCBmb3IgZHlu
YW1pYyBwYXJ0aXRpb25zIikKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgpUZXN0ZWQtYnk6IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+Ci0tLQogZHJpdmVy
cy9tdGQvbXRkY29yZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCmluZGV4IDE4YWE1NDQ2MGQzNi4uMGI0Y2EwYWE0MTMyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCkBA
IC01NjIsNyArNTYyLDcgQEAgc3RhdGljIHZvaWQgbXRkX2NoZWNrX29mX25vZGUoc3RydWN0IG10
ZF9pbmZvICptdGQpCiAJaWYgKCFtdGRfaXNfcGFydGl0aW9uKG10ZCkpCiAJCXJldHVybjsKIAlw
YXJlbnQgPSBtdGQtPnBhcmVudDsKLQlwYXJlbnRfZG4gPSBkZXZfb2Zfbm9kZSgmcGFyZW50LT5k
ZXYpOworCXBhcmVudF9kbiA9IG9mX25vZGVfZ2V0KGRldl9vZl9ub2RlKCZwYXJlbnQtPmRldikp
OwogCWlmICghcGFyZW50X2RuKQogCQlyZXR1cm47CiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
