Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98197C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 14:36:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C7364E56
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 14:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C7364E56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JDq7gt31FHrv6w7yF3t05dOf7jShHA8n0AmyfQqssKw=; b=13ZjDFsh4vrQYL70Ltc9a0+MB
	o1uWOlyDN4BTL+GuBm0Rt/gHsio2NZ3Ls1DBYU/vp10Pewz5d94GLwLtoLVhpZ8S/h1VV7rc5iqx9
	XrixEp98TP9sCRW0GOK8rrutUFI5MSxpX0/kV7vsaQh/NVn3a9GLKZVfE6xwfQInsYqI9gdggu8ck
	IwVYmQV3dH9I6tQjrsVLI5EgHUVLehojC0CpuJSqjRH1D4itc8C53YoEKFJaPOwzJfrSNwg18m4l8
	IigiZ8eN38kFOJWgm66wI8JqFQB3lCvziHN1O33szfWpz+R2J8KkDj5NcGSC+259ymVF2Xy9iO6kR
	P5+f9R0lQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9U7f-0008Vo-0M; Tue, 09 Feb 2021 14:36:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9U7c-0008Tk-1Y
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 14:36:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6B886608A38A;
 Tue,  9 Feb 2021 15:35:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8Vwy9HmKlMkY; Tue,  9 Feb 2021 15:35:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0B252605B49C;
 Tue,  9 Feb 2021 15:35:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BlL2HfhYicrX; Tue,  9 Feb 2021 15:35:57 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D535B608A38A;
 Tue,  9 Feb 2021 15:35:57 +0100 (CET)
Date: Tue, 9 Feb 2021 15:35:57 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
In-Reply-To: <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: NVDMpjLzrmLV3u3YwGU4qvbOOzku6A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_093608_232323_08F35484 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven@narfation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlrbG9zLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBUaGUgY29yZSBnb2Fs
IG9mIE1VU0UgaXMgaGF2aW5nIHRoZSBjb21wbGV4aXR5IG9uIHRoZSB1c2Vyc3BhY2Ugc2lkZSBh
bmQKPj4gb25seSBhIHNtYWxsIE1URCBkcml2ZXIgaW4ga2VybmVsc3BhY2UuCj4+IFdoaWxlIHBs
YXlpbmcgd2l0aCBkaWZmZXJlbnQgYXBwcm9hY2hlcyBJIHJlYWxpemVkIHRoYXQgRlVTRSBvZmZl
cnMgZXZlcnl0aGluZwo+PiB3ZSBuZWVkLiBTbyBNVVNFIGlzIGEgbGl0dGxlIGxpa2UgQ1VTRSBl
eGNlcHQgdGhhdCBpdCBkb2VzIG5vdCBpbXBsZW1lbnQgYQo+PiBiYXJlIGNoYXJhY3RlciBkZXZp
Y2UgYnV0IGFuIE1URC4KPiAKPiBMb29rcyBmaW5lLgoKSSdtIGdsYWQgdG8gaGVhciB0aGF0IQoK
PiBJIGRvIHdvbmRlciBpZiBNVVNFIHNob3VsZCBnbyB0byBkcml2ZXJzL210ZC8gaW5zdGVhZC4g
ICBMb25nIHRlcm0KPiBnb2FsIHdvdWxkIGJlIG1vdmUgQ1VTRSB0byBkcml2ZXJzL2NoYXIgYW5k
IG1vdmUgdGhlIHRyYW5zcG9ydCBwYXJ0IG9mCj4gZnVzZSBpbnRvIG5ldC9mdXNlIGxlYXZpbmcg
b25seSB0aGUgYWN0dWFsIGZpbGVzeXN0ZW1zIChmdXNlIGFuZAo+IHZpcnRpb2ZzKSB1bmRlciBm
cy8uCj4gCj4gQnV0IGZvciBub3cganVzdCBtb3ZpbmcgdGhlIG1pbmltYWwgaW50ZXJmYWNlIG5l
ZWRlZCBmb3IgTVVTRSBpbnRvIGEKPiBzZXBhcmF0ZSBoZWFkZXIgKDxuZXQvZnVzZS5oPikgd291
bGQgd29yaywgSSBndWVzcy4KPiAKPiBEbyB5b3UgdGhpbmsgdGhhdCB3b3VsZCBtYWtlIHNlbnNl
PwoKWWVzLCBJJ20gYWxsIGZvciBoYXZpbmcgTVVTRSBpbiBkcml2ZXJzL210ZC8uCgpJIHBsYWNl
ZCBNVVNFIGluaXRpYWxseSBpbiBmcy9mdXNlLyBiZWNhdXNlIENVU0Ugd2FzIGFscmVhZHkgdGhl
cmUgYW5kIG11c2UuYyBpbmNsdWRlcwpmdXNlX2kuaC4gU28gdHJpZWQgdG8gYmUgYXMgbGl0dGxl
IGludmFzaXZlIGFzIHBvc3NpYmxlLgoKPj4KPj4gTm90ZXM6Cj4+IC0tLS0tLQo+Pgo+PiAtIE9P
QiBzdXBwb3J0IGlzIGN1cnJlbnRseSBsaW1pdGVkLiBDdXJyZW50bHkgTVVTRSBoYXMgbm8gc3Vw
cG9ydCBmb3IgcHJvY2Vzc2luZwo+PiAgIGluLSBhbmQgb3V0LWJhbmQgaW4gdGhlIHNhbWUgTVRE
IG9wZXJhdGlvbi4gSXQgaXMgZ29vZCBlbm91Z2ggdG8gbWFrZSBKRkZTMgo+PiAgIGhhcHB5LiBU
aGlzIGxpbWl0YXRpb24gaXMgYmVjYXVzZSBGVVNFIGhhcyBubyBzdXBwb3J0IG1vcmUgdGhhbiBv
bmUgdmFyaWFibGUKPj4gICBsZW5ndGggYnVmZmVyIGluIGEgRlVTRSByZXF1ZXN0Lgo+PiAgIEF0
IGxlYXN0IEkgZGlkbuKAmXQgZmluZCBhIGdvb2Qgd2F5IHRvIHBhc3MgbW9yZSB0aGFuIG9uZSBi
dWZmZXIgdG8gYSByZXF1ZXN0Lgo+PiAgIE1heWJlIEZVU0UgZm9sa3MgY2FuIGNvcnJlY3QgbWUu
IDotKQo+IAo+IElmIHlvdSBsb29rIGF0IGZ1c2VfZG9faW9jdGwoKSBpdCBkb2VzIHZhcmlhYmxl
IGxlbmd0aCBpbnB1dCBhbmQKPiBvdXRwdXQgYXQgdGhlIHNhbWUgdGltZS4gIEkgZ3Vlc3MgeW91
IG5lZWQgc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhhdC4KCkknbGwgZGlnIGludG8gdGhpcyEKClRo
YW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
