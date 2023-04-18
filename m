Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CBAC77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 05:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A0oouCzhNTWi6FaQUEldy5Pb70BG6b5/t2PtFN3jP3Y=; b=lzgIHtPkhBDoek8NQNgjJhVaHl
	f+xWcyqrYwfSu1/q7+GVB5Pi8uUBz9d+TS7NjeOAA0J4/YD7sxhwl9uR0MhUTkkSqWhmRo+fHGvvW
	ohBaxU4828opbhFXB8O7e8BBECqM8ewY5blj0A6AiaFi6kag9WeSyZ+pU+Uy41lC+Qyo4zalRS9/d
	nounQWk2RP+WXOKapiPyB/DtXPAK3K+ERcQyTDutxuiTG7Xv745lLuzMIx3eBfZG6oRJF9o7htH2b
	u2JIu2MLKXpcwhUNAO+8P7BURNsY09ZWH5Ce+7SWek2tPdSOdergF2XxsLOUVA4KMnhlIbqnqWFCR
	8eajgfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1podjI-000tB5-2g;
	Tue, 18 Apr 2023 05:18:12 +0000
Received: from mx2.ucr.edu ([138.23.62.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1podjF-000t95-2f
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 05:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1681795089; x=1713331089;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:content-transfer-encoding;
  bh=3yyHcgAuucnuqHYQK8xkrlrcU3xWVsVJyHrX3MFNYBA=;
  b=XmSo4Ls3x/4p61/ueo5W5GfxGvhVS0+ScR6cIqM/RMSZFI9mvxJWCmSi
   pzvgWhju+txygpqM3oVcB835Q9XyFXCwqle9hOfk8BsqKpmFx0IPY//dZ
   35MOxu0KcgVFpVRvtJD6U32RiKFAdJUHjWv9GSMfXM4G+kFhfcwcFp8Px
   isJ+RTrRz5Z+nbBHIlO01i/lNv2UbvGXKW8ombKI8Egz2dUKWRh8koiD+
   FBfG09sjO05qXiny/zj1WxyjaH/wDQCkiNF6ESjt81PXLcTZqIxq9dEF8
   LPc1z6Pz0pzhEmWwncYAs658d8RQBTuSn40U5fGsMNp5Nv77jFEDHHVEx
   Q==;
Received: from mail-wm1-f71.google.com ([209.85.128.71])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Apr 2023 22:16:26 -0700
Received: by mail-wm1-f71.google.com with SMTP id fl8-20020a05600c0b8800b003f16fe94249so3743058wmb.9
        for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2023 22:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1681794982; x=1684386982;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSo88ekM07RpY57SnW2OeV+llcfiOK6+PQ1WVcWB5mU=;
        b=O6yVjiqSTvxO9RIvQh6PQwKSHxZPHLnWfl+HVAjC47pxvB8cBwFtB+aKyrWkJy5EZ+
         r4gLAo+5Y1JVwr/vcdoKHir5/QshecfcYs1DezxfvkMQTO7JfkFXK8H58TEPZhhxQo95
         QrP7Q3lsqMloKV2Lz9iTjTnUbuiER0Qc2QCzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681794982; x=1684386982;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSo88ekM07RpY57SnW2OeV+llcfiOK6+PQ1WVcWB5mU=;
        b=QASqMcIWBFTzTu0EAtILWZq0S59X7U/GG5Aj+n/s6pQ2N62T8rLW2WMLxBXC6s2GGn
         0Il7huWNOAKit9V5+J/FxLowR5pq2XQaj48kX42gZvb9FhC7nFiypEG3PG5EVez98eFi
         rzyTimBKgcBjXg6DATCYMFCOtlIVH0QrGfvUfvLVVQ+tnKD+2sCuEUgHe/lGR+vzKy4b
         Wvaay43jGqBVcGYchcHTqQrgpCTkY3FO3N4ENuLhVSjtjb2TEMMGN88/sN8w1Vv1sNgx
         9/o42aq02e2ecX3rRTtxWUcFdKGleblbxIxQNaj4zvnnz8lZ/1+03hU6zTEAQwLOUjvC
         Eseg==
X-Gm-Message-State: AAQBX9ew+woXzd1Yt5iOQzD5u0IdmdZ3MKZj65tVOobIlaHoKxakvYOE
	UdIF0kYOZmEEX7yA6Y/1F6h6s2NwKg9WrYOfhVn7s30UfjwrX1A/66dTlfn03GFsx5HVWZ62NmN
	jN0VivRJLmNOvbKRRALmsq7qoVqow57YIUWCHS3bg99k=
X-Received: by 2002:a1c:790f:0:b0:3f1:72e3:576b with SMTP id l15-20020a1c790f000000b003f172e3576bmr5229399wme.26.1681794982479;
        Mon, 17 Apr 2023 22:16:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWZe1zBlHke4mh2KAXg8vUbFFdDjWhxdbVMNV7R/dH26YSV26ZkpSPPdng1sFF33WSMQm3cBwZ/xUJ4wH9WFo=
X-Received: by 2002:a1c:790f:0:b0:3f1:72e3:576b with SMTP id
 l15-20020a1c790f000000b003f172e3576bmr5229387wme.26.1681794982164; Mon, 17
 Apr 2023 22:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
In-Reply-To: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
From: Yu Hao <yhao016@ucr.edu>
Date: Mon, 17 Apr 2023 22:16:11 -0700
Message-ID: <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
To: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_221809_907969_60389028 
X-CRM114-Status: GOOD (  10.68  )
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

U29ycnkgdGhhdCB0aGVyZSBpcyBhIG1pc3Rha2UgZm9yIHRoZSBmdWxsIHJlcG9ydC4KSXQgc2hv
dWxkIGJlIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL1pIWWZlbmcvYWU2NmJmODE2N2JjMzQxZDM3
NTNhZjAwZTk5MDJiMWEKCk9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDEwOjEw4oCvUE0gWXUgSGFv
IDx5aGFvMDE2QHVjci5lZHU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBXZSBmb3VuZCB0aGUgZm9s
bG93aW5nIGlzc3VlIHVzaW5nIHN5emthbGxlciBvbiBMaW51eCB2Ni4yLjAuCj4gVGhlIGZ1bGwg
cmVwb3J0Ogo+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL1pIWWZlbmcvYTNlM2ZmMmJkZmVhNWVk
NWRlNTQ3NWYwYjU0ZDU1Y2IKPgo+IFRoZSBicmllZiByZXBvcnQgaXMgYmVsb3c6Cj4KPiB1Ymk6
IG10ZDAgaXMgYWxyZWFkeSBhdHRhY2hlZCB0byB1YmkwCj4gdWJpNzogYXR0YWNoaW5nIG10ZDE0
Nwo+IGRpdmlkZSBlcnJvcjogMDAwMCBbIzFdIFBSRUVNUFQgU01QIEtBU0FOCj4gQ1BVOiAwIFBJ
RDogMjAwMjMgQ29tbTogc3l6LWV4ZWN1dG9yLjAgTm90IHRhaW50ZWQgNi4yLjAgIzYKPiBIYXJk
d2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUwo+
IDEuMTMuMC0xdWJ1bnR1MS4xIDA0LzAxLzIwMTQKPiBSSVA6IDAwMTA6bXRkX2Rpdl9ieV9lYiBp
bmNsdWRlL2xpbnV4L210ZC9tdGQuaDo1ODAgW2lubGluZV0KPiBSSVA6IDAwMTA6aW9faW5pdCBk
cml2ZXJzL210ZC91YmkvYnVpbGQuYzo2MjAgW2lubGluZV0KPiBSSVA6IDAwMTA6dWJpX2F0dGFj
aF9tdGRfZGV2KzB4NzdmLzB4MmZlMCBkcml2ZXJzL210ZC91YmkvYnVpbGQuYzo5NTUKPiBDb2Rl
OiBmYyBmZiBkZiA0OCBjMSBlYSAwMyAwZiBiNiAxNCAwMiA0YyA4OSBmMCA4MyBlMCAwNyA4MyBj
MCAwMyAzOAo+IGQwIDdjIDA4IDg0IGQyIDBmIDg1IDFmIDI1IDAwIDAwIDQxIDhiIDRjIDI0IDEw
IDQ4IDg5IGQ4IDMxIGQyIDw0OD4gZjcKPiBmMSA0OCA4OSBjMyBlOCBiNiBmMyAxYiBmYyA0OCA4
ZCA4NSA0MCAxNyAwMCAwMCA0OCA4OSBjMiA0OAo+IFJTUDogMDAxODpmZmZmYzkwMDBiZTBmZDMw
IEVGTEFHUzogMDAwMTAyNDYKPiBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAwMDAwMDAw
MDAwMDAwIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6
IGZmZmY4ODgwNDdhNDlkNDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAyCj4gUkJQOiBmZmZmODg4MDI0
ZTFjMDAwIFIwODogMDAwMDAwMDAwMDAwMDAxNiBSMDk6IGZmZmZmNTIwMDE3YzFmNDcKPiBSMTA6
IGZmZmZjOTAwMGJlMGZhMzcgUjExOiBmZmZmZjUyMDAxN2MxZjQ2IFIxMjogZmZmZjg4ODA2NTQ1
YTAwMAo+IFIxMzogMDAwMDAwMDAwMDAwMDAwMCBSMTQ6IGZmZmY4ODgwNjU0NWEwMTAgUjE1OiAw
MDAwMDAwMDAwMDAwMDA3Cj4gRlM6ICAwMDAwN2ZkNDVlODVjNzAwKDAwMDApIEdTOmZmZmY4ODgw
MmNhMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+IENTOiAgMDAxMCBEUzogMDAw
MCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiBDUjI6IDAwMDA3ZjY0YWVlZjUzYTQg
Q1IzOiAwMDAwMDAwMDRmMzlhMDAwIENSNDogMDAwMDAwMDAwMDM1MGVmMAo+IENhbGwgVHJhY2U6
Cj4gIDxUQVNLPgo+ICBjdHJsX2NkZXZfaW9jdGwrMHgzMDMvMHgzYTAgZHJpdmVycy9tdGQvdWJp
L2NkZXYuYzoxMDQzCj4gIHZmc19pb2N0bCBmcy9pb2N0bC5jOjUxIFtpbmxpbmVdCj4gIF9fZG9f
c3lzX2lvY3RsIGZzL2lvY3RsLmM6ODcwIFtpbmxpbmVdCj4gIF9fc2Vfc3lzX2lvY3RsIGZzL2lv
Y3RsLmM6ODU2IFtpbmxpbmVdCj4gIF9feDY0X3N5c19pb2N0bCsweDE5OC8weDIxMCBmcy9pb2N0
bC5jOjg1Ngo+ICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo1MCBbaW5s
aW5lXQo+ICBkb19zeXNjYWxsXzY0KzB4MzUvMHhiMCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo4
MAo+ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2My8weGNkCj4gUklQOiAwMDMz
OjB4N2ZkNDVkNjkwMmZkCj4gQ29kZTogMDIgYjggZmYgZmYgZmYgZmYgYzMgNjYgMGYgMWYgNDQg
MDAgMDAgZjMgMGYgMWUgZmEgNDggODkgZjggNDgKPiA4OSBmNyA0OCA4OSBkNiA0OCA4OSBjYSA0
ZCA4OSBjMiA0ZCA4OSBjOCA0YyA4YiA0YyAyNCAwOCAwZiAwNSA8NDg+IDNkCj4gMDEgZjAgZmYg
ZmYgNzMgMDEgYzMgNDggYzcgYzEgYmMgZmYgZmYgZmYgZjcgZDggNjQgODkgMDEgNDgKPiBSU1A6
IDAwMmI6MDAwMDdmZDQ1ZTg1YmM1OCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAwMDAwMDAw
MDAwMDAwMDEwCj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmZDQ1ZDdiYmY2MCBS
Q1g6IDAwMDA3ZmQ0NWQ2OTAyZmQKPiBSRFg6IDAwMDAwMDAwMjAwMDAwMDAgUlNJOiAwMDAwMDAw
MDQwMTg2ZjQwIFJESTogMDAwMDAwMDAwMDAwMDAwNQo+IFJCUDogMDAwMDdmZDQ1ZDZmZWM4OSBS
MDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwCj4gUjEwOiAwMDAwMDAw
MDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAwMDAwMDAwMDAwMDAKPiBS
MTM6IDAwMDA3ZmZmNjc2ODE0YmYgUjE0OiAwMDAwN2ZmZjY3NjgxNjcwIFIxNTogMDAwMDdmZDQ1
ZTg1YmRjMAo+ICA8L1RBU0s+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
