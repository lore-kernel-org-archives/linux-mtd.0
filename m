Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CE5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYk2odx6Rkf/McGBFljuH+zfWq6AMBz5kKxY1LeVks4=; b=nDBHAYbaPD9pqq
	FAdSEKh3KI6U4QgX9jlIBrBEjUgzxx2UMev4hNZlkS+nTj3DkFjiV/Nhahki8xsb6SvtLpqUyIhEK
	ofepZbWHJB1VUs1Q+UILKqYPaCjLWlnnln9/YIfIntV4D2TFr7Nuj0b4kcPf1V60uIjFZa+1wPXDJ
	40AvHD+O6PJbruHZF1QAvHIujufHCFrv/trjOA5ppsEMTODJbe5vnm1ZlIvdYS8Lt9qS8+YVeHmjK
	YInV8gd6hPwTy/8KcNxrXrlbdlaxryvMdKKKpvcaOtRJaBs5QcgCjkZPAT342qXZXgbyyQlfcxIdp
	3EVS3y5KBa8Cwyf20lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np35h-00AgLx-B2; Thu, 12 May 2022 07:18:29 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np35d-00AgJm-Qz
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 07:18:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D0F4E200008;
 Thu, 12 May 2022 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652339900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwbmBbhN0kgvtc8FIdoo3gXl6+om9eIUC04sDBGdORA=;
 b=XtJbZgSwaOraJPcYKFXcQISILKkMjY951nDLnOlk2JMK/vIyn3zaBGTDAJxQESL//ivPC6
 2WaeqUOh/4qWcGXip+vCGjVyUxnPTo3fW8HOnmcfan8O1KLxjtNLQuyANIwyp/MS9DaFtR
 tMyKXg+yGXeyT0bvczv/tNq+RALBoh9+eqWe94b6Cbi/6l2Mp2CTz9oqQfkpQiQWh7xtwX
 8K7/eDSn+IgoxD0QM5jsmyUH/pQRkhIGwhhmfqmgiYXV+kJlzXqu6/6oFO0duQBJdGakbw
 pBuEmYyQSksrWBv5skAyr+F824UsvtXjx5TpJYveTZkF2zbGodW5oTMXevUUbA==
Date: Thu, 12 May 2022 09:18:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, NOGUCHI Hiroshi
 <drvlabo@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Karim
 <Karimdplay@gmail.com>, M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: add support for Sercomm partitions
Message-ID: <20220512091817.25c653e4@xps13>
In-Reply-To: <10ce5bf1-bf12-b028-49cb-a3f1999f9a07@gmail.com>
References: <20220329122016.4122899-1-csharper2005@gmail.com>
 <20220330100958.57dc4d61@xps13>
 <ede9e050-3b60-ba0e-c626-044f7825adb7@gmail.com>
 <20220511091643.064f9d13@xps13>
 <10ce5bf1-bf12-b028-49cb-a3f1999f9a07@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_001826_411299_BCDB8850 
X-CRM114-Status: GOOD (  20.43  )
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

