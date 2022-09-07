Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1562FECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNspkjKXJW6a63UVMdr5a58upyj297BgE1tbIBqFm0E=; b=a77X9vyArNP8wf
	MvId6f9V1+VgNut/iT8YOvBdr3m09Zc+0Xu5jhzCw5tYZ9AzUc43SYfGOLN5OlTJR31gMQTo1saio
	KKzi9EaV99J1WlWEG1jTEnX1yiuB+vciPlhXTEG7H+2VkyGddeVo6SCSwtXV5/c/M31k7Bae7+cQq
	9Qtuw/ashKfK5RY/fcLAkfTxnQ2Cw3dcfnAlkyUbN79mt5be5W7KhPitouQcDjKR1SHTWFp3H8Ps3
	9842xkxIlBuBE+8LiGkHPhPA7OT7+Hkn+2LqVqgw6L5f/jRxwhuhER0FEwumVm7kPxSd6K5mTQaV9
	q3H3VFUf8UlNgEGl57aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVsF1-005IP5-GS; Wed, 07 Sep 2022 10:25:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVsEx-005IMT-SL
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2022 10:25:05 +0000
Received: by mail-lf1-x135.google.com with SMTP id a8so117541lff.13
        for <linux-mtd@lists.infradead.org>; Wed, 07 Sep 2022 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fEUqt9+qxUMWX8ZXycy90WtW/syx1Y2If6HQeNXBw3M=;
        b=oZxiH+wzBb4W/26mmXuGLuepWKl7gUHnD82V8shRrB/qT/iV2ygQGBcLaVcsSo2wkm
         awmbgrNlcQNeYR4lucqKP/fbV1V9NiISnLfEnq1SjCyknOOFZ7lmtUZs8g2q2fif5FvP
         gZcfe6luQ0aUSsjWgAs3UpHaDh5mabxY0VtP/sjnzyT3Pki0LQoZ6mGDITzy52MGUHOj
         Ei+bT5XCT+UwDe/sZ5ag0VL+1zl7YQZEiw8FEjretfO3bSaUiV0tGbxM4L5VvFvaIgJH
         qo4dgG0NleLhcRBC16OvZkXIgYjWKqemJYJWCQ/o5/sV/7+Jv/+I/eumGhjzGY/MfUSP
         Xr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fEUqt9+qxUMWX8ZXycy90WtW/syx1Y2If6HQeNXBw3M=;
        b=XH0uMcnSLjJyMsMy3xuTCDpRCpxUNNQpJt9BCiLgUj4sgOkodJJ+Nz3TjIcAllkU9W
         aG+I2kVJQwE4lEMkAoHKC0UrEHe9D4V9vHRk3Fi8nb4B95dwerg1W7FQsh5oVkF77n5H
         UKEjTSNUXK0Y8fc1XnPS6pccz0VqBiaoAjL2kcz2Q/5LVPgLqLd2rS7qPf3EJML1FbHC
         vKZFGvS6+adx3KiA1ozvfGRQ6eAD98XGUXce/P3z1RwcjuytzR6T+ipDiKeVtn+3deMN
         bhz9GrczHGQLfpQfGzp6ShLBhk5kHkwemvBiBFIhcLNPPrBS2n8blBmpJey94xtl52W4
         yCVw==
X-Gm-Message-State: ACgBeo1H9xOndBsxsVMrxAiUL4wdbXl7U3p1M6oCbPDy8lIbPNjApppb
	XmZFl3gIvOWkZKOPq21IQcDdhw==
X-Google-Smtp-Source: AA6agR6LtW2cVXdK9UY9CfzEJFLOaWhbSandN3K2DvIbIOcseMAC1gjJtA0vqrQGUWJcce/Fs82BnQ==
X-Received: by 2002:a05:6512:ac1:b0:491:571c:3ef7 with SMTP id n1-20020a0565120ac100b00491571c3ef7mr875597lfu.176.1662546300226;
        Wed, 07 Sep 2022 03:25:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s26-20020a05651c201a00b0026a999966bbsm1112677ljo.24.2022.09.07.03.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 03:24:59 -0700 (PDT)
Message-ID: <51d57c7d-18ea-78e0-cb6a-e84181e36ad3@linaro.org>
Date: Wed, 7 Sep 2022 12:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
 property
Content-Language: en-US
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
 <20220901072914.30205-2-sai.krishna.potthuri@amd.com>
 <6b06f88e-128d-7ce6-b97b-b5cacfc4834d@linaro.org>
 <BY5PR12MB4258128603AA297DD8FAB168DB7B9@BY5PR12MB4258.namprd12.prod.outlook.com>
 <83444851-14ef-b293-6581-1307331fb1c4@linaro.org>
 <BY5PR12MB425896652F8056EAD47E1042DB419@BY5PR12MB4258.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR12MB425896652F8056EAD47E1042DB419@BY5PR12MB4258.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_032503_938096_EB624FE5 
X-CRM114-Status: GOOD (  10.62  )
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

T24gMDcvMDkvMjAyMiAxMTo0OSwgUG90dGh1cmksIFNhaSBLcmlzaG5hIHdyb3RlOgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTYWkgS3Jpc2huYSBQb3R0aHVyaSA8c2FpLmtyaXNobmEucG90
dGh1cmlAYW1kLmNvbT4KPj4+Pj4gLS0tCj4+Pj4KPj4+PiBZb3Ugc3RpbGwgbWlzcyB0aGUgdXNl
ciAoRFRTKSBvZiB0aGlzIGNoYW5nZS4uLgo+Pj4gRG8geW91IG1lYW4gdG8gaGF2ZSB0aGlzIHBy
b3BlcnR5IGluIGV4YW1wbGUgRFRTIGluIHRoaXMgeWFtbD8KPj4KPj4gTm8sIEkgd2FudCB0byBz
ZWUgaW4tdHJlZSBEVFMgdXNpbmcgaXQuCj4gQXMgTWljaGFsIFNpbWVrIHRhbGtlZCB0byB5b3Ug
YWJvdXQgdGhpcyBvdmVyIElSQywgYXMgb2Ygbm93IHdlIGRvbuKAmXQgaGF2ZQo+IGEgRFRTIGlu
IHRoZSBtYWlubGluZSB0cmVlIGZvciBYaWxpbnggVmVyc2FsIHBsYXRmb3JtIGJ1dCB3ZSBoYXZl
IGEgcGxhbiB0byBkbyBpdC4KPiBGb3IgdGltZSBiZWluZyBpIHdpbGwgYWRkIHRoaXMgcHJvcGVy
dHkgaW4gdGhlIGV4YW1wbGUgZHRzIGluIHRoaXMgeWFtbCBmaWxlLgoKU3VyZSwgc291bmRzIGdv
b2QuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
