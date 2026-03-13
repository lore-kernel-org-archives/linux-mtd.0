Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACAB107BCEA
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 22:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9sRWUykDfK9VD6/yKApQpZiEnVVMBTiTVCSlwpL524c=; b=myO34s594Nt/BK
	6Q83ouZJHW03L5UPrLQWR50QQvLPUg+qPk9BPysfN9Oan9vcy1RVAZfROYG4okoWKfD/Onu97gxHr
	SrDqzLgwsnvOc1eu9OAqYZEYsJSknjjqQzuDCF5fbMJWULqNbyJ+JtrvJBbTrdUtKz3ZmU4IluluL
	FnfL9ykEqGCbSgx24flCPfN7IWsVTTPbBdyPKwwJHdxoR38OzkHTwpjff6GBzCObgW7an9k0OaaYt
	y3aTU4st+VUzLa3sZHMlWW9hzDDlwlNRYKBFa/wg7Re/p+rGrzUAntFGHN9Eu9oV3BO8KtgKa5FKd
	Leg/eMY7HEsFQg8mvNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Atg-00000001Go6-1Q7L;
	Fri, 13 Mar 2026 22:22:20 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Atc-00000001GnC-1ncZ
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 22:22:18 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8cd847b4b23so252359285a.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2026 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773440534; x=1774045334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Xo0VIRGWBMscIHAKCkeaIwKDfwRPDfJ7/cA8YRyy3s=;
        b=CO4LwePPpv0LLXuz1feC0BbHJgR3Vvu6oY88lmJ/wb0BHI8Cwhr4FxQs8b3+fslUjM
         TmQ4i34QQH7Y6+MQ0pW9liHpmMufTTwqvTJsBwZM+Ylsg5neGaNnol+R/BNl//WteeTW
         K+G3fvunvcN4VP2Q5O1rrC4plM4F4qCXdR4efaqPZ0tQVRAIej+QeSpxwIwGrnZ3GEeO
         7ObKyQz83Oh3Rjb1QMTgGwXzVmtQQtQCe8if53yNY+8CkrV0pWuVMPVxjDPe8THQs01i
         zqmS/fQtEVoAudu5QV9IJvyt2c1J5lyTwXzH9I2zF7jFkrVZ1GgWQL17yjt5lWJQRTjq
         4DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773440534; x=1774045334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xo0VIRGWBMscIHAKCkeaIwKDfwRPDfJ7/cA8YRyy3s=;
        b=jt10FWFe5ggP1tmpirEXQKjrsGn7ZLXsIRgvbw+EM0pah8Xvyps+OWpQbV8MrQykMx
         SiuluQAbo+MbBXy+QkwrwB9YgvDb16Hvtz46fEzqc/7jktEmN8jSsMVon4KKur1SLdLn
         90qUfrY2hVbcteqO2+1re8d69Slv0xnAmflEUtAJcEuXPePQ2BCga7BvhDEGFjJqOXbg
         HzXdg8JmD4BkNYrCRZsEikCTRdp9Fwk5Rl4WBcekFoosxa1Vq2aBh0n1KU0KFA8QHhNI
         tPPqXRUTLP4ngCEYbo9XfWVsjGJ+KEV2SqCz64q7UdCFCl/MJcOVmgK0XeeXjAH2s6fF
         1U5w==
X-Gm-Message-State: AOJu0YyV+SspOXZLtpz6XKjcatNiwm3pNFRorR67YaFsPL5hL3t0xgYt
	drQXqrpFhLz8EssKQgb9gGXoD72Qn9kY2E2jRGUWI2YTZyZmEs2nviaB
X-Gm-Gg: ATEYQzyZIQLDq56n4mffRHJU7j3V2dcrdyMsndV0YCWQoW4gnw/3oldrNY7W3PjCdJ9
	rA8etR8HewpaQPSf1mRvuw8EwpKLj1lb6UtxZLWx9eIJJUv0qJTdUZ0JqudGukmNmPOFxNWe901
	djfRtnMszxLfa8R4USJz+hzMUlknoPnWQI4uAqBDGa+7tEcdvT/MOUqYQM31dML1bSp1m+Alwbt
	QnWnrm6hrAeK/h+liv+v+Txlp3a7vdqDruBVrcywAvvKYTi/Z3YkGUh4V7RhWM7OqocB2fnpJlc
	7+WXTijdIvVX4NLQ/R2RGeEiN0AkY/BbikUa+VpabdHY3vWclVD/fCO4AalCmBjLWzOR65Wx4eS
	+TPQdMTC+u0mTS43du7jd1q6vDkeZlYxfkmUqTcTlO8cn8H5ENem2OSdUrgVXsMJpKDB/v0C/vT
	KAyky7fvE9DQJ5y1jdxyPf2mgoo44G513LzNxLIUeHcPpT