SGkgTWlraGFpbCwKCmNzaGFycGVyMjAwNUBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAxMSBNYXkg
MjAyMiAyMzozNjoxOCArMDMwMDoKCj4gT24gNS8xMS8yMDIyIDEwOjE2IEFNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IAo+ID4+Pj4gVGhpcyBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBjb2RlIGFz
IHByb3Bvc2VkIGJ5IE5PR1VDSEkgSGlyb3NoaQo+ID4+Pj4gPGRydmxhYm9AZ21haWwuY29tPiBo
ZXJlOiAgICAKPiA+Pj4gSSB3b3VsZCBjcmVkaXQgSGlyb3NoaSB3aXRoIGEgU3VnZ2VzdGVkLWJ5
IGF0IGxlYXN0ICAgIAo+ID4+IEkgcmVhZCBzdWJtaXR0aW5nIHBhdGNoZXMgcnVsZXMgYWdhaW4g
YW5kIHRob3VnaHQgdGhhdCBTaWduZWQtb2ZmLWJ5IGlzCj4gPj4gc3VpdGFibGUgZm9yIHRoaXMg
Y2FzZS4gSXMgdGhpcyBvaz8gIAo+ID4gRWl0aGVyIHlvdSB0YWtlIGhpcyB3b3JrIGFsbW9zdCBs
aWtlIGl0IGlzIGFuZCBoZSBtdXN0IGJlIHRoZSBhdXRob3IKPiA+ICphbmQqIHRoZSBmaXJzdCBz
aWduZWQtb2ZmLWJ5IGxpbmUsIG9yIHlvdSB0YWtlIHRoZSBhdXRob3JzaGlwIGlmIHlvdQo+ID4g
dGhpbmsgeW91IGRpZCBlbm91Z2ggbW9kaWZpY2F0aW9ucyB0byB0aGUgY29kZSBhbmQgaW4gdGhp
cyBjYXNlIHlvdSBjYW4KPiA+IGVpdGhlciBjcmVkaXQgaGltIHdpdGggYSBzdWdnZXN0ZWQtYnkg
YmVmb3JlIHlvdXIgc2lnbmVkLW9mZiwgb3IgeW91Cj4gPiBjYW4gY3JlZGl0IGhpbSB3aXRoIGEg
Y28tZGV2ZWxvcGVkLWJ5ICsgaGlzIHNpZ25lZC1vZmYgYW5kIHRoZW4geW91cnMuICAKPiAKPiBU
aGFuayB5b3UgZm9yIGNsYXJpZmljYXRpb24hIE15IG1vZGlmaWNhdGlvbnMgd2VyZSBxdWl0ZSBz
bWFsbDoKPiAgLSBSZW1vdmUgcmVkdW5kYW50IGJyYWNlcyBhbmQgbG9naWNhbCBOT1Qgb3BlcmF0
b3IKPiAgLSBEZWZpbmUgcHJfZm10Cj4gIC0gUmVwbGFjZSBrY2FsbG9jIGJ5IGt6YWxsb2MKPiAg
LSBVc2Ugb2ZfZ2V0X2NoaWxkX2NvdW50KCkgYW5kIGFsbG9jIGJpZyBlbm91Z2ggYXJyYXkgYmVm
b3JlIHRoZQo+ICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGUoKQo+IAo+IFRoZXJlZm9yZSwgSSBw
cmVmZXIgdG8ga2VlcCB0aGUgYXV0aG9yc2hpcCBvZiB0aGUgb3JpZ2luYWwgYXV0aG9yIChOT0dV
Q0hJIEhpcm9zaGkpLiAKPiAKPiBQYXRjaCBpcyByZWFsbHkgZ29vZCBhbmQgd2FzIHN1Y2Nlc3Nm
dWxseSB0ZXN0ZWQgb24gdGhlIGh1bmRyZWRzIG9mIFNlcmNvbW0gZGV2aWNlcyAoNS40LCA1LjEw
LCA1LjE1IEtlcm5lbCkuIE15IG1vdGl2YXRpb24gZm9yIHVwc3RyZWFtaW5nIGlzIHdvcmsgdW5k
ZXIgb2ZmaWNpYWwgc3VwcG9ydCBmb3IgdGhlc2UgZGV2aWNlcyBpbiBPcGVuV3J0Lgo+IAo+IFdo
YXQgYXJlIHRoZSBuZXh0IHN0ZXBzIGZyb20gbXkgc2lkZSBpbiB0aGlzIGNhc2U/IFNob3VsZCBJ
IHdhaXQgZm9yIHJldmlldyBvZiB0aGlzIHBhdGNoIGhlcmUgKExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIyMDUxMDE2MjY1NS4yMTAxMS0xLWNzaGFycGVyMjAwNUBn
bWFpbC5jb20vVC8jdQo+ICkgb3IgZG8gSSBuZWVkIHRvIGRvIHNvbWV0aGluZyBhZGRpdGlvbmFs
bHkgKGZvciBleGFtcGxlLCBzZW5kIHVwZGF0ZWQgc2V0IHY1IHdpdGggQWNrZWQtYnkgZnJvbSBL
cnp5c3p0b2YgaW4gdGhlIGZpcnN0IHBhdGNoKT8gCj4gCj4gQW5kIHNvcnJ5IGZvciB0aGUgbWFu
eSBxdWVzdGlvbnMuLi4gSSBoYXZlbid0IGZ1bGx5IG1hc3RlcmVkIHRoZSBMaW51eCBjaGFuZ2Ug
bWFuYWdlbWVudCBwcm9jZXNzIGFuZCBiZXN0IHByYWN0aWNlcyB5ZXQuCgpXZSBhcmUgdXNlZCB0
byBpbmNyZW1lbnRhbCBjaGFuZ2VzLCBzbyBwbGVhc2Ugc2VuZCBhbm90aGVyIHZlcnNpb24gd2l0
aAp0aGUgdGFncyBjb2xsZWN0ZWQsIHRoZSBjaGFuZ2VzIHRoYXQgSSByZXF1ZXN0ZWQgcmVnYXJk
aW5nIHRoZQphdXRob3JzaGlwIGFuZCB3ZSdsbCBzZWUgd2hhdCBoYXBwZW5zIHRvIHRoZSBuZXh0
IHZlcnNpb24uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
