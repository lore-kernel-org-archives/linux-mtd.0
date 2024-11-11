Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280E6D3ABF6
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDp0jxcVWiIbQHbzKWsnOc2MbGbAcXjj2bkQAVtYz4k=; b=uIoceH/KdSfx5I
	Bz4qTnLZFS3/zWEImu0OkELdZRpf7Ez4KakVm8ZBDEfS1cdXM1rwY97jAodQPOk+4cDdPxXr5hqku
	6qu2ngVPNcl57K/gPBmDNGppKWfoOsvrUJO/JHapLRdOsauJopnvlObzelqp5TNPs2Mv/1NYCZK3L
	qAJr4NDOZzkr3pXka9llSh5dMor1lZWJPRzRe5sQzpvqwvdUajVZg8YzVrC6TqCXDsZE9jQZkMz+e
	0GX4zsTnb62MiWO1FmiFk2uUsfmqtT2b6ag0/5YTvMVPS4a9uc+GuQXUliMUV9EFbZKeq51t3CD0R
	c08d5STtb+swLJFGtM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb0j-00000001Bv9-3Pos;
	Mon, 11 Nov 2024 20:27:45 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb0h-00000001BtG-1QUv
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 20:27:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1497F20003;
	Mon, 11 Nov 2024 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731356860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xq9A5l1i9Igv1/7m4w9nDZzIX3x5k17d5L7FGPm2Dw=;
	b=ofLOlyzNIds6ghTysRaYefoQ/z63D8cK21p0RetzdsuNqG0btKw7ivJnvxeltPe6YSDwDE
	x/o04SiiiPXBU5F+QGqR1t1HfAPswzOsII8N7VlyTinZDHYTM3CvMazrK1gMVyNH+fDo8Y
	Fd3sZqrwIQQ1bqLsl57VQLwzT/y8o2TtjvsdXEXK6FbgkLWaQjE//0//AO+17qznrUWt03
	wZhltzUMD8Fv0Lao+7Ms7c3EVfCXELA14BIhkC/dyihvZeKyD6gmnokskqpUlzPwh449Gg
	EVHp4STgwKh+iDvtQoAb4zJwN7WtJ2Qj1ECB8cswqBQWAzN0m1epZKHohYSLkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,  "Gupta, Anshuman"
 <anshuman.gupta@intel.com>,  "Deak, Imre" <imre.deak@intel.com>,  Richard
 Weinberger <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <CY5PR11MB6366051E35678864805BC89CED582@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Mon, 11 Nov 2024 11:29:47 +0000")
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
	<20241022104119.3149051-7-alexander.usyskin@intel.com>
	<Zx-mPQSHXv5Teq_j@intel.com>
	<CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
	<CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
	<Zyk5kueKlusKlwqM@intel.com>
	<CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
	<Zy1EAIPEaY8Wlh-h@intel.com>
	<CY5PR11MB6366769459115688B8AA100AED5F2@CY5PR11MB6366.namprd11.prod.outlook.com>
	<CY5PR11MB6366051E35678864805BC89CED582@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 21:27:37 +0100
Message-ID: <87msi5o6rq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_122743_809371_38B44414 
X-CRM114-Status: GOOD (  23.72  )
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

