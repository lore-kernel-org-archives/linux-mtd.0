Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE4C0218F
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JH3iX/E+63LtSuZiCiS5yA3MXactRHkTafOZnO+7I/g=; b=3t8xhuejt3shjk
	RarljBCNyWxsDDMFzD+pOI3qWHgHCVH1jp47SjLRD7nsj35d7REg1i1+bL0tYI1xOJgU8q0FvvtX5
	8Re2dvrPBndZ31yL9u1LwGihY7/LQEIaBzlNtGrs5Xj4Puap2Fg/j8QWPR9QWI3UkJlEtH0iYWH/e
	+B7Q89wIs5jwOAmvleyHV7hxLUfX83ERxUViC9okwMwDNR1mapTRV7Wct8Dv3X0YvpVqkZ29UMfOc
	IG3OfLZJHQexfnoBiphxKZOwomzmXUf6omAjGsxaRgzqpIpEBOmhpUOK5A+JPfdgJcWmuUASixeBh
	HQm38osBQLnYa0gM/xyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdq3M-0000000Aara-1J0S;
	Fri, 31 Jan 2025 12:23:20 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdq3J-0000000AarB-43PH
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 12:23:19 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id AE403240101
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 13:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738326193; bh=2qfaRTO5iG5mOYJ+RvO6+d2r0hfl5IUM+PXTysg9LQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=FsS9KPX3k9YpNJzPDrCitVL7pEQscFI1jh9lobTa3Zb6etDLtErtKy4x4VQD3caIZ
	 lVy3QSMJhZIsPr0Ef77KnJE7XnxmqZcnEydj0ytqGOPyLtFqg3Wus0QyjXZuIONKlO
	 kBA7nltro0sEpF6tSMpDEj3rUexXBoDkVZCpEf3gmnKKbA1VGN3nr1rfh2C1URv/am
	 MfbTqYgijwBeO3QZDy0wuM3OYOS7v2e4/gMGjpooQzerAqzXqIoDmG0bhxXopkpXxX
	 SiV5SwJhoBkXtt0ewcxJJbi0DYQ1GdvFBDKsnHx7aT5/Mffw+/s2Y1lKtPxv27Aquy
	 d88uSSCOnzmWA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ykw5h1ywDz6typ;
	Fri, 31 Jan 2025 13:23:03 +0100 (CET)
Date: Fri, 31 Jan 2025 12:23:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
Message-ID: <Z5zAp3X7U0oftneH@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
 <a9df1ae6-8779-4dc0-8f03-eda939c0e533@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9df1ae6-8779-4dc0-8f03-eda939c0e533@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_042318_293070_B776D816 
X-CRM114-Status: GOOD (  17.22  )
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

