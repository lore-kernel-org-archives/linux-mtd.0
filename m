Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72667E77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyU4X8hcqwsTuwvQ/MU7l/A6+1sGx+y1oHZhMGJxm+E=; b=rsrJMs5DT58Tdh
	vk7DEkp4U/noJyphmdp1vO2EUa//3pKLEm1DhbyXJ04bMRYT4YnGef21HKM7zBv0ngd5c57EJGkTH
	CT9s+NCb0rAHQhk8lw8l+TE8t4m9Si3+M//VrEDT8b5A3WQKSBGgri7M0N7WGjZnOCkBbpByr/9hk
	HzsJUZVI0GNDNV/vNF8CajWhkP7mESp3W2qs5SAhOiZnTL8g5DkB0iLq3GyPPBJVSqOT0sZdYLFPc
	8n/boitbDkBjkh1A822BJt1RVjIqqLw/mNZvrQhmRL/XNk6BdZUM8+Bzz3RHBrMl3ieiRA1/4DJtK
	NVULqErTbxlHNC+L81eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXXJ-00000001aCx-1xR1;
	Fri, 06 Dec 2024 12:34:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXXH-00000001aC8-31vx
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 12:34:20 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53e2baf3160so1072790e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2024 04:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733488457; x=1734093257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6FbXH9ZDZRSoXXBfckKXKingdb4cJtlkfM8gYPYNLY=;
        b=e/EuHvaFJaav8BC4lcd9IJtmfCjfYTqGVtiL6XLEfzjNcY3v/n63FseCWq3hZ+Lf3X
         x4uqluYn9A/ak6ujIGVa2sAou8oAgvy+E/3R1dVGieZfmbRU8fYJue70YRCz+ytIs+b+
         T8nRZYo/aZ77hyACMO8zfl1xCdV9cxqpKD9l9fnjlI83TTKZqBtqP56FUGv16dYnnDdl
         7Frhwh2n/TavTfieCd/f+7EKpxpX8iLPB4KnSfUR1dKs10tjUoH4n/V0xqfWcmvuZiP0
         /AW4bJLH2VWFSdyyZYtAeIAaOkp7ZJeO3r6vg/rpxfEYYrD7KA6DtpEcK43szJ3u5wyL
         vmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733488457; x=1734093257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6FbXH9ZDZRSoXXBfckKXKingdb4cJtlkfM8gYPYNLY=;
        b=CvrF896SK7KvXQ7lKFhQEI22weVy9C/ihrBxo96XiEog+kWzjTdAT35W12hkcVHAp9
         Wlv30RE/dXJpvprHj4/+3x4IMSUBEtqpbx6ZGbGEprH+cyIhjxm4YhN72uVBEwkMoAjm
         HvrZzsBR6iTp9THTVRIOJ9Vrz2HDyWaAFa8fJUGZ2CNUTzUUZha/RLpsN5EfRf/6sNPq
         koBlfATYQplk7dpntTTZMVkZ8mrX3Ho2M6C3gKHOoTAFrOzLFJj7t++UD1m3JPZ9fRI4
         lOrt9cI6qxv1LxhO1o7t8SRgNJW4XEnlUwBCpn1d3DtOUSVMK2STUSFZS36pTlK/yA7Z
         CR7w==
X-Gm-Message-State: AOJu0YyUavmQ46az21hin9juQ0ANXKuw6+Gl0jbBLvER+bc62x6nOmHz
	8NMiHgUeAbNv+wS72tOqaJti82OYvCO2OTRGlgDraXV5R9XjHMyi0mM8tw==
