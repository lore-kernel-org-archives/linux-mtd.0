Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA08C25B78
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkaTQmVUC6lGdPxvFXV2UG3+wGFpCecKB8oudgNPl24=; b=syCRIqiP4liWf9
	b38/auugjsnX+ngrEtVqgHno0KStmo2sHPdWPMPXYORdBr/JV2xfYeonLKTVK1NUUjQaCuXN8ht1S
	2MpVBr67uecQcffMAMT4SoGyUtCaGgiw0gg36wXHI7yfmJX5jLuw8hYNqi4zMHxpIhwDQcODl6Zu4
	Vo8CY4ZAbrR43x/aaDoe7NmOOsFFMxFDnLbtk+S24Z/aoQVSlJrlmuoIMqTTpwHkxMRGh9lVr/92y
	uRNeYMVn7kI1WRrtZWmqEurVEqPPyAk59MwBZCgO7RbgEqb0D+2XlvRFko8aSgma6EcyuyVxhJTVH
	sk/Yx6ds6hhtNLg1NmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBx6j-00000000rGG-3JBP;
	Tue, 28 May 2024 13:43:17 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBx6d-00000000rFH-1WE8
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 13:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vrlJg+gvxce4qVnPpoGhK+rjv8ov8o6eVLj/sB5TAi0=; b=bK0TBYfG69Gq6mE4Z1ATMxRxh5
	cD1jn5Ebio45blOl+cszvxPDr8Mr0I1fYUM3T942NiVkYED/yNwm0/0NpAgih4y/fOAURV+/Ze0ly
	kp6r6zMtOWZbovRQVdAiYU/44dk0suMbg4gzamSTaeajiuAlRF04iGOq6q4dAJzgh4Ed8jaxY8fuw
	OFp8Lk+6xZ0dSqututm9mXSOE8YR5iPDaLNoIwpOiciYpzSca6cN2R6QcK72hGXv/dTfk8rMQswhn
	Lq5Q1d0J8mDmK6GtAJ/fj20GvfI1HMTT0kWqHjr9JERhhFOx2npeUMmsiB8dpTQ7fw69sN8zxX4Go
	OyPktYHQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBx6b-0003Op-4c; Tue, 28 May 2024 15:43:09 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBx6a-000KRY-1q;
	Tue, 28 May 2024 15:43:08 +0200
From: Esben Haabendal <esben@geanix.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  "Aneesh Kumar
 K.V" <aneesh.kumar@kernel.org>,  "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <56f19120-7ddb-4006-99f6-e1b043ed88e1@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 28 May 2024 15:32:12 +0200")
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
	<20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
	<eb911c50-2f66-43dd-a1ff-398a3e7c56a2@csgroup.eu>
	<56f19120-7ddb-4006-99f6-e1b043ed88e1@kernel.org>
Date: Tue, 28 May 2024 15:43:07 +0200
Message-ID: <87jzjevyqc.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_064311_426965_9B143C7B 
X-CRM114-Status: GOOD (  10.95  )
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

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIDI4LzA1
LzIwMjQgMTU6MTUsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+IExlIDI4LzA1LzIwMjQgw6Ag
MTQ6MjgsIEVzYmVuIEhhYWJlbmRhbCBhIMOpY3JpdMKgOgo+Pj4gW1ZvdXMgbmUgcmVjZXZleiBw
YXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgZXNiZW5AZ2Vhbml4LmNvbS4gRMOpY291dnJleiBw
b3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0KPj4+Cj4+PiBXaGlsZSB1c2Ugb2YgZnNsX2lmYyBkcml2ZXIg
d2l0aCBOQU5EIGZsYXNoIGlzIGZpbmUsIGFzIHRoZSBmc2xfaWZjX25hbmQKPj4+IGRyaXZlciBz
ZWxlY3RzIEZTTF9JRkMgYXV0b21hdGljYWxseSwgd2UgbmVlZCB0aGUgQ09ORklHX0ZTTF9JRkMg
b3B0aW9uIHRvCj4+PiBiZSBzZWxlY3RhYmxlIGZvciBwbGF0Zm9ybXMgdXNpbmcgZnNsX2lmYyB3
aXRoIE5PUiBmbGFzaC4KPj4gCj4+IEkgZG9uJ3QgdW5kZXJzdGFuZC4KPj4gCj4+IFNoYWxsIEkg
dW5kZXJzdGFuZCA6Cj4+IAo+PiBXaGlsZSB1c2Ugb2YgZnNsX2lmYyBkcml2ZXIgd2l0aCBOQU5E
IGZsYXNoIGlzIGZpbmUgYXMgdGhlIGZzbF9pZmNfbmFuZCAKPj4gZHJpdmVyIHNlbGVjdHMgRlNM
X0lGQyBhdXRvbWF0aWNhbGx5LCAuLi4uCj4+IAo+PiBvcgo+PiAKPj4gLi4uLCBhcyB0aGUgZnNs
X2lmY19uYW5kIGRyaXZlciBzZWxlY3RzIEZTTF9JRkMgYXV0b21hdGljYWxseSB3ZSBuZWVkIAo+
PiB0aGUgQ09ORklHX0ZTTF9JRkMgb3B0aW9uIHRvIGJlIHNlbGVjdGFibGUgZm9yIHBsYXRmb3Jt
cyB1c2luZyBmc2xfaWZjIAo+PiB3aXRoIE5PUiBmbGFzaAo+PiAKPj4gCj4+IAo+PiBJJ20gZmlu
ZSB3aXRoIHRoZSBmYWN0IHRoYXQgeW91IHdhbnQgdG8gYmUgYWJsZSB0byBzZWxlY3QgaXQgd2hl
biB5b3UgCj4+IHVzZSBOT1IgZmxhc2hlcywgCj4KPiBCdXQgdXNlcnMgYXJlIG5vdCBmaW5lLi4u
IHRoZWlyIG1lbW9yeSB3b24ndCB3b3JrIGlmIHRoZXkgY2Fubm90IGNob29zZQo+IGl0IChpZiB5
b3UgbWVhbnQgc2VsZWN0PWNob29zZSkuCgpFeGFjdGx5LiBUaGUgSUZDIGNvbnRyb2xsZXIgc3Vw
cG9ydHMgYm90aCBOQU5EIGFuZCBOT1IgZmxhc2hlcy4gU2luY2UKY29tbWl0IGVhMGMwYWQ2YjZl
YiAoIm1lbW9yeTogRW5hYmxlIGNvbXBpbGUgdGVzdGluZyBmb3IgbW9zdCBvZiB0aGUgZHJpdmVy
cyIpLAppdCBoYXMgbm90IGJlZW4gcG9zc2libGUgdG8gdXNlIElGQyBjb250cm9sbGVyIGZvciBO
T1IgZmxhc2hlcyB3aXRob3V0CnNlbGVjdGluZyB0aGUgSUZDIE5BTkQgZHJpdmVyIChDT05GSUdf
TVREX05BTkRfRlNMX0lGQyksIHdoaWNoIGlzCm9idmlvdXNseSBub3QgaG93IGl0IGlzIHN1cHBv
c2VkIHRvIGJlLgoKL0VzYmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
