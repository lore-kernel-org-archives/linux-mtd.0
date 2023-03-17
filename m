Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E1AC74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jfTKgUxphLf8zpopvtJYkdrhesXDpwOj2A5dCiLvGZE=; b=TpBe8ZIGygHcI7
	c9TdO1cB1IymF5cwFkH0OzJyMGaK2xqW7i5mAs1ieHY0FOPnHcqcBBACiZP9JkP/flRZAWX2uRB1A
	9bJPIr7JVZg0gRYT1eKzhxcDiZxlZqWR/t9TXrVOuyZZ7+Nl/BFmBliP3H4MH7zbbYqWodVs4oHme
	mloGQxqFcnck7qEeEYmpbtjU8n2ElzwxUEQKzlHdc4N3MdnxonMLP+OkvPpwbTDfgdSxS62CZDSgr
	3CkLBXYPi0Chj0AZpPTnA/9dr4f9KO4fZWsg4OcLdHnj9ruv1U1MaZFb5tairnRP+oXlNfg70QJvb
	0ezsiwQDh9erwzVUtqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4oY-001Ks5-2B;
	Fri, 17 Mar 2023 07:47:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4oV-001KrD-3A
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 07:47:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id g18so4173377ljl.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679039265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyTzJAstb2sufGT3LOYhfDOVgqbVY7GStE/9I2R9cno=;
        b=gS1msluopnlLvvcdA0NI5pxIMFbbB5+si77CJkQjUhlqlTXWPdnIsxFEIPahg+4Rjx
         pXY/A6F9wEIa8Krceyl8tj/4beLfne1MvBH7D9eQS5AQo7BCR5Cs1UfmLJIF1pK7lpPi
         lEkPwPdOWt0PjU+bzCy9BrIbD280LShRUuFBjddzyghfK7JQV663sNH9EfzpAoQG5qP5
         3tmtB5nkdWaVFNhduYPOkJjzPe/ekUp0aKcSUmWnS4h9Ebfdyc+FdUY7dyXfW20NeMig
         B5GOeId1/TIq8pwayeUW3wlhG9UG78Mz7/6I0aUA75vsSbt24Gf1rGKdBWF2aGkI+0RW
         dwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679039265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyTzJAstb2sufGT3LOYhfDOVgqbVY7GStE/9I2R9cno=;
        b=4ED7ICGP+mvZe35qa8S1AHEZ12KPNbCGWaEoSaQIh8YnlKUD+5RNneDjGjJEusew4+
         DkGj6DRs5BmaMb8bvEnVxxUSL+fqOnocQ3FIxsnz3qYnreqHxF4N/lUkU+ADo3T5uU14
         N9lEAhw7nY/FyluLvoKtJtSaHYAIQMMKZywBOSMt+3rOv98lK/cV2GhdPr0gzdrZbF7I
         XKvfsAObH5mu9ay9iDLMmsUobdAzh4om6cZNggoc97eo6LqMRqU5G5CaOKKS7keB4Gds
         nz9sfIK/66O8hmuaLLXSt94OkMCzm6kuSn2oc1gjfZeow4z9nogllsKht8/ozsHXi4/B
         Wjwg==
X-Gm-Message-State: AO0yUKXZdeMkUiNVE54AMy1EGR9VLh99HlLckZlPBE0fadVbW9s53kTy
	UY+SazYGNE3kGFcxZWCSEIs=
X-Google-Smtp-Source: AK7set9tqn7X0J52etmvUwLr1Ljcwb33WD+up1h8k5TGNtgot5EyT67+Ty967HMZNZB0Mrjia7Ak7w==
X-Received: by 2002:a2e:9001:0:b0:299:ac49:46da with SMTP id h1-20020a2e9001000000b00299ac4946damr1342316ljg.42.1679039265391;
        Fri, 17 Mar 2023 00:47:45 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id z1-20020a2e9641000000b002934fe524d2sm267417ljh.83.2023.03.17.00.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:47:44 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: core: print error code if registering NVMEM fails
Date: Fri, 17 Mar 2023 08:47:36 +0100
Message-Id: <20230317074736.28944-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_004748_017487_0772AE25 
X-CRM114-Status: GOOD (  10.91  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKSXQncyBhIGNvbW1vbiBw
cmFjdGljZSB0aGF0IGhlbHBzIGRlYnVnZ2luZyBwcm9ibGVtcy4KClNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL210ZC9tdGRjb3Jl
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwppbmRleCA4M2EyMjU2NmE4Y2UuLjgzMDNjZTYyYzc1MSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwpAQCAtNTM5LDcgKzUz
OSw4IEBAIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAkJ
aWYgKFBUUl9FUlIobXRkLT5udm1lbSkgPT0gLUVPUE5PVFNVUFApIHsKIAkJCW10ZC0+bnZtZW0g
PSBOVUxMOwogCQl9IGVsc2UgewotCQkJZGV2X2VycigmbXRkLT5kZXYsICJGYWlsZWQgdG8gcmVn
aXN0ZXIgTlZNRU0gZGV2aWNlXG4iKTsKKwkJCWRldl9lcnIoJm10ZC0+ZGV2LCAiRmFpbGVkIHRv
IHJlZ2lzdGVyIE5WTUVNIGRldmljZTogJWxkXG4iLAorCQkJCVBUUl9FUlIobXRkLT5udm1lbSkp
OwogCQkJcmV0dXJuIFBUUl9FUlIobXRkLT5udm1lbSk7CiAJCX0KIAl9Ci0tIAoyLjM0LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
