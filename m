Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93622C02194
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZl2ZjbNckSp4+ZgsOJ9tNgAqWN8BAzO/gYywgUfvRk=; b=eYo0PQdD2kD278
	bkkQWb22UEx0Ja1UZyTlz/4juVkJ9i4WLjhKF4HkvVC9NWJxFyVe/UkyUGOJ3hjuIm+cRTdRMGefA
	TlO82K5xJ/k/jycWzwvfhLBNmFKcdIV8BGMluMQI+iFo2BCXK6+cSQFapCCgqgzd1YKsHHqQm1bU8
	OM5Tw+wnWCXMAfqSQqUTc0/zT2r+ek3azRwPLBS+fnYC0Y54KL2Eok/xHyKstzxAi+YgfvBM2tqz6
	KUXBYZF8/bsuN052GSWCaNXnMJgjylrRPgFtUhVef3wI251reN/2LaUYOVjKwCc+sxGuLd11FCY/u
	7EmQE9oXB4yqp+N/yZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5M2-00000006wuN-1QZC;
	Thu, 06 Feb 2025 17:07:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Lz-00000006wu5-3Jhc
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 17:07:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B855442BE;
	Thu,  6 Feb 2025 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2taOfS6UmQKEI7wuUTCU2ak/Qb2Q0kvynZ5wujlAtSc=;
	b=V5tfF/GoO7XLmaaGdKISt5kKntHgBSJf5ZjHNlComoZFQ4/xN5fjvGf4psMk1mDVcPqDWK
	cl5W5kheP7+tDXNzuot35RvTtVCPKlVW0qBhj000Bm/CLuu8Nxw1dGzgh9b45G0O/Hp/Ch
	e0nWUVWpXcApeNbkQXzcRW2XLn9Ak2Sedn2RbUbgCq5h81YBhbAPs/9Klp6SYl0Qa19GpT
	4YgR78mABE65Jb+cpcIVcZ3ZtSl3C/o/FIml5jbVkjyGYvKDGzKEEddOvOq906QEaona1Y
	r7nMH98CCbMvGxR4HRDKJM8Dg0A7tE3E3EV4L8gKAolYWwMnlyg15Es4BhMqew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 2/2] mtd: spi-nand: macronix: Add support for read retry
In-Reply-To: <20250122065605.285145-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 22 Jan 2025 14:56:05 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:07:46 +0100
Message-ID: <87pljv3st9.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_090751_966346_C50124C2 
X-CRM114-Status: UNSURE (   6.04  )
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

SGVsbG8sCgpPbiAyMi8wMS8yMDI1IGF0IDE0OjU2OjA1ICswOCwgQ2hlbmcgTWluZyBMaW4gPGxp
bmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgoKPiBAQCAtMzc3LDcgKzQyNCw5IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1hY3Jvbml4X3NwaW5hbmRfdGFibGVbXSA9
IHsKPiAgCQkgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5G
TygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwKPiAgCQkJCSAgICAgbWFjcm9uaXhfZWNjX2dldF9z
dGF0dXMpLAo+IC0JCSAgICAgU1BJTkFORF9DT05UX1JFQUQobWFjcm9uaXhfc2V0X2NvbnRfcmVh
ZCkpLAo+ICsJCSAgICAgU1BJTkFORF9DT05UX1JFQUQobWFjcm9uaXhfc2V0X2NvbnRfcmVhZCkK
CkkgdGhpbmsgdGhlcmUgaXMgYSBtaXNzaW5nIGNvbWEgaGVyZSBhbmQgZXZlcnl3aGVyZSBlbHNl
IHdoZXJlIHRoZXJlIGlzCmNvbnRpbnVvdXMgcmVhZCBzdXBwb3J0PwoKPiArCQkgICAgIFNQSU5B
TkRfUkVBRF9SRVRSWShNQUNST05JWF9OVU1fUkVBRF9SRVRSWV9NT0RFUywKPiArCQkJCQltYWNy
b25peF9zZXRfcmVhZF9yZXRyeSkpLAo+ICAJU1BJTkFORF9JTkZPKCJNWDM1VUYxR0U0QUMiLAo+
ICAJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAw
eDkyLCAweDAxKSwKPiAgCQkgICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMTAyNCwg
MjAsIDEsIDEsIDEpLAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
