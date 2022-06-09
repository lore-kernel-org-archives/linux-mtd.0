Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E2C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kdp5NTDas209Y791vtUh+LvoHXURKirr8VUWIJqyQnE=; b=PoUkhBPYaAdTX7
	O+I+NwWmm8Q/z0HX2YLh7n0y7Rn5alKXWkLoX1Yy5jYLQDUXbhWNmspO0dDfEN+oCede//qL9DCWm
	ZKKX8+nvWfi8gKmBsNTnaWqQomceTOfi47fPaUXqLG0pmgJ9P9Jc+VoXo2mYrttOqYhiahFyBfaHi
	g8L/5Fl1VN31IHa2913Bj5xmmNITZ5+i43XNU2iYLFUQIJbHF9OICmkoOKJzelPMyYuew3k4vnxeq
	Y6NdV9ZSNDon/4bEcHno19ALdhh7Gml7RahMJ/55FE5CnE29KSvsODHIIR2G1lCncw4+TkDMVFRRW
	Air1Es3hZLIa17rYmy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHzP-0023Oo-GK; Thu, 09 Jun 2022 13:14:19 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvZ-0020t9-Is
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:10:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 40FC5FF807;
	Thu,  9 Jun 2022 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITj+D6pf4vtJjIg4YV1QMKa+PIL6lnpS+3b87tjq90M=;
	b=mAkTn72lcLs7xI8y9hbrIHnbX5b18ahqU2B5H+lbYuyxFIdQoaezMhxlGYOqMc5GqppSaX
	wqOnCCaLWC/nPa/NnTnqU1H6GNdll7X8RLDrmc9yOP6VCj8pgDyU0bIOefXuRFzJX8rihP
	ZAIYPo3L08gnZPKBj08D5veCGppkuMjMaBz4IGvfnS94kzCJQoQqawYVEnmbAwvQQhAxDQ
	VkEu4bd2+cV7HXpHP4HyFvMFIUIHP+h946m+wfIoBLUBQSfdmqbTAY0+YJFE/BgtdGhR6S
	6SuVe2ghmdDJORoON1KMf2H4mz/E0xDvs8P1SsNad3Sbw9F7bhqDiZqzObmjmA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtdchar: use kvmalloc() for potentially large allocations
Date: Thu,  9 Jun 2022 15:10:18 +0200
Message-Id: <20220609131018.293486-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516070601.11428-3-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'83208e106a8e8a859110ebb04a5e927ced911afb'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_061021_813881_F29F59B6 
X-CRM114-Status: UNSURE (   9.14  )
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

T24gTW9uLCAyMDIyLTA1LTE2IGF0IDA3OjA2OjAxIFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IG10ZGNoYXJfd3JpdGVfaW9jdGwoKSBjYWxscyBrbWFs
bG9jKCkgd2l0aCB0aGUgJ3NpemUnIGFyZ3VtZW50IHNldCB0bwo+IHRoZSBzbWFsbGVyIG9mIHR3
byB2YWx1ZXM6IHRoZSB3cml0ZSByZXF1ZXN0J3MgZGF0YS9PT0IgbGVuZ3RoIHByb3ZpZGVkCj4g
YnkgdXNlciBzcGFjZSBhbmQgdGhlIGVyYXNlIGJsb2NrIHNpemUgb2YgdGhlIE1URCBkZXZpY2Uu
ICBJZiB0aGUgbGF0dGVyCj4gaXMgbGFyZ2UsIGttYWxsb2MoKSBtYXkgbm90IGJlIGFibGUgdG8g
c2VydmUgc3VjaCBhbGxvY2F0aW9uIHJlcXVlc3RzLgo+IFVzZSBrdm1hbGxvYygpIGluc3RlYWQu
ICBDb3JyZXNwb25kaW5nbHksIHJlcGxhY2Uga2ZyZWUoKSBjYWxscyB3aXRoCj4ga3ZmcmVlKCkg
Y2FsbHMuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9k
LmF0Pgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgS8SZcGllxYQgPGtlcm5lbEBrZW1wbml1LnBs
Pgo+IEFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKQXBwbGll
ZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQv
bGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
