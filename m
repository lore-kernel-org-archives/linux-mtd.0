Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE5EC36018
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Apr 2025 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oThJ3aGk9jsKTLwX5YXWHR1WWu3fDs15BKhSsZiyXw=; b=Yd5YZH+tjBhEvh
	dMSnqpOfMPrjW4/aWtF/oPwUCLRfcoQn7EEh/s1qL6YgpiGzHOHE5He1OEVTRycyfX0nDEijJvklQ
	Cej0dmPS+sWOwcNd4C4sUVLq+CM2iZj6M3P3fpoSRUj9DTHOKowo/R8oc87Sy0oZ/zWEkVMlFkcsp
	HxpCGSHCMDdgS++rxNbdkvSGGPkZTUH9wnbVz0QOlexIxDdHwxs5UGATA3AAP8sA2gVwZKrDg6bOO
	Sw/KNOoLaEM8Tm+uahBx0vCSFc/67NDYhVnxSXbycLeKjPC3b2VuE0zkDe7rq4eW3E/jur0Lk0FPB
	JkuOhIt1ZdN2gKrsC3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWj4-00000002I3j-0UT9;
	Tue, 01 Apr 2025 08:12:02 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWiq-00000002HzQ-2JJJ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Apr 2025 08:11:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3834793f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2025 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495107; x=1744099907; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yad9HzH1ez8KmnqjdaY3xwpmYh43LNGXz8HH4WDTETc=;
        b=W7397GfF3ogpfPvxvAf52Zpqd9VK3o18jTX6jvJJd5gs3soXYN1eUqb2zxS09HMNhX
         S9jIYcQdGWRBVch2CayvMsanyAr6u7fO9pmKEozQ6/XFZx8N6OAx50QwbqygaQmqw2aj
         /LoSlvgasO/BZg6QOxI+l4WcRWu9kcDZ249Tvx8Fs/BN2ESv9rd7jkhYvTvH/ohdrG5f
         Mx+Xf9ozHPPsR3nKBAX6jCTYOsWgfJ22nJAG8RjaDRfxBVEpiRgUna33TQTFv51ugG/c
         9YH+9cBtzHAiHPGolZJKXp3rrtHaxSne2DyRhlm9NMN+RFkMKr3SQ4VGSuua8S4KQyKd
         Fbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495107; x=1744099907;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yad9HzH1ez8KmnqjdaY3xwpmYh43LNGXz8HH4WDTETc=;
        b=UXsPBXEIDUupgiq6PP+iwfpJjlmd+I2/+C6oTwSX+P1S0WdWIKy3Z1f7VA9HX1rEZr
         BoNGx/3erI8sbGGQuP4ABKPi+PyMXx0Y0h9NLSjgfY/XjL0lQ2A2IW8ZxUCN9yc0RR9i
         fWUtIq0KeOsi9kEgKpDy5F+xRa0tqcrJ5ClLHojz1JF3SVCRepo8MRboFSM78TEYmBXg
         EPmK7MOOYlUIM0okA4wYlBk3WBXu9/cAvFNNsTtHbusK2mYdt4qQ8SdROgHzpvslOBgz
         fdouKjRZg8l3BXuZxitQvmEQJAj4ioBof2N9VnE6mX+LOCb1weSCpQbJj+34SygZzShO
         3Rfw==
X-Forwarded-Encrypted: i=1; AJvYcCUriM7QAZAFhS4ng7WJ5B1hgGU00mhomKnMq3JbWMbX/i4PbHjEha/Dy4q0M8nK1V+z1vGWLhPrw9g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyH9QoV2u3FA8y8HzG6ETToocWbfXa4eEvbNgI7cAw0u48L0rzm
	ogH26OJdMLPiYrk8EFR8iY7AM3JrZknv0BUEDPnsSQ8MKOGQR5QQKZNjH3B87qQ=
