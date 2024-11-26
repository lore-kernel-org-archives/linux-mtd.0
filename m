Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E341D5A6E2
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSXgE7HnHxXdrq7wfc5BMYzoYjrjGgs+Sog3xGT3mFY=; b=s2Eo0nSxgW9WYg
	gvt4Wncm1oSK7Ow4nwWVNPgV9AqgSfnUaoVjn8rGmrvdocEqJqxw8+S8iutYey+V+Y3bAiGalomtO
	Bylp8eig5uKZJ82yhAMIWWkNh6a9D0/QE+oc7HyUi8ai2MBnk1lbLZG67qggUb1BB+jFHJNzT7jSy
	ZjZ+R9TQmuSNLE/bySCMSwGjbC8hoF3qDfNZzQFlZTYYAzKi7p2IYnkqSvn0sH+N+Kfru8sGTZQcx
	E+UbG0gqPD/cTNaAw6r+ODOz8NyLXoCYR+g/CsKVroWNwJfoE+MkoTIYRSMm7HAGFH67ZvzZvq6CC
	9698CtB9gJ+GtRILp6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFoS7-00000009hkP-3OCt;
	Tue, 26 Nov 2024 05:49:35 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFoS5-00000009hjp-1qfs
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 05:49:34 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so4402460a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 21:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732600172; x=1733204972; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UB6HIiB9fYrnHWsQY2vK1iIVeNJm/snUPz8wyR7wZsQ=;
        b=ElU4JMGC6Az6ihmPTrDB9/2tR+WxUeGcqpLUGG4oUo2Hrnx9ytBOy4iV29LS305aVL
         QmjQO55liPo5EHihbs+5ywQ1Y6h6pfC8HShXK/zCxEcYUHuj+ZLm7ORuQ1esK9GJvDQi
         prhZ8l2jFdis3LN0kxZruTt5f6LMXW/FZ6juzESA3VIJmAODJSONiNYpthHEvxktd+W2
         ZtzuW+pylD60KPx8nxbfu/AKZ0GUarkim7bQB7PyBulgBfW1wDTL6K0SqoxHqbwQ1Cep
         NubSJ56DEo6/NCMyZ8arr9lonSr57bQ3JvIdJxA5ZcO4A3Y4iCCnBoqxerrIxwLdbsqE
         fSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732600172; x=1733204972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UB6HIiB9fYrnHWsQY2vK1iIVeNJm/snUPz8wyR7wZsQ=;
        b=DzM+NbO94EyPwhwY1tWjf7GhNNCTi2omwS7qwZw5ihrZEWafisAUNJMkK45y1Eo0M/
         v04yIllThq6RCmBeQFO0sO5NCWDXrFw3WpW0ihwbRLduf/mx8uud6XoVNrTTb2Fd/oUo
         fwZ1fgkCK3TpviOuTvx/aCqEBLCfsp9uQqgMeCbNmQqLGiaurIO8uRW3isPPR9ARbv9m
         M7Oupck4cJH5ZqeA7HhQsZAIuLx1/AQZIoouJNU76oWen4YLXrM0wa7codv+gnLyfXKn
         Bu28TzTFSFt6DlMYRIP0piW/5X2CTBB27CWCRYGFzseIO/5DJxQb8inTSv6I9p4l5hg1
         CbHg==
X-Forwarded-Encrypted: i=1; AJvYcCXuj/c8oitPwc5h6/3aqGIAxKmyZv8TImr8KYmVLQLJfivzp4E5FZte/89i16wbP7uZb+6klAqoNac=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl0Vhg01uE+MWlhiyfqMQc3S37o+hc8J+tmDIJ9AStKp3wUxXk
	zycBPghD0Du7Yc6/2k30QOffO5NBBXeGbLLUP9htUztEj2RljRu9iXT72E2zww==
X-Gm-Gg: ASbGnct3UZuehk2R0yegbdIlRal9ZT/+edl1ajyJoQG5I6/EAS1ds3kx+hHgG3hT8fq
	4hpOMszkO9lpy6lomvVJqFZPxzD2E5/CSy6IoFpecMKz97flKTStVqzskVuVdk5rE5zj529iuIP
	iTPZGvZjlpf1m1ZC9vWxEm4iwiogdeI1qtthmzlgr7gPiGjK6FKfxlPsOxUWNu0aR7CPno1i/L+
	bVJ68nIwIJ4sgPsrRGlKYMYNlMjcVSfuUg1pCUAhxD4cxs7ycae2mSdsUNbv+8=
