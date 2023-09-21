Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E7DE7107E
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm7/wPOkI1yHJzjAFuDUecZkxm+SGhPAIlKgRJPRyIk=; b=vU1InCLPE9sV+i
	z3EUJ6LKqIOkNV6KhUGOaY7NqXvug0nVp5h8GitREu+lM2e9d51gDwcWef32BLh1R/0X+Ci8E0+Tu
	05nrd0dZyLC+lG3GTlWYeDdGiRk22ri5DVl763CGDXrSoOLUL8HMtbSYT3nyycdRSFoucyF2I6G8E
	f2yFOaUBWoveECOmLIyPfvwf/g5Cf8jmHhaPyPD/qAV3Vty/OReFkPEdlrbtiuE1XtS4A7OgSSxq7
	NyPbytOMobQb2ESs+y5gky9FzOmM4cPCDEzvw6EsxUZc5KSxXo6OObd9FnxlCqkXQQ+K/0oxKNjnN
	6p2xrloWlhcsrkMRbNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKib-006Hh9-1J;
	Thu, 21 Sep 2023 14:31:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKiY-006HgW-1t
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 14:31:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-530ab2d9e89so1200410a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695306705; x=1695911505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sP96J04IzbNW8/aKdG0MvK5uH8GFs3cXDYFHxmwUfag=;
        b=Ofa55Jyszb2FoQliAv2lalpvcyhkeEIlUGVy3wbNxsw4V3hTaJZO/Ux29UA5KrYVj5
         k8V2Mi9JqfmolCTBBMKA1CAlugkhpBws1NLQqPKTmzOoko3WQaOyrzlCdtCtMl32SSUe
         xo0hsqod784njcLtgG8/Q4bfagidzcVBbDUyJiUVCS/Pmx5SrQaI1tu1OxCQ7OxB8Fjg
         yQwdfIMJnVwbXxpm4BY3EXvTZvuavTLj9sHal62pGDb4kRGftOgf0ToZSn0/hJFXoDMv
         4JVKXZiMwGd89O6gtqRUFBbkjlCdUo1jUGzahpEGWEM8MRPS/KVmJmfMdbNfqVodv86D
         fPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306705; x=1695911505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sP96J04IzbNW8/aKdG0MvK5uH8GFs3cXDYFHxmwUfag=;
        b=TpawPi6YMWqELic0uaD9vU64iqJj55wssILLPOQyzRMShHBVN/O0cTOLH9gUbpn+9T
         ZM4vz3VugpHJc4MC3NLoBTba6iaLlsZUgV4obJHmEhbZS3EAwJjbu2Dd8vhtfKMvvf6f
         k51eazd4mdK5Fy+Ci0bYpp+Vie6uMLgD6YO/xnIZ1oePUiIkusIdhCv0ZPgTH1RH+8m/
         Mvszlde0zkNF/Q/IPRog7i7CXYAPKQtolehAMJWRaHObouGE91hGEpWDIaEKo2s9kXeE
         dsP4C/HD/vAD+iTywTBT4/vsHKvbsAF6TPik5RJMG3f4SzEKx8mF0WEaI/3Pl+2ZzHCI
         QI6g==
X-Gm-Message-State: AOJu0YyXDUubyAbVK8S5xPWEOTZ1e0U3pbK2joK06HAH0d+f7iSgqTj1
	1UmpbffNqSYYvqKiL3TsLJFnHw==
X-Google-Smtp-Source: AGHT+IH4nZ6qomKmkIzyGievhJ1QFes7cUE8bqYM8WY8mDDFvKwHAwtezxXtG2UDZWhTLuO8RmRjcA==
X-Received: by 2002:aa7:c554:0:b0:523:102f:3ce0 with SMTP id s20-20020aa7c554000000b00523102f3ce0mr4836710edr.21.1695306704810;
        Thu, 21 Sep 2023 07:31:44 -0700 (PDT)
