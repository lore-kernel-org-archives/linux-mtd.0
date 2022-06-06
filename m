Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B61DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5D/BxL9uX2tZ/xS+ZiEg7lNjckWY79BjQxwThvA7RZk=; b=DL2Ul0jBeWJH7+
	zX3ZIjChKjiDmbTi5GdqDEZGJpJ7bvprNGWApw9q1yzsdYG/zFgyph9g/lLgvezaITWCK2nAwHlbJ
	ZUhyT6g/yucI6pMzhcPU27sgEqJ0qPtk7/1R4rREAXLjwfhkxJDATL8Ld+9BhzqdYNjl0y8YDlN+O
	ISqqkruxgGuSSvqy6x5luKtsE8cevrkXZWAb2OsPpnnAfnBwi3HZqLiABR5TKk0LPjKOcZSNQWkee
	c3iA6k5V0UvUwg86EKqle77/06mp9Zbv+BqImf3P+0pQ0mVGOouqR1QuYhBYBZcwPZFhXMdZDDSrg
	a4+8j1hxosH6MyVttQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERR-001jgi-1p; Mon, 06 Jun 2022 15:14:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERH-001jcI-Cv
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 15:14:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id s12so22373633ejx.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wdA5SSs2A+GftYSjZhbZ3WXsisBDCmDB/JAxOYIkUdU=;
        b=Erz1QKme2uzu1CL53DykcnrB+qfgjJVnrpzSTvOrs+a/I69PggV9QsYYLXjzqxHebU
         atO+cXtLR7n5ZB6wEgQ6IdC7lYVVlOBMbGAAUyXlYZBNl1FZgYz6TyUWfIAqXNbSXL2T
         UG9Zo2iohTfIMSlrKX2DPboaZgVGBb57qjEyd0DhZMoYf7eWWUNrKmfleK2dDnVruHHs
         bK7wxDw/KOtX5hkmXJrnkVW4hhXZ9DQR3zktMyBdMGmPnvC6GGaeQLXbYSn1zNDASMZK
         hNDcpkbLwl71VmMIITEVDlEXBFz0CGCrQ9VkpyBbLzCgSGeilwXFVz9GQVUfu8L4dHTp
         7DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wdA5SSs2A+GftYSjZhbZ3WXsisBDCmDB/JAxOYIkUdU=;
        b=jvptu+7NXXvHq1Q1xOWh7gz+spxPoy7id9hCQXXkspZrtoEt1JHqlR7ymPeRnAYFld
         m28UjHw91tEVVEePkRrU+HEeZzxYliThUJ0VEBbRbEBkJZfwG5XEFpyNoc0tRhFFJfSb
         TZQpiPZ0nzHAreFyhS68FWDK1cNnaV4QnbMlLONzV4mdvwq2UxeKInpw1qiDSYg3CTcv
         WPY63S0ytSON+aujdg3V93CKQ6ww2VadGT52g/SHRCfvWshF+z7MiEWFjQsaVGeHafvi
         8it9GdosbY7aGzBvb1q5/r+GT+FNaOJcDK6LpYUNFK21QpK4K5APmxykl/mItlHKSRlc
         iuvg==
X-Gm-Message-State: AOAM531rZbXq5liJiLdSFbuVXuSOdECImrGZnte56xp241V/8uX7WSgI
	3P4qGJqIutsYY4ddL0twVBo=
X-Google-Smtp-Source: ABdhPJyt2liP+1F1RvMMxu7z+WgrxpjuApud9EFnbwkjgtInQOBqMpdZdFYR9tePcSfc/J8YciKCbQ==
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id j1-20020a170906830100b006e4896d59b1mr21131479ejx.396.1654528481019;
        Mon, 06 Jun 2022 08:14:41 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id be5-20020a0564021a2500b0042e09f44f81sm7494001edb.38.2022.06.06.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:14:40 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: mtd: partitions: Support label only partition
Date: Mon,  6 Jun 2022 17:14:15 +0200
Message-Id: <20220606151417.19227-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606151417.19227-1-ansuelsmth@gmail.com>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_081443_508808_1C97335C 
X-CRM114-Status: GOOD (  15.34  )
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

