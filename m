Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1178CED256
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQDaMXTPW26GYpq4Bi47KssE7Ufz2Wg1IhMhRlsorHw=; b=3cjJWtcH/eo+JM
	K+rRqNitbRH0Dwkh0IGbHOa6iQBAFVEKki7hBzWkKITZ+9HV11C+ncHi3c2sSaB17k+Q6PkihBW2P
	gxBhaYyuwcdAF33N4TSxw37eX6zPIdDEi5aYIdhq1piwfcBYNYoQX4pfeTFGBKYRjO4XVEF6W6E+z
	5gv0u0PLO2Xncj/StqLf5I10dwaTZEW0sPpB71HAg/E45GP7hFZVg7xUFoD8+W+NVUTLIuHChGsao
	hcdFlwKhEHJrWW6cK5QxOU6e/EzLPKTQHEsHklOHZlh7hyzDqjRhLmrqqhYWGSQFzWV8Mw5jbEpiH
	/c6Pd9W/CPNXe8fU1Gvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy00b-00000004ILO-3qKy;
	Tue, 08 Oct 2024 02:31:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxzzI-00000004I5j-13CT;
	Tue, 08 Oct 2024 02:30:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so4156114a12.2;
        Mon, 07 Oct 2024 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728354611; x=1728959411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLu2GkrJyIH/iXx8pdbjQNyQU8u3ariQBugLwkrciVs=;
        b=LEcSAPcazxEKo2hKS26MNkgJIJfdctMo6EyGywbAtzXtoSl5xthCFYxxZ5XGN/RdzQ
         BK84c3qOy3pY7eBf/ltvIkVpIf2pVJpJ8ZpWsL0VyRDOiJl7s5NlXmTqqPg3NxJKm/fC
         DO7nMqzdO5htEKK6qLuMfaau2Fq2uRdhJx4+pBDE41jDKnQr68cXyFMOlUALJF9ybVT8
         MSol6Xr4vlz+1s3aPtuxoQnCrbZFLq7pu8E9Dguac1TqSkrouh1rKigLz3YL6KXLHfHJ
         yX2XEzDx+REwdLYrK7cemfUp9iro3+DK1Go1K6FW0xZSWBSzG9WiG2sjjizNPqzxC+p0
         NQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728354611; x=1728959411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLu2GkrJyIH/iXx8pdbjQNyQU8u3ariQBugLwkrciVs=;
        b=Y5nhs0cwrfoQI4yVRJsS0OZsr+mWX/tZHJ9sNBKD+zYFhWdKqHDnwnTcT65yDctHBf
         8+gSpaze068V3eb6hZmyoiV91nYmQhOeVEOjGkuzmAMZBlIU4IbNBq71fuaJ/dRedlsN
         Z8qzsAkWz/gZZewtABNNVuT44E1MM4P2TzT8Qxh9Zw5S9a1fP/p9xRgDIT8MbG6TEjY/
         JFAfm+5gGsLRANOAuR5EY1e1jhjY5eC1NbgI/I+BtCO6w0wBozLVspKGGdchJdMDaBvJ
         IeKe3y3giN77vpoRe+ZSEdlrS56NhyG3bA2VrUWy/NWXGrFgsGTtyuU9chrsrly/+r4a
         CBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJtoVWKDxIwu5iidPp1BTVq5svMHx3wsS/RtV8CVAx8kThk4DdHk20nMlo2E5Mr13wRt6NjGnr5UXQxPd9CNiO@lists.infradead.org, AJvYcCXX3CNxo0THtqg3OiWuRN2n0c0q2oVTtJcX3/pXWeBEz4CZRQlGBt23cIdx1wOOtb706D/MMY2cnAvy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf/BrnCi4fiJLyoEWUsF1k2UI2ElywrZ4/YuBYeJyLN86pj92r
	drWiMcaJdE8TOvWwTOnPjPI6ZOAe/yluDd+iMPyhpWTHq7Y/PQ5g
X-Google-Smtp-Source: AGHT+IGeQEqLzuvHuWusEN4nVLoxNffXjEIhVExhavgblUpbYb87p1OahnMRUqzEYA2b6qstnKCPfA==
X-Received: by 2002:a05:6a21:1788:b0:1ce:d08c:2c10 with SMTP id adf61e73a8af0-1d6dfa55709mr20715014637.28.1728354610971;
        Mon, 07 Oct 2024 19:30:10 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e28213ce28sm386873a91.40.2024.10.07.19.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 19:30:10 -0700 (PDT)
Message-ID: <eec602ce-e74a-4b37-880d-32b49a55adf8@gmail.com>
Date: Tue, 8 Oct 2024 10:30:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240927020749.46791-1-hpchen0nvt@gmail.com>
 <20240927020749.46791-2-hpchen0nvt@gmail.com>
 <20241001121902.658d3977@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20241001121902.658d3977@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_193012_321406_891EADBF 
X-CRM114-Status: GOOD (  14.21  )
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

