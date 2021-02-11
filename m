Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFE4C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 14:09:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DAD64E8A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 14:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25DAD64E8A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dMEln+m5lnHAizSD3RTdPgh1ZZ9JUo5Mn3UsNhp2Z0k=; b=d6pzPHrM+31YAOEAQwXQ8t6In
	9FPhiAF2OT5BbOzcZXo+1o8zcliT78r9aUKeD1XbdqFpPY0FSGS7HHBgxqckB8hLyYVh6hGvp5m2F
	pXeCrgy3A8fysOziyoBa0TsJpT6gVL7cRt/njRPjAJFyxs4jukaRvNJlxhOJ6I5yw1o3cobBfA56K
	TKbt6IcesjkfBDBYmjsw0h36zAQuiLzmuxwN63V8BscbaL5shnv4GC7cnNd7riBFPl1BpEkMu1u4P
	PbTNVH1XQePAc+bNO3HyInuCKgmN5XdB/++afGpxCik6osFTbQYAjW8teAj7fOnBpY581hPlsQzIW
	byn8akO1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lACdi-000816-Pb; Thu, 11 Feb 2021 14:08:14 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lACdc-0007zX-QF
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 14:08:10 +0000
Received: from xps13 (aputeaux-654-1-105-167.w90-2.abo.wanadoo.fr [90.2.4.167])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B9DC810000F;
 Thu, 11 Feb 2021 14:08:00 +0000 (UTC)
Date: Thu, 11 Feb 2021 15:07:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH V4] mtd: rawnand: qcom: update last code word register
Message-ID: <20210211150759.506f3463@xps13>
In-Reply-To: <20210210090144.GE19226@work>
References: <1611869959-5109-1-git-send-email-mdalam@codeaurora.org>
 <20210210090144.GE19226@work>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_090808_958287_188907B4 
