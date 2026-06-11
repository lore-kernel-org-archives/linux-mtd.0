Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA046CD98CC
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2026 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZMsGYB1GgshTwtrt5oCj4DD6Zkt+bfonItJooroPjE=; b=0PcKgQVYq6/IDr
	MTwSw62TqiI2yC/G6YR5Cp5R7xXmmSssnw13/FdhkpqSK+4WioMP0G7uqHM+0oy4gWaxPtUkOWBAF
	HfM6LEnyMCGc8l9O8N7dKr58Hg83wpkjXsBfREUnS8x/sVF4SHhRVql2hg4kzr+X3YfZm1aL1WGaY
	YSWgtiItKii8vGqMdZE+sx/1hU9sMw21fjsfhDSD9v8ZesQil7RBGyz9cuaPuYJ8bitVadnBWgC5U
	CJUROHeEKflI2PPjnqrNZJ2fagkNn50Qn6GwNy5uuU9AGMnRdHehbeiSwRSYyhMlpOqwUasEu4hkr
	v6UBVNKMF8B5HnEmCwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZgj-00000008rdo-0w5M;
	Thu, 11 Jun 2026 07:18:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZge-00000008rch-3LHf
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jun 2026 07:18:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5922EC49F63;
	Thu, 11 Jun 2026 07:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15FCA5FF03;
	Thu, 11 Jun 2026 07:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42CC3106B9E33;
	Thu, 11 Jun 2026 09:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781162322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sLNr0hm3uew16y7gDj0WRdwwiCg0beTzmwfRz3pQzxA=;
	b=RjTsL9aZGZLbis5NocmSyRViuFMI53uoVHIsnfWq5DZCK8tm+woEEqV+qh39Ly8r411yht
	RAoZUBhYgQm/gMXU3Pef4yg6xVslVYDssHUtRbvEnY0Ww4P248CpzqlA+dnfJ70rzM96eE
	W2bfpwr4L81BcysNcxjXF3R5WSe7M/gOhh2u/EIoxDmDxSW6QXilkagiNDl+2//V6XFot1
	bM/n1vE4kEyyv9t2kVoPWo3T4uxbICziTjjIBIp2YVFOMY2zyVwDuy2RriT97UxQR6Ikc7
	Nnpbg5UpX3etO6EOIDZ4WHQgBEku34/Je28eoqOg9WGh54nO1JYmTQZFeu/tYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Qing Wu <ses1er@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spinand: dosilicon: Add support for additional
 models
In-Reply-To: <20260527130754.10867-1-ses1er@gmail.com> (Qing Wu's message of
	"Wed, 27 May 2026 09:07:54 -0400")
References: <20260527130754.10867-1-ses1er@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 11 Jun 2026 09:18:40 +0200
Message-ID: <87ldcl8rzj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_001849_012271_7941E7CB 
X-CRM114-Status: UNSURE (   4.59  )
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

SGksCgpPbiAyNy8wNS8yMDI2IGF0IDA5OjA3OjU0IC0wNCwgUWluZyBXdSA8c2VzMWVyQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciBhZGRpdGlvbmFsIERvc2lsaWNvbiBTUEkg
TkFORCBjaGlwcy4KPgo+IERhdGFzaGVldHMgZm9yIGNoaXBzIGluY2x1ZGVkIGluIHRoaXMgcGF0
Y2g6IGh0dHBzOi8vd3d3LmRvc2lsaWNvbi5jb20vU1BJJTIwTkFORCUyMEZsYXNoLmh0bWwKPgo+
IFRlc3RlZCBvbiBhIFRQLUxpbmsgVEwtN0RSNzI1MCB3aXRoIGEgRG9zaWxpY29uIERTMzVRMUdC
ICgweEU1IDB4RjEpCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaW5nIFd1IDxzZXMxZXJAZ21haWwuY29t
Pgo+IC0tLQoKUGxlYXNlIHJ1biBjaGVja3BhdGNoLnBsLCB0aGVyZSBhcmUgb2J2aW91cyBpc3N1
ZXMgeW91IGRpZG4ndCBhZGRyZXNzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
