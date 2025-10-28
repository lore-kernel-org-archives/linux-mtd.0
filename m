Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B13DCCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOEWm6CC/wQ3yOoyrHgZuvRLaygoTtnD5WGfqyWH6xM=; b=AnoZ6CBnIZlb68
	icS/R0LGGDonDDDySfVgL53Y9WTvLpgm8+dnr1zsyXOwjtLD7a3L0kKlbfOzwb6EjqFG3TLuBvyl4
	5IemXzAf6KLJNfiD2y0ir0iW+OfDfuYJuvBXLtTK/QYyBHL6C8yxk/cOybK2bh3r50/h+aJ9Yn5/S
	tsYWAWv09UMLxPKU1QRrpbw9Yh0Y0/69diORIyLhYBJLlUGxDfCNevHOWLWusDwtEeRll4nDAPmC8
	0lQGkEMeIYZfr/2hTkB5JOWAXu+FfRuwspxO7Rg29aJpXjvQ8gNW598b6O+7prk4dR8rZybLqqv/I
	hN2YctIzmCPp9DXRDaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlrD-0000000GDDh-1iuj;
	Tue, 28 Oct 2025 15:43:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlrA-0000000GDC7-3iwZ
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:43:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so23843575e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666211; x=1762271011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
        b=VDb/eHi6e4I9rHrt4VhOcBleWi8LsQSPQ5xo9D4x3u2WajNRlKy1OqAkYUqMIpzYHK
         R299KG7vZwEwGECnFK/xs3XuUl9YV57+8y0PPfiskVmEt7Uz1EiycpRxD8ijkTZvVgVB
         az4rAaTthM/BOzlbXs8cTifpavaL1k6PYPXrgjRd4Hg37vsmuHjCacqT34xJe6+9ZiKw
         wVttnDTKcDMchR2VywEVnbHOZ/lmprmkaacjSJjaNlKx41hq4rNAUVQ1/fqh3TaeQLt5
         r+VzMw+vLiRVU19yvuY3XHk6dlIRWWdHfb+yqVfhZmWoh1UpFUkn2Nc+aImnvPHLq6DM
         W7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666211; x=1762271011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
        b=vT6QNfYt1hYZOmKRs9fx0D9ieU+Shlf3+h+JF+sMqYGOLXEvjs/PycKXBUelsMD9Y+
         awefnNK9XuV34bQZDwa9AcuAsz7xtK6K0oAlQvgBt9cX5r2tEE/0cIJ6roux3Cl7G4P9
         cNEi4gh/3cvrrPI/vuL4ghKGI9MK1NreO39gPmk0N0f03Sv/BsNxCX4NwmXj42F1tOPy
         oZ1eYkQABg0XM8+sTq77gohJ/0yk3qI8sDTlET6oYQMqkJT0+FJ0zZSiWlg4XjtornaP
         9Jy0pQ1I639eDg4+OUdl43B/sUvRZeFWdWqy7UV46XcAO68gnOFYKbFyGiTZvSElPmye
         TbkA==
X-Forwarded-Encrypted: i=1; AJvYcCWi+N4KxvUcmuFpxM8kHwZm7F+sAM8KPy/PAUuXp2D/RnovUQHjBGhuFCsxnKo96iAhrKrC7s3vjFY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4G6wQswAWw3wwP/kBWt0QvEK7SOybz42kr//51gyDoZ6PRX7k
	ar63CBFds76IMX+7sFTX+5kqXguREVJconXfaayhzyjg5IT1CXKRxoIQ
X-Gm-Gg: ASbGncvicKRHWxTEP+Gq/It/4hhLkFoxAXaNMoEvvsCY/TmwkOrtc0cZGMIFAiO67cA
	dVl86gQMm5X/jmJdVnxdBPpg4iNehjpIJqVq5GtfCGVzgA+6CkssD4n1NJlsLXd6DZkKxw0XzHN
	XMkXgtYks+lY392DwG/IROX8F7ISA/AkTw7KNmhi/XDKRwwQrf2QoQN3O0SySfvWqHYIydoahMH
	ykd29aFZsyl+sg3iSSii51XxAOPLmboHTXaJhAXtd/miKEbmPsbCwz6TpKJaS39iqjg/vY4heub
	YqIYDi1eRGsymJrBAbMXH857lkQAf4U6agi6BJ6ZVXB/UwqGT5SZcKTb4MgqzDfhiPCy4L6qb17
	AmX/+4d9Hhm5iCSEXi986ZeE0wD3oCJfwKBG4Wt71SFhA9wlNPKw9vHFLGBJgeDc6hsU1LxXxwe
	WDEbcEWQP0ZJbZjLLipoWmgY7xulMqvXVsf3uGlZATdmls57SFMlKsdEGzWg==
X-Google-Smtp-Source: AGHT+IGQT1sWn537O9lUQH0SeyIcZJ4uWohxTzjPx9kV6HFu78PmQQbglpth1JWOPqlEUpT9jeFZgg==
X-Received: by 2002:a05:600c:4e02:b0:475:dd04:128a with SMTP id 5b1f17b1804b1-47717e6b4c8mr33281395e9.31.1761666210763;
        Tue, 28 Oct 2025 08:43:30 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02cd6dsm210045835e9.2.2025.10.28.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:43:30 -0700 (PDT)
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
Subject: Re: [PATCH v4 08/16] mtd: rawnand: sunxi: add has_ecc_block_512 capability
Date: Tue, 28 Oct 2025 16:43:29 +0100
Message-ID: <8637155.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20251028073534.526992-9-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-9-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084332_935385_2A698DCD 
X-CRM114-Status: UNSURE (   7.61  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM1OjAxIFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYxNiBj
b250cm9sbGVyIGNhbid0IGhhbmRsZSA1MTIgYnl0ZXMgRUNDIGJsb2NrIHNpemUuIFRoZQo+IE5G
Q19FQ0NfQkxPQ0tfNTEyIGJpdCBkaXNhcHBlYXJlZCBpbiBINiwgYW5kIE5ERkNfUkFORE9NX0VO
IHRvb2sgaXRzCj4gcGxhY2UuCj4gCj4gU28sIGFkZCBoYXNfZWNjX2Jsb2NrXzUxMiBjYXBhYmls
aXR5IHRvIG9ubHkgc2V0IHRoaXMgYml0IG9uIFNvQyBoYXZpbmcKPiBpdC4KPiAKPiBObyBmdW5j
dGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFy
ZC5nZW5vdWRAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5l
ai5za3JhYmVjQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
