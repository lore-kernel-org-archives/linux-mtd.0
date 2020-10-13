Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4061CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 17:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9991C2536D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 17:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0BBMPRl5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9991C2536D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S+LtE7hR0BoBkD2BhsUxtX+2ujJUMG1PeIoiKoGYiEU=; b=0BBMPRl5kf8MNwHO6+ppVEpwY
	xJkuQIy/MwfrsjGek4jX28kZM4i9reUTh1OTulGu3m78I+tHYvLEr/hqKRbxiW/sijI1tq9KCbQvW
	IFIAObq+Y1/lAH9PFO+5+xwn0avwOalEQUjNC0TELzUwrB4aJfch+dFfaPyeC/JCNrzSEL+gDGLKA
	k0hg+827eGEhp7e9koAZ0hm8sFNBwGWXLM88UPkVxuSS4XtMvLLEOWqIpFUXr72eCY9KNn/xy+r00
	iTEbasa8PQSJj4PiET2uA8LbtgvNYHyr++7YgcN++cg12wC9Ql5DHuNea+9p39kvMRlMs6IhkKMcq
	kw6+Kr4aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSOEP-0004tI-2G; Tue, 13 Oct 2020 17:37:01 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSOEM-0004sJ-P6
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 17:37:00 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0BD961BF207;
 Tue, 13 Oct 2020 17:36:53 +0000 (UTC)
Date: Tue, 13 Oct 2020 19:36:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20201013193652.0c535c7c@xps13>
In-Reply-To: <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de>
 <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_133658_923636_46FDBF5B 
X-CRM114-Status: GOOD (  23.57  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTHVjYXMsCgpMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4gd3JvdGUgb24g
VHVlLCAxMyBPY3QgMjAyMCAxOToxNDoyMQorMDIwMDoKCj4gT24gRG8sIDIwMjAtMTAtMDEgYXQg
MTg6MzkgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4gPiBIaSBNaXF1ZWwsCj4gPiAKPiA+
IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDExOjU4IEFNIE1pcXVlbCBSYXluYWwKPiA+IDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ICAgCj4gPiA+IEkgZm91bmQgYSBib2Fy
ZCAoTlRDIEMuSC5JLlAsIHN1bjVpIFI4IFNvQykgd2l0aCBhIHBhcmFsbGVsIE5BTkQuCj4gPiA+
IAo+ID4gPiB3aXRoIHRoZSBzYW1lIERUIHByb3BlcnRpZXMgYnV0IGEgZGlmZmVyZW50IE5BTkQg
Y29udHJvbGxlciBkcml2ZXIgSQo+ID4gPiBjb3VsZCBub3QgcmVwcm9kdWNlIHRoZSBpc3N1ZS4K
PiA+ID4gCj4gPiA+IEhvd2V2ZXIsIEkgZGlkIHRyaWVkIHdpdGggc29mdCBCQ0ggYW5kIEkgZm91
bmQgYSByZWxhdGVkIGVycm9yIHdoaWNoIEkKPiA+ID4ganVzdCBmaXhlZC4gSSBhbHNvIGdvdCBh
IGJ1ZyByZXBvcnQgZnJvbSBJbnRlbCdzIHJvYm90IHdoaWNoIEkgYWxzbwo+ID4gPiBmaXhlZC4g
UGVyaGFwcyB3aGF0IHlvdSBzZWUgaXMgcmVsYXRlZCAoc3RpbGwgYXJvdW5kIHRoaXMgLT50b3Rh
bCBlbnRyeQo+ID4gPiBub3QgYmVpbmcgc2V0IGF0IHRoZSByaWdodCBtb21lbnQgYXQgcHJvYmUg
dGltZSkuCj4gPiA+IAo+ID4gPiBJZiB0b21vcnJvdydzIHJlcG9ydCBzdGlsbCByZXR1cm5zIGFu
IGVycm9yLCB3ZSB3aWxsIG5lZWQgc29tZW9uZQo+ID4gPiB0byBnZXQgcGh5c2ljYWwgYWNjZXNz
IHRvIHRoZSBkZXZpY2UgdG8gYWRkIGRlYnVnZ2luZyBjb2RlIGFuZCB0cmFjawo+ID4gPiBkb3du
IHRoZSBmYWlsdXJlLiAgCj4gPiAKPiA+IFRoZSBsaW51eC1uZXh0IDIwMjAxMDAxIHJlc3VsdHMg
ZnJvbSB0aGUga2VybmVsY2kgUGVuZ3V0cm9uaXggbGFiIGRpZAo+ID4gbm90IHNob3cgdXAsIHNv
IGxldCdzIHdhaXQgdG8gc2VlIHRoZSBpbXgyNyBib290IGxvZyB0byBiZSBiYWNrIG9ubGluZQo+
ID4gYWdhaW4uICAKPiAKPiBKdXN0IGEgaGVhZHMgdXA6IG91ciBsYWIgd2FzIGJyb2tlbiBmb3Ig
c29tZSB0aW1lIGR1ZSB0byBhIGxvY2FsIGlzc3VlLgo+IEl0J3Mgbm93IGJhY2sgdG8gd29ya2lu
ZyBhbmQgdGhlIGJhY2tsb2cgb2Ygam9icyBpcyBiZWluZyBleGVjdXRlZCBvbgo+IHRoZSBib2Fy
ZHMgcmlnaHQgbm93LCBzbyByZXN1bHRzIHNob3VsZCBzaG93IHVwIGluIHRoZSBuZWFyIGZ1cnR1
cmUuCgpVbmRlcnN0b29kLiBCYXNlZCBvbiB0aGUgcHJldmlvdXMgcmVwb3J0cyBzaGFyZWQgYnkg
RmFiaW8gSSB0cmllZCB0bwpmb3JnZSB0aGUgaHRtbCBsaW5rcyB0b3dhcmQgbW9yZSByZWNlbnQg
cmVwb3J0cyBidXQgaXQgYWx3YXlzIGZhaWxlZCwKbm93IEkga25vdyB3aHkgOikKCkNoZWVycywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
