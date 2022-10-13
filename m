Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D8C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Oct 2022 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZ8XM9NLQQb4UVJBTHocMozTY4QGc3gJbAvGNea/IY0=; b=EMZxlyAfDmIaJg
	i6bvBCSA/f3VU0wFwQUydj5vwltdDBYSYyyljvdFyvOO6dr4Vjfvb7LVE1DO7H7UNZ10WMp39mXuo
	0Z4BR5xhWllKPQ5rF77qObtRWYl01CEEGgL3ura0JCo2se2hfKEJEOR4UoBA6qsuEY1LZ9BxGrNZc
	jW7AqHlGH3wR2WGVAlfGxPj3XxxBq7KpGVTQpJNROH5tBXvfeLGXEpVI4HIKQhKdCyGNe4MCYe5WW
	49q6bBGbR9WacufzMhod3ENGj6H97FkYHgx++bY57xgWk1LTv/JPno7IMly2J57McGAzTdXF8rvLP
	7eLZFcDAkOPfzeYUEuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwvj-00BctK-Dv; Thu, 13 Oct 2022 12:03:15 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwvg-00Bcrv-CX
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2022 12:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665662593;
  x=1697198593;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1MGxMelD5CFcZq+j5DA3eIwTyqIy+c7LP8tUQGlyWSY=;
  b=haFEDWz2M0PyV/6bgh1ZuHWawtrW90XvFZCrpwy01UTTUbdqWxJ7jgS2
   4O0/lfnHUzX/AOIrWF8agJ3N2SRbSVNzAFBF0hzjMdndA4Is7PGYoheUN
   Bc58ICvOOSJ4QpLdSRkE1WUvVsnr2CrXhzzMtM/m0G8HgSiIaT6cIMLlZ
   Gc8Uwz1kP9A+c86SWS4m3mmApUhHr2hSy4mzEgGeUkizVHSCVwmJf4Qek
   wUpjHdAJLGPIvlEuVWpTDa+VIJRAX62/CxecpEF3UJKFfigi1/9rZWH+d
   Qec+VXbGthR2U2Ya9ipGKZ7hIsrXvQsgxNXO6cq8OEis7CbqpoN1H0zm9
   Q==;
From: =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<kernel@axis.com>, =?UTF-8?q?M=C3=A5rten=20Lindahl?=
	<marten.lindahl@axis.com>
Subject: [PATCH] ubi: block: Reduce warning print to info for static volumes
Date: Thu, 13 Oct 2022 14:02:49 +0200
Message-ID: <20221013120249.738375-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_050312_915899_57E414C8 
X-CRM114-Status: UNSURE (   9.82  )
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

SWYgdm9sdW1lIHNpemUgaXMgbm90IG11bHRpcGxlIG9mIHRoZSBzZWN0b3Igc2l6ZSA1MTIgYSB3
YXJuaW5nIGlzCnByaW50ZWQgc2F5aW5nIHRoYXQgdGhlIGxhc3Qgbm9uLXNlY3RvciBhbGlnbmVk
IGJ5dGVzIHdpbGwgYmUgaWdub3JlZC4KClRoaXMgc2hvdWxkIGJlIHZhbGlkIGZvciByZXNpemFi
bGUgdm9sdW1lcywgYnV0IHdoZW4gY3JlYXRpbmcgc3RhdGljCnZvbHVtZXMgd2hpY2ggYXJlIHJl
YWQgb25seSB0aGlzIHdpbGwgYWx3YXlzIGJlIHByaW50ZWQgZXZlbiBpZiB0aGUKdW5hbGlnbmVk
IGRhdGEgaXMgZGVsaWJlcmF0ZS4KClRoZSBtZXNzYWdlIGlzIHN0aWxsIHZhbGlkIGJ1dCB0aGUg
c2V2ZXJpdHkgc2hvdWxkIGJlIGxvd2VyZWQgZm9yIHN0YXRpYwp2b2x1bWVzLgoKU2lnbmVkLW9m
Zi1ieTogTcOlcnRlbiBMaW5kYWhsIDxtYXJ0ZW4ubGluZGFobEBheGlzLmNvbT4KLS0tCiBkcml2
ZXJzL210ZC91YmkvYmxvY2suYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9i
bG9jay5jIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKaW5kZXggNGNmNjdhMmEwZDA0Li5kZmNi
OTQ3ZmJmYzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCisrKyBiL2RyaXZl
cnMvbXRkL3ViaS9ibG9jay5jCkBAIC0zNTQsOSArMzU0LDEyIEBAIHN0YXRpYyBpbnQgY2FsY19k
aXNrX2NhcGFjaXR5KHN0cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpLCB1NjQgKmRpc2tfY2FwYWNp
dHkpCiAJdTY0IHNpemUgPSB2aS0+dXNlZF9ieXRlcyA+PiA5OwogCiAJaWYgKHZpLT51c2VkX2J5
dGVzICUgNTEyKSB7Ci0JCXByX3dhcm4oIlVCSTogYmxvY2s6IHZvbHVtZSBzaXplIGlzIG5vdCBh
IG11bHRpcGxlIG9mIDUxMiwgIgotCQkJImxhc3QgJWxsdSBieXRlcyBhcmUgaWdub3JlZCFcbiIs
Ci0JCQl2aS0+dXNlZF9ieXRlcyAtIChzaXplIDw8IDkpKTsKKwkJaWYgKHZpLT52b2xfdHlwZSA9
PSBVQklfRFlOQU1JQ19WT0xVTUUpCisJCQlwcl93YXJuKCJVQkk6IGJsb2NrOiB2b2x1bWUgc2l6
ZSBpcyBub3QgYSBtdWx0aXBsZSBvZiA1MTIsIGxhc3QgJWxsdSBieXRlcyBhcmUgaWdub3JlZCFc
biIsCisJCQkJdmktPnVzZWRfYnl0ZXMgLSAoc2l6ZSA8PCA5KSk7CisJCWVsc2UKKwkJCXByX2lu
Zm8oIlVCSTogYmxvY2s6IHZvbHVtZSBzaXplIGlzIG5vdCBhIG11bHRpcGxlIG9mIDUxMiwgbGFz
dCAlbGx1IGJ5dGVzIGFyZSBpZ25vcmVkIVxuIiwKKwkJCQl2aS0+dXNlZF9ieXRlcyAtIChzaXpl
IDw8IDkpKTsKIAl9CiAKIAlpZiAoKHNlY3Rvcl90KXNpemUgIT0gc2l6ZSkKLS0gCjIuMzAuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
