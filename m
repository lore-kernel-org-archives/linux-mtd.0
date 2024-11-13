Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73379D41C1E
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3aSq5/hmVzAgeTQ776Uz9QO3racDDyUyBH9amUk2ds=; b=SSLk7Bdf82W1C4
	IY9y4WMwaBwjnjR7YIH8dsQmJd1eTXX9qCyMlaELbb0Sp7BtSQDMb4fStT/+ZTfUj87DkXXrdWJgQ
	jTKQhs/6p6d+faoLy1e3yA+0RTPAmFHq56uZWWpzYFDZGZ57mYK48Q0SG2yP7Knlzx+IOS8rtLBC3
	+/xrk+BEy3KY4yI8gRTxxhHJoJLGLyNsM4lZHu/XnuXx03Tx52ZhyEItGouJWO0ZnmNX0KRoHmaWF
	+xjuY3mBcQnNXrH0G8THa2cK/y+okpe0I3Afr82p/QmmaJAcSieXx2auiZ7YCy1Z2Qq5av1AJuSVL
	Gx0tlHZg44REwlRS1lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9N2-00000006CH3-0T0c;
	Wed, 13 Nov 2024 09:09:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9LD-00000006By4-2nxJ
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:07:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25131E0003;
	Wed, 13 Nov 2024 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731488829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gItS4ct+EOxG20yTUb1Sp9O+9wuwU7KGiBD97mPueXU=;
	b=G2qmxmKcMURoRlGS4cfajPcrtQ5kTfsrSA9Tm4QY2j0/8O3lfNfFlnAMvavJdzc/RgV5WJ
	ARZAP1h19/6Bno5A1TJ9YMJ3lSZFd3m4vDXS40nLndb88SyaKRqfWN7Pt0f6UUpXpwTXcA
	fzB/qbR6vNiBtgZSz54VVWhc9yq+o+PQPTGpP1LcCGboKqPThjB307C3cNoK9Tz5YZqEkl
	25Ym2aJ5A0mpMIg6I3YAbgtaIS3MgL+7suC8spzmARmiy719+lN7aQnyLQXIX7Cqj1SAl9
	stL+IE1slGPQxlrDBQeTDTOztDw1rPDAczn33twZvcqOzT2Brq0KlEbNJvNyZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <andersson@kernel.org>,
  <konradybcio@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <manivannan.sadhasivam@linaro.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <quic_srichara@quicinc.com>,  <quic_varada@quicinc.com>
Subject: Re: [PATCH v13 2/8] mtd: rawnand: qcom: cleanup qcom_nandc driver
In-Reply-To: <374ea155-0970-38bd-470f-cc440ca0bab5@quicinc.com> (Md Sadre
	Alam's message of "Tue, 12 Nov 2024 17:45:07 +0530")
References: <20241030121919.865716-1-quic_mdalam@quicinc.com>
	<20241030121919.865716-3-quic_mdalam@quicinc.com>
	<871pzh397j.fsf@bootlin.com>
	<374ea155-0970-38bd-470f-cc440ca0bab5@quicinc.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 13 Nov 2024 10:07:08 +0100
Message-ID: <87bjyjsds3.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_010711_988203_45DD7A5E 
X-CRM114-Status: UNSURE (   6.24  )
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

SGVsbG8sCgpPbiAxMi8xMS8yMDI0IGF0IDE3OjQ1OjA3ICswNTMwLCBNZCBTYWRyZSBBbGFtIDxx
dWljX21kYWxhbUBxdWljaW5jLmNvbT4gd3JvdGU6Cgo+IE9uIDExLzEyLzIwMjQgMTI6MDAgQU0s
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDMwLzEwLzIwMjQgYXQgMTc6NDk6MTMgKzA1MzAs
IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPiB3cm90ZToKPj4gCj4+PiBj
bGVhbnVwIHFjb21fbmFuZGMgZHJpdmVyIGFzIGJlbG93Cj4+IFBlcmZvcm0gYSBnbG9iYWwgY2xl
YW51cCBvZiB0aGUgUXVhbGNvbW0gTkFORCBjb250cm9sbGVyIGRyaXZlciB3aXRoCj4+IHRoZQo+
PiBmb2xsb3dpbmcgaW1wcm92ZW1lbnRzOgo+IE9rCj4+Pgo+Pj4gLSBSZW1vdmUgcmVnaXN0ZXIg
dmFsdWUgaW5kaXJlY3Rpb24gYXBpCj4+IEFQSQo+IE9rCj4+IAo+Pj4KPj4+IC0gUmVtb3ZlIHNl
dF9yZWcoKSBhcGkKPj4gQVBJCj4gT2sKPj4gCj4+Pgo+Pj4gLSBDb252ZXJ0IHJlYWRfbG9jX2Zp
cnN0ICYgcmVhZF9sb2NfbGFzdCBtYWNybyB0byBmdW5jdGlvbgo+PiBmdW5jdGlvbnMKPiBPawo+
PiAKPj4+Cj4+PiAtIFJlbmFtZWQgbXVsdGlwbGUgdmFyaWFibGVzCj4+IFJlbmFtZQo+IE9rCgpJ
biBnZW5lcmFsIHdoZW4gdGhlIG1haW4gYW5zd2VyIGlzICJva2F5IiwgeW91IGNhbiBwcm9iYWJs
eSBqdXN0IHNheSBhCnNlbnRlbmNlIGxpa2UgInRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzIEknbGwg
dGFrZSB0aGVtIGludG8gYWNjb3VudCIsCndpdGhvdXQgYW5zd2VyaW5nIHRvIGVhY2ggYW5kIGV2
ZXJ5IGNvbW1lbnQuIFRoaXMgd2F5LCBpdCB3aWxsIGJlIGVhc2llcgpmb3IgbWUgdG8gY2F0Y2gg
aWYgeW91IGhhdmUgZnVydGhlciByZW1hcmtzLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
