Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65CDCD342C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ3e0Yef+0PyUTdIQQAAc3zIjNnd4dyqeoYamdOqPDg=; b=VL63DG5HLqQVuR
	+rzIQ1X5IbsGe7QEIf/beIV+vg6UCw9fF4XQJRX8bfp7UojVtAZmJW5LxGXKMAfy7NgOnOznfo7t7
	zpTcr1ywWQ6GXoz76Gx6Gi4VNe5F4kd6NzWMpPvz1xNQSqK7SORgw2Po70LGjIkzJXOTc/rvFokl6
	Ag6OqdE6gPPafs70CslNHYF7PAuQWsTa952U9uLYEyNQ/lEhK6d62PuecrypQ8WEcE+eYN3luBYAf
	FWkXiF2fxGyLiHfzygdcMu+IvlJ5oRtmaMBdkHw5VbsV4/Fi9+tJqxxj0423oWMd6rgoX8N5SOY5D
	TrE1zOBrg0gyIHxpR3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKY4x-00000000GLM-247f;
	Wed, 06 May 2026 08:58:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKY4v-00000000GKt-3rEd
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 08:58:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C2D261A3550;
	Wed,  6 May 2026 08:57:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 952886053C;
	Wed,  6 May 2026 08:57:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12E47102F225A;
	Wed,  6 May 2026 10:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778057878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JlXk+xatlEthntP1Ub/7zc6zElbOfS0IevTloFk5T9U=;
	b=GOmeB9p+Zgol6RKfZq+3lJODiae8HJr1e7SJTAaKdNuz6vtrCeaHTOri3SC+D23e6AZm7T
	iouGhxkvZ4fGKHjAlKPW2jOaAFJZdPmRX4jjOZTtjtAGh7w01QVvUs+iQEsAWK8QM0fqps
	Oxy1uvzsElg1FBq4mGfBff4tybAjEr1ilNmQI5n3l9bpEk4nl+6bx8HeJ7KL8c9n30Mr4f
	ehFCJBvc45T/ZqyZJ0ZY/JfKNM92EVJCD28CGBANrPrHvn07RjXsYMsJiX4OTCrjTRNRqp
	BuzOw2f+Ymb4ZZwVZvmFo8COV1sEBT2b2VQL/U7/mbosRxRXcJpzlOrn3JeOFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Sean Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
In-Reply-To: <2vxzbjet266g.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	05 May 2026 18:05:11 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
	<2vxzbjet266g.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 10:57:55 +0200
Message-ID: <87tsskncdo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015802_101294_76B82C79 
X-CRM114-Status: GOOD (  13.90  )
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

