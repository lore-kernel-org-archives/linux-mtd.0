Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820EAC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWSKRBL4ep658YMASR4F0oVfztVCT8RrUBs2BW/vvbk=; b=QRfogoD5wWnqwm
	6/c4tUrBT7jmDzjBHQlKxxv0CBk7vICuBDs2YWgZfjh5zWiBNfPKw8JM3u4CFN+sVGGGcauqVb98u
	E4XfxVGM7SlzOmtr99V1PHNPgj9dqR+Z2dEvgNd1ygpLJvjbnX5/Ky7YgkVqZ675FE9U5v82x7NoM
	KSrD09+q9RJ1Z9OlhlrmY1WssXFzW9ryQk4y0Gg7YpDBIt2R729G95qSsbqxWcIGpeXU0jQf8upQ/
	HexI4DhFlfDvtONxVVornkMK2nYjq21c8VtfhzBGsGybMDzcctkwJ1jEuScfm116+W0sj/UA9D45z
	5FjXydF4ClVd97EgYyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndARe-0037Qa-TA; Sat, 09 Apr 2022 12:44:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndARb-0037Q0-HT
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 12:44:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id bh17so22149649ejb.8
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qFqeqNjaO9GxDFF6ku8GcKf8eCW7YzW8WlCYcuIhXtw=;
 b=k7qgK3YBC2ZfwWfBq974Auw9JESCchzvmVpnSkvd2Wh/jNBRtf2QzUXjuM6QDOC9WM
 MPpiekFZ4AAUK19lFab93vvPSScrJmv0YP9biKIdieYfTpNX6o8XQlOObgooo/n/zi/M
 Y3xoONQc85T07imeYdn+5hF3rp17wTf91pj7Q0YnA+wCbthgDElRQKF4HlvLNMGBmPSI
 EuyBB6bigXaIU+2XGPRL2IRoPpCw80QfF8g/Pf5lCM8CrVVt9vSrW3g/VFmwiimTbKRr
 60cZtoPeTk/UD1k+YWNHEth0bfD5Ng8rbGhMK7LSYif8uQrFASWeiTokQkEQpZ4ODFhA
 MXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qFqeqNjaO9GxDFF6ku8GcKf8eCW7YzW8WlCYcuIhXtw=;
 b=fToeU+1Fo2gUk3N+rk4X15XrGxAOiJ1yxOXUKRH34btSMEvFohdoq9ZzPSCqtedJK8
 6S7iNabIGyADiE0Zg/dfbHQADaZJBgh/aVVIdAL1PxtIuZ3ArCDnhi68Ou1VbNPiVy2W
 YHEoNf+bsdMEWVTn2jw0uuslyMn27kZv3rvdQCDqn8SSlgGG76CFkg5JotTTfCqmWmFw
 MNpMycfaFnlni8xBLD33U+E7DOeJvoPRwcia7UsVjPJgdYJHpiqRiRpSdiIfUF6nh5YN
 K/K67BCakzH1eIBzawLPNQUPW9BWUwUCLuqYBtx+aodtJ1tbmOsOlTKMJbbHMWXTZWFn
 aGGA==
X-Gm-Message-State: AOAM530RspD3D7zkGlg0U5aWy9sr2dm+M8ws4KV+mECNsdCJ3a+JFoWZ
 vEcU4WQNPZXLBwAdPl+cHYEWfw==
X-Google-Smtp-Source: ABdhPJwLYMPowNdTkLJ34QzaeN9tFdTwYfvdX4sZzVVl0Iw2FtIgFVDuXXt10tP1iVV/54OpJmp2hw==
X-Received: by 2002:a17:906:469a:b0:6e8:76c2:1d58 with SMTP id
 a26-20020a170906469a00b006e876c21d58mr1213716ejr.371.1649508236783; 
 Sat, 09 Apr 2022 05:43:56 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm9749886ejb.162.2022.04.09.05.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 05:43:56 -0700 (PDT)
Message-ID: <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
Date: Sat, 9 Apr 2022 14:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_054359_643673_FFF073D7 
X-CRM114-Status: GOOD (  22.11  )
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

