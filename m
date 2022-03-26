Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794AAC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Mar 2022 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v+7nZKE2mtDj/YWKLGdBtbjblC/woGh099/pYAXF904=; b=fUWRba5Bo3yqUK
	cw4q0GD75RAwAR59GaKczl3GwUJX3uOhE3rObTPmcO7LYg6N/ASP5vyVMsbQFcPdeCwKRZD9/WaGn
	a3biMzC0s/aj956j48C9FfhRZ1jS/RqzaZVxWR9txamMEjANkNz2sz58UwqJLi+TwORaPpJwxdxvV
	V+rZ/Hf3uxcFsxyABLGaPhFIlE+5EUsWugRZyh16VmPAO3VNv3wM2MbEsmRoI/nLeXUkDsEmmcyGI
	80FjTT6Fdb3LezRDg97s6hD/05yt5rTuIfpK46LZwUYPDYhS5Nblo+0pZf10pBHHjBfgwLxXhxV3/
	qcuvsLDMGE4pEkSjuqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY9Lv-004Y8q-C5; Sat, 26 Mar 2022 16:33:23 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY9Lr-004Y7x-BI
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2022 16:33:20 +0000
Received: by mail-lj1-x233.google.com with SMTP id u3so13961472ljd.0
 for <linux-mtd@lists.infradead.org>; Sat, 26 Mar 2022 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b/o6cWXwPEfNmyBK8+mkZmSj3tnXxybCImM/tuFapz8=;
 b=QGxDXKm9i/Nj+8JlKctiGaLJzLxk5EdPrHap5dio8KMADv6YYFhF6JiJhtjIy5WWi6
 +Namhw1f9d8Dv+jucxZdZvJ/21uF6WKw1jrPevBqqXXyMPHFx5lz0Owtl/yfAtV71j2B
 9+pZd4aKhxbu5la5UajtcIkwTu8St3gLxJ1pOeQwA/ensD7+Nx4coN1jXMsiB54hVdLp
 gX99hd4z3rpIEj1Q1zdbGgCnL+R6kkVfXZngMK4GllGY5M7FUjCPYDJISz4O4ULkDlV1
 Q17KcH5jyb0npzNTfZsoonXQayALOKjz0xD8XvBH6fLXo7HPyKR9oCagXRWBvV+/CbYt
 JttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b/o6cWXwPEfNmyBK8+mkZmSj3tnXxybCImM/tuFapz8=;
 b=ws3sPulcUHzy8ippnvgUZPCcK3jkogU5X3Nb/ur5Txi3qplyA1XqBJgLBz+4j57a1C
 nDSsxGeBF/ss5fGJNZv+tYXROU6ClOQql0KgaVmOqj3hF0PB2dDl+yz907Epb9PtDyna
 JIWr57vW+N06/sTJhxc/1u4LCwZRMROfWFi8JOdZX4W6vWXir5bwzbNCIQqa5XNPlPqw
 1XC8f94ST3EPBdVKWuk6lnqzQu/iIFjc/cgLeyY75h+Ce4GZfuJGvwg3oBjf2M897jjn
 V02GXfnHfQqHFrAI5rae/JPvs8Btbm/DUXMHeG/3qccN+umIwXoI/bu9cwyr3WLWm2qJ
 cy6w==
X-Gm-Message-State: AOAM5339wC5J+yRS0dtT2JOI13VSIM6UAQlVudx+y8upd+29YEHTUKkx
 iDdxlgV9GEn3sjQEdaRXVJoEbH6uZ1w=
X-Google-Smtp-Source: ABdhPJw1JFrhxhw/l4u6j7I1006Cj4hARVom1Ql4peXbHL+NFrXU0fCY2QCc1Dfk+vUIML8Gryb8aw==
X-Received: by 2002:a05:651c:1783:b0:249:43a8:b6f9 with SMTP id
 bn3-20020a05651c178300b0024943a8b6f9mr12381110ljb.273.1648312392718; 
 Sat, 26 Mar 2022 09:33:12 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 w22-20020a2e9996000000b00249824260f8sm1073407lji.25.2022.03.26.09.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 09:33:12 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: rawnand: print offset instead of page number for bad
 blocks
