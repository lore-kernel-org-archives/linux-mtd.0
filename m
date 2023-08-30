Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCFEC83F15
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUBZ7Je8FpIJ8mUnnloHfvED7sS0IYeBswdk3KMaWOs=; b=Zk8s60Y5qMGB8g
	c6BUVQKZB+tIPzhk16GlA7JwNwriFesn7iiW7rgofC/2tYWMvARgAhvSzAeN8vBcBHvRaQipTY8hh
	M/Ddq2tI3/YARyzF4FuYM46rRbBEJxLJZDT29pElP4btecjhTX8SeMXMdQKkGJIOlc3TRN0y6JR8N
	s/vLj5pTbAE1JEcw9ICkwdm5YeaWxSwyPYHUx3aLa/pNY4JGNz0g2EVPfRg+hq3yY3vnKR3p+4Kiq
	Sji1HRVAKOm1yfs6ld42dQmAw2IZ/yzdxhDtl2FSjOWJmMqF5R2FwKLrePdFRy9/LaXYyuebj961s
	7RM+CNpprvD1T2lep0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFzY-00D2b6-1b;
	Wed, 30 Aug 2023 07:51:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFzV-00D2aA-2s
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 07:51:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2915860ADB;
	Wed, 30 Aug 2023 07:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01ED4C433C7;
	Wed, 30 Aug 2023 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693381912;
	bh=xlEmr/yuZsJY9ofkrEANJIvbRZu2g9tn4/DEKXSc+cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYZBT+LnaXrhkD6DAlwpYzcOkG1wx9BN0w0QFMdS7NZFif5UW+m6UQb23ck6otqjj
	 ftmYGmHRSRdML3l+q1XDyjSOl5B9vPZh7PGecNALB8Hlt7K3aEmGS18a2PFoPUpoMh
	 SUbYBE9oPaaEXMhiohPktHn7RjhNodaKLC7fk6IHFqayvo6BM98YpeMYaimEQlT2QV
	 2OCOuLM6+Hq28iwCAWJITT6xfZgq0fWtvR2zX8XWb/ACoQRjDWWfC564xKh5wdlQU4
	 /FmjR+x5SPridfPh32qQ8f2w8TLxX+c8WrUeWWurpGtL2MApVG/NqLYsnMqhFeVbDL
	 qbB7H9gsH87Kg==
Date: Wed, 30 Aug 2023 09:51:43 +0200
From: Christian Brauner <brauner@kernel.org>
To: hch <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830-giftig-stechen-efe4b54b1599@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
 <20230829-alpinsport-abwerben-4c19ebb9a437@brauner>
 <340229452.1869458.1693328104443.JavaMail.zimbra@nod.at>
 <20230830061345.GA17785@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830061345.GA17785@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_005153_977917_A1215699 
X-CRM114-Status: GOOD (  16.38  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMDg6MTM6NDVBTSArMDIwMCwgaGNoIHdyb3RlOgo+IE9u
IFR1ZSwgQXVnIDI5LCAyMDIzIGF0IDA2OjU1OjA0UE0gKzAyMDAsIFJpY2hhcmQgV2VpbmJlcmdl
ciB3cm90ZToKPiA+IFdoYXQgdHJlZSBkb2VzIHRoaXMgcGF0Y2ggYXBwbHkgdG8/IGxpbnV4LW5l
eHQ/Cj4gPiBJIGdhdmUgaXQgYSBxdWljayB0cnkgb24gTGludXMnIHRyZWUgYnV0IGl0IGZhaWxl
ZCB0b286Cj4gPiAKPiA+IGZzL3N1cGVyLmM6IEluIGZ1bmN0aW9uIOKAmGdldF90cmVlX2JkZXbi
gJk6Cj4gPiBmcy9zdXBlci5jOjEyOTM6MTk6IGVycm9yOiDigJhkZXbigJkgdW5kZWNsYXJlZCAo
Zmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYYmRlduKAmT8KPiA+
ICAgcyA9IHNnZXRfZGV2KGZjLCBkZXYpOwo+ID4gICAgICAgICAgICAgICAgICAgIF5+fgo+ID4g
ICAgICAgICAgICAgICAgICAgIGJkZXYKPiA+IGZzL3N1cGVyLmM6MTI5MzoxOTogbm90ZTogZWFj
aCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1
bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiAKPiBTaG91bGQgYmUgYWdhaW5zdCB0aGUgbGF0ZXN0IExp
bnVzIHRyZWUgYWZ0ZXIgdGhlIG1lcmdlIG9mIHRoZSB2ZnMKPiBicmFuY2hlcyB5ZXN0ZXJkYXku
CgpJIHdvdWxkIHN1Z2dlc3QgdG8ganVzdCBwdWxsIGl0IGZyb206Cmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Zmcy92ZnMuZ2l0IGI0L3Zmcy1zdXBlci1t
dGQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