RG9jdW1lbnQgbmV3IHBhcnRpdGlvbiBub2RlcyB0aGF0IGRlY2xhcmUgb25seSB0aGUgbGFiZWwg
aW5zdGVhZCBvZiB0aGUKcmVnIHVzZWQgdG8gcHJvdmlkZSBhbiBPRiBub2RlIGZvciBwYXJ0aXRp
b24gcmVnaXN0cmVkIGF0IHJ1bnRpbWUgYnkKcGFyc2Vycy4gVGhpcyBpcyByZXF1aXJlZCBmb3Ig
bnZtZW0gc3lzdGVtIHRvIGRlY2xhcmUgYW5kIGRldGVjdApudm1lbS1jZWxscy4KCldpdGggdGhl
c2Ugc3BlY2lhbCBwYXJ0aXRpb25zLCB0aGUgcmVnIC8gb2Zmc2V0IGlzIG5vdCByZXF1aXJlZC4K
VGhlIGxhYmVsIGJpbmRpbmcgaXMgdXNlZCB0byBtYXRjaCB0aGUgcGFydGl0aW9uIGFsbG9jYXRl
ZCBieSB0aGUKcGFyc2VyIGF0IHJ1bnRpbWUgYW5kIHRoZSBwYXJzZXIgd2lsbCBwcm92aWRlIHJl
ZyBhbmQgb2Zmc2V0IG9mIHRoZSBtdGQuCgpOVk1FTSB3aWxsIHVzZSB0aGUgZGF0YSBmcm9tIHRo
ZSBwYXJzZXIgYW5kIHByb3ZpZGUgdGhlIE5WTUVNIGNlbGxzCmRlY2xhcmVkIGluIHRoZSBEVFMs
ICJjb25uZWN0aW5nIiB0aGUgZHluYW1pYyBwYXJ0aXRpb24gd2l0aCBhCnN0YXRpYyBkZWNsYXJh
dGlvbiBvZiBjZWxscyBpbiB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1
ZWxzbXRoQGdtYWlsLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0
aW9uLnlhbWwgICAgICAgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlh
bWwKaW5kZXggZTFhYzA4MDY0NDI1Li5iZmY2ZmI5ODBlNmIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFy
dGl0aW9uLnlhbWwKQEAgLTExLDYgKzExLDEzIEBAIGRlc2NyaXB0aW9uOiB8CiAgIHJlbGF0aXZl
IG9mZnNldCBhbmQgc2l6ZSBzcGVjaWZpZWQuIERlcGVuZGluZyBvbiBwYXJ0aXRpb24gZnVuY3Rp
b24gZXh0cmEKICAgcHJvcGVydGllcyBjYW4gYmUgdXNlZC4KIAorICBBIHBhcnRpdGlvbiBtYXkg
YmUgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGJ5IGEgc3BlY2lmaWMgcGFyc2VyIGF0IHJ1bnRpbWUu
CisgIEluIHRoaXMgc3BlY2lmaWMgY2FzZSwgdGhlIGxhYmVsIGlzIHJlcXVpcmVkIGluc3RlYWQg
b2YgdGhlIHJlZy4KKyAgVGhpcyBpcyB1c2VkIHRvIGFzc2lnbiBhbiBPRiBub2RlIHRvIHRoZSBk
eW5hbWljY2FsbHkgYWxsb2NhdGVkIHBhcnRpdGlvbgorICBzbyB0aGF0IHN1YnN5c3RlbSBsaWtl
IE5WTUVNIGNhbiBwcm92aWRlIGFuIE9GIG5vZGUgYW5kIGRlY2xhcmUgTlZNRU0gY2VsbHMuCisg
IFRoZSBPRiBub2RlIHdpbGwgYmUgYXNzaWduZWQgb25seSBpZiB0aGUgcGFydGl0aW9uIGxhYmVs
IGRlY2xhcmVkIG1hdGNoIHRoZQorICBvbmUgYXNzaWduZWQgYnkgdGhlIHBhcnNlciBhdCBydW50
aW1lLgorCiBtYWludGFpbmVyczoKICAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+CiAKQEAgLTIyLDYgKzI5LDggQEAgcHJvcGVydGllczoKICAgbGFiZWw6CiAgICAgZGVzY3Jp
cHRpb246IFRoZSBsYWJlbCAvIG5hbWUgZm9yIHRoaXMgcGFydGl0aW9uLiBJZiBvbWl0dGVkLCB0
aGUgbGFiZWwKICAgICAgIGlzIHRha2VuIGZyb20gdGhlIG5vZGUgbmFtZSAoZXhjbHVkaW5nIHRo
ZSB1bml0IGFkZHJlc3MpLgorICAgICAgV2l0aCBkeW5hbWljYWxseSBhbGxvY2F0ZWQgcGFydGl0
aW9uIHRoZSBsYWJlbCBpcyByZXF1aXJlZCBhbmQgd29uJ3QKKyAgICAgIGZhbGxiYWNrIHRvIHRo
ZSBub2RlIG5hbWUuCiAKICAgcmVhZC1vbmx5OgogICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFt
ZXRlciwgaWYgcHJlc2VudCwgaXMgYSBoaW50IHRoYXQgdGhpcyBwYXJ0aXRpb24KQEAgLTQxLDcg
KzUwLDEwIEBAIHByb3BlcnRpZXM6CiAgICAgICBpbW11bmUgdG8gcGFpcmVkLXBhZ2VzIGNvcnJ1
cHRpb25zCiAgICAgdHlwZTogYm9vbGVhbgogCi1yZXF1aXJlZDoKLSAgLSByZWcKK2lmOgorICBu
b3Q6CisgICAgcmVxdWlyZWQ6IFsgcmVnIF0KK3RoZW46CisgIHJlcXVpcmVkOiBbIGxhYmVsIF0K
IAogYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