T24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMDg6MjI6NTVBTSArMDkwMCwgRGFtaWVuIExlIE1vYWwg
d3JvdGU6Cj4gT24gMS8yNy8yNSAwMzo1OCwgSi4gTmV1c2Now6RmZXIgdmlhIEI0IFJlbGF5IHdy
b3RlOgo+ID4gRnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0Pgo+ID4gCj4g
PiBDb252ZXJ0IHRoZSBGcmVlc2NhbGUgUG93ZXJRVUlDQyBTQVRBIGNvbnRyb2xsZXIgYmluZGlu
ZyBmcm9tIHRleHQgZm9ybQo+ID4gdG8gWUFNTC4gVGhlIGxpc3Qgb2YgY29tcGF0aWJsZSBzdHJp
bmdzIHJlZmxlY3RzIGN1cnJlbnQgdXNhZ2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5l
dXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9hdGEvZnNsLHBxLXNhdGEueWFtbCAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysr
KysrKysKWy4uLl0KPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgU0FUQSBub2RlcyBhcmUgZGVm
aW5lZCB0byBkZXNjcmliZSBvbi1jaGlwIFNlcmlhbCBBVEEgY29udHJvbGxlcnMuCj4gPiArICBF
YWNoIFNBVEEgcG9ydCBzaG91bGQgaGF2ZSBpdHMgb3duIG5vZGUuCj4gCj4gVmVyeSB1bmNsZWFy
LiBUaGUgU0FUQSBub2RlcyBkZWZpbmUgcG9ydHMgb3IgY29udHJvbGxlcnMgPyBOb3JtYWxseSwg
YSBzaW5nbGUKPiBjb250cm9sbGVyIGNhbiBoYXZlIG11bHRpcGxlIHBvcnRzLCBzbyB0aGUgZGlz
dGluY3Rpb24gaXMgaW1wb3J0YW50LgoKSSdsbCBjaGFuZ2UgaXQgdG8gIkVhY2ggU0FUQSBjb250
cm9sbGVyIC4uLiIsIHNlZSBiZWxvdy4KCgo+ID4gKyAgY2VsbC1pbmRleDoKPiA+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGVudW06
IFsxLCAyLCAzLCA0XQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIDEgZm9yIGNv
bnRyb2xsZXIgQCAweDE4MDAwCj4gPiArICAgICAgMiBmb3IgY29udHJvbGxlciBAIDB4MTkwMDAK
PiA+ICsgICAgICAzIGZvciBjb250cm9sbGVyIEAgMHgxYTAwMAo+ID4gKyAgICAgIDQgZm9yIGNv
bnRyb2xsZXIgQCAweDFiMDAwCj4gCj4gQXJlIHlvdSBzdXJlIHRoZXNlIGFyZSBkaWZmZXJlbnQg
Y29udHJvbGxlcnMgPyBBcmUgdGhleSBub3QgZGlmZmVyZW50IHBvcnRzIG9mCj4gdGhlIHNhbWUg
Y29udHJvbGxlciA/IEdpdmVuIHRoYXQgdGhlIHByZXZpb3VzIHRleHQgZGVzY3JpcHRpb24gZGVm
aW5lIHRoaXMgYXMKPiAiY29udHJvbGxlciBpbmRleCIsIEkgc3VzcGVjdCB0aGVzZSBhcmUgdGhl
IHBvcnQgb2Zmc2V0cyBhbmQgeW91IFNBVEEgbm9kZXMKPiBkZWZpbmUgcG9ydHMsIGFuZCBub3Qg
Y29udHJvbGxlcnMuCgpUaGV5IGhhdmUgbm8gc2hhcmVkIHJlZ2lzdGVycywgYW5kIGVhY2ggaW5z
dGFuY2UgaGFzIHRoZSBzYW1lIHJlZ2lzdGVyCnNldCAoYXQgYSBkaWZmZXJlbnQgYmFzZSBhZGRy
ZXNzKS4KClRoZSBNUEM4MzE1RSByZWZlcmVuY2UgbWFudWFsIChmb3IgZXhhbXBsZSkgZG9jdW1l
bnRzIHRoZW0gYXM6CgoJU0FUQSAxIENvbnRyb2xsZXLigJRCbG9jayBCYXNlIEFkZHJlc3MgMHgx
XzgwMDAKCVNBVEEgMiBDb250cm9sbGVy4oCUQmxvY2sgQmFzZSBBZGRyZXNzIDB4MV85MDAwCgoo
dGFibGUgQS4yNCBTZXJpYWwgQVRBIChTQVRBKSBDb250cm9sbGVyKQoKU2VjdGlvbiAxNS4yIENv
bW1hbmQgT3BlcmF0aW9uIGltcGxpZXMgdGhhdCBlYWNoIFNBVEEgY29udHJvbGxlcgpzdXBwb3J0
cyBhIHNpbmdsZSBwb3J0OgoKCVRoZSBTQVRBIGNvbnRyb2xsZXIgbWFpbnRhaW5zIGEgcXVldWUg
Y29uc2lzdGluZyBvZiB1cCB0byAxNgoJY29tbWFuZHMuIFRoZXNlIGNvbW1hbmRzIGNhbiBiZSBk
aXN0cmlidXRlZCB0byBhIHNpbmdsZSBhdHRhY2hlZAoJZGV2aWNlIG9yLCBpZiB0aGUgc3lzdGVt
IGNvbnRhaW5zIGEgcG9ydCBtdWx0aXBsaWVyLCBvdmVyIGVhY2gKCW9mIHRoZSBhdHRhY2hlZCBk
ZXZpY2VzLgoKU28sIGluIGNvbmNsdXNpb24sIEknbSBmYWlybHkgc3VyZSAiY29udHJvbGxlciIg
aXMgdGhlIHJpZ2h0IGRlc2NyaXB0aW9uLgoKCkJlc3QgcmVnYXJkcywKSi4gTmV1c2Now6RmZXIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
