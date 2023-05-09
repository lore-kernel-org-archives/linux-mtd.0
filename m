Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D52C77B75
	for <linux-mtd@archiver.kernel.org>; Tue,  9 May 2023 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdNg7xK7rK8Dccw3qNd2JwCns5A/CVoQcDDWcQefwJY=; b=c80z5MhV3GvnAv
	lAH9kCKgrKkISz9Jb+61T4gIlStPmDOegduNnhn8RfPbyd0a78ipky2dE1SAYTWNAX5TQ+/VBzUfW
	jWZizBHWFL6t3PunbE2yz8HwgiInip82C0XFetgTvCXCdvmRXo7esgXpMX8kZJoLxp0eM2d8tm0AW
	3BBlyc/w+QI0P6+fjigwABDcDIz0Vu8fzTk3HP7D86IQa0XtWBdBgxRbbB/6jZBAcX/5tKfQGR377
	QXkawZhqWsSx0roWRyrodWbpRYBBMVm1PvQSei1pEYccp0rUNlnABlhMfaw56sVjM4pfC7j/C1nVz
	nc2RO+Hqgf62LlaAXsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS6s-0041On-1L;
	Tue, 09 May 2023 18:30:50 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS6p-0041Nj-1s
	for linux-mtd@lists.infradead.org;
	Tue, 09 May 2023 18:30:49 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-55a829411b5so57764247b3.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 May 2023 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683657045; x=1686249045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ5hIfVGYt176X0mmh5Nxb3U1ww7Q7ORWMM97Hft4mM=;
        b=VjqJEnqzTkEZ4iHn5ydijXymdY8/PV8bwyjXe+lzA3PjZfKpJ8NjCIR2auQ/yWySh6
         ez1BUZukd6Xe9G6E6C2E+046wP2yVXKEmbXOaXCbEzKQITPhFpeGTZ3fkHkwTzKR6MYN
         DUSVuUlscFmiptusPeEEDTQfX6ggVPePqlPcm9wLs2h423+rsZRL7r+POmNERu+u0op2
         1bOwKAxlp4EP8SWOHg64z/c8oIY0BACcnNcfgoqlEvteOObaTHDywjJV1VnipYuZeYkY
         1xyJU0CXqrOJDLvONs7qFLrjVA2J0DyTrcKNe6TaIsg/RBT6o3qSpKnKaXW3XWcYAM9S
         qGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683657045; x=1686249045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ5hIfVGYt176X0mmh5Nxb3U1ww7Q7ORWMM97Hft4mM=;
        b=OJNMNpv6UcZsODpw6mvoALloUU+EklCzN4jVcSTd/tB44oVw9Omp4uFXIUC6IxLuKU
         DgTLhrzK8d5SX6J9Zz7RoSj7dgDxa9QwwbgojKHLqc4pMeK+Y7/FRxF1v7WAQb9K4AT+
         V0ZcYlOGFxBhufDb/5DIjnYVjMZSH1Fp9/uM9FtPcmDfcGsHjvCF7k22D6sifhDaO/u+
         BaaxysD0cHFvM73yoPFiEgHyHS2DJ27wFV6Hx9T6cYSiJOZF3jGI6loNClCXDwF/iTZN
         cJBoLr7JD5Z3EIiigD8vBmXYtw02FY5sC9uhe+q4cQXqDyJD654D6wrWxpxZissL7m5Z
         kpyQ==
X-Gm-Message-State: AC+VfDyLVqUSTq47cp0QL2roHN7yCZGUWh4szcKFbuRTOnhNnwN/HeWz
	3PC7PvShPkagyCIdCfNq1wISFlJ/p52IPecw173gGA==
X-Google-Smtp-Source: ACHHUZ64WObK4alO23JU4r2bWXEcbsP3Y6beKyvnef7Og3R6aLy+mmjR1HujeuofX7PzFky5/HHtl4QtPES8PUPQ3To=
X-Received: by 2002:a25:c549:0:b0:b97:4b7b:945c with SMTP id
 v70-20020a25c549000000b00b974b7b945cmr17021207ybe.57.1683657044881; Tue, 09
 May 2023 11:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org> <20230509093129.40b30c7a@xps-13>
