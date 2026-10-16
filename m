Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC147CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eg4T/uo3FdGEh1D8eUsdrIJuspDALDQkBHSa9Yk4HQY=; b=DqD8/EQPxZlJ14
	sw0mjAIskfaMMbOKr46RlrYEoiinloc6+f0JQzWjsRkQbPBaV4q3uoLMqAowJW04OE4NJSPcFiIh+
	4RzcYFT+vH1UtUuAOReHvJl8gCsF9AtX+kdd49zIfVl+nF4wIKH7oeG9HAcHE6HhyLK8cvnGjNBi2
	sBlc3JqfxPS3wW685vzGtLaCgcuCSJsZ6B4026XTljNcwU3rVYLISOxk01d351HNkwAGOHcg3xgIU
	lmWZeuKuElQxEWGqjmLxvRzYlPA7LhxPe3bDOceyhOY9Nt+pqPrEQGaexhJHDnYxBCmoSWPrX+bQ2
	UxOt/Y9V0EOInVDW4hnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVrx-00000001cmZ-06dF;
	Fri, 16 Oct 2026 00:32:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVrt-00000001cm0-3qpT
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 00:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792110735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PpmzonvJ+GFyXX1ccvr8BDAPumMVPYHB7D08eoJkdk=;
	b=OMi03vrwiksem2U41TCFBpUAaYtOZu+lGZOzQNCPnbZbJzhol7uqK7YGClwnyJrFYP7ZvB
	XuiMXVbpxX9CP5a1piIHy0xC5qZ6xdSYcBrXoms3/U4sR8cR+kr8KrpKQcTPzttb0PiRWY
	wj4ZU8y3W/z/IQVJFmLs9cARieZ3mzo=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-jBZogp0XNSO-oPQ1uxUvVw-1; Fri, 16 Oct 2026 00:32:14 +0000
X-MC-Unique: jBZogp0XNSO-oPQ1uxUvVw-1
X-Mimecast-MFC-AGG-ID: jBZogp0XNSO-oPQ1uxUvVw_1792110733
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67694007c9cso8094433d50.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 17:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792110733; x=1792715533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PpmzonvJ+GFyXX1ccvr8BDAPumMVPYHB7D08eoJkdk=;
        b=wFXSNlHaIOLEuDj5XCS2MRcgV70Bw2RAYEBasTo3mI5XzS95GR8p8qO88cEt6Ejh2C
         RNjepyNyOA7bDw3hiVtRL9SC5mX80ir8UCBm5vpXypkuDumsGAggR4KsXzAmxKhfUXVz
         1k7/xB5n4DoVIqp0CWjZ+38blDyC0bxmME2pgbMoh70m/NXVsDG8aOCCxh2zH67BAf0h
         1f4ZQf3MxbtN8lomMbozbf9//6wsb8/lrVdTY3ixEOccMT21gYUhKM16Eb/vZYyDP9bU
         ZYqVtpjqtJsn/SXeSNW4yowhuJfOcA2uJwSyBofAQNYSYt0tbms3OKfC5hB6t9RtB35p
         /q3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwd5QU4aYHqONkcNdgy8u8a0cArN/WmgWzX3xMIA2csGh1QAJ2DowRuxfPXv6KHVehXtHCShfUNIbs=@lists.infradead.org
X-Gm-Message-State: AFq9FYKZtsOBcpTwp6SYDhu44y6dPZGjQNQ1cp+Ejga2i6Sq/m+WtZ3O
	2seRWnLZHv3cXgzZzQuHZYFxoARLim9GJ3gwj3ERKQPzqmC1UHf2QIx8XR5IMALzNTww+Ju6svf
	BYdeKb9gz4MwbOlC+zhDQWZ98kZfqkfZo5crxIDQMj/O+QudijcUU54NLpd1b5FBwZkK6FVyJ8o
	1r7kIpbeVhpFZ5q9/zQbHBlJzA22f4shYL8+cp/nuPxA==
