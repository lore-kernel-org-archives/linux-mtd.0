Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB51C74A5B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i86yt+qR+w/+ohhjKwBv6XU9h6cCpwMBp0b/sjEPB6w=; b=2k1VVjIUMwt7U2Rsg57Kt/Dt98
	nX1O29/FwJ/j10aH06Zj7q+6DcT8vjDeMRVMLfrkB6LWBb5EJG/28TPEcuvDXiQ7ZkUDw8Nnjt1QD
	tqOBuYUb2NIHTsF6qQMytz3h1tF8ewcvnpel6iftPBzquVsiBySg3jfDUnpGgwb1wQ3YAWQ4eJ6/p
	GuNLFlblhNsAcIdPv08amIo+g/80YaVpOMDQQmEpEIOAQTWItL3ZtDHmBU2lMQZxWONT10DegzPec
	5NZgKDNL13QCWpV/HhOTSL8vBlxrTkNsWeLFoML9lVyRBTZ5jfdojFiZI/zyQFOZ+d5pXVkR3xD8f
	1+7se75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebEp-00CLnl-2S;
	Tue, 21 Mar 2023 12:37:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebEn-00CLmq-0O
	for linux-mtd@lists.infradead.org;
	Tue, 21 Mar 2023 12:37:14 +0000
Received: by mail-lf1-x133.google.com with SMTP id k37so5965820lfv.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679402228;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvG4pgdfGqR6pYV/v1cqgj6VbkM5imqTHjM8zonyodk=;
        b=C9BKkYpODqpk5Izf5P/D0X+U4m3+9k4fJ7uD1aJxp2crfC9Ueptl6Pi9z0nOfXll92
         ruaxmWgsSGV4oRoE6pGNkAYck/uATsvOu+ajChL1OkDxde5pvIVU/MEWqNIdMXnHggGZ
         sHmQiX5gttqZdSqdqgwe4kNxZsiS7HBtrrEidzJWJ9cJ0qLZ1/yQyS8uZteM3WBILTOJ
         J+kgZCisPwxGmHNdvcDCgEUd8eun5FiOT3esejwdIyltgXgViwfv+zE/RPB62Zz9oYLR
         WUhcO1peEBDXcd+mf5ItEHGI94tK82+Cqd4//Klv7iVL2jwTPnqTao0qhFiGt2ln/XQU
         ybcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679402228;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LvG4pgdfGqR6pYV/v1cqgj6VbkM5imqTHjM8zonyodk=;
        b=EL3iBau2LUbUZ7Mmcl/oM8e6NPe6y6UDkTry9/VALGjrt14N/uzwIy5s3Kt2EsgvkF
         +CkU1NNHsqszsa2fgdqgtzXG5Cpbuc5RIt7fdpyLu/n1gJQ6bBhWNLrp94eARe5SKTTm
         WwGZrH9C+ah8XlcVk3SsKhYOKYO+TRH6aamRPeR8XrFNR+VmjMxNN3WwCoDNdcS8dnm/
         ANKpmzTAjz9YIaOxsKOUpCowvNVSDOEiFgRQ9UPxoGvFc9Z1kN4qKKJNjWkq3LD+1SQU
         FrbLEAnLsQSD32nNCXg3MvFefcOlQHf2JVjl+riUO7k6xBNP6vASbVvorV0kLsWJWrKU
         c9gQ==
X-Gm-Message-State: AO0yUKVwgJS71UDXZFO/C4w1T1mm/Fe06KfTK55g0PzT81C9fUDDHTNH
	KpVbNdcgYvO7zCSV5ZmmAh8=
X-Google-Smtp-Source: AK7set90ZghV9IMeuLACkpvhjkpk0sc316MT1SexpY6JJ5aHQToBonkuwdFC4FxVi4Pbtj6YrhKpvA==
X-Received: by 2002:a19:7609:0:b0:4ca:ffe0:e754 with SMTP id c9-20020a197609000000b004caffe0e754mr1015719lff.18.1679402228362;
        Tue, 21 Mar 2023 05:37:08 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id z17-20020a056512377100b004e8373b2bfcsm2145903lft.176.2023.03.21.05.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 05:37:07 -0700 (PDT)
Message-ID: <d5533e3b-fad0-4c0f-cccf-b94c1957455f@gmail.com>
Date: Tue, 21 Mar 2023 13:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe deferrals
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
References: <20230307192506.439532-1-miquel.raynal@bootlin.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230307192506.439532-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_053713_158958_E87CBB47 
X-CRM114-Status: GOOD (  20.10  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNy4wMy4yMDIzIDIwOjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IFRoZXJlIGlzIG5vIHJl
YXNvbiB0byBjb21wbGFpbiBhYm91dCBwcm9iZSBlcnJvcnMgaW4gY2FzZSBvZiBkZWZlcnJhbHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KCkFja2VkLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cgo+IC0t
LQo+IENoYW5nZXMgaW4gdjI6Cj4gKiBVc2Ugb2YgZGV2X2Vycl9wcm9iZSgpLgo+IAo+ICAgZHJp
dmVycy9tdGQvbXRkY29yZS5jIHwgOSArKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDBmZWFjYjlmYmRhYy4u
ZTRlMTAyNTg1MDIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IEBAIC01MzYsMTIgKzUzNiwxMSBAQCBzdGF0aWMgaW50
IG10ZF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gICAJbXRkLT5udm1lbSA9IG52
bWVtX3JlZ2lzdGVyKCZjb25maWcpOwo+ICAgCWlmIChJU19FUlIobXRkLT5udm1lbSkpIHsKPiAg
IAkJLyogSnVzdCBpZ25vcmUgaWYgdGhlcmUgaXMgbm8gTlZNRU0gc3VwcG9ydCBpbiB0aGUga2Vy
bmVsICovCj4gLQkJaWYgKFBUUl9FUlIobXRkLT5udm1lbSkgPT0gLUVPUE5PVFNVUFApIHsKPiAr
CQlpZiAoUFRSX0VSUihtdGQtPm52bWVtKSA9PSAtRU9QTk9UU1VQUCkKPiAgIAkJCW10ZC0+bnZt
ZW0gPSBOVUxMOwo+IC0JCX0gZWxzZSB7Cj4gLQkJCWRldl9lcnIoJm10ZC0+ZGV2LCAiRmFpbGVk
IHRvIHJlZ2lzdGVyIE5WTUVNIGRldmljZVxuIik7Cj4gLQkJCXJldHVybiBQVFJfRVJSKG10ZC0+
bnZtZW0pOwo+IC0JCX0KPiArCQllbHNlCj4gKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZtdGQt
PmRldiwJUFRSX0VSUihtdGQtPm52bWVtKSwKPiArCQkJCQkgICAgICJGYWlsZWQgdG8gcmVnaXN0
ZXIgTlZNRU0gZGV2aWNlXG4iKTsKPiAgIAl9Cj4gICAKPiAgIAlyZXR1cm4gMDsKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
