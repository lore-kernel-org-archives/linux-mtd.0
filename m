Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29522C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsZJ1sJpseyPolVYg/DlBeuuZx0f3byXe/F3X1BGpyY=; b=tyMwLE2aqbbpEJ
	ZvCMXcxV7dhUxUCnrICagMn/eJxeh2rFy35wNHuaz3tZEt+4Tdm+dObmJzvxWR/yT4D09YRawYZao
	mLsNnks1e3hMPDcLHKLZnOrYpvvm2YiOR7yO6YMjmxrRvX9VnoykikNDEKb68EjUd/VwEtAUDqoOg
	PAGx1A9eYoAqMBsaihYEQst1gvq0X6wZy6WNguc0WvhYIi/ZXFwtGRjLBBObW7BJTvsVyfjZt+h16
	54NrnEmYr1W0F4riKGx3qBPYoQUVClArIuSBKV9V2ggNw7is1zPL/F2OG/dzlIHJXzhr7NVmWcTzH
	CTA2oHae6PPcT8ma/kyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHjB-00AF05-I8; Mon, 02 Jan 2023 10:07:33 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHiF-00AESo-Vr
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 10:06:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0B88760003;
	Mon,  2 Jan 2023 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672653992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9D8Y+DBW+vGrczBNQRRDtRd16IJPcvgPJsKV94Z0guE=;
	b=HRMVRoBd4UF80iOc0qdYtbX+AWvmt4xXGGSZTO0v2LY/PQqtmGvtxeKi+kT9ACK12aNyxJ
	+XhGSUmbexgQgqNtYA2rly89LLpljCPVM6kw4biBbSxDjS86eO2rySrINbPLxU3sW1xNwq
	noKUVpK/Y5QzwgrRsoQmzrzwaiIH8HkQWdCGv2YtJRIJtU3ICH9455XpXYoxJnslyKYz+k
	AzZQoEOhq0GtBdtDRDiOKSUpOUE9PItqyr/05t2GnhG61lCluvjXoTQWIAHw29Cb5FGMSN
	ZPqz82f0lkrhxJXJejb4CiWOVTWIjoj+zkUhmKPlMY9rUCNJMxDcQSihzj18Rw==
Date: Mon, 2 Jan 2023 11:06:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: hynix: Add support for
 H27UCG8T2FTR-BC MLC NAND
Message-ID: <20230102110630.4c68e038@xps-13>
In-Reply-To: <1b17f332-827b-c8b1-807c-9c6e38caf173@sholland.org>
References: <20221229190906.6467-1-samuel@sholland.org>
	<20221229190906.6467-2-samuel@sholland.org>
	<20221230134507.719edeae@xps-13>
	<1b17f332-827b-c8b1-807c-9c6e38caf173@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_020636_521505_C8C2A729 