X-Gm-Gg: ASbGncv+tnEszu95cADkemopZ2fGbE0zNNcuoR1zfy6a0tubhL3CGqEBNSSwjU8KGGC
	p7ybwFIbrqt664YrqOI9TSzPnVnB2y8xvdtK3v6pKTMBIbErSqvMsuXKzEIrrFNYfPDz0P3DOWA
	OGTq3qQrlqxHR2yPtRzeAiglw66JhWXv85exs2xGZq4UwxmjwD5pfwplKsq/JKKWkPTW6m1GnaE
	i4x6hWvtS2U3G3XEwythEokHJRpCGUqaM2chDCztYR75XAuEo0uvBOlO1D5b/zV0zLUTxGuKnoZ
	D4AWf/dYnWgoURhyspNA6lKcLZIh172BruRxDkXoWl5cq1G42w==
X-Google-Smtp-Source: AGHT+IGAIG2hZk4kDo7KmhPqt1WSY7ynTSVG640/9RB4KHlIwYRE6Y56jxWOf0i+lrUG3F1hLFBSvw==
X-Received: by 2002:a05:6000:18a5:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39c120deb39mr7684191f8f.14.1743495106828;
        Tue, 01 Apr 2025 01:11:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b66a96dsm13234594f8f.44.2025.04.01.01.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:11:46 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:11:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: "Artem B. Bityutskiy" <dedekind@linutronix.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [bug report] UBI: Unsorted Block Images
Message-ID: <d13c5c32-b094-45c8-a5bb-fa32d0222d16@stanley.mountain>
References: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
 <4518b0db-deab-15d5-7824-74db77d3682b@huawei.com>
 <2d283e0e-9d53-4160-a098-33907de08ef6@stanley.mountain>
 <c121ca20-4d65-2b7e-a434-71b1ecd4ffea@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c121ca20-4d65-2b7e-a434-71b1ecd4ffea@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_011148_593023_4DDC97E3 
X-CRM114-Status: GOOD (  24.76  )
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

