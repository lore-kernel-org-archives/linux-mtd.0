Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C11C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWQc4PguKOHXcRJC81EAl+mzCE0VDZzFcnrAmUNv5g4=; b=ttiPNPOmYSvvpB
	LS5+0WkIoEzM6fwLDDUEsfxPG0wt5D0wjfkZdVoxdX3Q+7JXXH2c7aZNu8kFdYNpnAP1WOpWvZD/k
	ZGBd5BTdIRBjQSyfmBUPQycolHoZGM9aOdyVHgYy4PRS+u+12YtslziLXdRyBt8XY6elC1M9L3Vyw
	IpbPgLadzZxv1TEKsET4bts5+aY4PvkqeJkqDFl9UiBf+61Qk0Ze4OsStV7rjA8hmVj8moR5RUYDL
	dC/ZRTTWPzt6KrUsxkkB7AA2s9phjJHvxzBlEO0o+6Vj1KqfPl1TQJwA8qd/CRmhd9dbFPEe+UgdR
	jcUlKYC9/3Gqwu7PMesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwjr-008ZTN-Vi; Fri, 22 Jul 2022 17:47:00 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwjp-008ZQI-Ej
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 17:46:59 +0000
Received: by mail-lj1-x229.google.com with SMTP id by8so6245034ljb.13
        for <linux-mtd@lists.infradead.org>; Fri, 22 Jul 2022 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4pDf7ez85QHUoBuUMoHgMnyuDNXTg+iV62WcG6bVoxE=;
        b=k5jT7LN8Fx7VEkTi0XgPQxBYvaHMVqDhNuzeipXMEE2dmex+dbNJnlmZiPyNCJMZ2P
         Tc+7Z/KTvjKKzxfIihpYVp7o4uYWv8G5KY6JLb6/rgmcyvOEx53QIhkMr1TcCtHZtfjU
         kR2I+YWQCWY/iBDDjTQS8dhgAfJ/0K0bl8gJSMEbFijjb/Kz5ONZ/AnK82jGsRcYFGlo
         ww8uAvOc28X7SUpKNAUpNfi0Zd5z6ZTs0jfeIYhKjfVlo595c17U3QvI/4ImkcJcK0D4
         1kk3nFzKiBm/S5GpZW+EwKlIH5ZfbHo/D94C8C9+GvpeC9PIm2ry3y0jI4UQANy9q4r/
         XeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4pDf7ez85QHUoBuUMoHgMnyuDNXTg+iV62WcG6bVoxE=;
        b=LGO2TIiMVVGzS30/CRlyYiaW9Xud5seEZ0Jv9M5VryQIHLQyxdcE9nynepGTCbn2h9
         fhqV1g/vza4wTyfa8P62NsEh/UPcaWix/J8ivUj+B86XWZ7Y/2Unyp+KLev56JdqPjKm
         BbK4T4r6mcelwrwi98LRBPRM2pr1eIg7Ybj5ohu6ebXUeOufAQFTPz6NEmTxbOwHDCbp
         c1fUcnWKLwvjpLTJg1ksm84D6yCgkq/Iv4pOSru0FEgNlTaHwuT6mWajGze71eACA9Cv
         iSf2erAcmmNzm9uf/uXIWVwBW2+baxFJOnjnUvdSzpCZI4AOATb/LbQsRyzNzAlQXDvt
         g38Q==
X-Gm-Message-State: AJIora+DTZfCb/zjYtMh1kDVIk/7t9CIVO+OZ/IXQvWOR0POBukJViid
	EmAstRDBhgvlxEmZQlrLlHw6qg==
X-Google-Smtp-Source: AGRyM1sqFiGr1+mDJ9qbeVsgJ4L1DLzZ2N4yyzMkKPO7XUslPN8IvI+lN6tL17Kpq2z/VwHxUKK3hA==
X-Received: by 2002:a2e:a5cb:0:b0:25d:7a70:2891 with SMTP id n11-20020a2ea5cb000000b0025d7a702891mr386558ljp.295.1658512013920;
        Fri, 22 Jul 2022 10:46:53 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id o1-20020a05651205c100b00489c7fb668dsm1163070lfo.182.2022.07.22.10.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 10:46:53 -0700 (PDT)