X-CRM114-Status: GOOD (  24.99  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBGcmksIDMwIERlYyAyMDIy
IDEwOjA4OjEzIC0wNjAwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIDEyLzMwLzIyIDA2OjQ1LCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FtdWVsLAo+ID4gCj4gPiBzYW11ZWxAc2hvbGxh
bmQub3JnIHdyb3RlIG9uIFRodSwgMjkgRGVjIDIwMjIgMTM6MDk6MDMgLTA2MDA6Cj4gPiAgIAo+
ID4+IEgyN1VDRzhUMkZUUi1CQyBpcyBzaW1pbGFyIHRvIHRoZSBhbHJlYWR5LXN1cHBvcnRlZCBI
MjdVQ0c4VDJFVFItQkMsIGJ1dAo+ID4+IHJlcG9ydHMgYSBkaWZmZXJlbnQgSUQuICAKPiA+IAo+
ID4gQ2FuIHlvdSBwcm92aWRlIGEgZGF0YXNoZWV0IGZvciB0aGlzIHBhcnQ/IEkgYW0gc3VycHJp
c2VkIGJ5IHRoZSBwYWdlCj4gPiBzaXplLiBJbiBnZW5lcmFsIGFueXdheSwgaXQncyBiZXN0IHRv
IHByb3ZpZGUgYSBsaW5rIHdoZW4gYWRkaW5nCj4gPiBzdXBwb3J0IGZvciBhIG5ldyBjb21wb25l
bnQuICAKPiAKPiBJIHdhcyB1bmFibGUgdG8gZmluZCBhIGRhdGFzaGVldCBmb3Igc3BlY2lmaWNh
bGx5IEgyN1VDRzhUMkZUUi1CQy4gVGhlCj4gYmVzdCBkYXRhc2hlZXQgSSBjb3VsZCBmaW5kIGlz
IGZvciBIMjdVQ0c4VDJFVFItQkNbMF1bMV0uIEhvd2V2ZXIsIHRoZXJlCj4gYXJlIGxheW91dCBw
YXJhbWV0ZXJzIGZvciBIMjdVQ0c4VDJGVFItQkMgaW4gc29tZSB2ZXJzaW9ucyBvZiB0aGUgdmVu
ZG9yCj4gTkFORCBkcml2ZXJbMl1bM11bNF0uIFRoZSBIeW5peCBjaGlwIGlzIHBhY2thZ2VkIGFz
IEVzc2VuY29yZQo+IEkzVC04R1E4VDJINVRBUkMsIGFzIHJlZmVyZW5jZWQgaW4gdGhhdCBOQU5E
IElEIHRhYmxlLCB3aGljaCBpcyB0aGUKPiBhY3R1YWwgcGFja2FnZSBvbiB0aGUgYm9hcmQgSSBo
YXZlLgo+IAo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4gCj4gWzBdOgo+IGh0dHBzOi8vejNkOWI3dTgu
c3RhY2twYXRoY2RuLmNvbS9wZGYtZG93bi9ILzIvNy9IMjdVQ0c4VDJFVFItQkMtSHluaXgucGRm
CgpQb2ludGluZyB0byBbMF0gb3IgWzFdIGluIHRoZSBjb21taXQgbG9nIHdvdWxkIGJlIG5pY2Ug
YXQgbGVhc3QsIGV2ZW4KdGhvdWdoIHdlIGNhbm5vdCBnZXQgb3VyIGhhbmRzIG9uIHRoZSByZWFs
IGRhdGFzaGVldC4uLgoKPiBbMV06IGh0dHA6Ly93d3cuenNvbmcuY29tLmNuL3VzZXJmaWxlcy9I
MjdVQyhEKUc4VChVKTJFVFItQkNfUmV2MS4wXzA4MjYucGRmCj4gWzJdOgo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9lbmdTaW50ZWNrL0ExMzNfSW1hZ2UvYmxvYi9tYWluL2xvbmdhbi9rZXJuZWwvbGlu
dXgtNC45L21vZHVsZXMvbmFuZC9zdW44aXcxNXAxL3BoeS1uYW5kL3BoeXNpY192Mi9uYW5kX2lk
Mi5jI0wxNTkyCj4gWzNdOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9sYXVuY2hmdXIvcmc4MTgta2Vy
bmVsL2Jsb2IvbWFzdGVyL21vZHVsZXMvbmFuZC9zdW44aXcxNXAxL3BoeS1uYW5kL3BoeXNpY192
Mi9uYW5kX2lkMi5jI0wxNTkyCj4gWzRdOiBBZGRpbmcgbWVtYmVyIG5hbWVzIHRvIHRoYXQgdGFi
bGUgZW50cnk6Cj4gCj4gey5uYW5kX2lkICAgICAgICAgICAgICAgPSB7MHhhZCwgMHhkZSwgMHgx
NCwgMHhhYiwgMHg0MiwgMHg0YSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGZmLCAw
eGZmfSwKPiAgLmRpZV9jbnRfcGVyX2NoaXAgICAgICA9IDEsCj4gIC5zZWN0X2NudF9wZXJfcGFn
ZSAgICAgPSAzMiwKPiAgLnBhZ2VfY250X3Blcl9ibGsgICAgICA9IDI1NiwKPiAgLmJsa19jbnRf
cGVyX2RpZSAgICAgICA9IDIxMTIsCj4gICNkZWZpbmUgTkFORF9NVUxUSV9QUk9HUkFNICgxIDw8
IDMpCj4gICNkZWZpbmUgTkFORF9SQU5ET00gICAgICAgICgxIDw8IDcpCj4gICNkZWZpbmUgTkFO
RF9SRUFEX1JFVFJZICAgICgxIDw8IDgpCj4gICNkZWZpbmUgTkFORF9MU0JfUEFHRV9UWVBFICgw
eGZmIDw8IDEyKQo+ICAub3BlcmF0aW9uX29wdCAgICAgICAgID0gMHgwMDAwMjE4OCwKPiAgLnZh
bGlkX2Jsa19yYXRpbyAgICAgICA9IDg5NiwKPiAgLmFjY2Vzc19mcmVxICAgICAgICAgICA9IDQw
LAo+ICAuZWNjX21vZGUgICAgICAgICAgICAgID0gOCwKPiAgLnJlYWRfcmV0cnlfdHlwZSAgICAg
ICA9IDB4MDUwODA0LAo+ICAuZGRyX3R5cGUgICAgICAgICAgICAgID0gMCwKPiAgLm9wdGlvbl9w
aHlpc2Nfb3Bfbm8gICA9IDE0LAo+ICAuZGRyX2luZm9fbm8gICAgICAgICAgID0gMCwKPiAgLmlk
X251bWJlciAgICAgICAgICAgICA9IDB4MDEwMDI2LAo+ICAubWF4X2Jsa19lcmFzZV90aW1lcyAg
ID0gMzAwMCwKPiAgLmRyaXZlcl9ubyAgICAgICAgICAgICA9IDEsCj4gIC5hY2Nlc3NfaGlnaF9m
cmVxICAgICAgPSA0MCwKPiAgLnJhbmRvbV9jbWQyX3NlbmRfZmxhZyA9IDAsCj4gIC5yYW5kb21f
YWRkcl9udW0gICAgICAgPSAwLAo+ICAubmFuZF9yZWFsX3BhZ2Vfc2l6ZSAgID0gMTYzODQgKyAx
NjY0fSwKClRoaXMgYW5kIHdoYXQgaXMgZGlzcGxheWVkIGluIHRoZSB0d28gZGF0YXNoZWV0cyBw
b2ludGVkIGFib3ZlIGxvb2tzCnZlcnkgbXVjaCBsaWtlIG91dC1vZi1iYW5kIGRhdGEgdG8gbWUs
IEkgZG9uJ3QgZ2V0IHdoeSB3ZSBzaG91bGQgdHJlYXQKdGhpcyBwYXJ0IG9mIHRoZSBhcnJheSBk
aWZmZXJlbnRseT8gVGhlIE9PQiBhcmVhIGlzIG5vdCBvbmx5IHN1cHBvc2VkIHRvCmJlIHVzZWQg
Zm9yIEVDQyBieXRlcyAoZXZlbiB0aG91Z2ggdGhhdCdzIGhvdyBVQkkgbWFrZSB1c2Ugb2YgaXQp
LCB5b3UKY2FuIHN0b3JlIGFsbCB0aGUgZGF0YSB5b3Ugd2FudCB0aGVyZSAoYnV0IGl0J3Mgbm90
IG5lY2Vzc2FyaWx5CnByb3RlY3RlZCBieSB0aGUgRUNDIGVuZ2luZSwgd2hpY2gsIGluIGdlbmVy
YWwsIG1hdHRlcnMgYSBsb3QuCgpJIGRvbid0IHNlZSBob3cgdGhpcyBkYXRhc2hlZXQgd291bGQg
YmUgZGlmZmVyZW50IHRoYW4gdGhlIG90aGVycy4gVGhleQpkb24ndCBkZXRhaWwgdGhlIGdlb21l
dHJ5LCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlbSB0byBkbyBpdCBpZiB0aGUKcGFnZSBzaXpl
IHdhcyBhbnl0aGluZyBkaWZmZXJlbnQgdGhhbiB0aGUgc3RhbmRhcmQ/Cgo+ICIub3B0aW9uX3Bo
eWlzY19vcF9ubyA9IDE0IiByZWZlcmVuY2VzIHRoaXMgZW50cnk6Cj4gewo+ICAgICAvKiAxNCAq
Lwo+ICAgICAubXVsdGlfcGxhbmVfcmVhZF9jbWQgPSB7MHg2MCwgMHgzMH0sCj4gICAgIC5tdWx0
aV9wbGFuZV93cml0ZV9jbWQgPSB7MHgxMSwgMHg4MX0sCj4gICAgIC5tdWx0aV9wbGFuZV9jb3B5
X3JlYWRfY21kID0gezB4NjAsIDB4NjAsIDB4MzV9LAo+ICAgICAubXVsdGlfcGxhbmVfY29weV93
cml0ZV9jbWQgPSB7MHg4NSwgMHgxMSwgMHg4MX0sCj4gICAgIC5tdWx0aV9wbGFuZV9zdGF0dXNf
Y21kID0gMHg3OCwKPiAgICAgLmludGVyX2JuazBfc3RhdHVzX2NtZCA9IDB4NzgsCj4gICAgIC5p
bnRlcl9ibmsxX3N0YXR1c19jbWQgPSAweDc4LAo+ICAgICAuYmFkX2Jsb2NrX2ZsYWdfcG9zaXRp
b24gPSAweDAwLAo+ICAgICAubXVsdGlfcGxhbmVfYmxvY2tfb2Zmc2V0ID0gMTAyNCwKPiB9LAo+
IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
