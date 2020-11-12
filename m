Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294FAC2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 08:28:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8938C20870
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 08:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/ecXgOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8938C20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Y0no4W8FRC8O/Uz1N2DeHWW6nAipC5kQfQNyHyH5E4=; b=F/ecXgOvpWi/h1l+VTC12LW2b
	9wgq3iE7nD+lTLFmsHcIIwh9W/O39qGXcpcds0qLURudSns5wRlsltEKOTEqBeM0ur7vfVX/XJeaC
	qwFpSzPFL6nAXPLrZ1H3QO01BZOmpGLvKxCzofEGdXtsbkeETglHcta/0SW/zVclh/3I1RQSilJEP
	RxOFI81QVynGTyD44KoIhwME1BNtVH6oxEkE0zAF/kj8Uo1YJwAn2P46qjfSMlBFj8CzmRbZrOwtJ
	bnFm+r+0clJSmPsvUDJ3/aJmadc6ypRRK06OpI6I0GwwrcZQs+sZBKYD3uvVPvTQ9cmmMwackgiiQ
	UnvobyWBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd7x1-0005VU-IZ; Thu, 12 Nov 2020 08:27:27 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7wx-0005UM-QD
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 08:27:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C3B37FF812;
 Thu, 12 Nov 2020 08:27:16 +0000 (UTC)
Date: Thu, 12 Nov 2020 09:27:15 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <20201112092715.7e466405@xps13>
In-Reply-To: <20201111192259.ovdyjcuue7fx2bqa@mobilestation>
References: <202011021254.XC70BaQT-lkp@intel.com>
 <20201110113827.hl5i27cpl6exo3md@mobilestation>
 <20201110163556.3e3423f6@xps13>
 <20201111192259.ovdyjcuue7fx2bqa@mobilestation>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_032724_038212_ED6EC28D 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: linux-mtd@lists.infradead.org, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2V5LAoKU2VyZ2UgU2VtaW4gPFNlcmdleS5TZW1pbkBiYWlrYWxlbGVjdHJvbmljcy5y
dT4gd3JvdGUgb24gV2VkLCAxMSBOb3YKMjAyMCAyMjoyMjo1OSArMDMwMDoKCj4gT24gVHVlLCBO
b3YgMTAsIDIwMjAgYXQgMDQ6MzU6NTZQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+
IEhpIFNlcmdlLAo+ID4gCj4gPiBTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0
cm9uaWNzLnJ1PiB3cm90ZSBvbiBUdWUsIDEwIE5vdgo+ID4gMjAyMCAxNDozODoyNyArMDMwMDoK
PiA+ICAgCj4gPiA+IEhlbGxvIE1pcXVlbCwKPiA+ID4gCj4gPiA+IEEgc2l0dWF0aW9uIG5vdGVk
IGJ5IHRoZSB3YXJuaW5nIGJlbG93IHdvbid0IGNhdXNlIGFueSBwcm9ibGVtIGJlY2F1c2UKPiA+
ID4gdGhlIGNhc3RpbmcgaXMgZG9uZSB0byBhIG5vbi1kZXJlZmVyZW5jZWQgdmFyaWFibGUuIEl0
IGlzIHV0aWxpemVkCj4gPiA+IGFzIGEgcG9pbnRlciBiaWFzIGxhdGVyIGluIHRoYXQgZnVuY3Rp
b24uIFNoYWxsIHdlIGp1c3QgaWdub3JlIHRoZQo+ID4gPiB3YXJuaW5nIG9yIHN0aWxsIGZpeCBp
dCBzb21laG93PyAgCj4gPiAgIAo+IAo+ID4gRG8geW91IHRoaW5rIHRoZSBjYXN0IHRvIGEgIV9f
aW9tZW0gdmFsdWUgaXMgbWFuZGF0b3J5IGhlcmU/ICAKPiAKPiBJdCdzIG5vdCBtYW5kYXRvcnkg
dG8gaGF2ZSB0aGUgY2FzdGluZyB3aXRoIG5vIF9faW9tZW0sIGJ1dCB3b3VsZG4ndAo+IGRvaW5n
IGxpa2UgdGhpczoKPiArIAlzaGlmdCA9IChzc2l6ZV90IF9faW9tZW0pc3JjICYgMHgzOwo+IGJl
IGxvb2tpbmcgd2VpcmQ/IFJlYWxseSwgaXMgdGhlcmUgYSBnb29kIHdheSB0byBzb21laG93IGV4
dHJhY3QgdGhlIGZpcnN0Cj4gdHdvIGJpdHMgb2YgYSBfX2lvbWVtIHBvaW50ZXIgd2l0aG91dCBn
ZXR0aW5nIHRoZSBzcGFyc2Ugd2FybmluZz8KCkkgYXNrZWQgYXJvdW5kIG1lLCB3aGF0IGFib3V0
IHRyeWluZyB1aW50cHRyX3Q/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