X-Gm-Gg: ASbGncsLC/ELRDgEuJDLhBqezlYvyS7HfIeQmnF/KyH5QI5SFTB2hTPnf102nHtwYgm
	zkvhY+paxg2fWBslMypcRQ88LH0lzVfOFPTg9tOw2YgnRvTDwWTkHMSAOB0pVT7vFKaegut7bLP
	TRe6x1u0DdWXADKM3iCskCuuSG4NX4NDJ6wimyRR05Dh2HcRP/JtZkmGi/haIIB60w/niE+XUQK
	CCsyVaG56iqEdQ97sPurzniAuhuw5skannwrSRYTOCgpJ2P8mM0WRMauf29hgPRikhPTXNg6Y/J
	xv47niKg+vE7wzRyOha3xgFQWYH7xm9B
X-Google-Smtp-Source: AGHT+IHpMMsDc5+9XmCEhF239JBHU8NdjbzX6wXPXCshGHTRo3AUbYBXCOUn7zyTl7AHRzgiF/Y+Vg==
X-Received: by 2002:a05:6512:118a:b0:53d:e544:3fda with SMTP id 2adb3069b0e04-53e2c2f001fmr1412847e87.55.1733488456977;
        Fri, 06 Dec 2024 04:34:16 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229751acsm491320e87.77.2024.12.06.04.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:34:15 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] FIX: NO_CAST.INTEGER_OVERFLOW in ubirsvol.c
Date: Fri,  6 Dec 2024 15:34:25 +0300
Message-Id: <20241206123425.58946-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_043419_758116_2B82956F 
X-CRM114-Status: GOOD (  10.61  )
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
IGV4cHJlc3Npb24gJ3ZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzJyBpcyBhIHN1YmplY3Qg
dG8gb3ZlcmZsb3cgYmVjYXVzZSBpdHMgb3BlcmFuZHMgYXJlIG5vdCBjYXN0IHRvIGEgbGFyZ2Vy
IGRhdGEgdHlwZSBiZWZvcmUgcGVyZm9ybWluZyBhcml0aG1ldGljCgpDb3JyZWN0aW9ucyBleHBs
YWluZWQ6CnRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11
bHRpcGxpY2F0aW9uLiAKYW4gZXhjZXB0aW9uIGNoZWNrIGZvciB0aGUgbmVnYXRpdml0eSBvZiB2
b2xfaW5mby5sZWJfc2l6ZSBhbmQgYXJncy5sZWJzIHdhcyBhZGRlZCwgYXMgd2VsbCBhcyBjYXN0
aW5nIHZvbF9pbmZvLmxlYl9zaXplIHRvIHVpbnQ2NF90CgpUcmlnZ2VycyBmb3VuZCBieSBzdGF0
aWMgYW5hbHl6ZXIgU3ZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYu
bW9yeWFrb3ZAZ21haWwuY29tPgoKLS0tCiB1YmktdXRpbHMvdWJpcnN2b2wuYyB8IDYgKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3ViaS11dGlscy91Ymlyc3ZvbC5jIGIvdWJpLXV0aWxzL3ViaXJzdm9sLmMKaW5kZXgg
MDg1NGFiYy4uODcyODZkNCAxMDA2NDQKLS0tIGEvdWJpLXV0aWxzL3ViaXJzdm9sLmMKKysrIGIv
dWJpLXV0aWxzL3ViaXJzdm9sLmMKQEAgLTIzMCw4ICsyMzAsMTAgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJCX0KIAl9CiAKLQlpZiAoYXJncy5sZWJzICE9IC0x
KQotCQlhcmdzLmJ5dGVzID0gdm9sX2luZm8ubGViX3NpemUgKiBhcmdzLmxlYnM7CisJaWYgKGFy
Z3MubGVicyAhPSAtMSl7CisJCWlmKHZvbF9pbmZvLmxlYl9zaXplID4gMCAmJiBhcmdzLmxlYnMg
PiAwKQorCQkJYXJncy5ieXRlcyA9IHZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzOworCX0K
IAogCWVyciA9IHViaV9yc3ZvbChsaWJ1YmksIGFyZ3Mubm9kZSwgYXJncy52b2xfaWQsIGFyZ3Mu
Ynl0ZXMpOwogCWlmIChlcnIpIHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
