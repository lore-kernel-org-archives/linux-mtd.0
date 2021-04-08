Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35C6C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 15:50:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F59A61132
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 15:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F59A61132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eXSpoCuXeTJGGmvFIPuJJSd+KwwUEf+ixwpFCDxWccQ=; b=BESGdLcZ1nm5nthGOe7V6O3ls
	SSWIxRikd+zGcvZKFwgattW6IYmyivLUMuV2XByttApBxQKeXC499oUTtUAJFTol56KNoxC9HfA3Z
	TofR1F9uqV/ifzm7hfE8rFfU6aQBJTNNR0GYnIU/D+NQV3FbYzR4/g3OcdpF1Kr7vfZwodAvcJ99V
	IinHlc+5Ti3jY1dhlETOJxNzNEiIF1RXLoorpJPImSmrV0u0i5/+gWI1mS0on7YCAe6fNpGQa0QPH
	uaO++meHmIS9alYrHw5wmGu3nw/782IKlubTQ94G3UtfQmORoHG4MXNMe/C9QJ5LclVGbFqcuuGWz
	lSaE5E8kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWuU-008Uxm-0u; Thu, 08 Apr 2021 15:49:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWuP-008Uvu-9o
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 15:49:31 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B281DC0016;
 Thu,  8 Apr 2021 15:49:24 +0000 (UTC)
Date: Thu, 8 Apr 2021 17:49:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
Message-ID: <20210408174922.55c1149f@xps13>
In-Reply-To: <CAFr9PXk-PNWBa9VPriP3nLUqdhtm6uPnbG3n4_rRCdF5YvS7OQ@mail.gmail.com>
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
 <20210323113233.3523d66b@xps13>
 <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
 <20210323150603.6b942a60@xps13>
 <CAFr9PXntCmdrmg+i3BB1j-aY4VbE=2iqyLcoSr9cX2090jGiGQ@mail.gmail.com>
 <20210407100204.08d894ca@xps13>
 <CAFr9PXk-PNWBa9VPriP3nLUqdhtm6uPnbG3n4_rRCdF5YvS7OQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_164929_542852_8164E707 
X-CRM114-Status: GOOD (  16.11  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBXZWQs
IDcgQXByIDIwMjEgMjE6MDE6MDEgKzA5MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBXZWQsIDcg
QXByIDIwMjEgYXQgMTc6MDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+ID4gWW91IG1heSBsb29rIGF0IG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKCkg
aGVscGVyIHRvIGd1aWRlIHlvdS4gQnV0Cj4gPiBJTUhPLCBpZiB0aGVyZSBhcmUgMC0zIGJmLCB5
b3Ugc2hvdWxkIHByb2JhYmx5IGFzc3VtZSB0aGVyZSB3ZXJlIDMgYmYKPiA+IGFuZCByZXR1cm4g
MywgaWYgdGhlcmUgd2VyZSA0LCByZXR1cm4gNCwgaWYgaXQncyB1bmNvcnJlY3RhYmxlIHJldHVy
bgo+ID4gLUVCQURNU0cgb3RoZXJ3aXNlIC1FSU5WQUwuICAKPiAKPiBVbmRlcnN0b29kLgo+IAo+
ID4gV2Ugc2hvdWxkIHZlcmlmeSB0aGF0IHRoaXMgZG9lcyBub3QgbWVzcyB3aXRoIFVCSSB3ZWFy
IGxldmVsaW5nCj4gPiB0aG91Z2guIFBsZWFzZSBjaGVjayB0aGF0IHJldHVybmluZyAzLWJpdCBl
cnJvcnMgbm8gbWF0dGVyIHRoZQo+ID4gYWN0dWFsIG51bWJlciBvZiBmbGlwcGVkIGJpdHMgZG9l
cyBub3QgbGVhZCBVQkkgdG8gbW92ZSB0aGUgZGF0YSBhd2F5Cj4gPiAoSSB0aGluayBpdCdzIGZp
bmUgYnV0IHdlIG5lZWQgdG8gYmUgc3VyZSBvdGhlcndpc2UgdGhlIGltcGxlbWVudGF0aW9uCj4g
PiBwcm9wb3NhbCBpcyBub3QgdmFsaWQpLiAgCj4gCj4gT2suIEknbSBub3Qgc3VyZSBob3cgdG8g
Y2hlY2sgdGhhdCB5ZXQgYnV0IEknbGwgbG9vayBpbnRvIGl0Lgo+IAoKWW91IGNhbiBwcm9iYWJs
eSBjaGVjayB0aGUgdGhyZXNob2xkIGluIHN5c2ZzCigvc3lzL2NsYXNzL210ZC9tdGRYLyp0aHJl
c2hvbGQqKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
