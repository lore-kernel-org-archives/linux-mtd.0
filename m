Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F87C77B70
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VNmyXxpYfdcoBwaap6Xo9r2X0k8z+vTfB4iK2OnfEiY=; b=j6Hsnxbg7dWtXv
	dnnyddENh1n24kzu1Nemk+MvZD0Lh7mXHxkZGx4h+S9ps2NShXkqj3EWMHIhuNRwEx9afho0e7C69
	lssfkEZwQQU/0eUUMGk/fHdTAgW2MMeA/IVmObSOKhgrOMegQgNUb3kM10rSx0cH56jle0GXCkIXC
	P5BuOqGWSI+jcHxnMba2r9I39HlWarGROJQnOTyjvTW8PIW8gRKmCnoAIlN426+3TcYjXokr4mmxb
	oidee/qbhYvunlyhCOzdDP1SW2zbXxt6w/oIEjX1gxvEQkzRCOpRw1j2pUNp/lqneHWmT5OEOgsVh
	LIZkcxOllTfGF0OMla7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poP3P-00GQuY-00;
	Mon, 17 Apr 2023 13:37:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poP3L-00GQsz-2a
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 13:37:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4edbd6cc46bso1262534e87.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2023 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681738673; x=1684330673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orKyQ+5xycM5jIDwpzyxBulKMAb91OuxkIA/XjFytMY=;
        b=bZaiLZV14CYwzHPbV9ecmLPy0qhBnpsd9Skky6Wi0gAfs37qeCpJ8bsu5dqL38pzLO
         oeaSqdanU3i3Jly/yqF+1V7BivVGFuFEeBM84IOKGYv4XmHncBOpCWAzJwOwbtXJ42H7
         +mq1pHORWDZ5zVr3gaksWbvffZhQDGIgpDBGhL1U+tIssG53nEuWfoqPp+cWbxnayjcf
         JVqLrurhM1y7Lfn9hyxRx9dGK6qQ1HS7DljB7KzhTNUiyfsHLqtKU66ijVUffcC0L6LI
         aqQFA5alo2eYgxvhartVRnSw5wIwZ8E7LGUWQ2+bPzULICxoXW/VgiqS1m2dpdR19BDY
         9z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681738673; x=1684330673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orKyQ+5xycM5jIDwpzyxBulKMAb91OuxkIA/XjFytMY=;
        b=GBw+wyx6Tvd+jT8bYY6NECoz5n1PvedsrWm3y+5kgSPyFWyTwR5v1sg6U8kxbnVca1
         wVeuwMktjNivexV2ytXwFZBZCi+S5JzIR6yjMiRUDHoIMY4293wuZPop3kJBVMmk4w3b
         9f8ueXf4RwDN+KVDeex6cjttYjT1r4R61Ac9zsLCEnYUZ2XQm6GT3VEhnlQ9Bvh0UHnb
         vKuKoYX+DJo2PbxSmWC+yvLWQKWh9K/0bL7q3nGZnXlSSQPDb0C0sD0Uw8XUXJUAgPbL
         HbdqK9qJdme/bjMM09DcmH6cDBkBOEYsrmO9aJPYszrDzcSs0igGl5DaXPy3n0ypBNfH
         f/Mw==
X-Gm-Message-State: AAQBX9eU6vdacnHpv336q5vMY3EcPlYQLrS3LTXUlF/YdtA1sHtGfo/5
	aiQtgaQjyNtdsZXICOEHlSY=
X-Google-Smtp-Source: AKy350YHYUa0TQhTJg50SJOu7ThDROh/FaB2/PO3UXQ0QV6AYJM3VWbathf/A9cx9Dv5rB+so/nNRg==
X-Received: by 2002:ac2:560e:0:b0:4cc:5e3a:dd82 with SMTP id v14-20020ac2560e000000b004cc5e3add82mr1763743lfd.58.1681738673088;
        Mon, 17 Apr 2023 06:37:53 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id g22-20020a19ee16000000b0049ad2619becsm2054520lfb.131.2023.04.17.06.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:37:52 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: parsers: qcom: deal with partitions names on Netgear WAX218
