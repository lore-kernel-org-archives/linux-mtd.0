Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D68CCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HpPElnqEeowbNJM6Typ1SSZtKzdSgpMzbDO7IqF8Pk=; b=O7dLRLzzb6jWGk
	1iik5sFNnd8OqUIS5jo2vNj9R96jqwJ8S+gsY4+i04jbGzEb3DOnuqL4IqJp8iQuTaUeqYfNFGnOj
	zC9iAL1LzuPByJ/HG/NneTQkL6lzrsDRJuj0IGQtT4uqJuMVwt3ojJW0TB5c6ErR2md3ICuWoRVXB
	78nRgczhsnCi2N0d+QKSbSdesq0ws/iOo4dCgmv7MZCd4p2DzTr7BIjwW2hC+YP02AxhHlGmYZ9av
	2IhmPniw4nvDRVfcj7fdmv0uERrV+BtlM35Utiwpjuo6xO/+V1KtYGwI827SuzFRsbpZ+vyuWnAq+
	B6am7EiLyPY+HrgB0DOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlt5-0000000GDi3-0DqY;
	Tue, 28 Oct 2025 15:45:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlt1-0000000GDgI-3gjl
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:45:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso9133005e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666326; x=1762271126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
        b=MXC2XIe3mQmshp14iVRdYFSu5EUq3/q+8PEHL7CSzoHa5zP+6lHybkycD19jQsEK25
         fXbgCgTLRf1Lz13qZbvF70QwpPu3aY/Kn9GCc7vzuSRMVyCRmG3s/pL+iQ1ypFNzDlbt
         +A/I40ftd4Zbt1sLhFYonrk8VWM628tLLCh5NNnOj2trunDcIu78HMBv/aDLM0T6TJ4F
         636pxR8TVYBlDOX13RBSp0yU/dE4Ga/5S189A7g7FDNr90r7pjfxzm2dv6YZtpO9Fxpm
         Y+ugyxztQQA7OnZY6javzZEJ1PfjRA3JbQ0cekG+ybOxm1ceAnIQRQkene3uKFFRTiLf
         JX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666326; x=1762271126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
        b=i3QPLPGkit/iGSTrJQZtWZ54pMLhd9SOyzGf8JQm7p9DffBRI5sfT+tcL7iiuphAV0
         +Ef3oDx3QEFLb1lZNiBbYYKvfXk2lbPgzY2oblyotZ013aYzqABVQZvwBxfHDTG5Ne4t
         SRA0kqFCkVYTlfoOVuHX9HcHI9nzllJ55spgda25axjuCe2bCLfzCAslC7xKMS8BmY2U
         QOT7j9ai66s2n7+67Xhyfs7CiKbjpJWDLTmOm5KkotPEwLkz+EJG813JzHp1s7zW0IWr
         ZmewVGEtD7nKjpzshTSVMPWzIKD6LVXkmTFuXsLWB8Lz0+KNTHnsVoKiRr5W5p8y2bnZ
         Ie9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgk1sfWT+K4Hn5vUrmMVMVWpU59KJ7aMRIYCEgi4mkiCStTV2QMjvCbtGKmqKw1OlidmhDtIwv4mI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLdsWOo9bcToJlRRAKjYVB6Ek31vq3ebTLauSCTWsl1wu3anuQ
	s77wTRpZjb9X9ko/nxaDEQLmOZynYNx12pnBY94pL2voe/reSw97yK3x
X-Gm-Gg: ASbGncuQsTdZjxHzI9eL+t+xsJ6kTQoNpHPug6Wxh8uCyqBQwe75DlTwZz8tcDnvyHd
	7dQeD3Smq1LNIsDo+26xL0ASS9lBqfOD8OGMx09J5sutFhp1Bsxe3so96Wp3ghzaLx795OTIWkw
	XyaozpaLUK0CDdrwmVWfuCrm8AvlLeFq1Wmydx7qN8CZoVmMwtwrWPx+PiwlD+/gP5ZQYz4hMWS
	r6AU27pcBovAbVXG78mRnhyHYT16xRJlxXQIesKnnMPeSlVeQ5XhJMZj9d+kaFisabMejhe4rtL
	U/R6PWL9uJFlK+j76lVhn7/qJTlxsFpWy6H3NWDoBlGsreF6x5/nLmzaom3kfreRiq0vtaizJPa
	+0GcNsvZi06XiZ16F8YueNDCG0AvjKHo7xjDmFFt3wJSBQ1P5QsRz3IFXWSj+UbSwj39T7ONvSH
	40oJ8etUGM4oMetoOQRR2JdN0ApNoQmlZ2+29BK6Gm9UIn9WwLrXw6jKGOaw==
X-Google-Smtp-Source: AGHT+IET/efRhuIuFB2PFKn8DXpNlkISko3LPS6KKpyQ63Wdmub6V/UZ/rCEDYkQXXUtyr4tnbPxTA==
X-Received: by 2002:a05:600d:8386:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-477182e1357mr23793205e9.19.1761666326096;
        Tue, 28 Oct 2025 08:45:26 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df62dsm22927131f8f.45.2025.10.28.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:45:25 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v4 12/16] mtd: rawnand: sunxi: introduce reg_spare_area in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:45:24 +0100
Message-ID: <24133952.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20251028073534.526992-13-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-13-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084527_928716_73B0959A 
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM1OjA1IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYvSDYx
NiBzcGFyZSBhcmVhIHJlZ2lzdGVyIGlzIG5vdCBhdCB0aGUgc2FtZSBvZmZzZXQgYXMgdGhlCj4g
QTEwL0EyMyBvbmUsIHNvIG1vdmUgaXRzIG9mZnNldCBpbnRvIHN1bnhpX25mY19jYXBzLgo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3Vk
IDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJl
YyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
