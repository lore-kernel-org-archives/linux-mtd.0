Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC85E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9AwX6GfWDhm5ny7hVafv9UKNu4vF4ssrvWPRA7LZrGI=; b=Ahumvp85EMdLzO
	GXZQs0B0saxLLoRS9QxbYUSVRSgoSu1bEJkwBwqvu8+FRsxNeL8dfOoSys3RLnxIhsVsBuvWpXLv2
	Pn0O9/na7T7upIteYaqlGJrhCk5DSUqfGusumsfJbDQys+lscEEIa2vot6WjbLm7h73HnfPK7KhGf
	B/ksuG3YyvA4u/evC3qQkmiaFYP3vuMt9Mvsnw7OpmrJiYaKZjh7DZWxMZRqdSZB9W3knNDlS/7l0
	yTJG6xAhGvGwzB69fo5IW0WKCmaj8oK4J03aJsRHYhYMhcZMAIF5CZOGhVcODrKEyYbymaKBfxYf6
	W7WxSC8HYmNe7hvxJm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFyI-00000001rs5-2IQ9;
	Thu, 19 Dec 2024 12:49:42 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFxw-00000001rpn-0wjh
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 12:49:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so784424e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734612558; x=1735217358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pHbjohFQXn3+C1Zb31AmCQahZXmj39Rt3f3yiPlSg0=;
        b=bf+Eta30KHkTZZ5eXhdbrgqumSGpDDsNqtB0chpbrAKvAOZlM+KQghTm4BjQehQHbA
         cFAusvZiKMr/6RDrunafN55CNgh1ulu82g1d8sL1keH6pjsFoIHTmaqqZatl4GJhyL8Q
         EcJtwI78KdKK2mKhn22VJlIrRdy1gJExO6cxZ9vOuaWiDv5tYtYCRLMQrv8gHT3ZZETJ
         bvnWdTv8GhR9OavV0Rfp7ThKaBbhqqjYzYCHJs1OuCgdT4svex6D3NNm+VWAsr0PwMQ+
         JBOGS67y0TA1ouBirz8QxgzEDubrnbDq+ymz5M48fQdPTl0K7ejlW07Af3a7tA/+kHqk
         lsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734612558; x=1735217358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pHbjohFQXn3+C1Zb31AmCQahZXmj39Rt3f3yiPlSg0=;
        b=hsCZB8g41FwuFHM1GIOwpzH1XAoeui6W4SBMGn4IB8li+MRIOXIYwVPtHwOn15HbfT
         E5nkRoUI9yc1xAXBRpMSKFbNCdsBWuQ+5tglJ5825BaHxfqZkoy/q/jhIlfuc7P3sSiv
         PP9jcXpNoBlmGdlbpOEn802jQxan7wNV5JGrCECZlMVzWzG96wopCZG724SXtHlo8Cnt
         jJx8DlgAFcsMVOH7fz30xWrxA+anVRiCa3vmZKDh94QDpvSh5KWeblWfgTq/vqXeegOL
         OdLeZV7inmXSBJFXtipNJLO+XWullloqbs9WsXd5Dr3ay0gb2d8nHxvV+locnWPfngC+
         rsXg==
X-Forwarded-Encrypted: i=1; AJvYcCXNrqM1WTPXXEh5cYEJjZiDSaRNht0YTRFHEkTCMJzx0DKy1Rb2X1Luo7C0wyZlcppJFyO9g/nuiRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUF1gx4rnaVc6mFKwf9gYkvECIUkf+kushcCaV1UnhGz0HqKOq
	nDdTknyXwJ0qjlkA+6oAT4U7wwp8Fu36cSaI45yXHjrqKArKYcFz
X-Gm-Gg: ASbGncvXLyBxYSwfmWd3blczi8q+ZUrdeMgFE4fXJ9MEYW8BCimuwVWA+/FMxMTiDJm
	Nf4etnzEcYe51mk0dxRy5LfOmL5hxm59CXkgGY7fKMACZNwT5GheoqZX2ApuzvQSbgWlhBDh946
	OC2/2ugPKRNE+IOS6UIWMLVLhtxH6E4oE2xHB+l0gNtBvnwA0muTX3od6sTsFDhjS1i87A5q4y9
	HeKz6SlTCjP9FUG4g+Yyqmd+07xyqN07MBqUDEv3SFBDkwu1pkmFtUd/mRM3uIlTPJIqOSYHo7Y
	PGc8caqZctX41XbvXSx+bli7Sq8+aEqmSfjs25g=
