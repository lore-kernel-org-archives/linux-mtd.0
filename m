Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFB0C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:32:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E49364DF4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E49364DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JSxvr7k4Ggi37l3VVrzbg6TdVuuBZDQKTGMhbO45As=; b=aTa8YMgQLv90bXpWW4zD3O+mTS
	wOd1t8Rbuk/raiBnsXfJ6T28AWGQDMnGO1pp2Rgtfyn6eXZ2A7nnNHf/LigDoTy2QICwE5DjjYdqg
	d8J3ZCVzzTWQUtODdhddYWGyyjzkTsDf8BU58+LLgvpKPdAJjHB4JdGx8NCLaUEL65fn0+DyzhDBe
	KQ64yMNXamQLbptgjxGD5T9VcFYE4IJbWRlLdMqrVzabyNdyuPIBpa9ldQ1Ux2J0BUe7i7jscFTWu
	eg+iiP4TkaxccsVa7zEUL1M779hgpYcR1+VXBFhWrMDGFbPtLST1no3SrDrLDD/Fmsc/aVl/h5uHG
	20rm2iyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSXh-00599G-L5; Wed, 03 Mar 2021 14:32:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS9A-0053VU-2f
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KMSX1uVxYWS5tl1uR5+DDAeIaBIhtR3YVV13cbow2ak=; b=brVcDz07h91Lem+7FKTKM0s8QE
 WsQKjopTYy1bSOonsadRvcsuXxUemh9h8eKsU5S5jOtQ7VoLFcXYyQ0J+xHwuu2zkgqy4RIbK72oX
 dUObRIdThIGYMLG6FGDyq9/6ngzeAKrAe1YCzNxA2MR5oLjUHhg7opvtcKDo0hXH2BPQw3r1NoThH
 0F2jAOets3Z14RrIguS+B22lUGaHSQvpYTXxvprxSQX+vsA3tY1ubNmDK9q39SbAipGKLhuKNobcz
 mGTC3uNnoFjyINXLiv4Gj6IMoCkYGlzUjm5jbuqWQ5FhWcbUb+2Yh7MohSMkv7I2gPJFbO1ehv8C9
 J0GVHkxg==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHAH2-0007JQ-Sb
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 19:01:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z11so32921346lfb.9
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMSX1uVxYWS5tl1uR5+DDAeIaBIhtR3YVV13cbow2ak=;
 b=HufP/ozMQu1G+FM6fmfsbawxYZn4gqt67bupLimghftv0hgkHduOlnf02tFvlcNDN/
 okgm15N7uIEbLSobRqxJVKUghCrIUWIeuyBAsPKuXOeGmKBkqAhyuasJOgun4Vm0b7No
 f7HPT7KZiLz8jV7GPeFSFzwXAC8/3LlLmD9MY5WciS8a1WqTwG+bQpNRylMKRWnn/6gj
 GAqpnaTUsqjUUL1yskF79tAOU2oWm4A2h5tkUvuj4u+7aR8gdo5/tWh9UcsFTqTmnORc
 qQDApiI0rtQEsW/bWBJMGiZ32PpoUkYPzX1I7JDoK8XmJrRsTV2f9RuFKZn/UeuIiVT6
 pY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMSX1uVxYWS5tl1uR5+DDAeIaBIhtR3YVV13cbow2ak=;
 b=YZ9dFzqoDabVP78t07MsEKeTDziT2Fzj6TPGCni6nzysHFN8rBm7h72usrKmgdifhi
 03uqGlLi9IQEIYrIv790V9DDj8CgMTvVzr620J/1ATS/qjkgwr9Bqy3IPCcyRYXBKSG5
 JHiZXIagB7/4jovRpP1aV9Mu+6GVaxa2btVtXobW48tM74NfNHrcLTrUvX90/pEWKMbM
 HBOGQTv/G6TybxMXRD0MxebB6dUslBnIWX68FcAyHSQIzAcJr9UQEzstyq18vcXGtnVe
 YnovuQ/TD2pYAXbm5yqFTYEeqzk/qYwlNN7gRn8kE2WnphIdT8v1gTvg20Wg5CkXd9IP
 OqmA==
X-Gm-Message-State: AOAM530rxuUV1XsSut8vfD8LHnMDZp64l1ZsFhbYBNKVG9guj1juE0Xk
 805BmAmZnwcb/mr66wvZObg=
