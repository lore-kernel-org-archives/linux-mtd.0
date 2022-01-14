Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 21:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DrQug1dHlLRNwLhzIQFweacEal/1p93sZ9nRneM60SI=; b=vD+C1SndSc6nJl8Jr7rp1k5pKf
	o245xIfkrErmD2AqXGcFFQREe6T3wd9yYCfbaf/uCWB/Vds1RiQXHtPyUcjs3IVHDlJioC3ae6Ho3
	oPIN4VH0GYX8zQCJlW/SYaLglZ4yc3Pgo4eHQ76SEx9GDcIHTs+emXxx+lznkyJqExncOvkYYembO
	o3ghZwAwwZlliuG5Y13HQOQy29sfDUTh4N8JBjjlJLBw/9xPnP5KWdR0bgLqlSGGc1txoybdJQp1q
	xB/SqvkxWeOCvje9rvndnMWPhX6StbPHwr1NZBsJOSC5lYjiOYP0AFNQHo++9BrlUn4NCks62+mL4
	hFinCAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8UHf-00AG7t-Ml; Fri, 14 Jan 2022 21:38:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8UHc-00AG7F-CA
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 21:38:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E7FE4614E2CD;
 Fri, 14 Jan 2022 22:38:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RsMcGCKVOPog; Fri, 14 Jan 2022 22:38:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6E2CE62DA5EE;
 Fri, 14 Jan 2022 22:38:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7eW97YoUHxbi; Fri, 14 Jan 2022 22:38:47 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4B65A62DA5E9;
 Fri, 14 Jan 2022 22:38:47 +0100 (CET)
Date: Fri, 14 Jan 2022 22:38:47 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, schaecsn <schaecsn@gmx.net>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1440776687.261341.1642196327200.JavaMail.zimbra@nod.at>
In-Reply-To: <20220114104820.1340879-1-gregkh@linuxfoundation.org>
References: <20220114104820.1340879-1-gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] ubifs: use default_groups in kobj_type
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: use default_groups in kobj_type
Thread-Index: YMthyaOLYqk+kHfGt8tLY1CCh4fFCA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_133852_613445_6FF5795E 
X-CRM114-Status: UNSURE (   8.75  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdyZWcgS3JvYWgtSGFydG1h
biIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEFuOiAibGludXgta2VybmVsIiA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBDQzogIkdyZWcgS3JvYWgtSGFydG1hbiIgPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJz
Y2hhZWNzbiIgPHNjaGFlY3NuQGdteC5uZXQ+LAo+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZz4KPiBHZXNlbmRldDogRnJlaXRhZywgMTQuIEphbnVhciAyMDIyIDEx
OjQ4OjIwCj4gQmV0cmVmZjogW1BBVENIIHYyXSB1YmlmczogdXNlIGRlZmF1bHRfZ3JvdXBzIGlu
IGtvYmpfdHlwZQoKPiBUaGVyZSBhcmUgY3VycmVudGx5IDIgd2F5cyB0byBjcmVhdGUgYSBzZXQg
b2Ygc3lzZnMgZmlsZXMgZm9yIGEKPiBrb2JqX3R5cGUsIHRocm91Z2ggdGhlIGRlZmF1bHRfYXR0
cnMgZmllbGQsIGFuZCB0aGUgZGVmYXVsdF9ncm91cHMKPiBmaWVsZC4gIE1vdmUgdGhlIHViaWZz
IHN5c2ZzIGNvZGUgdG8gdXNlIGRlZmF1bHRfZ3JvdXBzIGZpZWxkIHdoaWNoIGhhcwo+IGJlZW4g
dGhlIHByZWZlcnJlZCB3YXkgc2luY2UgYWEzMGY0N2NmNjY2ICgia29iamVjdDogQWRkIHN1cHBv
cnQgZm9yCj4gZGVmYXVsdCBhdHRyaWJ1dGUgZ3JvdXBzIHRvIGtvYmpfdHlwZSIpIHNvIHRoYXQg
d2UgY2FuIHNvb24gZ2V0IHJpZCBvZgo+IHRoZSBvYnNvbGV0ZSBkZWZhdWx0X2F0dHJzIGZpZWxk
Lgo+IAo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBTdGVm
YW4gU2NoYWVja2VsZXIgPHNjaGFlY3NuQGdteC5uZXQ+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4KPiAtLS0KPiB2MjogZml4IHVwIHRoZSBjaGFuZ2Vsb2cgdGV4
dCB0byBwcm9wZXJseSByZWZlciB0byB0aGUgdWJpZnMgY29kZQo+ICAgIGluc3RlYWQgb2Ygc29t
ZSBvdGhlciBzdWJzeXN0ZW0gYXMgcG9pbnRlZCBvdXQgYnkgTWljaGFlbCBXYWxsZQoKQWNrZWQt
Ynk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CgpUaGFua3MsCi8vcmljaGFy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
