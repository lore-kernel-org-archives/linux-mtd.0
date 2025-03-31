Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3E8C3600C
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Mar 2025 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEQgwjwENvb7pVaO9m3WQLsHysj4mIEbhsCMov5Q3mM=; b=31ue2hDxgQYvar
	y3rkTA1EhkV+sBTodJWLGMYit6/gePGs+SjfuttFZWp4BiiXTlDVVMshkSw6FhnTebyBqV2pt/K4k
	toD6lGsN6QUWGyWRbO66tSHFEO0q5asby8VsiwDSN1rz5U2IKWFIiKw9AbQSemPoKzHNVuy1GNw91
	8IyVVsdKwRKKId8snSkgLhFOjAbAhhKOnAAvxWF3Fq5CSHkzNvtxmvNUoma3hTjW8SXFamg5pG6nm
	aTnNp74Z4gpuug+BwrazLY/pbRQebPHnTrqcMTO8lBrFtflkRs13+FiQDzs6ACUIWj+b5Clb5C8iu
	g7XQAKmmm1ksJqGDpooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzH70-00000000o9d-0WHx;
	Mon, 31 Mar 2025 15:31:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGqi-00000000jPR-1nIj
	for linux-mtd@lists.infradead.org;
	Mon, 31 Mar 2025 15:14:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso31368835e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2025 08:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743434091; x=1744038891; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+cr+Gsac8r+6vnIuWWnrWh3E0FUrqFSAgiegZOYmSLQ=;
        b=XwgugYj1YK2bwbcnUNbXW2LMePFj4sUyamF27q12Mc2moIU5j8KYuC+k3ISbCAs6Z3
         dK3pN66KOO0oIcRoAihSretx3SOkW41uFgz+JGz6vWKQ7aDyfUhTo/rkdklvrY0KRGlg
         P3tVN1Z9H10G81uLzv/NkKOO5HmOKiZF0yzP3SF3ObR6mIt5eMbFJDeAq5EnySZPW0Lt
         6IgfGJC8SJognG8YUUjy2qV4aPR/gg6H7ZH7mZ6ddfMpEEG3NsTmgTtu4Cb9GFJh6zgC
         90vDYRx0/gUBZpVZ1PbCfnse0ceb4lL8tlbyAt2zgmy70rplNETQuND6tmgkLAW1hxEg
         dboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434091; x=1744038891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cr+Gsac8r+6vnIuWWnrWh3E0FUrqFSAgiegZOYmSLQ=;
        b=d3lSAfycVDWW7+d08foCFrz3T6YbTrfh1QJekXVffGkRuI8QLHI6Rkb+f9m9/7KQ3A
         pO9yoaUqaprFRRr3dAI6tTVkV37oD2aT6QfCnb62uWdi77woSjj3MueG4fvpAXnJxnec
         SskzOfFRlBIdbP+bdCRRXyLMYs8VxPDqtNURZ6OpWzTC1TS9svLtL+xk0VL2QPeENAum
         /qa0ZEtiiKYmHxIjrV5uPNfWMAhOf2dFq8P3FRBXqzqs47BZROWUxdMokEO9e+eoqy8i
         pYCGi3sKmO+trM/gaHap/3ZVuKUKUu5gWgxF08hY804k1zw/HeDrpK5q+OknWx3XRlKZ
         +5oA==
X-Forwarded-Encrypted: i=1; AJvYcCVqqXny+kLZWUxHc8asULywtKIFilfgzHfHf/P8TQyovKdKmsZvmQNhY84vahc9KrpHiz9c1Bzn/pc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGbTp3hZa9d1v6JjSm44acMdfkaoGaWE/3RoLR67nu/1HLXCav
	gdKE9MFs1eG7rU0S6CwtD6lrl9W/8adW+BBgJt6awj0d+bHux5me8sLVdGAzc1CXBQLNmPSfgG/
	/
X-Gm-Gg: ASbGnct86yTkeaHDvMTzsyVGumiX8MrC2PPnQekCkswtzs9CTJK5wyVTjRokv7KRZmH
	mH48SDPcwYcJHGGcw/VFq4UbP1M9VsRmnnMpubZvysD9EHErklaVIoxEOLP08w2kbER2a0QuaZR
	eIOo/WW68xOaGSI+TbVYiJy8lzPRptQgtpA/zSNjsnbxLTt+q5RI0r/O+wAf9ZdsOm044QkUFgG
	arx0Vo6M9FPvzC6Ii4SmKcOfJFr2E3rh+F4b8YZEJGq70ssSG+VKtvDICuawiJqlnCreFNhMG7f
	ZW4AfSK4ps4rWj4MpazQVBBmylWk6XFPzjIYqb+0ZNu8sLJEGQ==
