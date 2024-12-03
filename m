Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50161E74AC2
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VXyh0v1nRI8D/z0GQPqWdovEmlo38cxAyir/QqRFCdg=; b=nP0nUj/7vxq350fwNlLmJlAAy5
	jjeGQHqkduqQLrhhlKNhc4x1PC/n75Zlcihni4zp8S6RXm81fOsyPoKLhbxDl5+hNNGZugvbuedYj
	Hi0o3ENXv+/mXnYaa88Dv0F3uoK0VhevPfeQS+AjdSnoUfKlVaeZtSTnrsXfzlbL2H2aoUMXQjmH3
	hIGAo116KLnbfioyuwSjtBXqY7/QTBvfxtDv+7kKN+J0I0tv27VBUHFOjgpRWeV2MLFkJWe9151ML
	zmXGE9V2DAo74xpwjaaPlT7cwi0TpUfmiVUJ8ObVvm0PrVyfbGprDaBXv8hy9nzyW75Fc2RhF9X/X
	bbWMlNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVRm-0000000A328-1TVo;
	Tue, 03 Dec 2024 16:08:22 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVRi-0000000A30y-2Hjl
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 16:08:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E1AB22F25C3;
	Tue,  3 Dec 2024 17:08:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id A2Hg5nRiddH4; Tue,  3 Dec 2024 17:08:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 13FA82F25C4;
	Tue,  3 Dec 2024 17:08:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XblzBPG62Bmk; Tue,  3 Dec 2024 17:08:14 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E5B9B2F25C3;
	Tue,  3 Dec 2024 17:08:14 +0100 (CET)
