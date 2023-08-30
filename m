Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C74C83F01
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkA7MuGCPi4EWPsWnsJ9dvYF90i4sw28yFEvrRTMaqw=; b=kkhV6YSufsS1gO
	NI8dOfa73B7iWBpMQJgoY7YVKaq9Guu2qg0pxLxUUfjlYMSbxdgpJ+FXL5+twO/H4YsYNUy/LeUvy
	nshaaFx1C4FMrALiqzM41CQNVDcTPeWH5lMl3V8sHdrrfC5xA3JFOcasWR8RG2hAeQjW+9QLaHEEs
	6B+Jwpz64/i0BI7yBczguResFucpvgXkOLSfYubP4jfNXQ3KYJ9od/L2e4C25dFRWO+0mPXrsVeKt
	Q7pYaBlGaTwm6MsUpoYlznu9VUpSzME1aKnIuAI9oCUgMUSFkrBXWfoHqNTuT1+hziari/KWkHGQ6
	DuWghmaJwudfxUUHHtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbESj-00Cty7-0M;
	Wed, 30 Aug 2023 06:13:57 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbESf-00CtwM-2S
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 06:13:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 054CF6732D; Wed, 30 Aug 2023 08:13:46 +0200 (CEST)
Date: Wed, 30 Aug 2023 08:13:45 +0200
From: hch <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: Christian Brauner <brauner@kernel.org>, hch <hch@lst.de>,
	Jan Kara <jack@suse.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830061345.GA17785@lst.de>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org> <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org> <20230829-alpinsport-abwerben-4c19ebb9a437@brauner> <340229452.1869458.1693328104443.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <340229452.1869458.1693328104443.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_231353_945799_4B35B9E1 
X-CRM114-Status: GOOD (  13.91  )
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

T24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMDY6NTU6MDRQTSArMDIwMCwgUmljaGFyZCBXZWluYmVy
Z2VyIHdyb3RlOgo+IFdoYXQgdHJlZSBkb2VzIHRoaXMgcGF0Y2ggYXBwbHkgdG8/IGxpbnV4LW5l
eHQ/Cj4gSSBnYXZlIGl0IGEgcXVpY2sgdHJ5IG9uIExpbnVzJyB0cmVlIGJ1dCBpdCBmYWlsZWQg
dG9vOgo+IAo+IGZzL3N1cGVyLmM6IEluIGZ1bmN0aW9uIOKAmGdldF90cmVlX2JkZXbigJk6Cj4g
ZnMvc3VwZXIuYzoxMjkzOjE5OiBlcnJvcjog4oCYZGV24oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJkZXbigJk/Cj4gICBzID0gc2dl
dF9kZXYoZmMsIGRldik7Cj4gICAgICAgICAgICAgICAgICAgIF5+fgo+ICAgICAgICAgICAgICAg
ICAgICBiZGV2Cj4gZnMvc3VwZXIuYzoxMjkzOjE5OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRl
bnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFy
cyBpbgoKU2hvdWxkIGJlIGFnYWluc3QgdGhlIGxhdGVzdCBMaW51cyB0cmVlIGFmdGVyIHRoZSBt
ZXJnZSBvZiB0aGUgdmZzCmJyYW5jaGVzIHllc3RlcmRheS4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