X-Gm-Gg: AYBFou3KK9BnrY09wLFmQLNtbfDOpRwa2xxoDardUBzYTv/mzp9WUhvw6pe8XDVUbyT
	82FmhHy9uR57V55VO0Y2ToUICYbbu5Z1YvAxXdooRrrZPs32FJcSSyawtPLOjWXY0hFlLx5WzwY
	jzKd+lF9zVwBU/rvqJwOTT31nISaL9rfWstJ0dcJzBczcqVBspTD9fXuwlpAiFxa6DEXExomfFM
	7Ze5c6SchgT5imxCx5K4VmnQkeyUUaBNyqr3Vwa+cqwdQ==
X-Received: by 2002:a05:690e:12cf:b0:677:c92e:eee4 with SMTP id 956f58d0204a3-67936ac0905mr8161302d50.86.1792110733220;
        Thu, 15 Oct 2026 17:32:13 -0700 (PDT)
X-Received: by 2002:a05:690e:12cf:b0:677:c92e:eee4 with SMTP id
 956f58d0204a3-67936ac0905mr8161290d50.86.1792110732554; Thu, 15 Oct 2026
 17:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org> <20261012-work-fs-sb_rdonly-v1-20-60743a3dc326@kernel.org>
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-20-60743a3dc326@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 16 Oct 2026 02:32:01 +0200
X-Gm-Features: AclHuK8NmKT3H02cx2l9pkluaZaWRnSiR4jZEUSx8b1tH5UXdD0FGyrgWytahmA
Message-ID: <CAHc6FU5bdAjABRm=bnH68b2f66TZTDZ8sPdatLB2fS7-55U=yw@mail.gmail.com>
Subject: Re: [PATCH RFC 20/28] gfs2: wait for a pending withdraw before
 remounting read-only
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oZcPk7cjlEeeW-jOf09LBpjPFGFag_3fjxaCzhgw2Tw_1792110733
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_173218_042313_1F0DC673 
X-CRM114-Status: GOOD (  31.25  )
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