Date: Tue, 3 Dec 2024 17:08:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pintu Agarwal <pintu.ping@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <342000380.28770675.1733242094522.JavaMail.zimbra@nod.at>
In-Reply-To: <87ldww4zrx.fsf@bootlin.com>
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com> <CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com> <87ldww4zrx.fsf@bootlin.com>
Subject: Re: Block based OTA update needs mtdblock
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: Block based OTA update needs mtdblock
Thread-Index: KPeQUzpe+8lfpBQ6hKGV/yDwHulGvw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_080818_861833_23BF3ED9 
X-CRM114-Status: GOOD (  11.13  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAiUGludHUgQWdhcndhbCIgPHBpbnR1LnBp
bmdAZ21haWwuY29tPgo+IENDOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25lc2gg
UmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc+LAo+ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IEdl
c2VuZGV0OiBEaWVuc3RhZywgMy4gRGV6ZW1iZXIgMjAyNCAxNToxNzowNgo+IEJldHJlZmY6IFJl
OiBCbG9jayBiYXNlZCBPVEEgdXBkYXRlIG5lZWRzIG10ZGJsb2NrCgo+IEhlbGxvLAo+IAo+IE9u
IDIwLzExLzIwMjQgYXQgMTI6NTI6NTcgKzA1MzAsIFBpbnR1IEFnYXJ3YWwgPHBpbnR1LnBpbmdA
Z21haWwuY29tPiB3cm90ZToKPiAKPj4gSGksCj4+Cj4+IE9uIE1vbiwgNCBOb3YgMjAyNCBhdCAy
MTozMSwgUGludHUgQWdhcndhbCA8cGludHUucGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+
IEhpIEFsbCwKPj4+Cj4+PiBGb3Igb25lIG9mIG91ciBhdXRvbW90aXZlIHByb2R1Y3RzIHdlIGhh
dmUgdGhlIGZvbGxvd2luZyBjb25maWd1cmF0aW9uOgo+Pj4gUUMgY2hpcHNldCwgYXJtNjQsIEtl
cm5lbC01LjE1LCBOQU5EIEZsYXNoIDFHQiwgQS9CIHN5c3RlbSwgVUJJCj4+PiB2b2x1bWVzIChz
cXVhc2hmcywgdWJpZnMpLCBETS12ZXJpdHkgZm9yIHJvb3RmcyAoc3F1YXNoZnMpLCBzaW1wbGUK
Pj4+IGJ1c3lib3ggcGxhdGZvcm0uCj4+Pgo+Pj4gRm9yIE9UQSB1cGRhdGVzIHdlIGhhdmUgYSBz
dHJvbmcgZGVwZW5kZW5jeSB3aXRoIE1URF9CTE9DSy4KPj4+Cj4+PiBUaWxsIG5vdywgd2Ugd2Vy
ZSB1c2luZyB1YmlibG9jayBmb3IgbW91bnRpbmcgc3F1YXNoZnMgdm9sdW1lcyBhbmQKPj4+IGNv
bXBsZXRlbHkgZ290IHJpZCBvZiBtdGRfYmxvY2sgYnkgY29uZmlndXJpbmcgaXQgYXMgYSBsb2Fk
YWJsZQo+Pj4gbW9kdWxlLgo+Pj4gQnV0LCB3ZSBhbHNvIG5lZWQgdG8gc3VwcG9ydCBPVEEgdXBk
YXRlcyAoRnVsbCwgSW5jcmVtZW50YWwpIG9uIEEvQgo+Pj4gdm9sdW1lcyB1c2luZyB0aGUgc2Ft
ZSBBbmRyb2lkIE9UQSBmcmFtZXdvcmsuCj4+PiBodHRwczovL3NvdXJjZS5hbmRyb2lkLmNvbS9k
b2NzL2NvcmUvb3RhL25vbmFiL2Jsb2NrCj4+Pgo+Pj4gT1RBIHVwZGF0ZSB3aWxsIGJlIGFwcGxp
ZWQgdG8gdGhlIEIgKGluYWN0aXZlKSBwYXJ0aXRpb24uCj4+PiBPVEEgdXBkYXRlcyBwcmVmZXIg
YmxvY2sgYmFzZWQgdXBkYXRlIG92ZXIgZmlsZSBiYXNlZCBlc3BlY2lhbGx5IGZvcgo+Pj4gZG0t
dmVyaXR5IGVuYWJsZWQgZGV2aWNlcy4KPj4+Cj4+PiBOb3csIHRoZSBwcm9ibGVtIGlzLCBvbiBN
VEQgd2Ugb25seSBoYXZlIDIgb3B0aW9ucyBmb3IgYmxvY2sgYmFzZWQKPj4+IHVwZGF0ZXM7IHVi
aV9ibG9jayBvciBtdGRfYmxvY2suCj4+PiBXZSBjYW5ub3QgdXNlIHViaWJsb2NrIGZvciBPVEEg
dXBkYXRlcyBhcyBpdCBpcyByZWFkIG9ubHkuCj4+PiBGb3IgZnVsbCB1cGRhdGUgdm9sdW1lLCB3
ZSBjYW4gdXNlICJ1Yml1cGRhdGV2b2wiIGludGVyZmFjZSB0bwo+Pj4gY29tcGxldGVseSByZXBs
YWNlIHRoZSB2b2x1bWUgY29udGVudCwgYnV0IGZvciBwYXJ0aWFsIG9yIGluY3JlbWVudGFsCj4+
PiB1cGRhdGUgd2UgbmVlZCB0byB1cGRhdGUgb25seSBzcGVjaWZpYyBibG9ja3MgYW5kIG5vdCBl
bnRpcmUKPj4+IHBhcnRpdGlvbnMuCj4+PiBUaHVzLCB3ZSBoYXZlIHRvIHVzZSB0aGUgTVREX0JM
T0NLICgvZGV2L210ZGJsb2NrKSBpbnRlcmZhY2UgdG8KPj4+IHN1cHBvcnQgYmxvY2sgYmFzZWQg
T1RBIHVwZGF0ZXMgb24gVUJJIHZvbHVtZXMuCj4+PiBUaHVzLCBkdXJpbmcgb3RhIHVwZGF0ZXMg
KG9ubHkpIHdlIG5lZWQgdG8gaW5zdGFsbCB0aGUgbXRkYmxvY2sKPj4+IG1vZHVsZSwgcGVyZm9y
bSB0aGUgdXBkYXRlIGFuZCB0aGVuIHVuaW5zdGFsbCB0aGUgbW9kdWxlLgo+Pj4KPj4+IFRoYXQg
bWVhbnMsIHdlIGNhbm5vdCBjb21wbGV0ZWx5IGdldCByaWQgb2YgTVREX0JMT0NLIGZyb20gb3Vy
IHByb2R1Y3QKPj4+IGVzcGVjaWFsbHkgZm9yIE9UQSB1c2UgY2FzZXMuCj4+Pgo+Pj4gSXMgdGhp
cyB0aGUgb25seSB3YXksIG9yIGRvIHdlIGhhdmUgYW55IG90aGVyIG9wdGlvbiB0byBzdXBwb3J0
IE9UQQo+Pj4gdXBkYXRlcyBvdmVyIFVCSSB2b2x1bWVzID8KPj4+Cj4+IFJlc3RhcnRpbmcgdGhp
cyB0aHJlYWQgYWdhaW4uLi4KPj4gQW55IGZ1cnRoZXIgY29tbWVudCBvbiB0aGlzID8KPj4KPj4g
RGlkIGFueWJvZHkgdXNlZCBibG9jayBiYXNlZCBPVEEgdXBkYXRlIE5BTkQgQS9CIHN5c3RlbSB3
aXRob3V0IHVzaW5nCj4+IG10ZF9ibG9jayA/Cj4gCj4gTm90IG9uIG15IHNpZGUsIGl0IGlzIGFj
dHVhbGx5IGEgZ29vZCBxdWVzdGlvbi4gUmljaGFyZCwgYW55IGlkZWFzPwoKV2hhdCBhYm91dCB1
c2luZyB1Yml1cGRhdGV2b2w/CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