Received: from [172.20.34.61] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n23-20020aa7c697000000b0052ea9ad21bdsm919204edq.72.2023.09.21.07.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 07:31:44 -0700 (PDT)
Message-ID: <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
Date: Thu, 21 Sep 2023 15:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_073146_623378_1CF82066 
X-CRM114-Status: GOOD (  18.01  )
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

SGksIFNodWtsYSwKClNvcnJ5LCB0aGlzIGVtYWlsIHNvbWVob3cgZ290IG9mZiBteSByYWRhci4K
Ck9uIDgvMjIvMjMgMTM6MTYsIFNIVUtMQSBNYW10YSBSYW1lbmRyYSB3cm90ZToKPiAKPiBPbiAx
NC4wNy4yMyAxMDoxNSwgU0hVS0xBIE1hbXRhIFJhbWVuZHJhIHdyb3RlOgo+PiBIZWxsbyBUdWRv
ciwKPj4KPj4gT24gMTMuMDcuMjMgMDU6NDMsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+PiBUaGlz
IGVtYWlsIGlzIG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFz
ZSBiZSBjYXJlZnVsIHdoaWxlIGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBv
ciByZXBseWluZyB0byB0aGlzIGVtYWlsLgo+Pj4KPj4+Cj4+PiBPbiAwNS4wNy4yMDIzIDE4OjQ5
LCBNYW10YSBTaHVrbGEgd3JvdGU6Cj4+Pj4gbXQyNXF1NTEyYVsxXSBzdXBwb3J0cyBsb2NraW5n
L3VubG9ja2luZyB0aHJvdWdoIEJQIGJpdHMgaW4gU1IuCj4+Pj4KPj4+PiBUZXN0ZWQgdXNpbmcg
bXRkLXV0aWxzLSBmbGFzaF9sb2NrL2ZsYXNoX3VubG9jayBmb3IgTVQyNVFVNTEyQUJCOEUxMi4K
Pj4+Pgo+Pj4+IExpbms6IGh0dHBzOi8vbWVkaWEtd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGll
bnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9zZXJpYWwt
bm9yL210MjVxL2RpZS1yZXYtYi9tdDI1cV9xbGt0X3VfNTEyX2FiYl8wLnBkZj9yZXY9YjI1OWFh
ZGMzYmVhNDllYTgyMTBhNDFjOWFkNTgyMTEKPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYW10YSBTaHVr
bGEgPG1hbXRhLnNodWtsYUBsZWljYS1nZW9zeXN0ZW1zLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBD
aGFuZ2VzIGluIHYyOgo+Pj4+ICAgIC0gYWRkIExpbmsgdGFnCj4+Pj4gICAgLSBmaXggY2hpcCBw
YXJ0IG51bWJlciBtdDI1cWw1MTJhLT5tdDI1cXU1MTJhCj4+Pj4KPj4+PiAgICBkcml2ZXJzL210
ZC9zcGktbm9yL21pY3Jvbi1zdC5jIHwgMiArKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21p
Y3Jvbi1zdC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+Pj4+IGluZGV4IDRi
OTE5NzU2YTIwNS4uMDhlOTQzNDBlYmFhIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvbWljcm9uLXN0LmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1z
dC5jCj4+Pj4gQEAgLTIyOSw2ICsyMjksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2lu
Zm8gc3Rfbm9yX3BhcnRzW10gPSB7Cj4+Pj4gICAgICAgICAgICAgICAgIE1GUl9GTEFHUyhVU0Vf
RlNSKQo+Pj4+ICAgICAgICAgfSwKPj4+PiAgICAgICAgIHsgIm10MjVxdTUxMmEiLCAgSU5GTzYo
MHgyMGJiMjAsIDB4MTA0NDAwLCA2NCAqIDEwMjQsIDEwMjQpCj4+Pj4gKyAgICAgICAgICAgICBG
TEFHUyhTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIgfCBTUElfTk9SXzRCSVRfQlAg
fAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgU1BJX05PUl9CUDNfU1JfQklUNikKPj4+PiAgICAg
ICAgICAgICAgICAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBT
UElfTk9SX1FVQURfUkVBRCkKPj4+PiAgICAgICAgICAgICAgICAgRklYVVBfRkxBR1MoU1BJX05P
Ul80Ql9PUENPREVTKQo+Pj4+ICAgICAgICAgICAgICAgICBNRlJfRkxBR1MoVVNFX0ZTUikKPj4+
Cj4+PiBDYW4geW91IHRyeSB0aGUgZm9sbG93aW5nIGluc3RlYWQ/IFdlIHRyeSB0byB1c2UgU0ZE
UCBwYXJzaW5nIHdoZW5ldmVyCj4+PiBwb3NzaWJsZS4KPj4+ICAgICAgICAgICB7ICJtdDI1cXU1
MTJhIiwgIElORk82KDB4MjBiYjIwLCAweDEwNDQwMCwgMCwgMCkKPj4+ICAgICAgICAgICAgICAg
ICAgIEZMQUdTKFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8IFNQSV9OT1JfNEJJ
VF9CUCB8Cj4+PiAgICAgICAgICAgICAgICAgICBTUElfTk9SX0JQM19TUl9CSVQ2KQo+Pj4gICAg
ICAgICAgICAgICAgICAgUEFSU0VfU0ZEUAo+Pj4gICAgICAgICAgICAgICAgICAgTUZSX0ZMQUdT
KFVTRV9GU1IpCj4+Cj4+Cj4+IEkgdGVzdGVkIHdpdGggU0ZEUCBQYXJzaW5nIEZsYWcuIEl0IHdv
cmtzIGZpbmUuCj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBbICAyMTQuNzI2MDkw
XSBBQ1BJOiBIb3N0LWRpcmVjdGVkIER5bmFtaWMgQUNQSSBUYWJsZSBMb2FkOgo+PiBbICAyMTQu
NzMxNDgyXSBBQ1BJOiBTU0RUIDB4RkZGRjg5Mjg4MkQ4OTgwMCAwMDAwRUMgKHYwMiBBTEFTS0Eg
TVQyNVFVCj4+IDAwMDAxMDAwIElOVEwgMjAxOTA1MDkpCj4+IFsgIDIxNC43NjYwODJdIHNwaS1u
b3Igc3BpLVBSUDAwMDE6MDA6IG10MjVxdTUxMmEgKDY1NTM2IEtieXRlcykKPj4KPj4KPj4gY2F0
IC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaS1QUlAwMDAxOjAwL3NwaS1ub3IvamVkZWNfaWQKPj4g
MjBiYjIwMTA0NDAwCj4+Cj4+IGNhdCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGktUFJQMDAwMTow
MC9zcGktbm9yL21hbnVmYWN0dXJlcgo+PiBzdAo+Pgo+PiBjYXQgL3N5cy9idXMvc3BpL2Rldmlj
ZXMvc3BpLVBSUDAwMDE6MDAvc3BpLW5vci9wYXJ0bmFtZQo+PiBtdDI1cXU1MTJhCj4+Cj4+IHh4
ZCAtcCAgL3N5cy9idXMvc3BpL2RldmljZXMvc3BpLVBSUDAwMDE6MDAvc3BpLW5vci9zZmRwCj4+
IDUzNDY0NDUwMDYwMTAxZmYwMDA2MDExMDMwMDAwMGZmODQwMDAxMDI4MDAwMDBmZmZmZmZmZmZm
ZmZmZgo+PiBmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIwZmJmZmZmZmZm
ZjFmMjllYjI3NmIKPj4gMjczYjI3YmJmZmZmZmZmZmZmZmYyN2JiZmZmZjI5ZWIwYzIwMTBkODBm
NTIwMDAwMjQ0YTk5MDA4YjhlCj4+IDAzZTFhYzAxMjczODdhNzU3YTc1ZmJiZGQ1NWM0YTBmODJm
ZjgxYmQzZDM2ZmZmZmZmZmZmZmZmZmZmZgo+PiBmZmZmZmZmZmZmZmZmZmZmZmZlN2ZmZmYyMWRj
ZmZmZgo+Pgo+PiBtZDVzdW0gIC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaS1QUlAwMDAxOjAwL3Nw
aS1ub3Ivc2ZkcAo+PiA2MTBlZmJhMTY0N2UwMGFjNmRiMThiZWIxMWU4NGMwNAo+PiAvc3lzL2J1
cy9zcGkvZGV2aWNlcy9zcGktUFJQMDAwMTowMC9zcGktbm9yL3NmZHAKPj4KPj4gZGQgaWY9L2Rl
di91cmFuZG9tIG9mPS90bXAvcXNwaV93cml0ZSAgYnM9MU0gY291bnQ9MQo+PiAxKzAgcmVjb3Jk
cyBpbgo+PiAxKzAgcmVjb3JkcyBvdXQKPj4gMTA0ODU3NiBieXRlcyAoMS4wIE1CLCAxLjAgTWlC
KSBjb3BpZWQsIDAuMDIyMTM5MSBzLCA0Ny40IE1CL3MKPj4KPj4gbXRkX2RlYnVnIHdyaXRlIC9k
ZXYvbXRkMCAwIDEwNDg1NzYgL3RtcC9xc3BpX3dyaXRlCj4+IENvcGllZCAxMDQ4NTc2IGJ5dGVz
IGZyb20gL3RtcC9xc3BpX3dyaXRlIHRvIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaAo+Pgo+
PiBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGQwIDAgMTA0ODU3Ngo+PiBFcmFzZWQgMTA0ODU3NiBi
eXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaAo+Pgo+PiBtdGRfZGVidWcgcmVh
ZCAvZGV2L210ZDAgMCAxMDQ4NTc2IC90bXAvcXNwaV9yZWFkCj4+IENvcGllZCAxMDQ4NTc2IGJ5
dGVzIGZyb20gYWRkcmVzcyAweDAwMDAwMDAwIGluIGZsYXNoIHRvIC90bXAvcXNwaV9yZWFkCj4+
Cj4+IGhleGR1bXAgL3RtcC9xc3BpX3JlYWQKPj4gMDAwMDAwMCBmZmZmIGZmZmYgZmZmZiBmZmZm
IGZmZmYgZmZmZiBmZmZmIGZmZmYKPj4gKgo+PiAwMTAwMDAwCj4+Cj4+IG10ZF9kZWJ1ZyB3cml0
ZSAvZGV2L210ZDAgMCAxMDQ4NTc2IC90bXAvcXNwaV93cml0ZQo+PiBDb3BpZWQgMTA0ODU3NiBi
eXRlcyBmcm9tIC90bXAvcXNwaV93cml0ZSB0byBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gK
Pj4KPj4gbXRkX2RlYnVnIHJlYWQgL2Rldi9tdGQwIDAgMTA0ODU3NiAvdG1wL3FzcGlfcmVhZAo+
PiBDb3BpZWQgMTA0ODU3NiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaCB0
byAvdG1wL3FzcGlfcmVhZAo+Pgo+PiBzaGExc3VtIC90bXAvcXNwaV93cml0ZSAgL3RtcC9xc3Bp
X3JlYWQKPj4gNGZlNGU3MWIxMWY0NGU5NjcyYmQ0OWUyZTMyYzBmZDk0ZGE0ZmViNiAgL3RtcC9x
c3BpX3dyaXRlCj4+IDRmZTRlNzFiMTFmNDRlOTY3MmJkNDllMmUzMmMwZmQ5NGRhNGZlYjYgIC90
bXAvcXNwaV9yZWFkCj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4KPj4gU2hhbGwg
SSB3cml0ZSBhIG5ldyBjb21taXQgZm9yIFBBUlNFX1NGRFAgRmxhZyBvciB1cGRhdGUgdGhpcyBj
b21taXQgYXMtCj4+ICJNb2RpZnkgbXQyNXF1NTEyYSBGbGFncyIgPwo+IAo+IAo+IFBpbmchIEp1
c3QgdG8gZm9sbG93IHVwIG9uIHRoaXMuCj4gCgpZZWFoLCBwbGVhc2UgbWFrZSAyIGNvbW1pdHMg
c28gdGhhdCB3ZSBjYW4gY2xlYW5seSByZXZlcnQgdGhlIHN3aXRjaGluZwp0byBTRkRQLCBpZiBl
dmVyIG5lZWRlZC4KClNvIHRoZSBmaXJzdCBjb21taXQgd2lsbCBsb29rIGxpa2U6CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCmIvZHJpdmVycy9tdGQvc3BpLW5v
ci9taWNyb24tc3QuYwppbmRleCA0YWZjZmM1N2M4OTYuLmE4ZGExZjE4ZTMzNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYworKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL21pY3Jvbi1zdC5jCkBAIC00MDUsOSArNDA1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
bGFzaF9pbmZvIHN0X25vcl9wYXJ0c1tdID0gewogICAgICAgIH0sIHsKICAgICAgICAgICAgICAg
IC5pZCA9IFNOT1JfSUQoMHgyMCwgMHhiYiwgMHgyMCwgMHgxMCwgMHg0NCwgMHgwMCksCiAgICAg
ICAgICAgICAgICAubmFtZSA9ICJtdDI1cXU1MTJhIiwKLSAgICAgICAgICAgICAgIC5zaXplID0g
U1pfNjRNLAotICAgICAgICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05P
Ul9EVUFMX1JFQUQgfApTUElfTk9SX1FVQURfUkVBRCwKLSAgICAgICAgICAgICAgIC5maXh1cF9m
bGFncyA9IFNQSV9OT1JfNEJfT1BDT0RFUywKICAgICAgICAgICAgICAgIC5tZnJfZmxhZ3MgPSBV
U0VfRlNSLAogICAgICAgIH0sIHsKICAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQoMHgyMCwg
MHhiYiwgMHgyMCksCgphbmQgdGhlIHNlY29uZCBvbmUgd2lsbCBhZGQganVzdCB0aGUgQlAgc3Vw
cG9ydCwgc29tZXRoaW5nIGxpa2U6CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21p
Y3Jvbi1zdC5jCmIvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwppbmRleCBhOGRhMWYx
OGUzMzUuLmZkYWZiZmEwZjkzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9taWNy
b24tc3QuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCkBAIC00MDUsNiAr
NDA1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHN0X25vcl9wYXJ0c1tdID0g
ewogICAgICAgIH0sIHsKICAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQoMHgyMCwgMHhiYiwg
MHgyMCwgMHgxMCwgMHg0NCwgMHgwMCksCiAgICAgICAgICAgICAgICAubmFtZSA9ICJtdDI1cXU1
MTJhIiwKKyAgICAgICAgICAgICAgIC5mbGFncyA9IFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9S
X0hBU19UQiB8ClNQSV9OT1JfNEJJVF9CUCB8CisgICAgICAgICAgICAgICAgICAgICAgICBTUElf
Tk9SX0JQM19TUl9CSVQ2LAogICAgICAgICAgICAgICAgLm1mcl9mbGFncyA9IFVTRV9GU1IsCiAg
ICAgICAgfSwgewogICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgweDIwLCAweGJiLCAweDIw
KSwKCk9mIGNvdXJzZSwgSSBleHBlY3QgeW91IHRvIHJ1biBhZ2FpbiB0aGUgbXRkX2RlYnVnIHRl
c3RzIGFuZCBhbHNvIHZlcmlmeQp0aGUgbG9ja2luZy4gVGhhbmtzIQoKQ2hlZXJzLAp0YQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