T24gMDkvMDQvMjAyMiAxNDoyNiwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+Pgo+PiBJbiBhbnkg
Y2FzZSB0aGlzIHJlcXVpcmVzIHZlbmRvciBwcmVmaXguCj4gCj4gSSdtIG5vdCBzdXJlIHRoYXQg
InNjcGFydC1pZCIgaXMgbmVjZXNzYXJ5IGhlcmUuICJzZXJjb21tLHNjLXBhcnRpdGlvbnMiCj4g
aXMgbmVjZXNzYXJ5LiBJJ20gZ29pbmcgdG8gYWRkIHZlbmRvciBwcmVmaXggaW4gYSBzZXBhcmF0
ZSBwYXRjaC4gSXMgdGhpcwo+IG9rPwoKWWVzLgoKPiAKPiAtLS0KPiDCoERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKPiDCoDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiBpbmRleCAwMTQz
MDk3M2VjZWMuLjY1ZmYyMjM2NGZiMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiBAQCAtMTA4Miw2ICsx
MDgyLDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gwqDCoMKgwqAgZGVzY3JpcHRpb246IFNlbnNp
cmlvbiBBRwo+IMKgwqAgIl5zZW5zb3J0ZWssLioiOgo+IMKgwqDCoMKgIGRlc2NyaXB0aW9uOiBT
ZW5zb3J0ZWsgVGVjaG5vbG9neSBDb3Jwb3JhdGlvbgo+ICvCoCAiXnNlcmNvbW0sLioiOgo+ICvC
oMKgwqAgZGVzY3JpcHRpb246IFNlcmNvbW0gKFN1emhvdSkgQ29ycG9yYXRpb24KPiDCoMKgICJe
c2ZmLC4qIjoKPiDCoMKgwqDCoCBkZXNjcmlwdGlvbjogU21hbGwgRm9ybSBGYWN0b3IgQ29tbWl0
dGVlCj4gwqDCoCAiXnNnZCwuKiI6Cj4gLS0KPiAKPj4+ICsKPj4+ICtyZXF1aXJlZDoKPj4+ICsg
IC0gY29tcGF0aWJsZQo+PiBNaXNzaW5nIHJlZy4KPiAKPiByZWcgaXNuJ3QgcmVxdWlyZWQuIFBh
cnNlciBjYW4gcmVhZCBwYXJ0aXRpb24gb2Zmc2V0cyBhbmQgc2l6ZXMgZnJvbQo+IFNDIFBBUlQg
TUFQIHRhYmxlLiBPciBkbyB5b3UgbWVhbiBzb21ldGhpbmcgZWxzZT/CoCBBbGwgaXMgb2sKPiB3
aXRob3V0IHJlZyBkZWZpbml0aW9uIGluICJFeGFtcGxlIiAoZXhjZXB0IHRoZSB3YXJucyB0aGF0
IHJlZyBwcm9wZXJ0eQo+IGlzIG1pc3NpbmcpLgoKcmVnIG1pZ2h0IG5vdCBiZSByZXF1aXJlZCBm
b3IgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBidXQgaXQgaXMgcmVxdWlyZWQKYnkgZGV2aWNldHJl
ZSBmb3IgZXZlcnkgbm9kZSB3aXRoIHVuaXQgYWRkcmVzcy4gRG8geW91IGV4cGVjdCBoZXJlIG5v
ZGVzCndpdGhvdXQgdW5pdCBhZGRyZXNzZXM/Cgo+PiBBcmUgeW91IHN1cmUgdGhhdCB5b3UgdGVz
dGVkIHlvdXIgYmluZGluZ3M/IFlvdSBtaXNzIGhlcmUgYWRkcmVzcy9zaXplCj4+IGNlbGxzIGFu
ZCBjaGlsZHJlbiwgc28geW91IHNob3VsZCBoYXZlIGJpZyBmYXQgd2FybmluZy4KPj4KPj4gUGx1
cyB5b3VyIERUUyBleGFtcGxlIGhhcyBlcnJvciBhbmQgZG9lcyBub3QgY29tcGlsZS4uLgo+IAo+
IFdob2xlIGR0cywgZm9yIHRoZSByZWFsIGRldmljZSAobm90IGZvciBleGFtcGxlKSwgd2FzIHRl
c3RlZCBtYW55IHRpbWVzLgoKWWVhaCwgSSBkaWQgbm90IHNwZWFrIGFib3V0IHdob2xlIERUUywg
YnV0IGJpbmRpbmdzIGFuZCBleGFtcGxlIGluIHRoZQpiaW5kaW5ncy4KCj4gVGhhbmsgeW91IGZv
ciB5b3VyIGZlZWRiYWNrISBJIGNoZWNrZWQgdGhlIGFub3RoZXIgZXhhbXBsZXMgYW5kIHRoZXJl
Cj4gYXJlIG5vIGFueSB3YXJuaW5ncyBub3cuIEJ1dCBJJ20gbm90IHlldCBzdXJlIHRoYXQgInBy
b3BlcnRpZXMiIGFuZAo+ICJyZXF1aXJlZCIgYXJlIGNvcnJlY3QuCj4gV2hhdCBkbyB5b3UgdGhp
bmsgKG9yIHdoYXQgZWxzZSBJIGhhdmUgdG8gcmVhZCAvIGNoZWNrKT8KClRoZXJlIGlzIG5vIHdh
eSB5b3UgdGVzdGVkIHRoZSBiaW5kaW5ncy4gVGhlcmUgYXJlIGZvciBzdXJlIHdhcm5pbmdzCmJl
Y2F1c2UgaXQgc2ltcGx5IGNhbm5vdCBiZSBldmVuIGNvbXBpbGVkLiBUaGUgd3JpdGluZy1zY2hl
bWEucnN0CmRlc2NyaWJlcyBob3cgdG8gdGVzdCBpdC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
