Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCBEC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCUsSUMWrYTJJNvt9DSE5kz26guxNq+m74OurdSJyI4=; b=y74tAuMYWBDx3B
	3Dz6eBjYxyJSpj+Zxee7OC8t46UWKveCiPPHIgLRLqq0FydPPrM27r/YSS8bULGml5KloYFng1NGq
	VKoHy1p5KmEzsyAbQKGwZWJNgKn3ne2IgzgQl9OsvB3GlP2YTKg5F6G42qrznVCmkOUR2+jAGxqpF
	oTSVYRfIQpMT2KSdWCuVyyVWoTCWGjEzjgkt2/PbAJyFeAEXIuo2AeK6yZVGELbn/6wInZp0iSnCU
	wQU2fOpvMm+1LZWQAjMPUhQQkk7WxwmmtU5WpaIZ8IEUasHtgWexcSSWrJTqCsJIcMCjMlZRCinFo
	hjGUMjfRMLE9GBEN38aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRTI-00000004vlN-2vcr;
	Tue, 18 Mar 2025 07:34:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRTG-00000004vl5-3nQ2
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 07:34:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223594b3c6dso108447585ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283282; x=1742888082; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sch7la5qdb49duMOy4vFgMfr/xMO2MbtEqZ0tC+N5Co=;
        b=FpBq5SZDgvoHlZ7T8CwCYAZJnwmNH7gOOiy6Ztm3ChbcFOZZ1JLK8KZfwC+ebqcRv3
         Uk1fvyDpO77QyWQfH2vIc1B7W3kGorjVtLu0Aj79nY29lRJJ5AOjMfFO9S0XHGGSnY+S
         nl/5Cbf5aRt8RpOOOupQsAcVlcDxF66MJNyDsOnwCeomCbrw94dCOOpPFdrQAjM/T98j
         HADmZwwYsNRmxDYnGUZZr/Vw9DU+nKYWOdoI3Mrr6cdVB0sJSiRJaGC/9fdz4sqs9BB3
         k6jf4HpLTtadXOWeS/QjNoCAvo2kRHW0qWEIEztlpqafoCSx2ynSfqwmXhFxAsr4EKtn
         LDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283282; x=1742888082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sch7la5qdb49duMOy4vFgMfr/xMO2MbtEqZ0tC+N5Co=;
        b=fF9uMm/D8mrNOtcBDBEgma5ymosXvEKU+yF0O+W8ecofyMyy82NCswNuzzTn+6vS2R
         GaJhG4Vy3qR1w0E3PoXAbN94LLofiESMuC8/1fClhr4zKHwrVfKWjmre1949AbaXKNfi
         7SF4lGL+EllmVdNpTxD1DfEn3PWQG6Z07qWP3wiOiEKdTEaGsh7DRwfbSnLL4+V+F7g1
         XrWKyUCxgN3dg5MRnvTPeqClwe8DokfvAckgr/Eo/Gz00OwBG3jNZYmshp6bu35iF2e6
         tyYu25wGuCx0qROJvjPppz22O0JiNhNcer8Sfcj0ptV5PtjISl4siEzPt9+jbHaARTo4
         koiA==
X-Forwarded-Encrypted: i=1; AJvYcCVkjS+xG7FK2drU5bmWTy9OISbzYnidzcNRmhr4/6XEdux2FnBt7yAlgj4Sa/fmb7rXhQ8LVVTTBLA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOxfd85C0Ray0XAuL9xXim1cGsLyLVw+p37FI7NsKEz07TREW0
	S0AAgGyCnZ8MKgJxpxEK+uZ+JOX1XkSvMJ2bE4qedD2duTGZRSX6lgd65ojEKg==
X-Gm-Gg: ASbGncsZz9Sqf8V5RZbp+cOzkPN36cbSRv8cTnmFNeKPqy8wOapHwBVWlLNjBPJbeE2
	4WauuIIvCqPbf+5byLeaOzceJabl8BZO3GlIdUEoZaxv/3RcbSexuNAqUcqpiEVR0/A5pFiItbd
	QugBrt78mEVuuzbfoNlyeBoAno79e0MR/xlvDHiJQ93bVvBSj14xvC6oI14RWKJ+HAkZEHWVxbr
	+bo3lz3duOMcQbi3vYnCoUbFLTosVkgRk/aT0lChWsiGZ+8KA6TFxkJn/xicORMfXSCWCttzlG2
	WN4Vpg7BjRUtA+9pvEj9Bl/RuDshOpXAZ/PZU94FZKUzoN1+ZXOsTdPt
X-Google-Smtp-Source: AGHT+IG5yxqfLmJatVY82JIyTMbAGWoGx5aMvFHioASOebuvnlP+jZZ+3cmaakAsF9c4YjxeoRTg9Q==
X-Received: by 2002:a17:903:230d:b0:220:e1e6:4457 with SMTP id d9443c01a7336-225e0a8dff2mr180297405ad.26.1742283282287;
        Tue, 18 Mar 2025 00:34:42 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba7260sm87304195ad.110.2025.03.18.00.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:34:42 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:04:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mtd: rawnand: qcom: Fix read len for onfi param
 page
Message-ID: <20250318073437.hmunilehmqdfkyg3@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-4-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310120906.1577292-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_003442_949130_D630FCD5 
X-CRM114-Status: UNSURE (   8.19  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMDU6Mzk6MDVQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBUaGUgbWluaW11bSBzaXplIHRvIGZldGNoIHRoZSBkYXRhIGZyb20gZGV2aWNlIHRv
IFFQSUMgYnVmZmVyCj4gaXMgNTEyLWJ5dGVzLiBJZiBzaXplIGlzIGxlc3MgdGhhbiA1MTItYnl0
ZXMgdGhlIGRhdGEgd2lsbCBub3QgYmUKPiBwcm90ZWN0ZWQgYnkgRUNDIGFzIHBlciBRUElDIHN0
YW5kYXJkLiBTbyB3aGlsZSByZWFkaW5nIG9uZmkgcGFyYW1ldGVyCj4gcGFnZSBmcm9tIE5BTkQg
ZGV2aWNlIHNldCBuYW5kYy0+YnVmX2NvdW50ID0gNTEyLgo+IAo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gRml4ZXM6IDg5NTUwYmViMDk4ZSAoIm10ZDogcmF3bmFuZDogcWNvbTogSW1w
bGVtZW50IGV4ZWNfb3AoKSIpCj4gVGVzdGVkLWJ5OiBMYWtzaG1pIFNvd2phbnlhIEQgPHF1aWNf
bGFrc2RAcXVpY2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19t
ZGFsYW1AcXVpY2luYy5jb20+CgpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxt
YW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+Cu
teCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
