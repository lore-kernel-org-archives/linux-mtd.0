Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B0D78337
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IyXBSNEBDoqH1e1FIVJqcUUo3I1jy/tjCiBNorvyl8=; b=rbqHgCGS6C+WQL
	Avm9x21M8gBZuEj249r1Xc/wF0FIzo2ApDBXIrP1G+yizbTmS25L1PoWj/fJkNv9H3rikuUC0pk3E
	k69huUnguJzfdVwAs8faYUseL5Jf3i4Z1QU7phvHnfe4zWqkBwXXF+DsJ0X4QjTIJmizRPyjHpXVe
	S/efBZOH7u4qNBOZal77XGcc+wx0p57q1EzFd8mbJQUG2Mq+XXnJakWYaCGj7iJrLAPbKM8BPg9oN
	jfcPMrA6UBIQBX3CQxQB364ZxC8hGszQ7kV8cdDMS/MIaRVUvVMPQNbSn8CSY4XwOUSPxIoasNfix
	OX1jcZokpzIIrsIxGuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9kN-00000006wWT-0nZG;
	Mon, 02 Dec 2024 16:58:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9jW-00000006wNi-0OjA
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 16:57:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18B1A1BF206;
	Mon,  2 Dec 2024 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733158630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwJhyHk0KFMT+SspT26kxCXdvr9xbBBJKrLs3UwpEic=;
	b=VSkN8ZkJeUeTRw2LmDazBUhNapQ6k5z70UoeTPWZRwkhVI3EDrH3qvNDYylCHOwxXU+44g
	JkDY8NAL7vKRRrcXxul0ZWkGjVJ+mePFdRPQeXa7YU443Pcd2ev9PkJ+wPuJ46ko83NYSG
	ltHDoK7cIkCRsBIdF3JJRpqV/Z/Of5qQG2rn22z7fZvXwrRdY9mVwy2sZ9mA/WaKJHZR/Z
	vep6asofT2F50lOkz1I/yPjE3/eYBGwrUAkx0FC4hnlRO00WPFO89Besjz/bJfIjtFPlnI
	9AD+bLY0RrGVDRDQObNyFXhxOepoG90Smm25dLB67JH7SXinixFfbhFtz/jzWw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <andersson@kernel.org>,
  <konradybcio@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <manivannan.sadhasivam@linaro.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <quic_srichara@quicinc.com>,  <quic_varada@quicinc.com>
Subject: Re: [PATCH v14 0/8] Add QPIC SPI NAND driver
In-Reply-To: <20241120091507.1404368-1-quic_mdalam@quicinc.com> (Md Sadre
	Alam's message of "Wed, 20 Nov 2024 14:44:58 +0530")
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 17:57:09 +0100
Message-ID: <87mshe58gq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085714_258502_EDCADF3F 
X-CRM114-Status: UNSURE (   6.48  )
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

SGkgTWFyYywKCk9uIDIwLzExLzIwMjQgYXQgMTQ6NDQ6NTggKzA1MzAsIE1kIFNhZHJlIEFsYW0g
PHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPiB3cm90ZToKCj4gdjE0Ogo+ICAqIFVwZGF0ZWQgY29t
bWl0IG1lc3NhZ2UKPiAgKiBGaXggc3BlbGxpbmcgbWlzdGFrZQo+ICAqIFJlbW92ZSAiaW5saW5l
IiBmcm9tIG11bHRpcGxlIEFQSXMgZnJvbSBxY29tX25hbmRjLmMgZmlsZQo+ICAqIE1vdmUgJ3wn
IGluIHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMoKSBBUElzIGF0IHRoZSBlbmQgb2YgbGluZQoK
SSBndWVzcyBpdCBpcyBub3cgdGltZSB0byBtb3ZlIG9uLCBJIGNhbiBhcHBseSBwYXRjaGVzIDIt
NSBhbmQgc2hhcmUgYW4KaW1tdXRhYmxlIHRhZy4gSG93ZXZlciwgZHVlIHRvIHRoZSBmcmVxdWVu
dCBpbmNvbnNpc3RlbmNpZXMgb2JzZXJ2ZWQKZHVyaW5nIHRoZSBsaWZldGltZSBvZiB0aGlzIHBh
dGNoc2V0LCB3ZSBtaWdodCBiZSBzbGlnaHRseSBtb3JlCmNvbnNlcnZhdGl2ZSB0aGFuIHVzdWFs
IGFuZCBzcGxpdCB0aGUgcGF0Y2hlcyBvdmVyIHR3byBrZXJuZWwKcmVsZWFzZXMuIEkgZmVhciB0
aGVyZSBtaWdodCBiZSBhbm5veWluZyBmaXhlcyBvbiB0aGUgbXRkIHNpZGUgbmVlZGVkCmJlY2F1
c2Ugb2Ygc29tZSBzaWRlIGVmZmVjdHMuIFdpdGhvdXQgdGhlc2UsIHRoZSBzcGkgdHJlZSBtaWdo
dCBoYXZlCmJyb2tlbiBxY29tIHN1cHBvcnQgZm9yIHNldmVyYWwgd2Vla3MuIFdoYXQgZG8geW91
IHRoaW5rPwoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