X-Google-Smtp-Source: AGHT+IEdyX1RdQhdvNaPp0SCTTx8I8x8eJFgmqDkN0lhnBu/mb+E+XT3c32Po/ZTM0dDuR93yBB4Xw==
X-Received: by 2002:a05:6000:188b:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39c120cb835mr6857754f8f.11.1743434090704;
        Mon, 31 Mar 2025 08:14:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b658a32sm11706210f8f.19.2025.03.31.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:14:50 -0700 (PDT)
Date: Mon, 31 Mar 2025 18:14:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: "Artem B. Bityutskiy" <dedekind@linutronix.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [bug report] UBI: Unsorted Block Images
Message-ID: <2d283e0e-9d53-4160-a098-33907de08ef6@stanley.mountain>
References: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
 <4518b0db-deab-15d5-7824-74db77d3682b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4518b0db-deab-15d5-7824-74db77d3682b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_081452_474935_07827882 
X-CRM114-Status: GOOD (  20.01  )
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgMDg6NDM6NTVQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI1LzMvMzEgMTc6NDYsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+IEhpIERh
biwKPiA+IEhlbGxvIEFydGVtIEIuIEJpdHl1dHNraXksCj4gPiAKPiA+IENvbW1pdCA4MDFjMTM1
Y2U3M2QgKCJVQkk6IFVuc29ydGVkIEJsb2NrIEltYWdlcyIpIGZyb20gSnVuIDI3LCAyMDA2Cj4g
PiAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoIHN0YXRpYyBjaGVj
a2VyIHdhcm5pbmc6Cj4gPiAKPiA+IAlkcml2ZXJzL210ZC91YmkvdnRibC5jOjg0NCB1YmlfcmVh
ZF92b2x1bWVfdGFibGUoKQo+ID4gCXdhcm46ICd1YmktPnZ0YmwnIGNhbiBhbHNvIGJlIE5VTEwK
PiA+IAo+IFsuLi5dCj4gPiAgICAgNDMxICAgICAgICAgIGlmICghbGViX2NvcnJ1cHRlZFswXSkg
ewo+ID4gICAgIDQzMiAgICAgICAgICAgICAgICAgIC8qIExFQiAwIGlzIE9LICovCj4gPiAgICAg
NDMzICAgICAgICAgICAgICAgICAgaWYgKGxlYlsxXSkKPiA+ICAgICA0MzQgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxlYl9jb3JydXB0ZWRbMV0gPSBtZW1jbXAobGViWzBdLCBsZWJbMV0sCj4g
PiAgICAgNDM1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHViaS0+dnRibF9zaXplKTsKPiA+ICAgICA0MzYgICAgICAgICAgICAgICAgICBpZiAobGVi
X2NvcnJ1cHRlZFsxXSkgewo+ID4gICAgIDQzNyAgICAgICAgICAgICAgICAgICAgICAgICAgdWJp
X3dhcm4odWJpLCAidm9sdW1lIHRhYmxlIGNvcHkgIzIgaXMgY29ycnVwdGVkIik7Cj4gPiAgICAg
NDM4ICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBjcmVhdGVfdnRibCh1YmksIGFpLCAx
LCBsZWJbMF0pOwo+ID4gICAgIDQzOSAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikK
PiA+ICAgICA0NDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZnJl
ZTsKPiA+ICAgICA0NDEgICAgICAgICAgICAgICAgICAgICAgICAgIHViaV9tc2codWJpLCAidm9s
dW1lIHRhYmxlIHdhcyByZXN0b3JlZCIpOwo+ID4gICAgIDQ0MiAgICAgICAgICAgICAgICAgIH0K
PiA+ICAgICA0NDMKPiA+ICAgICA0NDQgICAgICAgICAgICAgICAgICAvKiBCb3RoIExFQiAxIGFu
ZCBMRUIgMiBhcmUgT0sgYW5kIGNvbnNpc3RlbnQgKi8KPiA+ICAgICA0NDUgICAgICAgICAgICAg
ICAgICB2ZnJlZShsZWJbMV0pOwo+ID4gICAgIDQ0NiAgICAgICAgICAgICAgICAgIHJldHVybiBs
ZWJbMF07Cj4gPiAgICAgNDQ3ICAgICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgNDQ4ICAgICAgICAg
ICAgICAgICAgLyogTEVCIDAgaXMgY29ycnVwdGVkIG9yIGRvZXMgbm90IGV4aXN0ICovCj4gPiAg
ICAgNDQ5ICAgICAgICAgICAgICAgICAgaWYgKGxlYlsxXSkgewo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeXl5eXl4KPiA+IElzIHRoaXMgTlVMTCBjaGVjayByZXF1aXJlZD8KPiAK
PiBZZXMsIGxlYiAxIGNvdWxkIGJlIGNvcnJ1cHRlZChlZy4gYmFkIGVjIGhlYWRlciksIHRoZW4g
dGhlIGxlYiAxIHdvbid0IGJlCj4gc2Nhbm5lZCBkdXJpbmcgYXR0YWNoaW5nLCB3aGljaCBtZWFu
cyAnbGViWzFdJyB3b24ndCBiZSBpbml0aWFsaXplZCBieQo+IHByb2Nlc3NfbHZvbCgpLgo+ID4g
Cj4gPiAgICAgNDUwICAgICAgICAgICAgICAgICAgICAgICAgICBsZWJfY29ycnVwdGVkWzFdID0g
dnRibF9jaGVjayh1YmksIGxlYlsxXSk7Cj4gPiAgICAgNDUxICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAobGViX2NvcnJ1cHRlZFsxXSA8IDApCj4gPiAgICAgNDUyICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4gPiAgICAgNDUzICAgICAgICAgICAg
ICAgICAgfQo+ID4gICAgIDQ1NCAgICAgICAgICAgICAgICAgIGlmIChsZWJfY29ycnVwdGVkWzFd
KSB7Cj4gPiAgICAgNDU1ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBCb3RoIExFQiAwIGFu
ZCBMRUIgMSBhcmUgY29ycnVwdGVkICovCj4gPiAgICAgNDU2ICAgICAgICAgICAgICAgICAgICAg
ICAgICB1YmlfZXJyKHViaSwgImJvdGggdm9sdW1lIHRhYmxlcyBhcmUgY29ycnVwdGVkIik7Cj4g
PiAgICAgNDU3ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlOwo+ID4gICAg
IDQ1OCAgICAgICAgICAgICAgICAgIH0KPiA+ICAgICA0NTkKPiA+ICAgICA0NjAgICAgICAgICAg
ICAgICAgICB1Ymlfd2Fybih1YmksICJ2b2x1bWUgdGFibGUgY29weSAjMSBpcyBjb3JydXB0ZWQi
KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeXgo+ID4gVGhpcyBzaG91bGQgc2F5ICMwIEkgdGhpbms/Cj4gCj4gSSBndWVzcyB0
aGF0ICcjMScgcmVmZXJzIHRvIGxlYiAwIGFuZCAnIzInIHJlZmVycyB0byBsZWIgMS4KPiA+IAo+
ID4gICAgIDQ2MSAgICAgICAgICAgICAgICAgIGVyciA9IGNyZWF0ZV92dGJsKHViaSwgYWksIDAs
IGxlYlsxXSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eXl5eCj4gPiAgICAgNDYyICAgICAgICAgICAgICAgICAgaWYgKGVycikK
PiA+ICAgICA0NjMgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4gPiAg
ICAgNDY0ICAgICAgICAgICAgICAgICAgdWJpX21zZyh1YmksICJ2b2x1bWUgdGFibGUgd2FzIHJl
c3RvcmVkIik7Cj4gPiAgICAgNDY1Cj4gPiAgICAgNDY2ICAgICAgICAgICAgICAgICAgdmZyZWUo
bGViWzBdKTsKPiA+ICAgICA0NjcgICAgICAgICAgICAgICAgICByZXR1cm4gbGViWzFdOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KPiA+IFRoZSBOVUxMIGNoZWNr
IG9uIGxpbmUgNDQ5IG1ha2VzIFNtYXRjaCB0aGluayB0aGlzIGNhbiBiZSBOVUxMLgo+IAo+IElu
IHRoZW9yeSwgdGhlICdOVUxMJyB3b24ndCBiZSBhIHJldHVybiB2YWx1ZSwgdGhlc2UgY2FzZXMg
YXJlIGF2b2lkZWQgYnkKPiBsZWJfY29ycnVwdGVkIGNoZWNraW5nIGJyYW5jaGVzLgoKTm8sIHRo
YXQgZG9lc24ndCBmb2xsb3cuICBJZiBsZWJbMV0gaXMgTlVMTCB0aGVuIHdlIGtub3cgdGhhdAps
ZWJfY29ycnVwdGVkWzFdIGlzIHplcm8uICBJdCdzIG9ubHkgc2V0IHdoZW4gbGViWzFdIGlzIG5v
bi1OVUxMLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKCj4gPiAKPiA+ICAgICA0NjggICAgICAg
ICAgfQo+ID4gICAgIDQ2OQo+ID4gICAgIDQ3MCAgb3V0X2ZyZWU6Cj4gPiAgICAgNDcxICAgICAg
ICAgIHZmcmVlKGxlYlswXSk7Cj4gPiAgICAgNDcyICAgICAgICAgIHZmcmVlKGxlYlsxXSk7Cj4g
PiAgICAgNDczICAgICAgICAgIHJldHVybiBFUlJfUFRSKGVycik7Cj4gPiAgICAgNDc0ICB9Cj4g
PiAKPiA+IAo+ID4gcmVnYXJkcywKPiA+IGRhbiBjYXJwZW50ZXIKPiA+IAo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+ID4gLgo+ID4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