X-Google-Smtp-Source: AGHT+IHsY6tmfqG734zReYd1TupD+sQbp4EfbdUPfU+xP/ReE/K5JY3cIsgUGTxZjed7oJW5pJhvVg==
X-Received: by 2002:a05:6512:ea4:b0:540:2ac6:8c69 with SMTP id 2adb3069b0e04-542212ce942mr1063928e87.5.1734612558346;
        Thu, 19 Dec 2024 04:49:18 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f66fbsm164047e87.21.2024.12.19.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:49:16 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] jffsX-utils: fix integer overflow in jffs2dump.c
Date: Thu, 19 Dec 2024 15:49:32 +0300
Message-Id: <20241219124932.705660-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_044920_259444_63A32B75 
X-CRM114-Status: GOOD (  12.09  )
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

UmVwb3J0IG9mIHRoZSBzdGF0aWMgYW5hbHl6ZXI6ClRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGlj
IGV4cHJlc3Npb24gJ2RhdHNpemUgKyBvb2JzaXplJyBpcyBhIHN1YmplY3QgdG8gb3ZlcmZsb3cg
YmVjYXVzZSBpdHMgb3BlcmFuZHMgYXJlIG5vdCBjYXN0IHRvIGEgbGFyZ2VyIGRhdGEgdHlwZSBi
ZWZvcmUgcGVyZm9ybWluZyBhcml0aG1ldGljCgpDb3JyZWN0aW9ucyBleHBsYWluZWQ6CkZpeGVk
IHBvdGVudGlhbCBvdmVyZmxvdyBpbiBhcml0aG1ldGljIG9wZXJhdGlvbiBkYXRzaXplICsgb29i
c2l6ZQpieSBjYXN0aW5nIG9wZXJhbmRzIHRvIHVuc2lnbmVkIGxvbmcgbG9uZyB0byBlbnN1cmUg
c2FmZSBjb21wdXRhdGlvbi4KQW5kIGFsc28gYWRkZWQgYSBjaGVjayBpIHRoaW5rIHlvdSBjYW4g
anVzdCBhZGQKaWYgKGRhdHNpemUgPCAwIHx8IG9vYnNpemUgPCAwKSBleGNsdWRpbmcgbmVnYXRp
dmUgdmFsdWVzIOKAi+KAi2ZvciBkYXRzaXplIGFuZCBvb2JzaXplCgotLS0KIGpmZnNYLXV0aWxz
L2pmZnMyZHVtcC5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvamZmc1gtdXRpbHMvamZmczJkdW1wLmMgYi9q
ZmZzWC11dGlscy9qZmZzMmR1bXAuYwppbmRleCAzMDQ1NWVhLi5iZWU4YzU5IDEwMDY0NAotLS0g
YS9qZmZzWC11dGlscy9qZmZzMmR1bXAuYworKysgYi9qZmZzWC11dGlscy9qZmZzMmR1bXAuYwpA
QCAtNzcyLDYgKzc3MiwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCWV4
aXQoRVhJVF9GQUlMVVJFKTsKIAl9CiAKKwlpZiAoZGF0c2l6ZSA8IDAgfHwgb29ic2l6ZSA8IDAp
IHsKKwkJZnByaW50ZihzdGRlcnIsICJFcnJvcjogZGF0c2l6ZSBhbmQgb29ic2l6ZSBtdXN0IGJl
IG5vbi1uZWdhdGl2ZS5cbiIpOworCQlyZXR1cm4gLTE7CisJfQorCiAJaWYgKGRhdHNpemUgJiYg
b29ic2l6ZSkgewogCQlpbnQgIGlkeCA9IDA7CiAJCWxvbmcgbGVuID0gaW1nbGVuOwpAQCAtNzgz
LDcgKzc4OCw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJCXJlYWRfbm9j
aGVjayAoZmQsIG9vYiwgb29ic2l6ZSk7CiAJCQlpZHggKz0gZGF0c2l6ZTsKIAkJCWltZ2xlbiAt
PSBvb2JzaXplOwotCQkJbGVuIC09IGRhdHNpemUgKyBvb2JzaXplOworCQkJbGVuIC09ICh1bnNp
Z25lZCBsb25nIGxvbmcpZGF0c2l6ZSArICh1bnNpZ25lZCBsb25nIGxvbmcpb29ic2l6ZTsKIAkJ
fQogCiAJfSBlbHNlIHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
