Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F5EB64D8
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS1WpDnMVaPNkkRqSXdiwEksqW1bwnM+rsZWTVD7hn0=; b=HjDa1v30QofbOW
	zN+yhqRCMXFXi8auBL07HCcRU0NFniwpeS77eaTESaw89OdSdPO7/NC2oaIUp8nC9rGsZXFgqy73i
	DmdprvyrbpGJ2SROHuY2GKBLXPrvONGLW7nW+45Tl/jxk/WlhiKaYqZUsaQI3dhYpEwJ70VREpKBc
	3shR2MdwNFLz8y+iljIIfHMMnbOBg+68zgJUQcN/zWBATRUHc7nr+4BeXhHxPeozZvlKZOXhjBaTI
	+/49vcEjafjsQ5gQN34WzPKxlIiXVbJlICXqbwjHIBx4RvtY7L9uWIjY0epGkk3CA54PdnVrC7tJl
	CJo6U/yIWBJK+6aDr09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BS1-009Cio-1K;
	Tue, 13 Jun 2023 21:21:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BRw-009ChU-0K
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 21:21:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9741caaf9d4so4972566b.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2023 14:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686691268; x=1689283268;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YD94vOp+VeZ4x56jPA7n1R/f7iEhDVnQp4dgxqoTLC0=;
        b=maAo6QrORoNrVat7yzcWUR6fp3xFXYHuromco3f1O85GNQz0XcDsVTOS5LJi9+0XvE
         HXEQT7BadwX6Fn7CYhwFB6iF+MccboFdqtnCKflfzcqj4DQjDI82UmMAJxsGC1rzrz72
         a7+1QWOKleODvJ3fcENOryX39Ju8PqS0jl94/3VrhDB9ID9dpvHsWEThIfQeNDJ4AWBV
         WoQ7XpxJejoIU7UBsnmYoX4beuw/kkZF2Gc3YnG28/afe8Vk6NYbhQn6I3zn27ABIoje
         leqWoflfKjwjXwqraDiYXEFGaP6oUWWMG1GUoYqrqZ9ZsJvQyT2MfdfJaJtSY95SbAht
         Ufaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686691268; x=1689283268;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YD94vOp+VeZ4x56jPA7n1R/f7iEhDVnQp4dgxqoTLC0=;
        b=ij/gc9JMre7CTVhETXvoL2Iw/HLPi2t79jyzSRqBG6/zDdI1BVybxspLb6+EOplKYM
         PAZj99zE/ltCUEAAkaC0du5Jy/NfzFPDysdPTX8ENBwDdpyvcWKtubYBhWfBVD4P4P73
         YeLBm2O0VAz1IIKWTarGj8lQNXrfukOtzPvyp7jBIj92jHSOkRtfqJXJ85TBu0Pybahj
         KlIMO+qfOuYPg6jdBMGKRiOwaSnRZNCo8M4NZNFwqKzQECLYyV3WDPOrRj4AsnPCSoNc
         x0KzfeXA2SU6MksiN/rp6icVdy4zwe5Rc1tBZ+kmnEFffQjldoqGVkI8b4wn7H57qxhe
         P07A==
X-Gm-Message-State: AC+VfDy9rnD3IkrBrftJWLAwJdQGnzfz7LR1Osz5DjKSrcgYaYbhpcWD
	QRB8ESpjR+g7gkYqg44D1ZvZ2PL9Peo=
X-Google-Smtp-Source: ACHHUZ77VWB5N68nFFmF78x9lgJLVYVTIBt6Q//KTTPeWKubrYbQaEBDsb4UO/KKop9jXks7g7AOjA==
X-Received: by 2002:a17:906:db03:b0:974:1f0e:ec2d with SMTP id xj3-20020a170906db0300b009741f0eec2dmr13859467ejb.15.1686691268034;
        Tue, 13 Jun 2023 14:21:08 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906298700b00965b2d3968csm7229520eje.84.2023.06.13.14.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 14:21:07 -0700 (PDT)
Message-ID: <98811c98-4681-6ddc-8287-bd9b77559c51@gmail.com>
Date: Tue, 13 Jun 2023 23:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v3 2/2] mtd: rawnand: add support for the Sandisk SDTNQGAMA
 chip
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <aaf4580a-a368-8f70-c9c4-21b5ed4dd599@gmail.com>
Content-Language: en-US
In-Reply-To: <aaf4580a-a368-8f70-c9c4-21b5ed4dd599@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_142112_139877_651D676F 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

U2FuZGlzayBTRFROUUdBTUEgaXMgYSA4R0Igc2l6ZSwgMy4zViA4IGJpdCBjaGlwIHdpdGggMTZL
QiBwYWdlIHNpemUsCjFLQiB3cml0ZSBzaXplIGFuZCA0MCBiaXQgZWNjIHN1cHBvcnQKCkNvLWRl
dmVsb3BlZC1ieTogUGF3ZcWCIEphcm9zeiA8cGF3ZWxqYXJvc3ozNjkxQGdtYWlsLmNvbT4KU2ln
bmVkLW9mZi1ieTogUGF3ZcWCIEphcm9zeiA8cGF3ZWxqYXJvc3ozNjkxQGdtYWlsLmNvbT4KU2ln
bmVkLW9mZi1ieTogSm9oYW4gSm9ua2VyIDxqYng2MjQ0QGdtYWlsLmNvbT4KLS0tCgpDaGFuZ2Vk
IFYzOgogIFNlcGFyYXRlIHNlcmllCiAgQ2hhbmdlIHByZWZpeGVzCi0tLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9pZHMuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKaW5kZXggMWE4OWVkNzk2Li42NTAzNTFjNjIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9pZHMuYwpAQCAtNDQsNiArNDQsOSBAQCBzdHJ1Y3QgbmFuZF9mbGFz
aF9kZXYgbmFuZF9mbGFzaF9pZHNbXSA9IHsKIAl7IlRDNThOVkc2RDIgNjRHIDMuM1YgOC1iaXQi
LAogCQl7IC5pZCA9IHsweDk4LCAweGRlLCAweDk0LCAweDgyLCAweDc2LCAweDU2LCAweDA0LCAw
eDIwfSB9LAogCQkgIFNaXzhLLCBTWl84SywgU1pfMk0sIDAsIDgsIDY0MCwgTkFORF9FQ0NfSU5G
Tyg0MCwgU1pfMUspIH0sCisJeyJTRFROUUdBTUEgNjRHIDMuM1YgOC1iaXQiLAorCQl7IC5pZCA9
IHsweDQ1LCAweGRlLCAweDk0LCAweDkzLCAweDc2LCAweDU3fSB9LAorCQkgIFNaXzE2SywgU1pf
OEssIFNaXzRNLCAwLCA2LCAxMjgwLCBOQU5EX0VDQ19JTkZPKDQwLCBTWl8xSykgfSwKIAl7IlNE
VE5SR0FNQSA2NEcgMy4zViA4LWJpdCIsCiAJCXsgLmlkID0gezB4NDUsIDB4ZGUsIDB4OTQsIDB4
OTMsIDB4NzYsIDB4NTB9IH0sCiAJCSAgU1pfMTZLLCBTWl84SywgU1pfNE0sIDAsIDYsIDEyODAs
IE5BTkRfRUNDX0lORk8oNDAsIFNaXzFLKSB9LAotLQoyLjMwLjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