T24gVHVlLCBBcHIgMDEsIDIwMjUgYXQgMDI6NDY6MzVQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI1LzMvMzEgMjM6MTQsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+ID4gT24g
TW9uLCBNYXIgMzEsIDIwMjUgYXQgMDg6NDM6NTVQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3Rl
Ogo+ID4gPiDlnKggMjAyNS8zLzMxIDE3OjQ2LCBEYW4gQ2FycGVudGVyIOWGmemBkzoKPiA+ID4g
SGkgRGFuLAo+ID4gPiA+IEhlbGxvIEFydGVtIEIuIEJpdHl1dHNraXksCj4gPiA+ID4gCj4gPiA+
ID4gQ29tbWl0IDgwMWMxMzVjZTczZCAoIlVCSTogVW5zb3J0ZWQgQmxvY2sgSW1hZ2VzIikgZnJv
bSBKdW4gMjcsIDIwMDYKPiA+ID4gPiAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZSBmb2xsb3dp
bmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6Cj4gPiA+ID4gCj4gPiA+ID4gCWRyaXZl
cnMvbXRkL3ViaS92dGJsLmM6ODQ0IHViaV9yZWFkX3ZvbHVtZV90YWJsZSgpCj4gPiA+ID4gCXdh
cm46ICd1YmktPnZ0YmwnIGNhbiBhbHNvIGJlIE5VTEwKPiA+ID4gPiAKPiA+ID4gWy4uLl0KPiA+
ID4gPiAgICAgIDQzMSAgICAgICAgICBpZiAoIWxlYl9jb3JydXB0ZWRbMF0pIHsKPiA+ID4gPiAg
ICAgIDQzMiAgICAgICAgICAgICAgICAgIC8qIExFQiAwIGlzIE9LICovCj4gPiA+ID4gICAgICA0
MzMgICAgICAgICAgICAgICAgICBpZiAobGViWzFdKQo+ID4gPiA+ICAgICAgNDM0ICAgICAgICAg
ICAgICAgICAgICAgICAgICBsZWJfY29ycnVwdGVkWzFdID0gbWVtY21wKGxlYlswXSwgbGViWzFd
LAo+ID4gPiA+ICAgICAgNDM1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHViaS0+dnRibF9zaXplKTsKPiA+ID4gPiAgICAgIDQzNiAgICAgICAgICAg
ICAgICAgIGlmIChsZWJfY29ycnVwdGVkWzFdKSB7Cj4gPiA+ID4gICAgICA0MzcgICAgICAgICAg
ICAgICAgICAgICAgICAgIHViaV93YXJuKHViaSwgInZvbHVtZSB0YWJsZSBjb3B5ICMyIGlzIGNv
cnJ1cHRlZCIpOwo+ID4gPiA+ICAgICAgNDM4ICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIg
PSBjcmVhdGVfdnRibCh1YmksIGFpLCAxLCBsZWJbMF0pOwo+ID4gPiA+ICAgICAgNDM5ICAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gPiA+ICAgICAgNDQwICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4gPiA+ID4gICAgICA0NDEgICAg
ICAgICAgICAgICAgICAgICAgICAgIHViaV9tc2codWJpLCAidm9sdW1lIHRhYmxlIHdhcyByZXN0
b3JlZCIpOwo+ID4gPiA+ICAgICAgNDQyICAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ICAgICAg
NDQzCj4gPiA+ID4gICAgICA0NDQgICAgICAgICAgICAgICAgICAvKiBCb3RoIExFQiAxIGFuZCBM
RUIgMiBhcmUgT0sgYW5kIGNvbnNpc3RlbnQgKi8KPiA+ID4gPiAgICAgIDQ0NSAgICAgICAgICAg
ICAgICAgIHZmcmVlKGxlYlsxXSk7Cj4gPiA+ID4gICAgICA0NDYgICAgICAgICAgICAgICAgICBy
ZXR1cm4gbGViWzBdOwo+ID4gPiA+ICAgICAgNDQ3ICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4g
ICAgICA0NDggICAgICAgICAgICAgICAgICAvKiBMRUIgMCBpcyBjb3JydXB0ZWQgb3IgZG9lcyBu
b3QgZXhpc3QgKi8KPiA+ID4gPiAgICAgIDQ0OSAgICAgICAgICAgICAgICAgIGlmIChsZWJbMV0p
IHsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KPiA+ID4gPiBJ
cyB0aGlzIE5VTEwgY2hlY2sgcmVxdWlyZWQ/Cj4gPiA+IAo+ID4gPiBZZXMsIGxlYiAxIGNvdWxk
IGJlIGNvcnJ1cHRlZChlZy4gYmFkIGVjIGhlYWRlciksIHRoZW4gdGhlIGxlYiAxIHdvbid0IGJl
Cj4gPiA+IHNjYW5uZWQgZHVyaW5nIGF0dGFjaGluZywgd2hpY2ggbWVhbnMgJ2xlYlsxXScgd29u
J3QgYmUgaW5pdGlhbGl6ZWQgYnkKPiA+ID4gcHJvY2Vzc19sdm9sKCkuCj4gPiA+ID4gCj4gPiA+
ID4gICAgICA0NTAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlYl9jb3JydXB0ZWRbMV0gPSB2
dGJsX2NoZWNrKHViaSwgbGViWzFdKTsKPiA+ID4gPiAgICAgIDQ1MSAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKGxlYl9jb3JydXB0ZWRbMV0gPCAwKQo+ID4gPiA+ICAgICAgNDUyICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4gPiA+ID4gICAgICA0
NTMgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gICAgICA0NTQgICAgICAgICAgICAgICAgICBp
ZiAobGViX2NvcnJ1cHRlZFsxXSkgewo+ID4gPiA+ICAgICAgNDU1ICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBCb3RoIExFQiAwIGFuZCBMRUIgMSBhcmUgY29ycnVwdGVkICovCj4gPiA+ID4g
ICAgICA0NTYgICAgICAgICAgICAgICAgICAgICAgICAgIHViaV9lcnIodWJpLCAiYm90aCB2b2x1
bWUgdGFibGVzIGFyZSBjb3JydXB0ZWQiKTsKPiA+ID4gPiAgICAgIDQ1NyAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBvdXRfZnJlZTsKPiA+ID4gPiAgICAgIDQ1OCAgICAgICAgICAgICAg
ICAgIH0KPiA+ID4gPiAgICAgIDQ1OQo+ID4gPiA+ICAgICAgNDYwICAgICAgICAgICAgICAgICAg
dWJpX3dhcm4odWJpLCAidm9sdW1lIHRhYmxlIGNvcHkgIzEgaXMgY29ycnVwdGVkIik7Cj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeXgo+ID4gPiA+IFRoaXMgc2hvdWxkIHNheSAjMCBJIHRoaW5rPwo+ID4gPiAKPiA+ID4g
SSBndWVzcyB0aGF0ICcjMScgcmVmZXJzIHRvIGxlYiAwIGFuZCAnIzInIHJlZmVycyB0byBsZWIg
MS4KPiA+ID4gPiAKPiA+ID4gPiAgICAgIDQ2MSAgICAgICAgICAgICAgICAgIGVyciA9IGNyZWF0
ZV92dGJsKHViaSwgYWksIDAsIGxlYlsxXSk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KPiA+ID4gPiAgICAgIDQ2
MiAgICAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiA+ID4gICAgICA0NjMgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4gPiA+ID4gICAgICA0NjQgICAgICAgICAgICAg
ICAgICB1YmlfbXNnKHViaSwgInZvbHVtZSB0YWJsZSB3YXMgcmVzdG9yZWQiKTsKPiA+ID4gPiAg
ICAgIDQ2NQo+ID4gPiA+ICAgICAgNDY2ICAgICAgICAgICAgICAgICAgdmZyZWUobGViWzBdKTsK
PiA+ID4gPiAgICAgIDQ2NyAgICAgICAgICAgICAgICAgIHJldHVybiBsZWJbMV07Cj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eCj4gPiA+ID4gVGhlIE5VTEwg
Y2hlY2sgb24gbGluZSA0NDkgbWFrZXMgU21hdGNoIHRoaW5rIHRoaXMgY2FuIGJlIE5VTEwuCj4g
PiA+IAo+ID4gPiBJbiB0aGVvcnksIHRoZSAnTlVMTCcgd29uJ3QgYmUgYSByZXR1cm4gdmFsdWUs
IHRoZXNlIGNhc2VzIGFyZSBhdm9pZGVkIGJ5Cj4gPiA+IGxlYl9jb3JydXB0ZWQgY2hlY2tpbmcg
YnJhbmNoZXMuCj4gPiAKPiA+IE5vLCB0aGF0IGRvZXNuJ3QgZm9sbG93LiAgSWYgbGViWzFdIGlz
IE5VTEwgdGhlbiB3ZSBrbm93IHRoYXQKPiA+IGxlYl9jb3JydXB0ZWRbMV0gaXMgemVyby4gIEl0
J3Mgb25seSBzZXQgd2hlbiBsZWJbMV0gaXMgbm9uLU5VTEwuCj4gPiAKPiAKPiBIaSBEYW4uIFRo
ZSBsZWJfY29ycnVwdGVkIGFycmF5IGlzIGluaXRpYWxpemVkIGFzICcxJyBpbiBsaW5lIDM2OToK
PiAzNjkgICAgICAgICBpbnQgbGViX2NvcnJ1cHRlZFtVQklfTEFZT1VUX1ZPTFVNRV9FQlNdID0g
ezEsIDF9Owo+IAo+IElmIGxlYlsxXSBpcyBOVUxMLiB0aGUgbGViX2NvcnJ1cHRlZFsxXSBpcyBu
b24temVybywgdGhlbiB0aGUgZnVuY3Rpb24gd2lsbAo+IGV4aXQgaW4gZm9sbG93aW5nIGJyYW5j
aDoKPiAgNDU0ICAgICAgICAgICAgICAgICBpZiAobGViX2NvcnJ1cHRlZFsxXSkgewo+ICA0NTUg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogQm90aCBMRUIgMCBhbmQgTEVCIDEgYXJlIGNvcnJ1
cHRlZCAqLwo+ICA0NTYgICAgICAgICAgICAgICAgICAgICAgICAgdWJpX2Vycih1YmksICJib3Ro
IHZvbHVtZSB0YWJsZXMgYXJlCj4gY29ycnVwdGVkIik7Cj4gIDQ1NyAgICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIG91dF9mcmVlOwo+ICA0NTggICAgICAgICAgICAgICAgIH0KPiAKPiBBbSBp
IG1pc3Npbmcgc29tZXRoaW5nPwo+IAoKU29ycnksIHllYWguICBJIGdvdCBtaXhlZCB1cCB3aXRo
IHRoZSBsaW5lIGJlZm9yZS4gIEkgYXBvbG9naXplIGZvciB0aGF0LgoKcmVnYXJkcywKZGFuIGNh
cnBlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
