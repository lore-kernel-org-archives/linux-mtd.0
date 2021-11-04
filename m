Return-Path: <SRS0=xf6T=PX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042CCC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 12:54:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE3960F70
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 12:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AE3960F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gk97v/3/D9QQ3kuWBd0L/9cJ6pMnZ2XMyYaqpmWZBTA=; b=N8d+RNuLHsag+SK3jjgvmX2yRW
	zfAUFCdRu0hO2YX8zKAzVBfQ0rgLh6Kfiw2Mdu1e1G/2B3I9+Sc1AsUt4K1IiDAnIb+tazll5tgzK
	uW5jYCbaVn+MElP839jkSVz6fR8bz/hLbAvlOe0xlv5VrQ60lID5ms7BGpE5nkr3vRaTQGfwFgcx3
	HMV7hcYURlpgK2R0rzPumpjBWr1tX9VhO+NSz3yfo+epZqg9UNe5pYueONlfZcqykwnqDBtNC04ax
	3F4EfaOeBngbCV6Fhjs6tCr/6CMP3q3khBbnWilIrg9tr2f87nNahyqrW7kJ9Vvcpp9Ycuy/1utqX
	S9IAU5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1micFS-008wc4-So; Thu, 04 Nov 2021 12:53:42 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1micFP-008waL-55
 for linux-mtd@lists.infradead.org; Thu, 04 Nov 2021 12:53:40 +0000
Received: by mail-io1-xd2e.google.com with SMTP id v65so6740890ioe.5
 for <linux-mtd@lists.infradead.org>; Thu, 04 Nov 2021 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6w8o3WS6DFFpTMjQXm5psT4Qx5D68tU62B92Jeja+Zo=;
 b=ldR/C8KEc7oOIEzM0/TFcM+FBsb189UFzrCibuqX+cslz918BHC2riRxUFvjgu3Op3
 ikmUUyMutn1eSuL9G5N2lLZxG8k2vK5myYOonRec81EiqQbvekpeNsBa00jPZgMx4WiX
 3IBl0MQku2Y2p144oqcG64Z2mnfjktMCkwmWF9dAIhQ4W2IBbUCW+4YHb9o/2Jmv/9Tw
 hGpikCSQpN9z6DeavUQECTDqikd99/o3mkqfEVu6mqpz9Gx9jkEiZpwANAqmZkd85B0/
 m/Ianql51H9Jy/J/1kxUhwHF1US2q9kDGNvXpdnMpDKlINUqn69dt106HpLPNNOU8ar4
 D8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6w8o3WS6DFFpTMjQXm5psT4Qx5D68tU62B92Jeja+Zo=;
 b=G9l0QDrUIBXANuDAsY1Y2ThXRtWR2tHCLpddZRM7zUcZsDvurF5gy15WwJxs3Wkbw5
 RJ3ypV2Y7BURv+1XKdXdofmxd+TDCsFIr8J5UAv/LnkWHmSsGt87ja9LZaE2x9wO5NpJ
 Yt/ho+4SyLenTH+DSbejAqfjCCF3afNUkVNT69SEdSXEIvkVlMgHn78tH/qTh5dDnZG8
 tUuitCjKjXkYzfH7fLdGt8rambvM/X87CSRUMDljbBWPrKV4NbrTEKLgnygs5jvy5e+N
 f4Mej21/38lM4KbZRI2lj//oA6dMDn6X1QgRJdE6XZTlHq8L/IU1Jw9d2UX/Dm8KrFdU
 oShg==
X-Gm-Message-State: AOAM532YTldld16fGFN82YtWPLwqB35LBCtdas6EXE6ZeNpVdi8ipq8e
 S7//9hpZzOhtteMr4e39GfY1UA==
X-Google-Smtp-Source: ABdhPJwH6c+P5mnSghF2qajSekhAmW/D+2dMZvQnCwkU8gTuNOoExbbBh3PXxAXNBqTnJ4DFVPx/Yw==
X-Received: by 2002:a05:6602:2c07:: with SMTP id
 w7mr36082747iov.122.1636030416900; 
 Thu, 04 Nov 2021 05:53:36 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id d14sm2967722ilv.2.2021.11.04.05.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 05:53:36 -0700 (PDT)
Subject: Re: [PATCH v5 00/14] last set for add_disk() error handling
From: Jens Axboe <axboe@kernel.dk>
To: miquel.raynal@bootlin.com, martin.petersen@oracle.com, hare@suse.de,
 Luis Chamberlain <mcgrof@kernel.org>, jack@suse.cz, hch@lst.de,
 song@kernel.org, dave.jiang@intel.com, richard@nod.at,
 vishal.l.verma@intel.com, penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org,
 ira.weiny@intel.com, vigneshr@ti.com, dan.j.williams@intel.com,
 ming.lei@redhat.com, efremov@linux.com