X-CRM114-Status: GOOD (  19.46  )
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
Cc: Md Sadre Alam <mdalam@codeaurora.org>, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5h
cm8ub3JnPiB3cm90ZSBvbiBXZWQsCjEwIEZlYiAyMDIxIDE0OjMxOjQ0ICswNTMwOgoKPiBPbiBG
cmksIEphbiAyOSwgMjAyMSBhdCAwMzowOToxOUFNICswNTMwLCBNZCBTYWRyZSBBbGFtIHdyb3Rl
Ogo+ID4gRnJvbSBRUElDIHZlcnNpb24gMi4wIG9ud2FyZHMgbmV3IHJlZ2lzdGVyIGdvdCBhZGRl
ZCB0bwo+ID4gcmVhZCBsYXN0IGNvZGV3b3JkLiBUaGlzIGNoYW5nZSB3aWxsIGFkZCB0aGUgUkVB
RF9MT0NBVElPTl9MQVNUX0NXX24KPiA+IHJlZ2lzdGVyLgo+ID4gCj4gPiBGb3IgZmlyc3QgdGhy
ZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fbiByZWdpc3RlciB3aWxsIGJlCj4gPiB1c2UuRm9y
IGxhc3QgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyIHdpbGwgYmUK
PiA+IHVzZS4KClNvcnJ5IGZvciB0aGUgbGF0ZSBub3RpY2UsIEkgdGhpbmsgdGhlIHBhdGNoIGlz
IGZpbmUgYnV0IGlmIHlvdSBkb24ndAptaW5kIEkgd291bGQgbGlrZSB0byBwcm9wb3NlIGEgc21h
bGwgY2hhbmdlIHRoYXQgc2hvdWxkIHNpbXBsaWZ5IHlvdXIKcGF0Y2ggYSBsb3QsIHNlZSBiZWxv
dy4KCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVy
b3JhLm9yZz4gIAo+IAo+IFJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2
YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+IAo+IFRoYW5rcywKPiBNYW5pCj4gCj4gPiAt
LS0KPiA+IFtWNF0KPiA+ICAqIE1vZGlmaWVkIGNvbmRpdGlvbiBmb3IgbmFuZGNfc2V0X3JlYWRf
bG9jX2xhc3QoKSBpbiBxY29tX25hbmRjX3JlYWRfY3dfcmF3KCkuCj4gPiAgKiBBZGRlZCBvbmUg
YWRkaXRpb25hbCBhcmd1bWVudCAibGFzdF9jdyIgdG8gdGhlIGZ1bmN0aW9uIGNvbmZpZ19uYW5k
X2N3X3JlYWQoKQo+ID4gICAgdG8gaGFuZGxlIGxhc3QgY29kZSB3b3JkIGNvbmRpdGlvbi4KPiA+
ICAqIENoYW5nZWQgdG90YWwgbnVtYmVyIG9mIGxhc3QgY29kZSB3b3JkIHJlZ2lzdGVyICJOQU5E
X1JFQURfTE9DQVRJT05fTEFTVF9DV18wIiB0byA0Cj4gPiAgICB3aGlsZSBkb2luZyBjb2RlIHdv
cmQgY29uZmlndXJhdGlvbi4KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMg
fCAxMTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+IGluZGV4IDY2N2U0YmYuLjk0ODRiZTggMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gQEAgLTQ4LDYgKzQ4LDEwIEBACj4gPiAg
I2RlZmluZQlOQU5EX1JFQURfTE9DQVRJT05fMQkJMHhmMjQKPiA+ICAjZGVmaW5lCU5BTkRfUkVB
RF9MT0NBVElPTl8yCQkweGYyOAo+ID4gICNkZWZpbmUJTkFORF9SRUFEX0xPQ0FUSU9OXzMJCTB4
ZjJjCj4gPiArI2RlZmluZQlOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18wCTB4ZjQwCj4gPiAr
I2RlZmluZQlOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18xCTB4ZjQ0Cj4gPiArI2RlZmluZQlO
QU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18yCTB4ZjQ4Cj4gPiArI2RlZmluZQlOQU5EX1JFQURf
TE9DQVRJT05fTEFTVF9DV18zCTB4ZjRjCj4gPiAgCj4gPiAgLyogZHVtbXkgcmVnaXN0ZXIgb2Zm
c2V0cywgdXNlZCBieSB3cml0ZV9yZWdfZG1hICovCj4gPiAgI2RlZmluZQlOQU5EX0RFVl9DTUQx
X1JFU1RPUkUJCTB4ZGVhZAo+ID4gQEAgLTE4Nyw2ICsxOTEsMTIgQEAgbmFuZGNfc2V0X3JlZyhu
YW5kYywgTkFORF9SRUFEX0xPQ0FUSU9OXyMjcmVnLAkJCVwKPiA+ICAJICAgICAgKChzaXplKSA8
PCBSRUFEX0xPQ0FUSU9OX1NJWkUpIHwJCQlcCj4gPiAgCSAgICAgICgoaXNfbGFzdCkgPDwgUkVB
RF9MT0NBVElPTl9MQVNUKSkKPiA+ICAKPiA+ICsjZGVmaW5lIG5hbmRjX3NldF9yZWFkX2xvY19s
YXN0KG5hbmRjLCByZWcsIG9mZnNldCwgc2l6ZSwgaXNfbGFzdCkJXAo+ID4gK25hbmRjX3NldF9y
ZWcobmFuZGMsIE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXyMjcmVnLAkJCVwKPiA+ICsJICAg
ICAgKChvZmZzZXQpIDw8IFJFQURfTE9DQVRJT05fT0ZGU0VUKSB8CQlcCj4gPiArCSAgICAgICgo
c2l6ZSkgPDwgUkVBRF9MT0NBVElPTl9TSVpFKSB8CQkJXAo+ID4gKwkgICAgICAoKGlzX2xhc3Qp
IDw8IFJFQURfTE9DQVRJT05fTEFTVCkpCj4gPiArCgpZb3UgY291bGQgcmVuYW1lIHRoZSBtYWNy
byBuYW5kY19zZXRfcmVhZF9sb2MoKSBpbnRvCm5hbmRjX3NldF9yZWFkX2xvY19maXJzdCgpIG9y
IGFueXRoaW5nIGVsc2UgdGhhdCBtYWtlIHNlbnNlLCB0aGVuIGhhdmUKYSBoZWxwZXIgd2hpY2gg
ZG9lczoKCm5hbmRjX3NldF9yZWFkX2xvYygpCnsKCWlmIChjb25kaXRpb24gZm9yIGZpcnN0KQoJ
CXJldHVybiBuYW5kY19zZXRfcmVhZF9sb2NfZmlyc3QoKTsKCWVsc2UKCQlyZXR1cm4gbmFuZGNf
c2V0X3JlYWRfbG9jX2xhc3QoKTsKfQoKQW5kIGluIHRoZSByZXN0IG9mIHlvdXIgcGF0Y2ggeW91
IHdvbid0IGhhdmUgdG8gdG91Y2ggYW55dGhpbmcgZWxzZS4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