X-Google-Smtp-Source: ABdhPJxT+0VKmIOyspD7Cq+1Fcysq9AiAbgY+tnTourKXwBQKOBy2uxHvdA+2xW4YTvTUK5tPodxew==
X-Received: by 2002:a05:6512:1181:: with SMTP id
 g1mr8189614lfr.502.1614711634491; 
 Tue, 02 Mar 2021 11:00:34 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id x19sm587798lfr.198.2021.03.02.11.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 11:00:33 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: parsers: ofpart: limit parsing of deprecated DT syntax
Date: Tue,  2 Mar 2021 20:00:12 +0100
Message-Id: <20210302190012.1255-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_190137_942012_B144FC97 
X-CRM114-Status: GOOD (  11.85  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKRm9yIGJhY2t3YXJkIGNv
bXBhdGliaWxpdHkgb2ZwYXJ0IHN0aWxsIHN1cHBvcnRzIHRoZSBvbGQgc3ludGF4IGxpa2U6CnNw
aS1mbGFzaEAwIHsKCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CglyZWcgPSA8MHgwPjsK
CglwYXJ0aXRpb25AMCB7CgkJbGFiZWwgPSAiYm9vdGxvYWRlciI7CgkJcmVnID0gPDB4MCAweDEw
MDAwMD47Cgl9Owp9Owood2l0aG91dCAicGFydGl0aW9ucyIgc3Vibm9kZSkuCgpUaGVyZSBpcyBu
byByZWFzb24gaG93ZXZlciB0byBzdXBwb3J0IG5lc3RlZCBwYXJ0aXRpb25zIHdpdGhvdXQgYSBj
bGVhcgoiY29tcGF0aWJsZSIgc3RyaW5nIGxpa2U6CnBhcnRpdGlvbnMgewoJY29tcGF0aWJsZSA9
ICJmaXhlZC1wYXJ0aXRpb25zIjsKCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJI3NpemUtY2VsbHMg
PSA8MT47CgoJcGFydGl0aW9uQDAgewoJCWxhYmVsID0gImJvb3Rsb2FkZXIiOwoJCXJlZyA9IDww
eDAgMHgxMDAwMDA+OwoKCQlwYXJ0aXRpb25AMCB7CgkJCWxhYmVsID0gImNvbmZpZyI7CgkJCXJl
ZyA9IDwweDgwMDAwIDB4ODAwMDA+OwoJCX07Cgl9Owp9Owood2UgbmV2ZXIgb2ZmaWNpYWxseSBz
dXBwb3J0ZWQgb3IgZG9jdW1lbnRlZCB0aGF0KS4KCk1ha2Ugc3VyZSBvZnBhcnQgZG9lc24ndCBh
dHRlbXB0IHRvIHBhcnNlIGFib3ZlLgoKQ2M6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFp
bC5jb20+ClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4K
LS0tCiBkcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFy
dF9jb3JlLmMKaW5kZXggMjU4YzA2YTQyMjgzLi4wMjY1ODI5OGQ5OWEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJz
L29mcGFydF9jb3JlLmMKQEAgLTUzLDcgKzUzLDcgQEAgc3RhdGljIGludCBwYXJzZV9maXhlZF9w
YXJ0aXRpb25zKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAogCQlyZXR1cm4gMDsKIAogCW9mcGFy
dF9ub2RlID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUobXRkX25vZGUsICJwYXJ0aXRpb25zIik7Ci0J
aWYgKCFvZnBhcnRfbm9kZSkgeworCWlmICghb2ZwYXJ0X25vZGUgJiYgIW1hc3Rlci0+cGFyZW50
KSB7CiAJCS8qCiAJCSAqIFdlIG1pZ2h0IGdldCBoZXJlIGV2ZW4gd2hlbiBvZnBhcnQgaXNuJ3Qg
dXNlZCBhdCBhbGwgKGUuZy4sCiAJCSAqIHdoZW4gdXNpbmcgYW5vdGhlciBwYXJzZXIpLCBzbyBk
b24ndCBiZSBsb3VkZXIgdGhhbgpAQCAtNjQsNiArNjQsOCBAQCBzdGF0aWMgaW50IHBhcnNlX2Zp
eGVkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCiAJCW9mcGFydF9ub2RlID0g
bXRkX25vZGU7CiAJCWRlZGljYXRlZCA9IGZhbHNlOwogCX0KKwlpZiAoIW9mcGFydF9ub2RlKQor
CQlyZXR1cm4gMDsKIAogCW9mX2lkID0gb2ZfbWF0Y2hfbm9kZShwYXJzZV9vZnBhcnRfbWF0Y2hf
dGFibGUsIG9mcGFydF9ub2RlKTsKIAlpZiAoZGVkaWNhdGVkICYmICFvZl9pZCkgewotLSAKMi4y
Ni4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
