Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E24AC6FD1C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5/h99eiO8PfO0ZCuk7Nzq+gLjNYM/RX2j7movcb86Y=; b=ZCQVxwcVWWFBKQ
	X8ArJ0rz7KexWDEHK/27aMlvDRFToXvt2pa54zaDGwqg3WgDDWLrAaQ1L9zaEujQX6To5LWhNTpQ0
	p3LOW/mzLOj5/V2Fn9YeTt9i6EqH1qgcevr5XI+OUgLTyhvBMm7J0m4x2j/inYIIge3QrxefZu5ZT
	aycB+FQK1kklAtUQHzcc3RiQrdGaPl8of/yBabX0wmiL1cTuRIthBgDivOOrIu23+j5KJPiNzRLsY
	hh5ormw7fW5ZME9ewL0T5u/dEKpKDTx2N9sXf8dXCe5lrjwlBMFj6hsKV3weAIZVPIMn5WLwL13Pp
	AKl3knU9bFets+vtV95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJm-001xup-34;
	Thu, 23 Mar 2023 12:45:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJk-001xrq-14
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 12:45:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e18so8804392wra.9
        for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2023 05:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umlB44Y9/RQzoXmteHKil0EY6NqmhxRrqoCy6EX0T8g=;
        b=TzvzX1Xn+K5UaV3D5wgIpQWr0uYwlfNOc90LuAIMcZYFZp7B3umvE+v7lr9BCy0nCY
         2LeLr4VC/IAEw8f+btKGzFlHIChD3cn9nYnFxa5l7Oq1P0oSvLaLLRNURCgxBaF2rr18
         XUPUih1JRmGPpCaXVkGakzvgyYUDUu0vflKjwZkI83+R040kXlltuc1OJyjEFoMxJ/Z/
         w4TlVcDb8mMkQT2ezaRv304zX+NjCff7UnC3UH/eSjLhUCQFP+EU4fOUC4Hesp6nnQyA
         HQuZ0ai4jSMrvj6f56oT8I9b25o+eoMqZkhKDlPNX/QbKyDeHCmnNcVXV2wTMPYMElbW
         6n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umlB44Y9/RQzoXmteHKil0EY6NqmhxRrqoCy6EX0T8g=;
        b=4elzKbF+COUQYhhQOGPqn1lv/nIqBVGKYgr18GMyhG+YGEyubiqZoLF9U6ZDAyaKJd
         V1cQDXXUs64VPuGSrNR9cp9m98bn46ip95RWp1h/8yBKckn8gdLunkx7wMGXEkL+2+ab
         IU8R3S9DPNbQeW6C7HX1lc6Yfw7B9YN7fRunrFb/PIfwdpcOAB2w7lSWqNOo/XkO3Chm
         FOcSIzhaRudibRPcvtE9POb6JcnFtFsFNTJPjuJsgrWl7MimhQ/7zjfiXVldL8OKDzih
         naoncPwrhxM4zcVpVdxtGBqwGWGn4mg5c+Gaw9dRdK5ofOepPzfBGSptbed5JWBysTjP
         KJQA==
X-Gm-Message-State: AAQBX9fYOQfl4mPzwRzfEXzBfUTjUqoQwDQNkKX2TcMRr+2wBKfsp01j
	m19s01lnG1WONz+NZdkZ8cM=
X-Google-Smtp-Source: AKy350ZDqwo8YwYfUss1BF/h6Qz1Yl5+RUi3hjTf9ysdr0R6WyZz+l/CRqg0gdF/P9gfC7ryPqWBWQ==
X-Received: by 2002:a5d:4a4d:0:b0:2cf:e132:bfbb with SMTP id v13-20020a5d4a4d000000b002cfe132bfbbmr2313892wrs.38.1679575514978;
        Thu, 23 Mar 2023 05:45:14 -0700 (PDT)
Received: from atlantis.lan (255.red-79-146-124.dynamicip.rima-tde.net. [79.146.124.255])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c1c0900b003ee6aa4e6a9sm1942939wms.5.2023.03.23.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:45:14 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	masonccyang@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 2/2] mtd: nand: raw: macronix: allow disabling block protection
Date: Thu, 23 Mar 2023 13:45:10 +0100
Message-Id: <20230323124510.2484808-3-noltari@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230323124510.2484808-1-noltari@gmail.com>
References: <20230323124510.2484808-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_054520_369774_268E1308 
X-CRM114-Status: GOOD (  10.27  )
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

U29tZSBkZXZpY2VzIGhhbmcgd2hlbiBibG9jayBwcm90ZWN0aW9uIGlzIGVuYWJsZWQsIHNvIGxl
dCdzIGFkZCBhIGJvb2xlYW4KcHJvcGVydHkgdG8gYWxsb3cgZGlzYWJsaW5nIGl0LgoKRml4ZXM6
IDAzYTUzOWM3YTExOCAoIm10ZDogcmF3bmFuZDogTWFjcm9uaXg6IEFkZCBzdXBwb3J0IGZvciBi
bG9jayBwcm90ZWN0aW9uIikKU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFz
IDxub2x0YXJpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jv
bml4LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMKaW5kZXggMTQ3MmY5MjVmMzg2Li5iOWYwMzM4ZWJkYWYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYworKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMKQEAgLTIxOSw5ICsyMTksMTMgQEAg
c3RhdGljIGludCBteGljX25hbmRfdW5sb2NrKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZf
dCBvZnMsIHVpbnQ2NF90IGxlbikKIAogc3RhdGljIHZvaWQgbWFjcm9uaXhfbmFuZF9ibG9ja19w
cm90ZWN0aW9uX3N1cHBvcnQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKIHsKKwlzdHJ1Y3QgZGV2
aWNlX25vZGUgKmRuID0gbmFuZF9nZXRfZmxhc2hfbm9kZShjaGlwKTsKIAl1OCBmZWF0dXJlW09O
RklfU1VCRkVBVFVSRV9QQVJBTV9MRU5dOwogCWludCByZXQ7CiAKKwlpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKGRuLCAibXhpYyxkaXNhYmxlLWJsb2NrLXByb3RlY3Rpb24iKSkKKwkJcmV0dXJu
OworCiAJYml0bWFwX3NldChjaGlwLT5wYXJhbWV0ZXJzLmdldF9mZWF0dXJlX2xpc3QsCiAJCSAg
IE9ORklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVDVElPTiwgMSk7CiAKLS0gCjIuMzAuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
