Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B887D64093
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Dec 2025 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UPf6nnur+mIucjH9+T/rteUUgvVLHMySc7qAIJ2Llk=; b=E67bNyFsYLU9Jb
	zk7d9BO1KbRiH3WPk6cq7Pwi/SPlBMTHwFGryDlfeFmYUq0bTr3ahMRSZG0roWNjQiHQ94oYkthUj
	Gsl7s5xU7/8wsmu6nDC1u2w0s1yn/laRJyXlmmPR73xBdMT9STCYRYkNYrRjO6yudFgN9IB+ucKSS
	MM0ljwZf7Lz2N5CVhOPAhaINcHMXMrUK3nh3CFEx2jVWbrWbB0L+P3Whemc03TgdEeFUub+omVfiS
	07lC4P8pRi2/7NcRpwxAo8FUGJScOP0l6ULVI6I8ZKK/HifV7a2k5fnYY+QjkU0dOzkqvMmJINUqH
	Mfuh6pYrYowmP0LoN7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnTD-00000006OLo-12V1;
	Wed, 17 Dec 2025 09:05:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnT9-00000006OLO-2i5k
	for linux-mtd@lists.infradead.org;
	Wed, 17 Dec 2025 09:05:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7ED8E4E41C53;
	Wed, 17 Dec 2025 09:05:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 519596072F;
	Wed, 17 Dec 2025 09:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12B4F1195037F;
	Wed, 17 Dec 2025 10:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765962308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GHbESA3QlV3haQkQOJZ8bZoHaa5uRTi8+BzXSTQsGjA=;
	b=bKwcow/G81HEIlux3eTJybrhghyIqgaCcr2jgNjxkKuF4KTI1HNgwBFjGq1PKp2wzZLwLm
	7tX1k1w8lCjRquaRmpAtqbKCnbb0PFq/EgEVKllVzztsvBxpAi5GGEHRUNXOiSZ6d+74YV
	PUPJioNzDFh/0fDXGnaHuOk8BBJGSIYBXqRvO4vahksFUIJYxM9yVy8C6Cxi9YN8qiaZ5D
	azIGb2tPKmY04I4lDH1tGPZI9oVgwpxdsC/1CAyt1OKAJ6XB4OFk33h3q8PY08QrGDd389
	obJbZtAOljVIoQho84kqkJG4zPnzoNty6b3tSCiPUujLssEd3/HGeRjhKN2JiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Eugeniy Paltsev
 <Eugeniy.Paltsev@synopsys.com>,  Vinod Koul <vkoul@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
  dmaengine@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add dma-coherent property
In-Reply-To: <f1948d54-2e27-44ca-8509-ca16f9b792fd@kernel.org> (Dinh Nguyen's
	message of "Tue, 16 Dec 2025 21:22:09 -0600")
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
	<e1aae851-4031-4b5c-a807-7a61ecfe6af1@kernel.org>
	<877bumsv3q.fsf@bootlin.com>
	<f1948d54-2e27-44ca-8509-ca16f9b792fd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 17 Dec 2025 10:05:02 +0100
Message-ID: <871pktscld.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_010515_819781_5061015C 
X-CRM114-Status: UNSURE (   7.30  )
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

SGVsbG8gRGluaCwKCj4+PiBBcHBsaWVkIQo+PiBIYXZlIHlvdSBhcHBsaWVkIGFsbCAzIHBhdGNo
ZXM/IElmIHllcywgd2hlcmU/IEl0IGhhcHBlbmVkIGR1cmluZyB0aGUKPj4gbWVyZ2Ugd2luZG93
IGJ1dCBJIHNlZSBub3RoaW5nIGluIHY2LjE5LXJjMS4gSSB3YXMgYWJvdXQgdG8gdGFrZSB0aGUg
bXRkCj4+IGJpbmRpbmcgcGF0Y2gsIGJ1dCBpZiB5b3UgdG9vayBpdCBhbHJlYWR5IHRoYXQncyBm
aW5lLCBJJ2xsIG1hcmsgdGhpcwo+PiBzZXJpZXMgYXMgYWxyZWFkeSBhcHBsaWVkLgo+PiAKPgo+
IFllcywgSSB0b29rIGFsbCAzIGFuZCBzdGFnaW5nIGl0IGluIG15IHRyZWUgZm9yIHY2LjIwLgoK
Tm90ZWQuIElmIHlvdSBoYXBwZW4gdG8gcmViYXNlIHlvdXIgb3duIHRyZWUgeW91IGNhbiBhZGQg
bXkKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
b24gdGhlIG10ZCBiaW5kaW5nIHBhdGNoLiBPdGhlcndpc2UsIHdlbGwsIHRvbyBsYXRlLgoKVGhh
bmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
