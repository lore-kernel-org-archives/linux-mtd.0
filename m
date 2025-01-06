Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A529BE77188
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnYHeHZWsB8yZrx02lEQyLymMzVbSCM6aw7VKTQT2+0=; b=OX1UQ+Po3xKU5E
	nJVUFihDyNWfF0o2+qJIsoy3c8VL1au66iq42WymS8p8xnZjLR3+IoGZUDHYYVhjO4eKi59Ho4EpM
	/2tPb2lHql4i4y6LfaH8MHHbiN+do/1txLJ/wAV0egYyYrEE9bYfNUyD517bnI0+Sr69Ay96s0X36
	WPyDNDBaBEKqb5zAmj3iGDkjb8j1HX+a7KH+dh0uDLhjk/+yRLM3rM6E5tCNmIqnF3J/mM3yO/EPA
	rgovaUqzovqWuFG2utXqSftWWiu5qWPHpmXI9VmiBMG6ttE5/lQGwM5Hz7nOh9xzKHH20CETplzTi
	hRs7c3xAxxdUVTRlhWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnU0-00000001SSK-1bUR;
	Mon, 06 Jan 2025 13:49:28 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnTw-00000001SRZ-4455
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jan 2025 13:49:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62D7BFF802;
	Mon,  6 Jan 2025 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736171361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDXimFD+hEVunV4g41zyYrJcxb5U3S2/goflvp0vMeE=;
	b=f4ez3j8mLaR9Shg1dHOsR+mN1JaIM7yyUTnDDowiuKUbTTBnwA+EVPSih1Gh06XantE7Qf
	xQ0vznDCYUEf0cmuBjVpfw31Ii6QDR+xjDDFwMpjOjgUIiWhPvaMwp4YvxMgaiqL4Flpk7
	A+FISAPE0bvXKqoJSr+Pt4sK+zT2zK5gC5kfqJWBEoxy0IB+E8e1InFrna3qrDfLCEozW/
	vnL2/ITdInjOw5vzZUwkmAMEXonOmgXYMnViiAfJtSFb2BD26ENwP2K1SoAs6YPMlvuVw+
	LMQGKYolbz7rTH6vWQqqn257TKU8kyUDJPPUe5Rk2tMLtwJ4OOUe+sUtQJzI3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,  <andersson@kernel.org>,
  <konradybcio@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <manivannan.sadhasivam@linaro.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-spi@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  Tudor Ambarus
 <Tudor.Ambarus@linaro.org>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Michael Walle <michael@walle.cc>,
  Pratyush Yadav <pratyush@kernel.org>,  <quic_srichara@quicinc.com>,
  <quic_varada@quicinc.com>
Subject: Re: [GIT PULL] mtd: topic branch for spi with Qcom changes
In-Reply-To: <87jzbp9hnt.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 24
	Dec 2024 17:20:38 +0100")
References: <87jzbp9hnt.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 14:49:18 +0100
Message-ID: <87bjwkoxwh.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_054925_161204_EB4899CD 
X-CRM114-Status: UNSURE (   6.02  )
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

SGkgTWFyaywKCk9uIDI0LzEyLzIwMjQgYXQgMTc6MjA6MzggKzAxLCBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8gTWFyaywKPgo+IEknbSBt
ZXJnaW5nIHRoZSBRY29tIHNlcmllcywgaW4gY2FzZSB5b3UgbmVlZCBhIHRvcGljIGJyYW5jaCB0
byBhcHBseQo+IHRoZSBzcGkgYml0cyAoYmluZGluZyBhbmQgZHJpdmVyKSwgaGVyZSBpdCBpcy4K
ClRoZXJlIGlzIGEgYnJlYWthZ2Ugb24geDg2IHdpdGggdGhpcyBzZXJpZXMsIEknbSBhcHBseWlu
ZyBhbm90aGVyIHBhdGNoCmZyb20gTWQgU2FkcmUgQWxhbSBvbiB0b3AsIHNvIEknZCBzdWdnZXN0
IHRvIG5vdCBtZXJnZSB0aGlzIGJyYW5jaCBhbmQKd2FpdCBmb3IgdGhlIG5leHQgY3ljbGUgdG8g
dGFrZSB0aGUgc3BpIGJpdHMgaWYgeW91J3JlIGhhcHB5IHdpdGggdGhlbS4KCkxpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI1MDEwNjEzMTU1OC4yMjE5MTM2LTEtcXVp
Y19tZGFsYW1AcXVpY2luYy5jb20vVC8jdQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