X-Received: by 2002:a05:620a:4693:b0:8cd:92e7:718a with SMTP id af79cd13be357-8cdb5b25d03mr718459885a.38.1773440534301;
        Fri, 13 Mar 2026 15:22:14 -0700 (PDT)
Received: from 192-222-50-213.ll.local ([192.222.50.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda213e643sm752130985a.38.2026.03.13.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 15:22:14 -0700 (PDT)
From: Jenny Guanni Qu <qguanni@gmail.com>
To: richard@nod.at,
	chengzhihao1@huawei.com
Cc: linux-mtd@lists.infradead.org,
	klaudia@vidocsecurity.com,
	dawid@vidocsecurity.com,
	Jenny Guanni Qu <qguanni@gmail.com>
Subject: [PATCH] ubifs: fix out-of-bounds write in LPT commit padding
Date: Fri, 13 Mar 2026 22:22:13 +0000
Message-Id: <20260313222213.2181408-1-qguanni@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_152216_507707_BFC31D71 
X-CRM114-Status: GOOD (  13.19  )
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

SW4gd3JpdGVfY25vZGVzKCksIHdoZW4gd3JpdGluZyBMUFQgZGF0YSB0byBhIExFQiwgdGhlIGNv
ZGUgcGFkcyB0aGUKd3JpdGUgYnVmZmVyIHRvIG1pbl9pb19zaXplIGFsaWdubWVudCB1c2luZzoK
CiAgICBtZW1zZXQoYnVmICsgb2ZmcywgMHhmZiwgYWxlbiAtIHdsZW4pCgp3aGVyZSB3bGVuID0g
b2ZmcyAtIGZyb20gYW5kIGFsZW4gPSBBTElHTih3bGVuLCBtaW5faW9fc2l6ZSkuIFRoZQpidWZm
ZXIgKGMtPmxwdF9idWYpIGlzIGFsbG9jYXRlZCB3aXRoIHNpemUgYy0+bGViX3NpemUuIFdoZW4g
b2ZmcyBpcwpuZWFyIGxlYl9zaXplIGFuZCBmcm9tIGlzIG5vbi16ZXJvLCB0aGUgYWxpZ25tZW50
IHBhZGRpbmcgY2FuIHB1c2gKdGhlIG1lbXNldCBwYXN0IHRoZSBlbmQgb2YgdGhlIGJ1ZmZlci4K
CkZvciBleGFtcGxlLCB3aXRoIGxlYl9zaXplPTQwOTYsIG9mZnM9NDAwMCwgZnJvbT0zNTg0LCBt
aW5faW9fc2l6ZT0xMDI0OgogIHdsZW49NDE2LCBhbGVuPTEwMjQsIHBhZGRpbmc9NjA4IGJ5dGVz
IGF0IG9mZnNldCA0MDAwCiAgd3JpdGVzIHRvIG9mZnNldHMgNDAwMC4uNDYwNywgNTEyIGJ5dGVz
IHBhc3QgdGhlIDQwOTYtYnl0ZSBidWZmZXIKCkNsYW1wIHRoZSBwYWRkaW5nIHNpemUgdG8gbm90
IGV4Y2VlZCB0aGUgYnVmZmVyIGJvdW5kYXJ5IGluIGFsbCA0Cmluc3RhbmNlcyBvZiB0aGlzIHBh
dHRlcm4uCgpUaGUgT09CIHdyaXRlIHdhcyBjb25maXJtZWQgd2l0aCBLQVNBTiB1c2luZyBhIHRl
c3QgbW9kdWxlIHRoYXQKcmVwcm9kdWNlcyB0aGUgYXJpdGhtZXRpYyB3aXRoIG1hdGNoaW5nIGJ1
ZmZlciBhbmQgYWxpZ25tZW50IHZhbHVlcy4KCkZpeGVzOiAxZTUxNzY0YTNjMmEgKCJVQklGUzog
YWRkIG5ldyBmbGFzaCBmaWxlIHN5c3RlbSIpClJlcG9ydGVkLWJ5OiBLbGF1ZGlhIEtsb2MgPGts
YXVkaWFAdmlkb2NzZWN1cml0eS5jb20+ClJlcG9ydGVkLWJ5OiBEYXdpZCBNb2N6YWTFgm8gPGRh
d2lkQHZpZG9jc2VjdXJpdHkuY29tPgpUZXN0ZWQtYnk6IEplbm55IEd1YW5uaSBRdSA8cWd1YW5u
aUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEplbm55IEd1YW5uaSBRdSA8cWd1YW5uaUBnbWFp
bC5jb20+Ci0tLQogZnMvdWJpZnMvbHB0X2NvbW1pdC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy91
Ymlmcy9scHRfY29tbWl0LmMgYi9mcy91Ymlmcy9scHRfY29tbWl0LmMKaW5kZXggMDczNTFmZGNl
NzIyLi43N2E3YTJjZDQxOGYgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2xwdF9jb21taXQuYworKysg
Yi9mcy91Ymlmcy9scHRfY29tbWl0LmMKQEAgLTQwMiw3ICs0MDIsNyBAQCBzdGF0aWMgaW50IHdy
aXRlX2Nub2RlcyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKIAkJCXdsZW4gPSBvZmZzIC0gZnJvbTsK
IAkJCWlmICh3bGVuKSB7CiAJCQkJYWxlbiA9IEFMSUdOKHdsZW4sIGMtPm1pbl9pb19zaXplKTsK
LQkJCQltZW1zZXQoYnVmICsgb2ZmcywgMHhmZiwgYWxlbiAtIHdsZW4pOworCQkJCW1lbXNldChi
dWYgKyBvZmZzLCAweGZmLCBtaW5fdChpbnQsIGFsZW4gLSB3bGVuLCBjLT5sZWJfc2l6ZSAtIG9m
ZnMpKTsKIAkJCQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYnVmICsgZnJvbSwgZnJv
bSwKIAkJCQkJCSAgICAgICBhbGVuKTsKIAkJCQlpZiAoZXJyKQpAQCAtNDYxLDcgKzQ2MSw3IEBA
IHN0YXRpYyBpbnQgd3JpdGVfY25vZGVzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQogCQlpZiAob2Zm
cyArIGMtPmxzYXZlX3N6ID4gYy0+bGViX3NpemUpIHsKIAkJCXdsZW4gPSBvZmZzIC0gZnJvbTsK
IAkJCWFsZW4gPSBBTElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7Ci0JCQltZW1zZXQoYnVmICsg
b2ZmcywgMHhmZiwgYWxlbiAtIHdsZW4pOworCQkJbWVtc2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIG1p
bl90KGludCwgYWxlbiAtIHdsZW4sIGMtPmxlYl9zaXplIC0gb2ZmcykpOwogCQkJZXJyID0gdWJp
ZnNfbGViX3dyaXRlKGMsIGxudW0sIGJ1ZiArIGZyb20sIGZyb20sIGFsZW4pOwogCQkJaWYgKGVy
cikKIAkJCQlyZXR1cm4gZXJyOwpAQCAtNDg3LDcgKzQ4Nyw3IEBAIHN0YXRpYyBpbnQgd3JpdGVf
Y25vZGVzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQogCQlpZiAob2ZmcyArIGMtPmx0YWJfc3ogPiBj
LT5sZWJfc2l6ZSkgewogCQkJd2xlbiA9IG9mZnMgLSBmcm9tOwogCQkJYWxlbiA9IEFMSUdOKHds
ZW4sIGMtPm1pbl9pb19zaXplKTsKLQkJCW1lbXNldChidWYgKyBvZmZzLCAweGZmLCBhbGVuIC0g
d2xlbik7CisJCQltZW1zZXQoYnVmICsgb2ZmcywgMHhmZiwgbWluX3QoaW50LCBhbGVuIC0gd2xl
biwgYy0+bGViX3NpemUgLSBvZmZzKSk7CiAJCQllcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51
bSwgYnVmICsgZnJvbSwgZnJvbSwgYWxlbik7CiAJCQlpZiAoZXJyKQogCQkJCXJldHVybiBlcnI7
CkBAIC01MTAsNyArNTEwLDcgQEAgc3RhdGljIGludCB3cml0ZV9jbm9kZXMoc3RydWN0IHViaWZz
X2luZm8gKmMpCiAJLyogV3JpdGUgcmVtYWluaW5nIGRhdGEgaW4gYnVmZmVyICovCiAJd2xlbiA9
IG9mZnMgLSBmcm9tOwogCWFsZW4gPSBBTElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7Ci0JbWVt
c2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIGFsZW4gLSB3bGVuKTsKKwltZW1zZXQoYnVmICsgb2Zmcywg
MHhmZiwgbWluX3QoaW50LCBhbGVuIC0gd2xlbiwgYy0+bGViX3NpemUgLSBvZmZzKSk7CiAJZXJy
ID0gdWJpZnNfbGViX3dyaXRlKGMsIGxudW0sIGJ1ZiArIGZyb20sIGZyb20sIGFsZW4pOwogCWlm
IChlcnIpCiAJCXJldHVybiBlcnI7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