SGkgUHJhdHl1c2gsCgpPbiAwNS8wNS8yMDI2IGF0IDE4OjA1OjExICswMiwgUHJhdHl1c2ggWWFk
YXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIEFwciAwMyAyMDI2LCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+Cj4+IFRoZXJlIGFyZSBtYW55IGhlbHBlcnMgYWxyZWFkeSB0
byBlaXRoZXIgcmVhZCBhbmQvb3Igd3JpdGUgU1IgYW5kL29yIENSLAo+PiBhcyB3ZWxsIGFzIHNv
bWV0aW1lcyBjaGVjayB0aGUgcmV0dXJuZWQgdmFsdWVzLiBJbiBvcmRlciB0byBiZSBhYmxlIHRv
Cj4+IHN3aXRjaCBmcm9tIGEgMSBieXRlIHN0YXR1cyByZWdpc3RlciB0byBhIDIgYnl0ZXMgc3Rh
dHVzIHJlZ2lzdGVyIHdoaWxlCj4+IGtlZXBpbmcgdGhlIHNhbWUgbGV2ZWwgb2YgdmVyaWZpY2F0
aW9uLCBsZXQncyBpbnRyb2R1Y2UgYSBuZXcgaGVscGVyCj4+IHRoYXQgd3JpdGVzIHRoZW0gYm90
aCAoYXRvbWljYWxseSkgYW5kIHRoZW4gcmVhZHMgdGhlbSBiYWNrIChzZXBhcmF0ZWQpCj4+IHRv
IGNvbXBhcmUgdGhlIHZhbHVlcy4KPj4KPj4gSW4gY2FzZSAyIGJ5dGVzIHJlZ2lzdGVycyBhcmUg
bm90IHN1cHBvcnRlZCwgd2Ugc3RpbGwgaGF2ZSB0aGUgdXN1YWwKPj4gZmFsbGJhY2sgYXZhaWxh
YmxlIGluIHRoZSBoZWxwZXIgYmVpbmcgZXhwb3J0ZWQgdG8gdGhlIHJlc3Qgb2YgdGhlIGNvcmUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+Cj4KPiBJJ20gY29uZnVzZWQuIERvZXNuJ3Qgc3BpX25vcl93cml0ZV8xNmJpdF9zcl9h
bmRfY2hlY2soKSBkbyB0aGUgc2FtZQo+IHRoaW5nPyBIb3cgYXJlIHRoZXNlIHR3byBkaWZmZXJl
bnQ/CgpUaGUgcHJvdG90eXBlIHNheXMgaXQgYWxsOgoKc3RhdGljIGludCBzcGlfbm9yX3dyaXRl
XzE2Yml0X3NyX2FuZF9jaGVjayhzdHJ1Y3Qgc3BpX25vciAqbm9yLCB1OCBzcjEpCgpJdCB3cml0
ZXMgc3IxLCBhbmQgeW91IGNhbiBnaXZlIG9ubHkgc3IxLiBCdXQgYmVjYXVzZSBpdCBpcyBhIDE2
Yml0CndyaXRlLCBpdCBhbHNvIHdyaXRlcyBjci9zcjIgb24gd2hpY2ggdGhlIGNhbGxlciBoYXMg
bm8gY29udHJvbC4gVGhpcwpoZWxwZXIgaXMgYWN0dWFsbHkgdmVyeSBjaGlwIHNwZWNpZmljLCBi
ZWNhdXNlIHRoYXQgaXMgb25lIHdheSBhbW9uZyB0aGUKZGlmZmVyZW50IFNGRFAgUUVSIGZpZWxk
IHBvc3NpYmlsaXRpZXMgdG8gd3JpdGUgdGhlIFFFIGJpdC4KCkdpdmluZyBtb3JlIGNvbnRyb2wg
dG8gdGhlIGNhbGxlciwgaW5jbHVkaW5nIHRoZSBwb3NpdGlvbiBvZiB0aGUgUUUgYml0CmFzIHdl
bGwgYXMgdGhlIHBvc3NpYmlsaXR5IHRvIHNldCBvdGhlciBiaXRzIGluIGNyL3NyMiBpcyB3aGF0
IGlzCmludGVuZGVkIGluIHRoaXMgaGVscGVyLiBUaGlzIGlzIGFuIGludGVybmFsIGhlbHBlciBi
dHcsIG9ubHkgdGhlIGNvcmUKdXNlcyBpdC4KCk5vdGU6IEkgd2lsbCBzZW5kIGEgdjUgd2l0aCBh
biB1cGRhdGUgb2YgdGhlIG5hbWluZyBjb252ZW50aW9uIGJlY2F1c2UKaXQgaXMgbm90IHN1cGVy
IHNhdGlzZnlpbmcuIEkgYWxyZWFkeSBoYXZlIHRoYXQgcGF0Y2gsIGFuZCBJIHdhcyB3YWl0aW5n
CmZvciB0aGlzIHNlcmllcyB0byBnZXQgaW4gZm9yIHNlbmRpbmcgdGhlIGZvbGxvdy11cCBpbXBy
b3ZlbWVudHMsIGJ1dCBpZgp3ZSBnbyBmb3IgYSBuZXcgaXRlcmF0aW9uIEkgY2FuIGluY2x1ZGUg
dGhlc2UgcGF0Y2hlcyBpbi4gVGhlcmUgd2lsbCBiZQphIGZpeCBvZiB0aGUgUUUgYml0IGhhbmRs
aW5nIGluIHRoZSBzd3AuYyBjb3JlIEkgYW0gdG91Y2hpbmcgYXMgd2VsbCAoSQpmb3Jnb3QgdG8g
aGFuZGxlIGEgY2FzZSkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
