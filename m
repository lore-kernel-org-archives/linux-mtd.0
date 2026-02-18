Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9914FE9A03B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOGAxotyEU/2hF8X9pNLb5uvzChNC19OfIGAEaieoHw=; b=JSzT0WyVL5BGJ2
	qtahNvxQnxdrEHJTiZlt0UlgZBNpuv56qi0u6onaMdavuwKqWwvZ3AY29pvP8bnzDXR8VHmhPAXeV
	0Jyjj0cJLaUKNbZGjq8UucsvH6ygCog908V6hhq/9tupcuIu+QdfY/cUzzL2y25Rd3uKm8hszVv3Y
	VWRH7UjbtphBxIvCbwbmsFNzqLBROThCLAAntvHMIXRkU49d1QPry5dlJX9kYwuPiwIFkK+Zar7v1
	JGHylJSYT54JrZngr5wjMA4ZDG6j3rU6n6blQiPl2CsPMVYm5t3Thqob0glqIOmoSp0Wej9jk8FJk
	OtfNEjY+p3ODlwRUFjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsddn-00000009WF0-0cFo;
	Wed, 18 Feb 2026 09:14:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsddj-00000009WEY-3gJe
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 09:14:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D6881A108E;
	Wed, 18 Feb 2026 09:14:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 537B260738;
	Wed, 18 Feb 2026 09:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A856110368B44;
	Wed, 18 Feb 2026 10:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771406069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X4+s3Q6UCtp2HDj0Hlb7GVrkopt06aIm2XkozAacpX8=;
	b=mUQJLgq238PSSE0suF/RrKVT7FEiKJVCvjaxMI/FIj4R9ITbwxz3l1I+MNdJpRmP3ylEwf
	nh3OkULOxe5TVRLTLokA7MqSvPN8ZHkgx+rFoOf7OSyMute/srvsLLmwq5rMDNYOAGYBGV
	IOtkPUIVY7PHIhU3o0Iws32XnVPafZW9Q5c3uyxUgRFF23/cVPVEEsOqdW84BNKUMZvDEP
	BNzXnigUC4/tyBQKSsjcy+9fc4rMgMGqHjJ6NHfnTCpUDfrFzNwLUKmh6KqUuVpmuT+mBH
	YviOPBouWl5NFFp3opRukmSI5ksh+AMQAD+CrvQ5YsCCHHY5v9f5TVLnGQPufw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  mwalle@kernel.org,  takahiro.kuwano@infineon.com,
  richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MAINTAINERS: SPI NOR: maintainer and reviewer updates
In-Reply-To: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
	(Tudor Ambarus's message of "Fri, 13 Feb 2026 17:02:32 +0000")
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 18 Feb 2026 10:14:25 +0100
Message-ID: <87h5rev2fi.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_011436_406488_8FEE8855 
X-CRM114-Status: GOOD (  12.17  )
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

SGVsbG8sCgpPbiAxMy8wMi8yMDI2IGF0IDE3OjAyOjMyIEdNVCwgVHVkb3IgQW1iYXJ1cyA8dHVk
b3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gSGkgYWxsLAo+Cj4gVGhpcyBzZXJpZXMg
dXBkYXRlcyB0aGUgTUFJTlRBSU5FUlMgZmlsZSBmb3IgdGhlIFNQSSBOT1Igc3Vic3lzdGVtLgo+
Cj4gRmlyc3QsIEkgYW0gc3RlcHBpbmcgZG93biBhcyBhIG1haW50YWluZXIgZm9yIHRoZSBzdWJz
eXN0ZW0uIE15IGN1cnJlbnQKPiBwcmlvcml0aWVzIGhhdmUgc2hpZnRlZCwgYW5kIEkgd2FudCB0
byBlbnN1cmUgdGhlIHN1YnN5c3RlbSBpcyBtYW5hZ2VkCj4gYnkgdGhvc2Ugd2hvIGNhbiBkZWRp
Y2F0ZSB0aGUgbmVjZXNzYXJ5IHRpbWUgdG8gaXQuIEl0IGhhcyBiZWVuIGEKPiBwbGVhc3VyZSB3
b3JraW5nIHdpdGggdGhlIGNvbW11bml0eSwgYW5kIEkgYW0gY29uZmlkZW50IGxlYXZpbmcgdGhl
Cj4gdHJlZSBpbiB0aGUgY2FwYWJsZSBoYW5kcyBvZiBQcmF0eXVzaCBhbmQgTWljaGFlbC4KPgo+
IFNlY29uZCwgdG8gYXNzaXN0IHdpdGggdGhlIHJldmlldyBsb2FkLCBJIGFtIHByb3Bvc2luZyB0
aGUgYWRkaXRpb24gb2YKPiBUYWthaGlybyBLdXdhbm8gYXMgYSBkZXNpZ25hdGVkIFJldmlld2Vy
LiBLdXdhbm8tc2FuIGhhcyBiZWVuIGEKPiBjb25zaXN0ZW50IGFuZCByZWxpYWJsZSBjb250cmli
dXRvciB0byB0aGUgc3Vic3lzdGVtLiBIaXMgZGVlcAo+IHRlY2huaWNhbCB1bmRlcnN0YW5kaW5n
IGFuZCBhY3RpdmUgcGFydGljaXBhdGlvbiBtYWtlIGhpbSBhbiBleGNlbGxlbnQKPiBjaG9pY2Ug
dG8gaGVscCBmYWNpbGl0YXRlIHBhdGNoIHByb2Nlc3NpbmcgbW92aW5nIGZvcndhcmQuCj4KPiBU
aGFua3MgZm9yIHRoZSBjb2xsYWJvcmF0aW9uLgo+Cj4gdGEKPgo+IFNpZ25lZC1vZmYtYnk6IFR1
ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KClRoYW5rIHlvdSBUdWRvciBm
b3IgeW91ciBoZWxwIGFuZCByZXZpZXdzLCBpdCB3YXMgYSBwbGVhc3VyZSB0bwpjb2xsYWJvcmF0
ZSB3aXRoIHlvdSwgSSBob3BlIHdlJ2xsIG1lZXQgYWdhaW4gaW4gdGhlIGZ1dHVyZS4KCkkgaGVy
ZWJ5IGFja25vd2xlZGdlIGJvdGggTUFJTlRBSU5FUlMgY2hhbmdlcywgd2VsY29tZSBLdXdhbm8t
c2FuISBJCndpbGwgcGljay11cCB0aGUgc2VyaWVzIG9uY2UgLXJjMSBpcyBvdXQgYW5kIHdpbGwg
c3F1ZWV6ZSBpdCBpbiBhIGZpeGVzClBSLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
