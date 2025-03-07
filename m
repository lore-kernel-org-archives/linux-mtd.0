Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA3AC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIQHHnpLDEY2Fh7Rw3Qz51YfMPdBRlYrqlWX7h2kq8U=; b=2lfNYsNVIV+YnH
	85GREzU18zvM8DnTGNaRlMzlaWnRV7nxApX7bRg/DjW6SoWhkC/7CR0s0kufwDqIKd9WD3OK8oPz7
	PcFfdP7fc1nx20AMEFERYj+cIyRigGRMWEUny9hf2YMiRUc/eG4cfy6enPtIhI8YREdj9E4sYVJX1
	4+tSGd4DEccbFsJoyMTndAnRBC86CXW2U4M45thkOuwIAPRIWfegpypNe6C0RaN52OLJNv/NTywfJ
	TVJiUKTtIA7YdUocLhGoJ83eeStor0FhXldrGYYu3GMwrvtDqQ6RclKtheMUj19KWa3oe2CjkW/oU
	8A1zg6HNTLsCqOgta76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSus-0000000DXQW-2wPQ;
	Fri, 07 Mar 2025 08:18:46 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSre-0000000DWbh-2I16
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 08:15:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26EBA443B2;
	Fri,  7 Mar 2025 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741335320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhovoKIZAZPa2Ihi5jgodUoSJmwl/x0XqcCmjbBCeMA=;
	b=TWmxoDHYFCMe5SUC96zeS3sEwBTpgf39BGVhOXfxxbE81MFy1ZjIGBd8wzvxPrx9nCmYDd
	7pYplwxP7Dl0qjN5KkB6hWznpxpvd6DAzrKRo9EhTL5T2NXW5dfGyMXFX2WNs5JwJB+dEe
	Srhz+yL/jHMtWpgdoZ7Wl3D7bmQQQt4PGj8bzoLWlktUYLoAXcGkCx0Pj0mU4YfuN5PaGN
	D6pgQAjDujajQxxNfriVEjEg+jf+Vh63v8USFl19wUBEIKtcZNBtBZvT1tm1B7H155ReH8
	KuvtzKjy4KoRaRqTrYXlQf97TFTXQ8wYMnQTZuPb19BnVTQHKiR0A4CBAsffmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: spi-nor: explicitly include <linux/of.h>
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-1-c186a9511c1e@linaro.org>
	(Tudor Ambarus's message of "Fri, 07 Mar 2025 09:09:05 +0200")
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
	<20250307-spi-nor-headers-cleanup-v1-1-c186a9511c1e@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 09:15:18 +0100
Message-ID: <87h645tfxl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddujeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddujeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_001527_338739_00B3B72E 
X-CRM114-Status: UNSURE (   7.38  )
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

T24gMDcvMDMvMjAyNSBhdCAwOTowOTowNSArMDIsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoZSBjb3JlIGRyaXZlciBpcyB1c2luZyBvZl9wcm9w
ZXJ0eV9yZWFkX2Jvb2woKSBhbmQgcmVsaWVzIG9uIGltcGxpY2l0Cj4gaW5jbHVzaW9uIG9mIDxs
aW51eC9vZi5oPiwgd2hpY2ggY29tZXMgZnJvbSA8bGludXgvbXRkL210ZC5oPi4KPgo+IEl0IGlz
IGdvb2QgcHJhY3RpY2UgdG8gZGlyZWN0bHkgaW5jbHVkZSBhbGwgaGVhZGVycyB1c2VkLCBpdCBh
dm9pZHMKPiBpbXBsaWNpdCBkZXBlbmRlbmNpZXMgYW5kIHNwdXJpb3VzIGJyZWFrYWdlIGlmIHNv
bWVvbmUgcmVhcnJhbmdlcwo+IGhlYWRlcnMgYW5kIGNhdXNlcyB0aGUgaW1wbGljaXQgaW5jbHVk
ZSB0byB2YW5pc2guCj4KPiBJbmNsdWRlIHRoZSBtaXNzaW5nIGhlYWRlci4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KClJldmlld2Vk
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
