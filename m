Return-Path: <SRS0=aZxi=VE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BC4C48BDE
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2019 21:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6918E20684
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2019 21:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4lwI649";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pvBae38m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6918E20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDni5ikxFMw4jGjU7zxAHy4QfUeLzOw1lJkrK1tOXNM=; b=P4lwI649roUyka
	An0XzwGLgvB8uH1G2G5xFCZZjHYM7gCMLDTFh2kQdb8z4w8FvCL3rUeu3eFq1ZjCs3+JvKShBsF5l
	EnbAG22djqFFRwci7M7O1TpbeOPmbfPYLYUN+afGXqK7iEXxl9y/3FEtNe9RO7u4s+SrRGZGsqPYK
	7SpE+mBnZgueLl+TMebhugBV96O8HsP0SoMc9LH6lZbxEYP2I6RklpwkgLGxipBRjlZS/8wyJ37F/
	5Uz4tHHp1b9aTXxhznWO9KXcn4LM8pQIzl5/ylUnGWPnmhxJU+rw8k/spjtO0gdXMK0J2/kcnDoTS
	w3LcHHGJD6g/7n99HBxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkEGf-0004hs-Io; Sun, 07 Jul 2019 21:00:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkEGe-0004hd-07
 for linux-mtd@bombadil.infradead.org; Sun, 07 Jul 2019 21:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GQfRYS+Lvwyd/H6mr2zx6OT/dFcxnyJoK3DJpF6rA+8=; b=pvBae38m0r5hvpH8GMAoBzAZQZ
 HvllKl+1+MmTHpyn8wvDSs0k7Ggc4CGQkfqMK6yGn3ZS3JztYzXCqljDigfEeWiaTk4S5vx7j0s+U
 qWUe7PoGPByoZ2cnOLWeHammDaPT0NWFBcfh+xE5qzN+KZOCx23dSzfQymc2E3+1ZMjcf483yWbAQ
 By/D2fZuwM7YO7tYL35tneZGzVW9oldIPondDVrRphCcE31otcpcYGKTWCriQmJH8hOpNu1TvmekJ
 LbTbgzHs1ABkz9GcbN7ae0wGmnQObgNX4x8z/6S9hQeCJBkh1P66Y7Zfw/F28bRIbo1lcYcsGSQFv
 RJBGleDQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkEGg-0004iY-U5
 for linux-mtd@lists.infradead.org; Sun, 07 Jul 2019 21:00:20 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D897960003;
 Sun,  7 Jul 2019 20:59:23 +0000 (UTC)
Date: Sun, 7 Jul 2019 22:59:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [GIT PULL v2] mtd: spi-nor: Changes for 5.3
Message-ID: <20190707225921.241deb01@xps13>
In-Reply-To: <166a1e4f-9ed0-ade5-cae4-841fa97036ce@microchip.com>
References: <166a1e4f-9ed0-ade5-cae4-841fa97036ce@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190707_220019_025129_EE21AE1A 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, marek.vasut@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgo8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tPiB3cm90ZSBvbiBGcmksIDI4
IEp1biAyMDE5IDA5OjAwOjMyICswMDAwOgoKClsuLi5dCgo+IAo+IFRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgYTE4ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJk
OToKPiAKPiAgIExpbnV4IDUuMi1yYzEgKDIwMTktMDUtMTkgMTU6NDc6MDkgLTA3MDApCj4gCj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBzc2g6Ly9naXRA
Z2l0b2xpdGUua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4Lmdp
dCB0YWdzL3NwaS1ub3IvZm9yLTUuMy12Mgo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA4ZDEzMzZjMjQxYmRhZGY2MWE1NmUzOThkODJkMWU1MTJkYmZmNWY4Ogo+IAo+ICAgbXRk
OiBzcGktbm9yOiBjYWRlbmNlLXF1YWRzcGk6IGFkZCByZXNldCBjb250cm9sICgyMDE5LTA2LTI3
IDE3OjE4OjEzICswMzAwKQoKUHVsbGVkLCB0aGFua3MhCgpNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