In-Reply-To: <20230509093129.40b30c7a@xps-13>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 May 2023 20:30:33 +0200
Message-ID: <CACRpkdYLZ36Ad5y7qLUTFix6yx=jBQ=ZvxaB9U-fhqQ_fvvXCQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add SEAMA partition types
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113047_620757_A335A4AD 
X-CRM114-Status: GOOD (  21.97  )
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

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCA5OjMx4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnIHdyb3Rl
IG9uIFNhdCwgMDYgTWF5IDIwMjMgMTc6Mjk6NDMgKzAyMDA6Cj4KPiA+IFRoaXMgdHlwZSBvZiBm
aXJtd2FyZSBwYXJ0aXRpb24gYXBwZWFyIGluIHNvbWUgZGV2aWNlcyBpbgo+ID4gTkFORCBmbGFz
aCwgc28gd2UgbmVlZCB0byBiZSBhYmxlIHRvIHRhZyB0aGUgcGFydGl0aW9ucwo+ID4gd2l0aCB0
aGUgYXBwcm9wcmlhdGUgdHlwZS4KPiA+Cj4gPiBUaGUgb3JpZ2luIG9mIHRoZSAiU0VBdHRsZSBp
TUFnZSIgaXMgdW5rbm93bi4KPgo+IEkgZG9uJ3Qgc2VlIGFueSBrZXJuZWwgY2hhbmdlcywgd2h5
IGRvIHdlIG5lZWQgYW4gYWRkaXRpb25hbCBiaW5kaW5nPwoKVGhlIGJpbmRpbmdzIGFyZSBub3Qg
c3RyaWN0bHkgYm91bmQgdG8gTGludXgsIGl0J3MgbW9yZSBsaWtlIGFsbCBPUzplcwp1c2VzIHRo
ZSBMaW51eCBEVCBiaW5kaW5nIHJlcG8gYmVjYXVzZSBpdCBpcyB0aGUgYmlnZ2VzdCBwcm9qZWN0
LgpBbHNvIHdlIGFjdHVhbGx5IG1lcmdlIGEgYnVuY2ggb2YgYmluZGluZ3MganVzdCB0byBkZXNj
cmliZSBoYXJkd2FyZQoob3IgdGhpbmdzIGxpa2UgcGFydGl0aW9ucyksIGluIHRoZSBob3BlIG9m
IG1ha2luZyB1c2Ugb2YgdGhlbSBpbiB0aGUKbG9uZyBydW4uCgpBbnl3YXlzLCBmb3IgdGhlIHJl
Y29yZCwgdGhlIGZ1bGwgc3Rvcnk6CgpDdXJyZW50bHkgdGhpcyBiaW5kaW5nIGlzIHVzZWQgaW4g
b3V0LW9mLXRyZWUgT3BlbldydCBjb2RlLCB3aGVyZSBpdAppcyB1c2VkIGFzIG1hZ2ljIGZvciBz
cGxpdHRpbmcgcGFydGl0aW9ucyB3aXRoIG10ZHNwbGl0LgoKSSBndWVzcyB5b3UgbWlnaHQgYmUg
ZmFtaWxpYXIgd2l0aCBtdGRzcGxpdC4gSXQgaXMgYSBzb2Z0d2FyZSBwYXJ0aXRpb24Kc3BsaXR0
ZXIgdGhhdCBtYWtlcyBpdCBwb3NzaWJsZSB0byBzcGxpdCBhIGJpZyBwYXJ0aXRpb24gaW50byBz
bWFsbGVyCnBhcnRpdGlvbnMgZHluYW1pY2FsbHksIHVzaW5nIG1hZ2ljIGJsb2NrIGlkZW50aWZp
ZXJzLgoKVGhlIHR5cGljYWwgdXNlY2FzZSBpcyB0byBwdXQgdGhlIGtlcm5lbCBpbiB0aGUgZmly
c3QgZmxhc2ggYmxvY2tzLAp0aGVuIHBhZCB1cCB0byB0aGUgbmVhcmVzdCBldmVuIGVyYXNlIGJs
b2NrLCBhbmQgdGhlbiBhZGQgYQpKRkZTMiBvciBVQkkgZmlsZXN5c3RlbSBpbW1lZGlhdGVseSB0
aGVyZS4KClRoaXMgd2F5IGl0IGF2b2lkcyB1c2luZyBzdGF0aWMgcGFydGl0aW9uaW5nLCB0aGUg
dG9vbHMgcmVidWlsZGluZyB0aGUKZmlybXdhcmUgY2FuIGR5bmFtaWNhbGx5IHNwbGl0IG9mZiBt
b3JlIGZsYXNoIGFzIHRoZSBrZXJuZWwgaW1hZ2UKZ3Jvd3MuCgpUaGUgbXRkc3BsaXQgY29kZSB1
c2VzIGRpZmZlcmVudCBtYWdpYyBudW1iZXJzIHRvIGlkZW50aWZ5IHdoZXJlCnRoZSBkaWZmZXJl
bnQgcGFydGl0aW9ucyBzdGFydC4KCk9uZSBzdWNoIHR5cGUgb2YgcGFydGl0aW9uIGlzIHNlYW1h
LCBzbyB0aGUgY29kZSBuZWVkcyB0byBrbm93CnRoYXQgaXQgc2hvdWxkIGxvb2sgZm9yIHNlYW1h
IG1hZ2ljIHRvIGRldGVybWluZSB0aGUgc2l6ZSBhbmQKc3BsaXQgdGhpcyBwYXJ0aXRpb24gaW4g
YSBrZXJuZWwgYW5kIHJvb3RmcyBwYXJ0LiBUaGlzIGlzIHRoZSBjb2RlOgpodHRwczovL2dpdC5v
cGVud3J0Lm9yZy8/cD1vcGVud3J0L29wZW53cnQuZ2l0O2E9dHJlZTtmPXRhcmdldC9saW51eC9n
ZW5lcmljL2ZpbGVzL2RyaXZlcnMvbXRkL210ZHNwbGl0O2g9M2UwZGY4NTY3MTNhODRiMWRlY2Yx
NzE5MGYxNzFjYjEwY2U3YTc1NztoYj1IRUFECgpJdCBpcyBhIGJpdCBzYWQgdGhhdCBuby1vbmUg
aGFzIHRoZSBlbmVyZ3kgdG8gcHJvcG9zZSBtdGRzcGxpdAp1cHN0cmVhbSwgSSB0aGluayBpdCBp
cyBxdWl0ZSBnZW5lcmljIGFuZCBnZW5lcmFsbHkgdXNlZnVsLiBJIHN0YXJ0ZWQKdG8gbWFrZSBh
biB1cHN0cmVhbSBwYXRjaCBidXQgZ290IGV4aGF1c3RlZCB3aXRoIHRoZSB0YXNrLgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