Date: Sat, 26 Mar 2022 17:33:04 +0100
Message-Id: <20220326163304.30806-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_093319_445291_CF67A071 
X-CRM114-Status: GOOD (  12.12  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBtYWtlcyBwcmlu
dGVkIGluZm8gY29uc2lzdGVudCB3aXRoIG90aGVyIGtlcm5lbCBtZXNzYWdlcy4gQWZ0ZXIKc2Nh
bm5pbmcgTkFORCBCQlQgY3JlYXRlX2JidCgpIHByaW50cyBvZmZzZXQgb2YgZWFjaCBiYWQgYmxv
Y2suIFRoaXMKY2hhbmdlIG1ha2VzIGlzIGVhc3kgdG8gdmVyaWZ5IG5hbmRfZXJhc2VfbmFuZCgp
IGZhaWx1cmUgcmVhc29uLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgotLS0KSSBub3RpY2VkIHRoaXMgaW5jb25zaXN0ZW5jeSB3aGlsZSB1c2luZyAi
Zmxhc2hfZXJhc2UiIHRvb2wuCi0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
fCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCmluZGV4IDI4NGZmZjYyYWM0OS4uNmI2N2I3
ZGZlN2NlIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYworKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwpAQCAtNDUwMiwxMSArNDUwMiwxMyBA
QCBpbnQgbmFuZF9lcmFzZV9uYW5kKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHN0cnVjdCBlcmFz
ZV9pbmZvICppbnN0ciwKIAlsZW4gPSBpbnN0ci0+bGVuOwogCiAJd2hpbGUgKGxlbikgeworCQls
b2ZmX3Qgb2ZzID0gKGxvZmZfdClwYWdlIDw8IGNoaXAtPnBhZ2Vfc2hpZnQ7CisKIAkJLyogQ2hl
Y2sgaWYgd2UgaGF2ZSBhIGJhZCBibG9jaywgd2UgZG8gbm90IGVyYXNlIGJhZCBibG9ja3MhICov
CiAJCWlmIChuYW5kX2Jsb2NrX2NoZWNrYmFkKGNoaXAsICgobG9mZl90KSBwYWdlKSA8PAogCQkJ
CQljaGlwLT5wYWdlX3NoaWZ0LCBhbGxvd2JidCkpIHsKLQkJCXByX3dhcm4oIiVzOiBhdHRlbXB0
IHRvIGVyYXNlIGEgYmFkIGJsb2NrIGF0IHBhZ2UgMHglMDh4XG4iLAotCQkJCSAgICBfX2Z1bmNf
XywgcGFnZSk7CisJCQlwcl93YXJuKCIlczogYXR0ZW1wdCB0byBlcmFzZSBhIGJhZCBibG9jayBh
dCAweCUwOGxseFxuIiwKKwkJCQkgICAgX19mdW5jX18sICh1bnNpZ25lZCBsb25nIGxvbmcpb2Zz
KTsKIAkJCXJldCA9IC1FSU87CiAJCQlnb3RvIGVyYXNlX2V4aXQ7CiAJCX0KQEAgLTQ1MjQsOCAr
NDUyNiw3IEBAIGludCBuYW5kX2VyYXNlX25hbmQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgc3Ry
dWN0IGVyYXNlX2luZm8gKmluc3RyLAogCQlpZiAocmV0KSB7CiAJCQlwcl9kZWJ1ZygiJXM6IGZh
aWxlZCBlcmFzZSwgcGFnZSAweCUwOHhcbiIsCiAJCQkJCV9fZnVuY19fLCBwYWdlKTsKLQkJCWlu
c3RyLT5mYWlsX2FkZHIgPQotCQkJCSgobG9mZl90KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdCk7
CisJCQlpbnN0ci0+ZmFpbF9hZGRyID0gb2ZzOwogCQkJZ290byBlcmFzZV9leGl0OwogCQl9CiAK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