SGkgQWxleGFuZGVyLAoKUGxlYXNlIHJlZHVjZSB0aGUgY29udGV4dCB3aGVuIGFuc3dlcmluZywg
b3RoZXJ3aXNlIGl0J3MgaGFyZCB0byBmaW5kCmFsbCBwbGFjZXMgd2hlcmUgeW91IGNvbW1lbnRl
ZC4KCj4+ID4gPiA+IFRoYXQncyB0aGUgcGFydCB0aGF0IEknbSBub3Qgc3VyZSBpZiBJIGFncmVl
LiBpZiBJIHJlbWVtYmVyIGZyb20gc29tZQo+PiA+ID4gPiBleHBlcmltZW50cyBpbiB0aGUgcGFz
dCwKPj4gPiA+ID4gd2hlbiB5b3UgY2FsbCB0byB3YWtlIHVwIHRoZSBjaGlsZCwgdGhlIHBhcmVu
dCB3aWxsIHdha2V1cCBmaXJzdCBhbnl3YXkuCj4+ID4gPiA+Cj4+ID4gPiBUaGUgY2hpbGQgKG10
ZCBkZXZpY2UpIGRvZXMgbm90IGV4aXN0IGF0IHRoaXMgcG9pbnQgb2YgdGltZS4KPj4gPiA+IFRv
IGNyZWF0ZSBNVEQgZGV2aWNlLCB0aGUgcGFydGl0aW9uIHRhYmxlIHNob3VsZCBiZSBwcm92aWRl
ZAo+PiA+ID4gYW5kIGl0IHJlYWQgZGlyZWN0bHkgZnJvbSBmbGFzaCB0aGF0IHNob3VsZCBiZSBw
b3dlcmVkIHRvIGRvIHJlYWQuCj4+ID4KPj4gPiBJIGRvbid0IHVuZGVyc3RhbmQuLi4geW91IGhh
dmUgdGhlIG10ZC0+ZGV2IGF0IHRoaXMgcG9pbnQuLi4gdGhpcyBpcwo+PiA+IHRoZSBvbmUgeW91
IHNob3VsZCBiZSB0b3VjaGluZywgbm90IHRoZSBtdGQtPmRldi5wYXJlbnQuLi4gZXZlbiBhdCB0
aGUKPj4gPiBwcm9iZSwgYnV0IG1vcmVvdmVyIG9uIGV2ZXJ5d2hlcmUgZWxzZSBhcyB3ZWxsLgo+
PiA+Cj4+IAo+PiBBdCB0aGUgcHJvYmUgdGltZSBJIGRvIG5vdCBoYXZlIGRldi0+bXRkLCBidXQg
bm93IEkgc2VlIHlvdSBwb2ludCBoZXJlLgo+PiBJJ2xsIHNlcGFyYXRlIHBvd2VyIG1hbmFnZW1l
bnQ6Cj4+IC0gcHJvYmUgYmVmb3JlIGRldi0+bXRkIGNyZWF0aW9uIHdpbGwgdXNlIGF1eF9kZXYt
PmRldiAodGhhdCB3aWxsIGJlIG10ZC0KPj4gPmRldi5wYXJlbnQgbGF0ZXIpCj4+IC0gbXRkIGZ1
bmN0aW9ucyB3aWxsIHVzZSBtdGQtPmRldgo+PiAKPj4gSXMgdGhpcyB0aGF0IHlvdSBoYXZlIGlu
IG1pbmQ/Cj4KPiBJJ3ZlIHRyaWVkIGl0IGFuZCBmb3VuZCBvdXQgdGhhdCBtdGQtPmRldiBpcyBu
b3QgaW5pdGlhbGl6ZWQgaWYgcGFydGl0aW9ucyBhcmUgcHJlc2VudCBbMV0uCj4gTWlxdWVsIC0g
dGhpcyBtYXkgYmUgdGhlIHJlYXNvbiB3aHkgb3RoZXIgbXRkIGRyaXZlcnMgdXNlIHBjaSBvciBw
bGF0Zm9ybQo+IGRldmljZXMgdG8gbWFuYWdlIHJ1bnRpbWUgcG0uCj4gT3IgSSBoYXZlIG1pc3Nl
ZCBzb21ldGhpbmc/CgpQbGVhc2Uga2VlcCBpbiBtaW5kIHRoZXJlIGlzIF9hIGxvdF8gb2YgaGlz
dG9yeSBiZWhpbmQgbXRkLCBhbmQKc29tZXRpbWVzIGNob2ljZXMgZnJvbSB0aGUgcGFzdCBjYW5u
b3QgYmUgc2ltcGx5ICJmaXhlZCIgd2l0aG91dApicmVha2luZyB1c2Vyc3BhY2UuIFRoZSBwcm9i
bGVtIHdpdGggbXRkIGlzIHRoYXQgdGhlICJtdGQiIHN0cnVjdHVyZQpkZWZpbmVzIG5vdGhpbmcg
d2l0aCBwcmVjaXNpb24uIEl0IG1heSBiZSBhIGNvbnRyb2xsZXIsIGEgY2hpcCwgYQpwYXJ0aXRp
b24sIG9yIHdoYXRldmVyIG1peCBvZiB0aG9zZS4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIEkg
YmVsaWV2ZQp5b3UgYXJlIG1lbnRpb25pbmcgdGhlIEtFRVBfUEFSVElUSU9ORURfTUFTVEVSIGNv
bmZpZ3VyYXRpb24sIHdoaWNoIGJ5CmRlZmF1bHQgaXMgdW5zZXQsIHdoaWNoIG1lYW5zIHlvdSds
bCBsb29zZSB0aGUgInRvcCBsZXZlbCIgbXRkIGRldmljZT8KCkhvd2V2ZXIgaW4gZ2VuZXJhbCBJ
IGJlbGlldmUgdGhlICJmcmFtZXdvcmsiIHN0cnVjdCBkZXZpY2UgaXMgbWF5YmUgbGVzcwpyZWxl
dmFudCB0aGFuIHRoZSAiYnVzIiBzdHJ1Y3QgZGV2aWNlIHdoZW4gaXQgY29tZXMgdG8gcnVudGlt
ZSBQTSwgc28KYWN0dWFsbHkgSSB3b3VsZCBldmVudHVhbGx5IGV4cGVjdCB0aGlzIGRldmljZSB0
byBiZSB1c2VkPwoKPiBbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTIt
cmM2L3NvdXJjZS9kcml2ZXJzL210ZC9tdGRjb3JlLmMjTDEwNzgKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