Date: Mon, 17 Apr 2023 15:37:19 +0200
Message-Id: <20230417133719.16592-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_063755_846454_339C808C 
X-CRM114-Status: GOOD (  24.64  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTmV0Z2VhciBXQVgyMTgg
aGFzIHR3byBzaW1pbGFyIHBhcnRpdGlvbnM6ICJyb290ZnMiIGFuZCAicm9vdGZzXzEiLiBUaGV5
CmJvdGggY29udGFpbiBkZXZpY2UgZmlybXdhcmUgKGtlcm5lbCArIHJvb3RmcykuIEJvb3Rsb2Fk
ZXIgY2hvb3NlcyB0aGUKb25lIHRvIGJvb3QgZnJvbSBkZXBlbmRpbmcgb24gdGhlICJhY3RpdmVf
ZnciIHZhcmlhYmxlLgoKVGhlIHdob2xlIG1lY2hhbmlzbSBpcyB1c2VkIGZvciBzYWZlIGZpcm13
YXJlIHVwZ3JhZGVzLgoKU2FkbHkgb3JpZ2luYWwgYm9vdGxvYWRlciBvbiB0aGlzIGRldmljZSBk
b2Vzbid0IGxldCBrbm93IHdoYXQgZmlybXdhcmUKaXQgaGFzIGJvb3RlZC4KClRvIHJ1biBzeXN0
ZW0gcmVsaWFibHkgd2UgbmVlZCB0byBrbm93IHdoaWNoIGtlcm5lbCBoYXMgYmVlbiBib290ZWQg
YW5kCm1vdW50IHByb3BlciByb290ZnMgYWNjb3JkaW5nbHkuIFRoaXMgcGF0Y2ggcmVnaXN0ZXJz
IGN1cnJlbnRseSB1c2VkCnBhcnRpdGlvbiB1c2luZyB0aGUgImZpcm13YXJlIiBuYW1lLgoKSXQg
aXNuJ3QgY2xlYXIgaG93IG1hbnkgZGV2aWNlcyB3aWxsIG5lZWQgdGhpcyBzbyBqdXN0IGNoZWNr
IGZvciBhCldBWDIxOCBjb21wYXRpYmxlIHN0cmluZyBmb3Igbm93LgoKU2lnbmVkLW9mZi1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgpDYzogQWxleGFuZHJ1IEdhZ25pdWMg
PG1yLm51a2UubWVAZ21haWwuY29tPgpDYzogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhA
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL3BhcnNlcnMvcWNvbXNtZW1wYXJ0LmMgfCA5MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMv
cWNvbXNtZW1wYXJ0LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3Fjb21zbWVtcGFydC5jCmluZGV4
IDQzMTFiODlkOGRmMC4uMzUyZmIxNTM3NDVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJz
ZXJzL3Fjb21zbWVtcGFydC5jCisrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvcWNvbXNtZW1wYXJ0
LmMKQEAgLTU0LDYgKzU0LDY5IEBAIHN0cnVjdCBzbWVtX2ZsYXNoX3B0YWJsZSB7CiAJc3RydWN0
IHNtZW1fZmxhc2hfcGVudHJ5IHBlbnRyeVtTTUVNX0ZMQVNIX1BUQUJMRV9NQVhfUEFSVFNfVjRd
OwogfSBfX3BhY2tlZCBfX2FsaWduZWQoNCk7CiAKKy8qKgorICogcGFyc2VfcWNvbXNtZW1fZ2V0
X2FjdGl2ZV9mdyAtIGdldCBhY3RpdmUgZmlybXdhcmUgaW5kZXgKKyAqCisgKiBTb21lIGRldmlj
ZXMgaGF2ZSBhY3RpdmUgYW5kIGJhY2t1cC9mYWxsYmFjayBmaXJtd2FyZXMuIFRoaXMgZnVuY3Rp
b24gcmV0dXJucyBpbmRleCBvZiB0aGUgYWN0aXZlCisgKiBvbmUuIEl0J3MgdXNlZnVsIGZvciBy
ZWdpc3RlcmluZyBNVEQgcGFydGl0aW9ucyB1c2luZyBjbGVhciBuYW1lcy4KKyAqLworc3RhdGlj
IGludCBwYXJzZV9xY29tc21lbV9nZXRfYWN0aXZlX2Z3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBz
dHJ1Y3Qgc21lbV9mbGFzaF9wdGFibGUgKnB0YWJsZSkKK3sKKwlib29sIGZvdW5kID0gZmFsc2U7
CisJc2l6ZV90IG9mZnNldDsKKwlzaXplX3QgYnl0ZXM7CisJc2l6ZV90IHNpemU7CisJY2hhciAq
YnVmOworCWNoYXIgKnZhcjsKKwlpbnQgZXJyOworCWludCBpOworCisJaWYgKCFvZl9tYWNoaW5l
X2lzX2NvbXBhdGlibGUoIm5ldGdlYXIsd2F4MjE4IikpCisJCXJldHVybiAtRU9QTk9UU1VQUDsK
KworCS8qIEZpbmQgcGFydGl0aW9uIHdpdGggZW52aXJvbm1lbnQgZGF0YSAqLworCisJZm9yIChp
ID0gMDsgaSA8IGxlMzJfdG9fY3B1KHB0YWJsZS0+bnVtcGFydHMpOyBpKyspIHsKKwkJc3RydWN0
IHNtZW1fZmxhc2hfcGVudHJ5ICpwZW50cnkgPSAmcHRhYmxlLT5wZW50cnlbaV07CisKKwkJaWYg
KCFzdHJjbXAocGVudHJ5LT5uYW1lLCAiMDpBUFBTQkxFTlYiKSkgeworCQkJb2Zmc2V0ID0gbGUz
Ml90b19jcHUocGVudHJ5LT5vZmZzZXQpICogbXRkLT5lcmFzZXNpemU7CisJCQlzaXplID0gbGUz
Ml90b19jcHUocGVudHJ5LT5sZW5ndGgpICogbXRkLT5lcmFzZXNpemU7CisJCQlmb3VuZCA9IHRy
dWU7CisJCQlicmVhazsKKwkJfQorCX0KKwlpZiAoIWZvdW5kKQorCQlyZXR1cm4gLUVOT0VOVDsK
KworCS8qIFJlYWQgaXQgKi8KKworCWJ1ZiA9IGtjYWxsb2MoMSwgc2l6ZSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCFidWYpCisJCXJldHVybiAtRU5PTUVNOworCisJZXJyID0gbXRkX3JlYWQobXRkLCBv
ZmZzZXQsIHNpemUsICZieXRlcywgYnVmKTsKKwlpZiAoKGVyciAmJiAhbXRkX2lzX2JpdGZsaXAo
ZXJyKSkgfHwgYnl0ZXMgIT0gc2l6ZSkgeworCQlwcl9lcnIoIkZhaWxlZCB0byByZWFkIGVudmly
b25tZW50XG4iKTsKKwkJcmV0dXJuIC1FSU87CisJfQorCisJLyogRmluZCAmIHBhcnNlIGVudHJ5
IHdpdGggYWN0aXZlIGZpcm13YXJlIGluZGV4ICovCisKKwlmb3IgKHZhciA9IGJ1ZiArIDQ7IHZh
ciA8IGJ1ZiArIHNpemUgJiYgKnZhcjsgdmFyICs9IHN0cmxlbih2YXIpICsgMSkgeworCQljb25z
dCBjaGFyICpwcmVmaXggPSAiYWN0aXZlX2Z3PSI7CisJCXVuc2lnbmVkIGxvbmcgaWR4OworCisJ
CWlmIChzdHJzdGFydHModmFyLCBwcmVmaXgpKSB7CisJCQllcnIgPSBrc3RydG9sKHZhciArIHN0
cmxlbihwcmVmaXgpLCAwLCAmaWR4KTsKKworCQkJcmV0dXJuIGVyciA/IGVyciA6IGlkeDsKKwkJ
fQorCX0KKworCXJldHVybiAtRU5PRU5UOworfQorCiBzdGF0aWMgaW50IHBhcnNlX3Fjb21zbWVt
X3BhcnQoc3RydWN0IG10ZF9pbmZvICptdGQsCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IG10ZF9w
YXJ0aXRpb24gKipwcGFydHMsCiAJCQkgICAgICAgc3RydWN0IG10ZF9wYXJ0X3BhcnNlcl9kYXRh
ICpkYXRhKQpAQCAtNjQsNiArMTI3LDggQEAgc3RhdGljIGludCBwYXJzZV9xY29tc21lbV9wYXJ0
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCXN0cnVjdCBzbWVtX2ZsYXNoX3B0YWJsZSAqcHRhYmxl
OwogCXN0cnVjdCBtdGRfcGFydGl0aW9uICpwYXJ0czsKIAljaGFyICpuYW1lLCAqYzsKKwlpbnQg
YWN0aXZlX2Z3OworCWludCBmd19pZHg7CiAKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1NQ
SV9OT1JfVVNFXzRLX1NFQ1RPUlMpCiAJCQkmJiBtdGQtPnR5cGUgPT0gTVREX05PUkZMQVNIKSB7
CkBAIC0xMjMsMjQgKzE4OCwzNSBAQCBzdGF0aWMgaW50IHBhcnNlX3Fjb21zbWVtX3BhcnQoc3Ry
dWN0IG10ZF9pbmZvICptdGQsCiAJCQludW1wYXJ0cysrOwogCX0KIAorCWFjdGl2ZV9mdyA9IHBh
cnNlX3Fjb21zbWVtX2dldF9hY3RpdmVfZncobXRkLCBwdGFibGUpOworCiAJcGFydHMgPSBrY2Fs
bG9jKG51bXBhcnRzLCBzaXplb2YoKnBhcnRzKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwYXJ0cykK
IAkJcmV0dXJuIC1FTk9NRU07CiAKKwlmd19pZHggPSAtMTsKIAlmb3IgKGkgPSAwLCBqID0gMDsg
aSA8IHRtcHBhcnRzOyBpKyspIHsKIAkJcGVudHJ5ID0gJnB0YWJsZS0+cGVudHJ5W2ldOwogCQlp
ZiAocGVudHJ5LT5uYW1lWzBdID09ICdcMCcpCiAJCQljb250aW51ZTsKIAotCQluYW1lID0ga3N0
cmR1cChwZW50cnktPm5hbWUsIEdGUF9LRVJORUwpOwotCQlpZiAoIW5hbWUpIHsKLQkJCXJldCA9
IC1FTk9NRU07Ci0JCQlnb3RvIG91dF9mcmVlX3BhcnRzOwotCQl9CisJCWlmIChhY3RpdmVfZncg
Pj0gMCAmJiBzdHJzdGFydHMocGVudHJ5LT5uYW1lLCAicm9vdGZzIikpIHsKKwkJCW5hbWUgPSBr
c3RyZHVwKCsrZndfaWR4ID09IGFjdGl2ZV9mdyA/ICJmaXJtd2FyZSIgOiAiYmFja3VwIiwgR0ZQ
X0tFUk5FTCk7CisJCQlpZiAoIW5hbWUpIHsKKwkJCQlyZXQgPSAtRU5PTUVNOworCQkJCWdvdG8g
b3V0X2ZyZWVfcGFydHM7CisJCQl9CisJCX0gZWxzZSB7CisJCQluYW1lID0ga3N0cmR1cChwZW50
cnktPm5hbWUsIEdGUF9LRVJORUwpOworCQkJaWYgKCFuYW1lKSB7CisJCQkJcmV0ID0gLUVOT01F
TTsKKwkJCQlnb3RvIG91dF9mcmVlX3BhcnRzOworCQkJfQogCi0JCS8qIENvbnZlcnQgbmFtZSB0
byBsb3dlciBjYXNlICovCi0JCWZvciAoYyA9IG5hbWU7ICpjICE9ICdcMCc7IGMrKykKLQkJCSpj
ID0gdG9sb3dlcigqYyk7CisJCQkvKiBDb252ZXJ0IG5hbWUgdG8gbG93ZXIgY2FzZSAqLworCQkJ
Zm9yIChjID0gbmFtZTsgKmMgIT0gJ1wwJzsgYysrKQorCQkJCSpjID0gdG9sb3dlcigqYyk7CisJ
CX0KIAogCQlwYXJ0c1tqXS5uYW1lID0gbmFtZTsKIAkJcGFydHNbal0ub2Zmc2V0ID0gbGUzMl90
b19jcHUocGVudHJ5LT5vZmZzZXQpICogbXRkLT5lcmFzZXNpemU7Ci0tIAoyLjM0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
