Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C423BC41513
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tP4ysyl9Ks419wGmow/YxGDKbFC7p5RA7X+785ZhXS8=; b=DjXwp6L+WQ8Pjq
	niqJD1ZUA8/z4N8mkgOGd9BtI6LB85rokjUU//wrA6DnZAL3M7vkf/gWuSP7z5w8n92PB5KLMID9p
	0QURopidNvFeY6QwBycDjMV08NJ3y9EeiPvnG9Cr8VdSWQ6zBDt81v842X+IX04v4hxlUAnhuhz82
	+mDkIZH2H5dao9N93DGk5T6mbdVZaXNkateJot4Xl6EQIhTRAJgPpVMiKHQVigrbqTtByB7V3AMZr
	D62810gmw0eh1ELQ9KyC9yZ6ri24Fal7QdKaHI1qpa8OMBQosxj/9dszb9LYfv6z7WB/bqgTOBAaA
	DRjcfLVihzdhM0io3suQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDf-00360N-1Y;
	Fri, 28 Jul 2023 11:01:15 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDc-0035wA-1X
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 11:01:14 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b962c226ceso29955051fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 04:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690542068; x=1691146868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edm4Ph1uwoatUBIl/nO8+W/Z+DAK2COYGbrTolYZ2G4=;
        b=xOnIh0XFySrFq31d9farT5qlbbku3kyyxwG0mGjGUrjbrp+Gma5eJPdY2nzlpfjNdj
         Wks0eADzJmNO1a6sncSY0bTp3brOByUKYiBVPj65f/8p08LoOkYszekPaGQM4dojmGDE
         wkfvuTthmgs+rUIqLyCtQsARnSk2TL99zil9yi+MQp0oAYxJ+CfTwB3ODpg88MGxEpvm
         MkjxDjT+6KxbkkxeJTeMIYfLBG8firkErNqgiYIx2jB+sKTCBCt6YSrCgtJEbCfwUVJg
         /jY1pZ2jjlDCCwrbt6rqj2gI3mJKfxM8r29vA+hrE+MXelIjfG2CbOpLpHIJlXJ/V0Cq
         apMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542068; x=1691146868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edm4Ph1uwoatUBIl/nO8+W/Z+DAK2COYGbrTolYZ2G4=;
        b=ggGecGJ4RCdTeRpefsJNWr7poj/OVBPqdP1EI1LCCPGLvHCYSCQkrLAWcWyfnLtviN
         5KS8YAO3nHF1mNvyLbzxsEtvlx2eyjRKmt+kn7zCYVe2jwTT8WdNVML8NlMINMOWXoKj
         YRJpl0iEYC/ofthEXvuCgjB44DW3r3+qTsMoPbJEf7pRfyHR4/gM4n0VFNrQhKUx56r1
         pQNuPSUAExtC1jc1+q0sE5FHqsDaiX2tNbCuIU+3TFcR7JFq1KyD9EPAezOvoDD8jgoL
         cNuziHY9HZfyotj3MK+4hVAc4F8F+7yDUN+tVgBtz3K0HYrejW0zHud9VfXb4RdCmjY8
         +5Lw==
X-Gm-Message-State: ABy/qLb8bXZ5teojMBcT9k0sf96+/Rb9gJy+QjjMo6F/+4pYXruZyRzi
	+jIfUv38hHRRUG8+1UG6Wn1jmLvSp18r8pbiU+c=
X-Google-Smtp-Source: APBJJlH13mCJYd3NtClO89JGPVBF+/fmMGFKFQFBbIF/xO6JCbnXxtaq0UfyUiLcs5Xv+horR77oIQ==
X-Received: by 2002:a2e:81c3:0:b0:2b6:d9dd:f65f with SMTP id s3-20020a2e81c3000000b002b6d9ddf65fmr1502448ljg.17.1690542067917;
        Fri, 28 Jul 2023 04:01:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id k1-20020a7bc401000000b003fc06169abdsm3987407wmi.2.2023.07.28.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:01:07 -0700 (PDT)
Message-ID: <69c1411d-948d-a209-49ee-767e6f46ce4d@linaro.org>
Date: Fri, 28 Jul 2023 12:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com>
 <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
 <4ffbc99f5174fe48182211d489efa115@walle.cc>
 <0ed5a344424fccb6bcbef6496dccbc77@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <0ed5a344424fccb6bcbef6496dccbc77@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_040112_521214_9901BBE1 
X-CRM114-Status: GOOD (  15.06  )
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

CgpPbiA3LzI4LzIzIDEwOjQ2LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+Pj4+ICvC
oMKgwqAgLyogTWFjcm9uaXggU1BJLU5PUiBmbGFzaCA4RC04RC04RCByZWFkIElEIHdvdWxkIGdl
dCA2IGJ5dGVzIGRhdGEgQS1BLUItQi1DLUMgKi8KPj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkg
PCBub3ItPmluZm8tPmlkX2xlbjsgaSsrKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYnVmW2kg
KiAyXSAhPSBub3ItPmluZm8tPmlkW2ldKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+Pgo+PiBXZSBuZWVkIHNvbWUga2luZCBvZiBwZXIgZmxhc2ggcmRpZCBv
dmVycmlkZS4gSSBndWVzcyByZGlkIHdvbid0IHdvcmsKPj4gaW4gb2N0YWwgbW9kZSB0aGVuLiBB
cmUgYW55IG90aGVyIGNvbW1hbmRzIGFsc28gYWZmZWN0ZWQ/Cj4gCj4gSmFpbWUgd2FzIGtpbmQg
ZW5vdWdoIHRvIHNlbmQgbWUgc29tZSBkYXRhc2hlZXRzIGFuZCBpdCBsb29rcyBsaWtlCj4gc29t
ZSBjb21tYW5kcyB3aWxsIHJldHVybiB0aGUgcmVzcG9uc2UgYnl0ZXMgaW4gU1RSIG1vZGUuIFNv
LAo+IHRlY2huaWNhbGx5LCB0aGUgY29ycmVjdCB0aGluZyB0byBkbyBoZXJlIHdvdWxkIGJlIHRv
IHVzZQo+IDhELThELThTIG1vZGUuIE90aGVyIGNvbW1hbmRzIHdpbGwgYWxzbyByZXNwb25kIGlu
IFNUUiBtb2RlLCBidXQKPiBJIGd1ZXNzIHdlIGRvbid0IG5vdGljZSBiZWNhdXNlIG1vc3Qgb2Yg
dGhlbSBhcmUganVzdCBvbmUgYnl0ZS4KPiBCdXQgSSB0aGluayB3ZSBzaG91bGQgZ2V0IHRoaXMg
Y29ycmVjdCBpbiB0aGUgY29yZS4KPiAKCmhhcHB5IHRvIGdldCBwYXRjaGVzIGZvciByZXZpZXch
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