Cc: linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20211103230437.1639990-1-mcgrof@kernel.org>
 <163602655191.22491.10844091970007142957.b4-ty@kernel.dk>
Message-ID: <4764286a-99b4-39f7-ce5c-9e88cee1a538@kernel.dk>
Date: Thu, 4 Nov 2021 06:53:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <163602655191.22491.10844091970007142957.b4-ty@kernel.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_055339_267645_F957A74E 
X-CRM114-Status: GOOD (  15.00  )
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

T24gMTEvNC8yMSA1OjQ5IEFNLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9uIFdlZCwgMyBOb3YgMjAy
MSAxNjowNDoyMyAtMDcwMCwgTHVpcyBDaGFtYmVybGFpbiB3cm90ZToKPj4gSmVucywKPj4KPj4g
YXMgcmVxdWVzdGVkLCBJJ3ZlIGZvbGRlZCBhbGwgcGVuZGluZyBjaGFuZ2VzIGludG8gdGhpcyBz
ZXJpZXMuIFRoaXMKPj4gdjUgcGVncyBvbiBDaHJpc3RvcGgncyByZXZpZXdlZC1ieSB0YWdzIGFu
ZCBzaW5jZSBJIHdhcyByZXNwaW5uaW5nIEkKPj4gbW9kaWZpZWQgdGhlIGF0YXByb2JlIGFuZCBm
bG9wcHkgZHJpdmVyIGNoYW5nZXMgYXMgaGUgc3VnZ2VzdGVkLgo+Pgo+PiBJIHRoaW5rIHRoaXMg
aXMgaXQuIFRoZSB3b3JsZCBvZiBmbG9wcHkgaGFzIGJlZW4gZXhjaXRpbmcgZm9yIHY1LjE2Lgo+
Pgo+PiBbLi4uXQo+IAo+IEFwcGxpZWQsIHRoYW5rcyEKPiAKPiBbMDEvMTRdIG52ZGltbS9idHQ6
IHVzZSBnb3RvIGVycm9yIGxhYmVscyBvbiBidHRfYmxrX2luaXQoKQo+ICAgICAgICAgY29tbWl0
OiAyNzYyZmYwNmFhNDllM2ExM2ZiNGI3NzkxMjBmNGY4YzEyYzM5ZmQxCj4gWzAyLzE0XSBudmRp
bW0vYnR0OiBhZGQgZXJyb3IgaGFuZGxpbmcgc3VwcG9ydCBmb3IgYWRkX2Rpc2soKQo+ICAgICAg
ICAgY29tbWl0OiAxNmJlNzk3NGZmNWQwYTVjZDlmMzQ1NTcxYzNlYWMxYzNmNmJhNmRlCj4gWzAz
LzE0XSBudmRpbW0vYmxrOiBhdm9pZCBjYWxsaW5nIGRlbF9nZW5kaXNrKCkgb24gZWFybHkgZmFp
bHVyZXMKPiAgICAgICAgIGNvbW1pdDogYjc0MjFhZmNlYzBjNzdhYjU4NjMzNTg3ZGRjMjlkNTNl
NmViOTVhZgo+IFswNC8xNF0gbnZkaW1tL2JsazogYWRkIGVycm9yIGhhbmRsaW5nIHN1cHBvcnQg
Zm9yIGFkZF9kaXNrKCkKPiAgICAgICAgIGNvbW1pdDogZGMxMDRmNGJiMmQwYTY1MmRlZTAxMGU0
N2JjODljMWFkMmFiMzdjOQo+IFswNS8xNF0gbnZkaW1tL3BtZW06IGNsZWFudXAgdGhlIGRpc2sg
aWYgcG1lbV9yZWxlYXNlX2Rpc2soKSBpcyB5ZXQgYXNzaWduZWQKPiAgICAgICAgIGNvbW1pdDog
YWNjZjU4YWZiNjg5ZjgxZGFhZGRlMjQwODBlYTExNjRhZDJkYjc1Zgo+IFswNi8xNF0gbnZkaW1t
L3BtZW06IHVzZSBhZGRfZGlzaygpIGVycm9yIGhhbmRsaW5nCj4gICAgICAgICBjb21taXQ6IDVh
MTkyY2NjMzJlMjk4MWY3MjEzNDNjNzUwYjhjZmI0YzNmNDEwMDcKPiBbMDcvMTRdIHoycmFtOiBh
ZGQgZXJyb3IgaGFuZGxpbmcgc3VwcG9ydCBmb3IgYWRkX2Rpc2soKQo+ICAgICAgICAgY29tbWl0
OiAxNTczMzc1NGNjZjM1YzQ5ZDJmMzZhN2FjNTFhZGM4Yjk3NWMxYzc4Cj4gWzA4LzE0XSBibG9j
ay9zdW52ZGM6IGFkZCBlcnJvciBoYW5kbGluZyBzdXBwb3J0IGZvciBhZGRfZGlzaygpCj4gICAg
ICAgICBjb21taXQ6IGY1ODNlYWVmMGFmMzliNzkyZDc0ZTM5NzIxYjViYTRiNjk0OGEyNzAKPiBb
MDkvMTRdIG10ZC91YmkvYmxvY2s6IGFkZCBlcnJvciBoYW5kbGluZyBzdXBwb3J0IGZvciBhZGRf
ZGlzaygpCj4gICAgICAgICBjb21taXQ6IGVkNzM5MTkxMjRiMmU0ODQ5MGFkYmJlNDhmZmU4ODVh
MmE0YzZmZWUKPiBbMTAvMTRdIGF0YWZsb3A6IHJlbW92ZSBhdGFmbG9wX3Byb2JlX2xvY2sgbXV0
ZXgKPiAgICAgICAgIGNvbW1pdDogNGRkYjg1ZDM2NjEzYzQ1YmRlMDBkMzY4YmY5ZjM1N2JkMDcw
OGEwYwo+IFsxMS8xNF0gYmxvY2s6IHVwZGF0ZSBfX3JlZ2lzdGVyX2Jsa2RldigpIHByb2JlIGRv
Y3VtZW50YXRpb24KPiAgICAgICAgIGNvbW1pdDogMjZlMDZmNWIxMzY3MWQxOTRkNjdhZThlMmI2
NmY1MjRhYjE3NDE1Mwo+IFsxMi8xNF0gYXRhZmxvcDogYWRkcmVzcyBhZGRfZGlzaygpIGVycm9y
IGhhbmRsaW5nIG9uIHByb2JlCj4gICAgICAgICBjb21taXQ6IDQ2YTdkYjQ5MmU3YTI3NDA4YmMx
NjRjYmU2NDI0NjgzZTc5NTI5YjAKPiBbMTMvMTRdIGZsb3BweTogYWRkcmVzcyBhZGRfZGlzaygp
IGVycm9yIGhhbmRsaW5nIG9uIHByb2JlCj4gICAgICAgICBjb21taXQ6IGVjMjhmY2M2Y2ZjZDQx
OGQyMDAzOGFkMmM0OTJlODdiZjNhOWYwMjYKPiBbMTQvMTRdIGJsb2NrOiBhZGQgX19tdXN0X2No
ZWNrIGZvciAqYWRkX2Rpc2sqKCkgY2FsbGVycwo+ICAgICAgICAgY29tbWl0OiAxNjk4NzEyZDg1
ZWMyZjEyOGZjN2U3YzVkYzIwMThiNWVkMmI3Y2Y2CgpyaXZlcnMvc2NzaS9zZC5jOiBJbiBmdW5j
dGlvbiDigJhzZF9wcm9iZeKAmToKZHJpdmVycy9zY3NpL3NkLmM6MzU3Mzo5OiB3YXJuaW5nOiBp
Z25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYZGV2aWNlX2FkZF9kaXNr4oCZIGRlY2xhcmVkIHdp
dGggYXR0cmlidXRlIOKAmHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQog
MzU3MyB8ICAgICAgICAgZGV2aWNlX2FkZF9kaXNrKGRldiwgZ2QsIE5VTEwpOwogICAgICB8ICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvc2NzaS9zci5jOiBJ
biBmdW5jdGlvbiDigJhzcl9wcm9iZeKAmToKZHJpdmVycy9zY3NpL3NyLmM6NzMxOjk6IHdhcm5p
bmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhkZXZpY2VfYWRkX2Rpc2vigJkgZGVjbGFy
ZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1
bHRdCiAgNzMxIHwgICAgICAgICBkZXZpY2VfYWRkX2Rpc2soJnNkZXYtPnNkZXZfZ2VuZGV2LCBk
aXNrLCBOVUxMKTsKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CgoKRHJvcHBpbmcgdGhlIGxhc3QgdHdvIHBhdGNoZXMuLi4KCi0t
IApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
