Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27B8C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8/RWcuKS5T9LZPmQv/LFQeJa6TsY+bMJBXDSsljiYQ=; b=qEtEMy8Uclb+Xw
	Lscuz0KANbI7tMY9EzG02dK0dbqneLX/q7d64SDX6Zb498miI2/3HaONIRNZYGsI+TP5DG1W1D270
	DTkmMpTOVKclCCis9YiNC0J7+LHvG4GEB/+JskKpukjk4VxQfeDuZrNL6XJfhjPXQwDQ36hKdLc8c
	wEvQnP9+zn3/jqZN+rh8ISBEg2bgskkyH0kj03Ti+SaZyM8qtKFwzbI2hLrjW9Yx3u/kZFWqHjQCC
	wKbka9z+IvFk6cL1LzztVnpYhqZhI0zr4c+/gl5FBgC7AMrk3BJoZJRZ9KmOSHWnORAoYvbZ+zDAm
	wLbX5tohkO1YKz+z0qGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWFl-00000000QEU-3U9u;
	Mon, 10 Feb 2025 16:03:21 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWAT-00000000OxG-1AOY
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 15:57:55 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DD2F7240103
	for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2025 16:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739203069; bh=lQ9xjXE4fQ5E3R9uQe1RdCFTA3rQo7TSFCMdjBUTzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=XJ32rxft95edBr+EDeVQZGHUeecj5jwxAYiaY0fmQiw2umt38i4PSHy9Xqg3hFJiG
	 /zwvz+V5oKOw72WAw2xrq8hAP8wB+Yc79C5RKXPI+nT84dGnO8FJJe6BgjV+2KCv1K
	 1a/Sv9v6+tUMPu1OxatgL5s/rO/RkvTTXucwVQkuLC0FQKgeXGmOlzDLtEJL/rvaCK
	 3aSKa8WrXTNh5x1YiXZFYpqIAEdpStyegfE2z3NDSW+zSkvotggBkO6XagnhOYe+Gy
	 f22mnkpYg4Jfa392j6ToQbc6mTrz2xOh4/2lLIwaI1sSOLm6xfkPKEKVOGeJI1JRD3
	 asuBpZK0jhXeA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ys8Nl2HW4z9rxD;
	Mon, 10 Feb 2025 16:57:42 +0100 (CET)
Date: Mon, 10 Feb 2025 15:57:42 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Mark Brown <broonie@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z6oh9t2QQzz17Yt6@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
 <Z6a_f03Ct9aB7Bbn@probook>
 <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_075753_612099_B5BA7E70 
X-CRM114-Status: GOOD (  16.37  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTI6NTk6MzVQTSArMDAwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBTYXQsIEZlYiAwOCwgMjAyNSBhdCAwMjoyMDo0N0FNICswMDAwLCBKLiBOZXVzY2jD
pGZlciB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDA3LCAyMDI1IGF0IDA5OjM4OjA1UE0gKzAwMDAs
IE1hcmsgQnJvd24gd3JvdGU6Cj4gCj4gPiA+IFdoYXQncyB0aGUgc3Rvcnkgd2l0aCBkZXBlbmRl
bmNpZXMgaGVyZSAtIHdoeSBpcyBhbGwgdGhpcyBzdHVmZiBpbiBvbmUKPiA+ID4gc2VyaWVzPwo+
IAo+ID4gVGhlIHBhdGNoZXMgYXJlIGluZGVwZW5kZW50IG9mIGVhY2ggb3RoZXIsIGV4Y2VwdCBm
b3IgdGhlIGZvdXIgZWxiYy9uYW5kCj4gPiBwYXRjaGVzLiBUaGV5IGFyZSBpbiB0aGUgc2FtZSBz
ZXJpZXMgYmVjYXVzZSB0aGV5IGNhbWUgdXAgZHVyaW5nIHRoZQo+ID4gc2FtZSBwcm9qZWN0IGFu
ZCBhY2hpZXZlIHNpbWlsYXIgZ29hbHMsIGJ1dCBpdCBpc24ndCBuZWNlc3NhcnkuCj4gCj4gUGxl
YXNlIGRvbid0IGRvIHRoaXMsIGl0IGp1c3QgbWFrZXMgaXQgaGFyZGVyIHRvIG1lcmdlIHRoaW5n
cyBzaW5jZSBpdAo+IG1ha2VzIGl0IGxvb2sgbGlrZSB0aGVyZSdzIGNyb3NzIHRyZWUgbWVyZ2Vz
IG5lZWRlZCB3aGVuIHRoYXQncyBub3QgdGhlCj4gY2FzZSwgY29tcGxpY2F0aW5nIG1lcmdpbmcs
IGFuZCBwdXRzIHRoZSBlbnRpcmUgc2VyaWVzIGluIGV2ZXJ5b25lJ3MKPiBpbmJveCB3aGljaCBt
YWtlcyB0aGluZ3MgbW9yZSBub2lzeS4KCkhvdyBzaG91bGQgSSBwcm9jZWVkIHdpdGggdGhpcyBz
ZXJpZXMsIGluIHlvdXIgb3Bpbmlvbj8KSSBzZWUgcG90ZW50aWFsIGFkdmFudGFnZXMgKGxlc3Mg
b2YgdGhlIGlzc3VlcyB5b3UgZGVzY3JpYmUpIGFuZApkaXNhZHZhbnRhZ2VzIChzb21ld2hhdCBo
YXJkZXIgdG8gdHJhY2sgcGF0Y2hlcykgb2Ygc3BsaXR0aW5nIGl0IHVwCmJlZm9yZSBzZW5kaW5n
IHYzLgoKKE91dHNpZGUgb2YgdGhpcyBzZXJpZXMsIHRoZSBjb25jbHVzaW9uIGlzIGNsZWFyIGFu
ZCBzaW1wbGUpCgoKSi4gTmV1c2Now6RmZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