Message-ID: <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
Date: Fri, 22 Jul 2022 19:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Content-Language: en-US
To: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_104657_513424_26BB7E37 
X-CRM114-Status: GOOD (  15.89  )
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

T24gMjIvMDcvMjAyMiAxODo0OCwg5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgd3JvdGU6Cj4gQWRk
IHRoZSBTRkMgYmluZGluZ3MgZm9yIHRoZSBYMTAwMCBTb0MsIHRoZSBYMTYwMCBTb0MsIHRoZSBY
MTgzMCBTb0MsCj4gYW5kIHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdlbmljLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29t
Pgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbCAg
ICAgICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY0IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5iN2M0Y2Y0Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMu
eWFtbAo+IEBAIC0wLDAgKzEsNjQgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zcGkvaW5nZW5pYyxzZmMueWFtbCMKCkZpbGUg
bmFtZSBzaG91bGQgYmUgcmF0aGVyIGJhc2VkIG9uIGZpcnN0IGNvbXBhdGlibGUsIHNvCmluZ2Vu
aWMseDEwMDAtc2ZjLnlhbWwKCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IEJpbmRpbmdzIGZvciBTRkMgaW4gSW5n
ZW5pYyBTb0NzCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIOWRqOeQsOadsCAoWmhvdSBZYW5q
aWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgo+ICsKPiArZGVzY3JpcHRpb246Cj4gKyAg
VGhlIFNQSSBGbGFzaCBDb250cm9sbGVyIGluIEluZ2VuaWMgU29Dcy4KPiArCgpZb3UgbWlzcyBo
ZXJlIGFsbE9mIHJlZmVyZW5jaW5nIHNwaS1jb250cm9sbGVyLgoKPiArcHJvcGVydGllczoKPiAr
ICBjb21wYXRpYmxlOgo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gZW51bToKPiArICAgICAgICAg
IC0gaW5nZW5pYyx4MTAwMC1zZmMKPiArICAgICAgICAgIC0gaW5nZW5pYyx4MTYwMC1zZmMKPiAr
ICAgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1zZmMKPiArICAgICAgLSBpdGVtczoKPiArICAgICAg
ICAgIC0gZW51bToKPiArICAgICAgICAgICAgICAtIGluZ2VuaWMseDE4MzAtc2ZjCj4gKyAgICAg
ICAgICAtIGNvbnN0OiBpbmdlbmljLHgxMDAwLXNmYwo+ICsKPiArICByZWc6Cj4gKyAgICBtYXhJ
dGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAg
Y2xvY2tzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2stbmFtZXM6Cj4gKyAgICBj
b25zdDogc2ZjCgpSZW1vdmUgdGhlIGNsb2NrLW5hbWVzIGVudGlyZWx5LCBubyBiZW5lZml0cy4K
Cj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gaW50
ZXJydXB0cwo+ICsgIC0gY2xvY2tzCj4gKyAgLSBjbG9jay1uYW1lcwo+ICsKPiArYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9jbG9jay9pbmdlbmljLHgxMDAwLWNndS5oPgo+ICsKPiArCXNmYzog
c3BpQDEzNDQwMDAwIHsKPiArCQljb21wYXRpYmxlID0gImluZ2VuaWMseDEwMDAtc2ZjIjsKCgpV
c2UgNCBzcGFjZXMgZm9yIGV4YW1wbGUgaW5kZW50YXRpb24uCgo+ICsJCXJlZyA9IDwweDEzNDQw
MDAwIDB4MTAwMD47Cj4gKwo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmludGM+Owo+ICsJCWlu
dGVycnVwdHMgPSA8Nz47Cj4gKwo+ICsJCWNsb2NrcyA9IDwmY2d1IFgxMDAwX0NMS19TRkM+Owo+
ICsJCWNsb2NrLW5hbWVzID0gInNmYyI7Cj4gKwo+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgpO
byBzdGF0dXMgaW4gZXhhbXBsZS4KCj4gKwl9Owo+ICsuLi4KCgpCZXN0IHJlZ2FyZHMsCktyenlz
enRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
