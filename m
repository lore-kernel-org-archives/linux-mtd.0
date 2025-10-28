Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CBCCCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJMkp1fYsGN7+sLm2CeebspoJdctImYyjroKL0qmAuE=; b=ukr+njKf0A569X
	XCrWDLSGcNoJaFBO2pPio/OVA9XTHZtuBz7deq9ugEHG4IaJX8A1lCIZCvz2WxnWrOk/jm5e5FQrt
	4BKMUzkJ2uzzvhPqbFJDkzqnuoZBiIk55LpxPGn3dtWyju0YzppvuJX+b6mVdSLpnFIaXkA0urT4L
	0LyYOTGndrDujC2knDafDvYeIpSaE5FSk5OoghjUGpb/ZskZEJDMl6wdfGHCntxKEzujzlyfJms2s
	OSzhrvnZsyJaoozxi8nVZ3NcYtErYdnzBo3Zd2OrcS5sWvg59uNMOcAZFT83Vp2eRpbxRCj8Pnjw8
	Y3uijtA/N7ldIIaozPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlkl-0000000GC5v-0prD;
	Tue, 28 Oct 2025 15:36:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlki-0000000GC59-2RhB
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:36:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso25975325e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665810; x=1762270610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
        b=hFAcJWesmMj5GjntKz/vFXqRM6WMldh92hFEMU8VB+wLUEARxU8He31HekOXw2bzGn
         WTr7qytIkXjXGFf/Pt2Y75q0csHL33qTc8jQnbcUMExoGQtUWStyA/jA0FbUOFwoUv5E
         CeXCcDg6Lu1j9ZGccCjvbvrPPp6/z3UVxrQqhd+eaxfAi8X7zqPvqfT2Ng8wVqjPjg9u
         f3B9qiFIiVtQwZL8wy6/PExUkWs1ytgKaWrRSZxMCBShQum+QhyBdlkRQy3mZ9OE6JhO
         MRU47J+RbCkyxTXyOFlM8vdahHovKgDJW1mSCZuJgb4S/S/KazJkfmxIYHlzEDDW8vaw
         bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665810; x=1762270610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
        b=Gln+1LIcjDxkRD+JCHSLF8RQ+oTtyZVnlNoUz2gnaMnL2dWVW81LFSfEECUaTJTO85
         9dmu9EL2Yz+C22BU7zhiw1GLs16MPk5tAAU/KNzqWmXLlBxOD0PWlxHEytqm6Mu3LsGG
         51FIHkK3cAe/XhxBY5zSWcpR2ouu69rJ9nYuoWD31mELG8NHJcslnQPU6/lQ5b7DZHg1
         XZtpGqenI2XCnTmRoYZ12HLVjEMsq1AwwxDy6CR7Od6dxQ3hnl+HJNNCSc3VuJqNOOdO
         rn/r2xsPLCtJIFJ3/vFhOG8ijQ/f0bgqs3faT6Joru8qsFf/3PnR+Y2OwTYsejwwSy+p
         gtHw==
X-Forwarded-Encrypted: i=1; AJvYcCWJwOGKvPtZ29dtWPE9OH8q9EjSOCWQIMFwritwMkmvQWSTP+ETAc+E0B5oXjQGI7pgQGMIgc7V8QA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+CksBEiZjshKS31VJuKdtKLEPmCbyqoneUDMNTZOVxvb4/4k
	ngBTuezeU67xaNLWQUDmcxepa7Rfl/9D4TxxjumsnVusy0N35F8MHGMv
X-Gm-Gg: ASbGncsLxn1yTC6O6FgjMTMDaCpmm24khkkiedKKDJvL4h3p6xn586bJm9vpW8eaLYJ
	HNnfXao8hOzMcb7RA8JVgay7DrggmFAK3VPxlX/tuJ2pyyuR2xOCD6XGJDF9ijkxtTZcyk0uNxq
	OGYLEm6XKjmsYrW2VrzWo1m6xQdQaYBRH52+HhFFlFzo9feRae88n6pw7GZ6b06hGwmyfyJvEZZ
	UWqlUD9jhdBkulmLHOocPSInz0cdvCbESg0XZ4wgDE+vXYu9MlzpsvNfxRVLyKz585KugW0Nz/g
	p+2/mZDpZkBL9Z6Kb1YTWAYRDBvmO1W5f5H5TuEwWxoTcvSYKB2NWLpC3xn44EIioeaHB2TVwaU
	jOwCQDF+NMGs78bdxFVmHXdzVv7wx/umLxDthx/TAcu7uujRV9TxKv3mOvtWOZZa8j7HOPamxWh
	S8b+7PVKSiax2Om6tvFKA19svre07iPnX77mUO1XUFjG0DSO8CohRpiJshHg==
X-Google-Smtp-Source: AGHT+IHcEqxrDGNbCr9Qf3fhYUvlJSJPyM3H2iUm9WQHT2tvvW1arfoNj1Bg06ZOGX1vRi4tbPm82Q==
X-Received: by 2002:a05:600c:8216:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47717e30970mr33449425e9.26.1761665810438;
        Tue, 28 Oct 2025 08:36:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e41sm202105775e9.12.2025.10.28.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:36:50 -0700 (PDT)
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
Subject: Re: [PATCH v4 05/16] mtd: rawnand: sunxi: introduce reg_ecc_err_cnt in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:36:48 +0100
Message-ID: <7866116.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20251028073534.526992-6-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-6-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083652_647267_08CCA49F 
X-CRM114-Status: UNSURE (   7.95  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM0OjU4IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYvSDYx
NiBFQ0NfRVJSX0NOVCByZWdpc3RlciBpcyBub3QgYXQgdGhlIHNhbWUgb2Zmc2V0IGFzIHRoZQo+
IEExMC9BMjMgb25lLCBzbyBtb3ZlIGl0cyBvZmZzZXQgaW50byBzdW54aV9uZmNfY2Fwcwo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3Vk
IDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJl
YyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