X-Google-Smtp-Source: AGHT+IH7A4RpJtC++YPuYB5MX3HiLhpx1EDYwGMi9/FEGgV6zpbeHZux/sYsnjCByhEA+eq00AHWQw==
X-Received: by 2002:a05:6a20:9d94:b0:1db:ec6b:ba13 with SMTP id adf61e73a8af0-1e09e4178aemr23288221637.12.1732600172510;
        Mon, 25 Nov 2024 21:49:32 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de474c9fsm7503389b3a.44.2024.11.25.21.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:49:32 -0800 (PST)
Date: Tue, 26 Nov 2024 11:19:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Fix read len for onfi param
 page
Message-ID: <20241126054926.w2y3q4qnwiyatw5x@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-4-quic_mdalam@quicinc.com>
 <20241126054529.ewoajuaor4wpa4xe@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126054529.ewoajuaor4wpa4xe@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_214933_484666_2AD050F9 
X-CRM114-Status: GOOD (  21.54  )
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

T24gVHVlLCBOb3YgMjYsIDIwMjQgYXQgMTE6MTU6MzVBTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIEZyaSwgTm92IDIyLCAyMDI0IGF0IDAyOjI5OjMzUE0gKzA1MzAs
IE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4gPiBUaGUgbWluaW11bSBzaXplIHRvIGZldGNoIHRoZSBk
YXRhIGZyb20gZGV2aWNlIHRvIFFQSUMgYnVmZmVyCj4gPiBpcyA1MTItYnl0ZXMuIElmIHNpemUg
aXMgbGVzcyB0aGFuIDUxMi1ieXRlcyB0aGUgZGF0YSB3aWxsIG5vdCBiZQo+ID4gcHJvdGVjdGVk
IGJ5IEVDQyBhcyBwZXIgUVBJQyBzdGFuZGFyZC4gU28gd2hpbGUgcmVhZGluZyBvbmZpIHBhcmFt
ZXRlcgo+ID4gcGFnZSBmcm9tIE5BTkQgZGV2aWNlIHNldHRpbmcgbmFuZGMtPmJ1Zl9jb3VudCA9
IDUxMi4KPiAKPiBzL3NldHRpbmcvc2V0Cj4gCj4gPiAKPiA+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4gPiBGaXhlczogODk1NTBiZWIwOThlICgibXRkOiByYXduYW5kOiBxY29tOiBJbXBs
ZW1lbnQgZXhlY19vcCgpIikKPiA+IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPHF1aWNf
bWRhbGFtQHF1aWNpbmMuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2
YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+IAoKVGhpcyB3YXMgYSBtaXN0
YWtlLiBJIGRpZG4ndCBpbnRlbmQgdG8gZ2l2ZSB0aGlzIHRhZy4KCi0gTWFuaQoKPiAtIE1hbmkK
PiAKPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2UgaW4gW3YyXQo+ID4gCj4gPiAqIFNldCBidWZfY291
bnQgdG8gNTEyIGluIHRoZSBwYXJhbWV0ZXIgcGFnZSByZWFkCj4gPiAKPiA+IENoYW5nZSBpbiBb
djFdCj4gPiAKPiA+ICogVGhpcyBwYXRjaCB3YXMgbm90IGluY2x1ZGVkIGluIHYxCj4gPiAKPiA+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAyICstCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMKPiA+IGluZGV4IDMxZWMzZGIxMjQ2ZC4uZTFkY2E0ODU3NzU0IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+IEBAIC0yOTI2LDcgKzI5MjYsNyBA
QCBzdGF0aWMgaW50IHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwgIGNvbnN0IHN0cnVjdCBuYW5kXwo+ID4gIAkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFO
RF9ERVZfQ01EMSwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCW5h
bmRjLT5idWZfY291bnQgPSBsZW47Cj4gPiArCW5hbmRjLT5idWZfY291bnQgPSA1MTI7Cj4gPiAg
CW1lbXNldChuYW5kYy0+ZGF0YV9idWZmZXIsIDB4ZmYsIG5hbmRjLT5idWZfY291bnQpOwo+ID4g
IAo+ID4gIAljb25maWdfbmFuZF9zaW5nbGVfY3dfcGFnZV9yZWFkKGNoaXAsIGZhbHNlLCAwKTsK
PiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAKPiAKPiAtLSAKPiDgrq7grqPgrr/grrXgrqPgr43grqPg
rqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j
4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