RGVhciBNaXF1ZWwsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKCk9uIDIwMjQvMTAvMSDk
uIvljYggMDY6MTksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSHVpLVBpbmcsCj4KPiBocGNo
ZW4wbnZ0QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDI3IFNlcCAyMDI0IDAyOjA3OjQ4ICswMDAw
Ogo+Cj4+IEFkZCBkdC1iaW5kaW5ncyBmb3IgdGhlIE51dm90b24gTUEzNSBTb0MgTkFORCBDb250
cm9sbGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIdWktUGluZyBDaGVuIDxocGNoZW4wbnZ0QGdt
YWlsLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL210ZC9udXZvdG9u
LG1hMzVkMS1uYW5kLnlhbWwgICAgIHwgOTMgKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1s
Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L251dm90b24sbWEzNWQxLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYThhNTQ5NjQ0Yzk4Cj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9udXZvdG9uLG1hMzVk
MS1uYW5kLnlhbWwKPj4gQEAgLTAsMCArMSw5MyBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0t
LQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbnV2b3RvbixtYTM1
ZDEtbmFuZC55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBOdXZvdG9uIE1BMzVEMSBOQU5EIEZsYXNo
IEludGVyZmFjZSAoTkZJKSBDb250cm9sbGVyCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAt
IEh1aS1QaW5nIENoZW4gPGhwY2hlbjBudnRAZ21haWwuY29tPgo+PiArCj4+ICthbGxPZjoKPj4g
KyAgLSAkcmVmOiBuYW5kLWNvbnRyb2xsZXIueWFtbCMKPj4gKwo+PiArcHJvcGVydGllczoKPj4g
KyAgY29tcGF0aWJsZToKPj4gKyAgICBlbnVtOgo+PiArICAgICAgLSBudXZvdG9uLG1hMzVkMS1u
YW5kLWNvbnRyb2xsZXIKPj4gKwo+PiArICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+
PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+
PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+PiArICAiXm5h
bmRAW2EtZjAtOV0kIjoKPj4gKyAgICB0eXBlOiBvYmplY3QKPj4gKyAgICAkcmVmOiByYXctbmFu
ZC1jaGlwLnlhbWwKPj4gKyAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgbmFuZC1lY2Mtc3RlcC1z
aXplOgo+PiArICAgICAgICBlbnVtOiBbNTEyLCAxMDI0XQo+PiArCj4+ICsgICAgICBuYW5kLWVj
Yy1zdHJlbmd0aDoKPj4gKyAgICAgICAgZW51bTogWzgsIDEyLCAyNF0KPj4gKwo+PiArICAgIHJl
cXVpcmVkOgo+PiArICAgICAgLSBuYW5kLWVjYy1zdGVwLXNpemUKPj4gKyAgICAgIC0gbmFuZC1l
Y2Mtc3RyZW5ndGgKPiBObywgdGhleSBzaG91bGQgbm90IGJlIHJlcXVpcmVkLCB1bmxlc3MgdGhl
cmUgaXMgYSBnb29kIHJlYXNvbiB0byBkbwo+IHNvLiBPcHRpbWFsIHN0cmVuZ3RoIGlzIGRpc2Nv
dmVyYWJsZSwgc3RvcCBmb3JjaW5nIGl0IGJ5IGRlZmF1bHQuCgoKSSB3aWxsIHJlbW92ZSB0aGlz
IHJlcXVpcmVkLgoKCj4+ICsKPj4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+
ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSByZWcKPj4gKyAgLSBp
bnRlcnJ1cHRzCj4+ICsgIC0gY2xvY2tzCj4+ICsKPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL251dm90b24sbWEzNWQxLWNsay5oPgo+PiArCj4+ICsgICAgc29j
IHsKPj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+ICsgICAgICAgICNzaXplLWNl
bGxzID0gPDI+Owo+PiArCj4+ICsgICAgICAgIG5hbmQtY29udHJvbGxlckA0MDFBMDAwMCB7Cj4+
ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm51dm90b24sbWEzNWQxLW5hbmQtY29udHJvbGxl
ciI7Cj4+ICsgICAgICAgICAgICByZWcgPSA8MHgwIDB4NDAxQTAwMDAgMHgwIDB4MTAwMD47Cj4+
ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzggSVJRX1RZUEVfTEVWRUxfSElH
SD47Cj4+ICsgICAgICAgICAgICBjbG9ja3MgPSA8JmNsayBOQU5EX0dBVEU+Owo+PiArICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICsgICAgICAgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsKPj4gKwo+PiArICAgICAgICAgICAgbmFuZEAwIHsKPj4gKyAgICAgICAgICAgICAgICBy
ZWcgPSA8MD47Cj4+ICsKPj4gKyAgICAgICAgICAgICAgICBuYW5kLW9uLWZsYXNoLWJidDsKPj4g
KyAgICAgICAgICAgICAgICBuYW5kLWVjYy1zdGVwLXNpemUgPSA8NTEyPjsKPj4gKyAgICAgICAg
ICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aCA9IDw4PjsKPj4gKwo+PiArICAgICAgICAgICAgICAg
IHBhcnRpdGlvbnMgewo+PiArICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVk
LXBhcnRpdGlvbnMiOwo+PiArICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPj4gKyAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4+ICsKPj4gKyAg
ICAgICAgICAgICAgICAgICAgdWJvb3RAMCB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBs
YWJlbCA9ICJuYW5kLXVib290IjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJlYWQtb25s
eTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgzMDAwMDA+Owo+PiAr
ICAgICAgICAgICAgICAgICAgICB9Owo+PiArICAgICAgICAgICAgICAgIH07Cj4+ICsgICAgICAg
ICAgICB9Owo+PiArICAgICAgICB9Owo+PiArICAgIH07Cj4+ICsKPj4gKy4uLgo+Cj4gVGhhbmtz
LAo+IE1pcXXDqGwKCgpCZXN0IHJlZ2FyZHMsCgpIdWktUGluZyBDaGVuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