Q2hyaXN0aWFuLAoKT24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMToyN+KAr1BNIENocmlzdGlhbiBC
cmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFNpbmNlIGNvbW1pdCA5YzRhM2Rl
NmNkNWIgKCJnZnMyOiBBc3luY2hyb25vdXMgd2l0aGRyYXciKSBtb3N0IG9mIGEKPiB3aXRoZHJh
dyBoYXBwZW5zIGluIGRvX3dpdGhkcmF3KCkgZnJvbSBhIHdvcmsgaXRlbSBhbmQgU0RGX0pPVVJO
QUxfTElWRQo+IHN0YXlzIHNldCB1bnRpbCBpdCByYW4uIEEgcmVtb3VudCB0byByZWFkLW9ubHkg
aW4gdGhhdCB3aW5kb3cgZ29lcwo+IHRocm91Z2ggZ2ZzMl9tYWtlX2ZzX3JvKCkuIEl0cyBsb2cg
Zmx1c2hlcyBiYWlsIG91dCBlYXJseSBvbiB0aGUKPiB3aXRoZHJhd24gZmlsZXN5c3RlbSBiZWZv
cmUgRkxVU0hfU0hVVERPV04gY2FuIGNsZWFyIFNERl9KT1VSTkFMX0xJVkUKPiBhbmQgdGhlbiBn
ZnMyX3F1b3RhX2NsZWFudXAoKSBoaXRzIGl0cyBCVUdfT04oKToKPgo+ICAga2VybmVsIEJVRyBh
dCBmcy9nZnMyL3F1b3RhLmM6MTUzMiEKPiAgIFJJUDogMDAxMDpnZnMyX3F1b3RhX2NsZWFudXAr
MHg1NjIvMHg2YjAKPiAgICBnZnMyX21ha2VfZnNfcm8rMHhmMy8weDJlMAo+ICAgIGdmczJfcmVj
b25maWd1cmUrMHg0MmUvMHhmZDAKPiAgICByZWNvbmZpZ3VyZV9zdXBlcisweDQzNy8weGIyMAo+
Cj4gSnVzdCBmbHVzaGluZyB0aGUgd2l0aGRyYXcgd29yayBiZWZvcmUgdGhlIHJlbW91bnQgaXNu
J3QgZW5vdWdoLgo+IGdmczJfd2l0aGRyYXcoKSBzZXRzIFNERl9XSVRIRFJBV04sIGNhbGxzIGR1
bXBfc3RhY2soKSBhbmQgb25seSB0aGVuCj4gcXVldWVzIHRoZSB3b3JrLiBTbyBhIHJlbW91bnQg
Y2FuIHNlZSBhIHdpdGhkcmF3biBmaWxlc3lzdGVtIHdoaWxlCj4gdGhlcmUncyBub3RoaW5nIHRv
IGZsdXNoIHlldC4gQW5kIGEgd2l0aGRyYXcgY2FuIGFsc28gc3RhcnQgaW4gdGhlCj4gbWlkZGxl
IG9mIGdmczJfbWFrZV9mc19ybygpLgo+Cj4gU28gbGV0IGRvX3dpdGhkcmF3KCkgd2FrZSB1cCB3
YWl0ZXJzIHdoZW4gaXQgY2xlYXJzIFNERl9KT1VSTkFMX0xJVkUgYW5kCj4gbGV0IGdmczJfbWFr
ZV9mc19ybygpIHdhaXQgZm9yIHRoZSBiaXQgYWZ0ZXIgaXRzIGxvZyBmbHVzaGVzLCByaWdodAo+
IGJlZm9yZSBnZnMyX3F1b3RhX2NsZWFudXAoKS4gT24gYSBoZWFsdGh5IGZpbGVzeXN0ZW0gdGhl
IHNodXRkb3duIGZsdXNoCj4gYWxyZWFkeSBjbGVhcmVkIGl0LiB1bW91bnQgZG9lc24ndCBuZWVk
IHRvIHdhaXQuIGdmczJfcHV0X3N1cGVyKCkgc2V0cwo+IFNERl9OT1JFQ09WRVJZIGZpcnN0IGFu
ZCBnZnMyX3F1b3RhX2NsZWFudXAoKSBvbmx5IEJVR3Mgd2l0aG91dCBpdC4gT25jZQo+IHRoZSBi
aXQgaXMgY2xlYXIgdGhlIGpvdXJuYWwgaXNuJ3QgbGl2ZSBhbnltb3JlIGFuZCBnZnMyX21ha2Vf
ZnNfcm8oKQo+IGRvZXNuJ3Qgd3JpdGUgYW55dGhpbmcuCj4KPiBnZnMyX21ha2VfZnNfcncoKSBj
YW4gbGVhdmUgdGhlIGJpdCBzZXQgb24gYSB3aXRoZHJhd24gZmlsZXN5c3RlbSBhcwo+IHdlbGwu
IEl0IGNoZWNrcyBmb3IgYSB3aXRoZHJhdyBhbmQgdGhlbiBzZXRzIFNERl9KT1VSTkFMX0xJVkUu
IElmCj4gZG9fd2l0aGRyYXcoKSBydW5zIGluIGJldHdlZW4gaXQgZmluZHMgdGhlIGpvdXJuYWwg
bm90IGxpdmUgeWV0IGFuZAo+IHJldHVybnMuIE5vdGhpbmcgY2xlYXJzIHRoZSBiaXQgdGhlbiBh
bmQgdGhlIG5leHQgcmVtb3VudCB0byByZWFkLW9ubHkKPiB3YWl0cyBmb3IgaXQgZm9yZXZlci4g
U28gY2hlY2sgZm9yIHRoZSB3aXRoZHJhdyBhbmQgc2V0IHRoZSBiaXQgdW5kZXIKPiBzZF9sb2df
Zmx1c2hfbG9jaywgd2hpY2ggZG9fd2l0aGRyYXcoKSBob2xkcyB3aGlsZSBpdCB0ZXN0cyB0aGUg
Yml0Lgo+IFRoZW4gZWl0aGVyIHRoZSByZW1vdW50IHNlZXMgdGhlIHdpdGhkcmF3IG9yIGRvX3dp
dGhkcmF3KCkgc2VlcyB0aGUgbGl2ZQo+IGpvdXJuYWwuCj4KPiBSZXByb2R1Y2VyLCBsb2NrX25v
bG9jazogYSBTQ0hFRF9GSUZPIHRhc2sgd3JpdGVzIDEgdG8gdGhlIHdpdGhkcmF3Cj4gc3lzZnMg
a25vYiBmcm9tIGNwdSAxIGFuZCBrZWVwcyBjcHUgMSBidXN5IChSVCB0aHJvdHRsaW5nIGFuZCBj
cHUgMSdzCj4gZmFpciBzZXJ2ZXIgZGlzYWJsZWQpIHNvIGRvX3dpdGhkcmF3KCkgY2FuJ3QgcnVu
LCB0aGVuIGZyb20gY3B1IDI6Cj4KPiAgIG1vdW50IC1vIHJlbW91bnQscm8gL21udAo+Cj4gT24g
bG9ja19kbG0gdGhlIHdpbmRvdyBsYXN0cyBhcyBsb25nIGFzIHRoZSB3aXRoZHJhdyBoZWxwZXIg
cnVucy4gVGhlCj4gd2luZG93IGJlZm9yZSB0aGUgd29yayBpcyBxdWV1ZWQgY2FuIGJlIHdpZGVu
ZWQgd2l0aCBhIGtwcm9iZSBvbgo+IGR1bXBfc3RhY2tfbHZsKCkgdGhhdCBkZWxheXMgdGhlIHRh
c2sgd3JpdGluZyB0byB0aGUgd2l0aGRyYXcga25vYiBieSBhCj4gZmV3IHNlY29uZHMuIEEgcmVt
b3VudCB0byByZWFkLW9ubHkgb3Igc3lzcnEgdSBpbiB0aGF0IHdpbmRvdyBoaXRzIHRoZQo+IHNh
bWUgQlVHX09OKCkuCj4KPiBGaXhlczogOWM0YTNkZTZjZDViICgiZ2ZzMjogQXN5bmNocm9ub3Vz
IHdpdGhkcmF3IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBCcmF1bmVyIChBbXV0YWJsZSkgPGJyYXVuZXJAa2VybmVsLm9yZz4KPiAtLS0K
PiAgZnMvZ2ZzMi9zdXBlci5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQo+ICBmcy9nZnMy
L3V0aWwuYyAgfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZ2ZzMi9zdXBlci5jIGIvZnMvZ2ZzMi9z
dXBlci5jCj4gaW5kZXggMDYzMDJjMjkzNDBmLi4xZDdiMzkzNTRkNjUgMTAwNjQ0Cj4gLS0tIGEv
ZnMvZ2ZzMi9zdXBlci5jCj4gKysrIGIvZnMvZ2ZzMi9zdXBlci5jCj4gQEAgLTE0NywxMiArMTQ3
LDIzIEBAIGludCBnZnMyX21ha2VfZnNfcncoc3RydWN0IGdmczJfc2JkICpzZHApCj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIGVycm9yID0gZ2ZzMl9xdW90YV9pbml0KHNkcCk7Cj4gLSAgICAgICBp
ZiAoIWVycm9yICYmIGdmczJfd2l0aGRyYXduKHNkcCkpIHsKPiAtICAgICAgICAgICAgICAgZ2Zz
Ml9xdW90YV9jbGVhbnVwKHNkcCk7Cj4gKyAgICAgICBpZiAoZXJyb3IpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiBlcnJvcjsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogZG9fd2l0aGRy
YXcoKSBvbmx5IHRha2VzIGEgbGl2ZSBqb3VybmFsIGRvd24uIENoZWNrIGZvciBhIHdpdGhkcmF3
Cj4gKyAgICAgICAgKiB1bmRlciB0aGUgbG9jayBpdCBob2xkcyBmb3IgdGhhdCBzbyB0aGF0IGVp
dGhlciB3ZSBzZWUgdGhlIHdpdGhkcmF3Cj4gKyAgICAgICAgKiBvciBpdCBzZWVzIHRoZSBqb3Vy
bmFsIGxpdmUuIE90aGVyd2lzZSBnZnMyX21ha2VfZnNfcm8oKSB3YWl0cyBmb3IKPiArICAgICAg
ICAqIHRoZSBiaXQgZm9yZXZlci4KPiArICAgICAgICAqLwo+ICsgICAgICAgZG93bl93cml0ZSgm
c2RwLT5zZF9sb2dfZmx1c2hfbG9jayk7Cj4gKyAgICAgICBpZiAoZ2ZzMl93aXRoZHJhd24oc2Rw
KSkKPiAgICAgICAgICAgICAgICAgZXJyb3IgPSAtRUlPOwo+IC0gICAgICAgfQo+IC0gICAgICAg
aWYgKCFlcnJvcikKPiArICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgc2V0X2JpdChTREZf
Sk9VUk5BTF9MSVZFLCAmc2RwLT5zZF9mbGFncyk7Cj4gKyAgICAgICB1cF93cml0ZSgmc2RwLT5z
ZF9sb2dfZmx1c2hfbG9jayk7Cj4gKyAgICAgICBpZiAoZXJyb3IpCj4gKyAgICAgICAgICAgICAg
IGdmczJfcXVvdGFfY2xlYW51cChzZHApOwo+ICAgICAgICAgcmV0dXJuIGVycm9yOwo+ICB9Cj4K
PiBAQCAtNTY1LDYgKzU3Niw5IEBAIHZvaWQgZ2ZzMl9tYWtlX2ZzX3JvKHN0cnVjdCBnZnMyX3Ni
ZCAqc2RwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSFogKiA1KTsKPiAg
ICAgICAgICAgICAgICAgZ2ZzMl9hc3NlcnRfd2FybihzZHAsIGdmczJfbG9nX2lzX2VtcHR5KHNk
cCkpOwo+ICAgICAgICAgfQo+ICsgICAgICAgLyogQSB3aXRoZHJhdyB0aGF0IGRvX3dpdGhkcmF3
KCkgZGlkbid0IGZpbmlzaCB5ZXQgbGVhdmVzIGl0IGxpdmUuICovCj4gKyAgICAgICBpZiAoIXRl
c3RfYml0KFNERl9OT1JFQ09WRVJZLCAmc2RwLT5zZF9mbGFncykpCj4gKyAgICAgICAgICAgICAg
IHdhaXRfb25fYml0KCZzZHAtPnNkX2ZsYWdzLCBTREZfSk9VUk5BTF9MSVZFLCBUQVNLX1VOSU5U
RVJSVVBUSUJMRSk7Cj4gICAgICAgICBnZnMyX3F1b3RhX2NsZWFudXAoc2RwKTsKPiAgfQo+Cj4g
ZGlmZiAtLWdpdCBhL2ZzL2dmczIvdXRpbC5jIGIvZnMvZ2ZzMi91dGlsLmMKPiBpbmRleCA4M2I4
YmI2NDQ2ZTUuLjE1MzVjZTJiN2FhOCAxMDA2NDQKPiAtLS0gYS9mcy9nZnMyL3V0aWwuYwo+ICsr
KyBiL2ZzL2dmczIvdXRpbC5jCj4gQEAgLTEyMiw3ICsxMjIsNyBAQCBzdGF0aWMgdm9pZCBkb193
aXRoZHJhdyhzdHJ1Y3QgZ2ZzMl9zYmQgKnNkcCkKPiAgICAgICAgICAgICAgICAgdXBfd3JpdGUo
JnNkcC0+c2RfbG9nX2ZsdXNoX2xvY2spOwo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAg
ICAgICB9Cj4gLSAgICAgICBjbGVhcl9iaXQoU0RGX0pPVVJOQUxfTElWRSwgJnNkcC0+c2RfZmxh
Z3MpOwo+ICsgICAgICAgY2xlYXJfYW5kX3dha2VfdXBfYml0KFNERl9KT1VSTkFMX0xJVkUsICZz
ZHAtPnNkX2ZsYWdzKTsKPiAgICAgICAgIGdmczJfYWlsX2RyYWluKHNkcCk7IC8qIGZyZWVzIGFs
bCB0cmFuc2FjdGlvbnMgKi8KPiAgICAgICAgIHVwX3dyaXRlKCZzZHAtPnNkX2xvZ19mbHVzaF9s
b2NrKTsKPgo+Cj4gLS0KPiAyLjUzLjAKPgoKdGhpcyBsb29rcyBnb29kIGFsbCBhcm91bmQsIHRo
YW5rIHlvdSB2ZXJ5IG11Y2guIENhbiBJIGFkZCBpdCB0byBteSBnZnMyIHF1ZXVlPwoKVGhhbmtz
LApBbmRyZWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
