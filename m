Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2090C4167B
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Nov 2023 21:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeOq8kkzlnIa7aAn9qxn38kbi97NHHE3GUV+vt9j3u8=; b=aQVO1glKszS+Wr
	fYdUKz+s7PCB+js1vZ/1+yUNwf6rsCAAONHEFcbO6bIf2/q0S9AnhuarUK2YlCWm6G52vAUkVvA5p
	TJIu+MwZ3vWzp0t6WPwKyphJuky3A6ykdH5rWV0uOpA0AHiYhMqnYoRgrCPKMJdgDLWfYO/A3Ebey
	O3XcuT/v0soBpsJ4yGykkycFe3zknJrtaF8KyA/7XHLjy/n+JEYiYGUyp+2AO3oUxvAxixsROIsLL
	Q7jUdvce2ojxG+z4MTV1v+nHPInZKIp1sDKJ/Qh58xKoK+ufjn48Y03SaSRqT7L29k10Mg8kCBwiA
	lE4PHN6GHtnGMfGxzGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7N44-00FmKv-1l;
	Sun, 26 Nov 2023 21:53:20 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7N3z-00FmIA-2I
	for linux-mtd@lists.infradead.org;
	Sun, 26 Nov 2023 21:53:16 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c878e228b4so43829901fa.1
        for <linux-mtd@lists.infradead.org>; Sun, 26 Nov 2023 13:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701035593; x=1701640393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0zOW5OQKZeaAX0jplglyj1IglGDipFAYaQyemNP+wI=;
        b=GWZAtvKF4k3vithecU6P8VeVWbJqkaYINmv59OcSNU5GXZ9oaI2juj4ZgQAu8ahhd0
         jwHRfNNeo0SIzmk5Mlz5dkNeBJ0ZVG1lDpi/Mjn66OnqcsQGMyDjRikLDH8cIGk8Bxk7
         b9D+AA5ljugNi9yQi4KtQ5AvXLD+2CFV7aQrx23lVxP8x7bCfrgDiGl3tBx62gy/6nVm
         laha0ZIE+4ycsVsKIG5d5ICZGaQU8RKMDkCCWWBbdHScCrtPqQBp9uCZrzDkrgZVebGW
         +155SVXiZRE0qpQ9bQtOgw0YbnGxk+WVE9EsP3Y3U8MDmHU7LdOkvgC8fLBYbwcO1fYd
         bSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701035593; x=1701640393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0zOW5OQKZeaAX0jplglyj1IglGDipFAYaQyemNP+wI=;
        b=nJgGHLrP96KiW2zgX/O2VCyBM7iyZDC6Alwul/RZYLznXVkNijt1mzprh4ozKq24mL
         ODkFEBuwnVDl5l7bJ26QeGSdiNhNKCqrWXgapewuUVOvk7cdXSMQzQcZxb6BFDLr7o2T
         u83UY2Pdv3qHjQfPm/PuOizZkw1ljDTBGLDJAPgjbnH61WlRmrs/dFahkNEOiQYfM4tw
         mPyLHImuo1MX8kW3Vn0y/e9CNUYLGG3+0o+AtTRb8CVwXGR0N/AnHoFvds5287uM8lXj
         Ntt8cHVahsJvSgvvT4phpi6IfMabyEA+Ald1X07Poq7EziXjKGbhLsrZN1sGIL1E8DMA
         N5sw==
X-Gm-Message-State: AOJu0Yz2EX5QVXmFPHKWx9mp868beyRa1VePY4I3Uqm8z2MB3kKbUo05
	/HqsiOYt7DhCnybP9DSLMv3SptDiVh11W18z0aw=
X-Google-Smtp-Source: AGHT+IFuOT2A01/5XCjA/yWMYmAwsrLlX4hvZkjVEIBfr3tnPjIdIDHT1p15hxFk1/am1ZPm7LgrTg/1eoC9CN3NBjc=
X-Received: by 2002:a05:6512:310a:b0:509:47ba:3160 with SMTP id
 n10-20020a056512310a00b0050947ba3160mr5979553lfb.56.1701035593163; Sun, 26
 Nov 2023 13:53:13 -0800 (PST)
MIME-Version: 1.0
References: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
 <CAPWNY8UFFH_O-R=mZCjkFiOTjqR0u=JC-2SAVj=vR4chDbR2ZQ@mail.gmail.com>
In-Reply-To: <CAPWNY8UFFH_O-R=mZCjkFiOTjqR0u=JC-2SAVj=vR4chDbR2ZQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 26 Nov 2023 22:53:00 +0100
Message-ID: <CAFLxGvwyVPNpz7nPqVNi9jzVHkXjnmAW6viG3dH-wCMDApaawQ@mail.gmail.com>
Subject: Re: [systemd-devel] How to properly wait for udev?
To: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Cc: systemd-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_135315_774179_AA87874E 
X-CRM114-Status: UNSURE (   7.91  )
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

T24gU3VuLCBOb3YgMjYsIDIwMjMgYXQgMTA6MzbigK9QTSBNYW50YXMgTWlrdWzEl25hcyA8Z3Jh
d2l0eUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHVkZXYg
KHJlY2VudCB2ZXJzaW9ucykgdGFrZXMgYSBCU0QgbG9jayB1c2luZyBmbG9jaygyKSB3aGlsZSBw
cm9jZXNzaW5nIHRoZSBkZXZpY2UsIGFuZCB0b29scyBhcmUgc3VwcG9zZWQgdG8gZG8gdGhlIHNh
bWUuIFRoZSBmbG9jaygpIGNhbGwgY2FuIGJlIHNldCB0byB3YWl0IHVudGlsIHRoZSBsb2NrIGNh
biBiZSB0YWtlbi4KCkhtbSwgaW5kZWVkLiBCdXQgaXQgc2VlbXMgdG8gZG8gc28gb25seSBmb3Ig
YmxvY2sgZGV2aWNlcy4KVGhpcyBleHBsYWluIGFsc28gd2h5IG5vbmUgb2YgbXkgc3lzY2FsbCB0
cmFjaW5nIHNob3dlZCBmbG9jaygpIGNhbGxzIHNvIGZhci4KVUJJIHZvbHVtZXMgYXJlIGNoYXJh
Y3RlciBkZXZpY2VzLgoKLS0KVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
