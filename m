Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B253AC433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:07:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFFD619BB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFFD619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bNicmfNCFUh1XL2sofaYpBG9oG0SZE1IFzM3FsAwowc=; b=m91rFSuItGbWaj1X9Tzo8bKDt
	XWp5KbCr+nQadhmWJfelcVMBS7rYP3knj9yWvJN5+toSMZwpE9cMb0ohslBEszVeVLY26I78wJfSH
	mriGE5eYF01S/hMI50H6UUQJLeqFT6bYiFdjXwnyc53XRpVjawquiziPVSYGAQv5K9MCE2myZh1lU
	T4k94bvAk5x2E5d88qKMrctf5zrWlvlszwoGa/mfaq7ZiP1qrsKN2ExAYpPq/h2aIgnW6zpf7OUHd
	2G7t+m0zO6HXJP+lMAJPsxPc6OGgU/mx76lm3rTMntT5potqj9gxm+TaEL36vYVsBYL3qzVUzSnJG
	mVAelo0Cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOhff-00F7Hz-SY; Tue, 23 Mar 2021 14:06:11 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOhfb-00F7H5-7F
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 14:06:09 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C84F7100016;
 Tue, 23 Mar 2021 14:06:04 +0000 (UTC)
Date: Tue, 23 Mar 2021 15:06:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
Message-ID: <20210323150603.6b942a60@xps13>
In-Reply-To: <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
 <20210323113233.3523d66b@xps13>
 <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_140607_329335_F172B288 
X-CRM114-Status: GOOD (  12.51  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBUdWUs
IDIzIE1hciAyMDIxIDIwOjQ3OjEwCiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVHVlLCAy
MyBNYXIgMjAyMSBhdCAxOTozMiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPiBZb3UgY2FuIHJ1biBuYW5kYml0ZXJycyAtaSAvZGV2L210ZFgKPiA+
Cj4gPiBZb3UnbGwgc2VlIGlmIHRoZXJlIGlzIEVDQyBjb3JyZWN0aW9uIG9yIG5vdCAoYW5kIGl0
cyBsZXZlbCkuICAKPiAKPiBUaGVzZSBhcmUgcmVzdWx0cyBJIGdldCBmb3IgYm90aCBvZiB0aGUg
bmFuZGJpdGVycnMgdGVzdHMuCj4gCj4gIyBuYW5kYml0ZXJycyAtaSAvZGV2L210ZDEKPiBpbmNy
ZW1lbnRhbCBiaXRlcnJvcnMgdGVzdAo+IFN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgMCBiaXQgZXJy
b3JzIHBlciBzdWJwYWdlCj4gSW5zZXJ0ZWQgYml0ZXJyb3IgQCAwLzUKPiBSZWFkIHJlcG9ydGVk
IDQgY29ycmVjdGVkIGJpdCBlcnJvcnMKPiBFQ0MgZmFpbHVyZSwgaW52YWxpZCBkYXRhIGRlc3Bp
dGUgcmVhZCBzdWNjZXNzCgpUaGlzIGlzIG5vdCBhIHZhbGlkIGJlaGF2aW9yLiBUaGVyZSBpcyBz
b21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUgd2F5IEVDQwpzdGF0dXMgaXMgcmVhZC9yZXRyaWV2ZWQu
IFRoZSByZWFkIHNob3VsZCBpbmRlZWQgcmVwb3J0IDQgY29ycmVjdGVkIGJpdAplcnJvcnMsIGJ1
dCB0aGVuIHRoZSBkYXRhIHNob3VsZCBiZSB2YWxpZC4gSGVyZSBpdCBtZWFucyB0aGF0IHRoZQpp
bnRyb2R1Y2VkIGVycm9yIGFwcGVhcnMgY29ycmVjdGVkIGJ1dCBpbiBmYWN0IGlzIG5vdC4KCldl
IG5lZWQgdG8gdW5kZXJzdGFuZCB3aGF0IHN0YXR1cyBhcmUgYXZhaWxhYmxlIGFuZCB3cml0ZSB0
aGUKYXBwcm9wcmlhdGUgdmVuZG9yIGNvZGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
