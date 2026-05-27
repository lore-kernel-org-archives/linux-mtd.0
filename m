Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1C9CD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOStggJcp+F8adZ4MOoVXcEWfy4HSeJmt38xbavJInM=; b=YKrH8ZLR2ir2IH
	rm+8fJVmFdOoyWGxORhl4kgFYcYI7sC7XvnfkkBpL/DZS+/rS9kNJxAWoL0m/fKYRIQ3B4JKrQipo
	BO8dhjoaYwURD1c7ezwazVyXiYZ0LwhPL0ckRj0TNDyb8d4lr8ug4hl+JdcGo/C+3LSMwE5B68TRO
	EDCcERDqp3I4gOffom9Grtf2lduY7LixLquOvo0FeI17LxYSQDlWAcZ9lrzPmcOtP8TORCILTzPj+
	mn2R7TpVDNLH0s0y/RZcdWZXHAVEkC8N84huRBbyt7QRVtJ3vui9WM4cY3DzOVKiMwKCI0qKuISzW
	AzqN3C3rbDOk+qBNTvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS963-00000003UtO-04EY;
	Wed, 27 May 2026 07:54:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS961-00000003Ut2-0JfZ
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 07:54:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5A60C2C65F;
	Wed, 27 May 2026 07:54:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18C5D601A1;
	Wed, 27 May 2026 07:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E85710888942;
	Wed, 27 May 2026 09:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CCnbIBach2b7ZY6IjHTu31zdg4aqc0EOJLy/8+XgcvQ=;
	b=VPIWEIh0sjpPUqOYdaRpqxskqNu0SooOSXIFx4pGTi1qMovcRTMmaBerYwGL1G5fDkmvbg
	TRZyPkVyg1wVotOa630qjGY4iI2yk2q8GrVOZQ5V5D0y35eo6o8LuJQTyr8DSuKmx0dkII
	cju7pr+Fx3QoiY/0FaMT+lDED0ta7X7TO88h1kcqyLy1yUDbvEaofmOQiXDN8MkgcTgA2v
	rL/FzzHn5KzjVlnOh49gyK6dNq5OzoL9Vlg8394N8GW7G8JLftajR4AGmbJ7Pu8QDBe01M
	Qnmz51goUmQC2PIsnUPZXnjjGA0bOavyw4gTjnGh/fWPRmX+pvWNcLbU6IeXJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v6 00/28] mtd: spi-nor: Enhance software protection
In-Reply-To: <2vxz8q964210.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 17:35:23 +0200")
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
	<2vxz8q964210.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:54:25 +0200
Message-ID: <87h5ntl232.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_005433_271848_E680BF7B 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Cj4gQXBwbGllZCB0byBzcGktbm9yL25leHQuIFRoaXMgc2hvdWxkIGdpdmUgdXMgYXJvdW5kIDMg
d2Vla3MgdG8gc29hayBpbgo+IGxpbnV4IG5leHQuCgpUaGF0J3MgZmluZS4gTW9zdCBvZiB0aGUg
YnVpbGQgcmVsYXRlZCBicmVha2FnZXMgd2lsbCB1c3VhbGx5IGJlCmRpc2NvdmVyZWQgd2l0aGlu
IG9uZSB3ZWVrLiBUZXN0aW5nIGZlZWRiYWNrIHdpbGwgYW55d2F5IGJlIG11Y2ggbG9uZ2VyCnRv
IGNvbWUuCgo+IEV4cGVjdCB0aGUgU1BJIE5PUiBQUiBhIGxpdHRsZSBiaXQgbGF0ZXIgdGhhbiB1
c3VhbCwgYXJvdW5kCj4gdGhlIHN0YXJ0IG9mIHRoZSBtZXJnZSB3aW5kb3cgc28gd2UgY2FuIG1h
eGltaXplIHRoZSBleHBvc3VyZSBvZiB0aGVzZQo+IHBhdGNoZXMuCgpJIHRyeSB0byBzZW5kIHRo
ZSBNVEQgUFIgYmV0d2VlbiBtaWQgYW5kIGVuZCBvZiB0aGUgZmlyc3Qgd2VlayBvZiB0aGUKbWVy
Z2Ugd2luZG93LCBnZXR0aW5nIHlvdXIgUFIgb24gdGhlIGZpcnN0IGRheXMgb2YgdGhlIG1lcmdl
IHdpbmRvdyBpcwpzdGlsbCBjb21wbGV0ZWx5IG9rYXkgc2luY2UgdGhlIGJyYW5jaGVzIGFyZSBh
bHJlYWR5IHB1bGxlZCBpbnRvCmxpbnV4LW5leHQuCgo+IEFwb2xvZ2llcyBvbmNlIGFnYWluIGZv
ciB0aGUgY3JhcHB5IGNvbnRyaWJ1dG9yIGV4cGVyaWVuY2UsIEkgdHJpZWQgdG8KPiBnZXQgdG8g
dGhpcyBzb29uZXIsIGJ1dCB3YXNuJ3QgbXVjaCBzdWNjZXNzZnVsIGF0IGl0IDotLwoKTm8gd29y
cmllcyA6LSkKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
