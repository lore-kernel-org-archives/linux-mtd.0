Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E81606A33D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zF4FEWLY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfYMFbPY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uYH2strOrh8jAYT38aTCuJgAMqmKm+4oVHA+tb/xQCE=; b=zF4FEWLYJ0FQ3Ioxb+PO6SJm+J
	DA/aMKz2w0UjyDcix74/JJnxN26Iqzm9Nk2P6PU1uuFamX98W2C8B8nakjgDvAz7HMwRJoV6NVCm4
	F6DDkjj1X3zRxYzIJ4/PhwDsMYLngRJDwrB6LAUYcVV+ukluIRYgmAlDeEza4C+iqQ0vB3wbzsnZe
	lfn4M+cgAbad9TB7shheGIO600t9vn2Ow4AqTNdK0alKmuKsq8TIIfOjhgiSFCUa7k63DXowQaIDr
	3aZ2wGOqFK3KSBbskt9sxUwIfTs+8VyTGSNTfL5wBdQzjffwyb/v2ruzK/TnTRq3ulOyiXYPcmgPS
	WNxnwaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzZP-0000000BaQq-1Yci;
	Thu, 19 Nov 2026 10:40:47 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzZM-0000000BaQ6-3fC8
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 10:40:46 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-7d6a6776719so1286569137.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 02:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084843; cv=none;
        d=google.com; s=arc-20260327;
        b=jwr6xjnZFmgaK7LpyXtJ84bE5gfJUtcqck7OecLNPw3vO34QaXvM7oVfowX6iI2yIT
         h5zKTZgnVbtIc08mMnsiZfCl4JfzJN96WsE6gU2QGjqhXjAWkZg5vUz2PEd1T3wizKBM
         kd6HkV8vK7YZQKxgiMdqnMzYi9a023Rc/yQb1ytxskd+k/HxahLsaTH5J96nVfWSxHl/
         HEyjNU1mla/XOINp6Qf5KsiCjvBBDtKSBgeIWgKQURnc70mwCQuRvywLjPMGJFt7Y81j
         YdLL9MQaZYgLvzMsZj/xYIhSfV0MiKABhoAj1EV4DGPQzId1ymN5ObD9piRxnaJGqHNs
         uflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
        fh=XWQWVWwHR232Ed7eeGtFNsZFNaIqy5gPhD1g9qXRg2k=;
        b=sbAKExlHD0kXk58/pDaVml2ZUntFBlTIg8tDp70gkeW7mNUOxMDTSLipj+gszmrwov
         6Q88ww3gaLFq0nHH3utHE3LKYFTb7NYngm/f9ponCdLfclZ33SM2sD8Z9hB58t2KVoPQ
         vnXcarGMD5L1Qd7DNP5E/4a+yuq/CigpaKEkr1Gl9D0JzKcGLIFBRpJI0iNtBoWxo812
         aYpTCqkcU/71WQGbvQtHfAMKKVl/qXq20olnbmlGP3bW3dGavKWCC4SfLjt19wChg93h
         ueq0TzHBfuUOLpJcnNQSyH72ukqjJjXB1DYpabstfhKqYugI/IS63SPLDy8mbul0MIxI
         2Stw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084843; x=1795689643; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
        b=LfYMFbPYB4tOZd1YxOWGFT775fAavlix/saz3Luyx096up9SrpK1NkCdL/qaMt/uwL
         IHwEuudV7dI8o0S7GasRW+C39J9A/OUXjZ1wZuIBFlKdDaoT5c4pPaelQi5u4+64JTlv
         GRAFzRSWbxyCV+H3FaWqPVhM2ZPD+TPMA6pkccp8GGj5eSX5TEIPTGrFCXQaPUD2clbw
         KQ4VRXfLVXd6OoMgO/LSbSL0+ZBsHqoASR/SUgcNSh1/UmL7zBKfNd3L/dBq1d7V2WFJ
         HGOeTS/abTgS3NuN/IdzBprQsAUUfw64ATVyNyR0lDS5VjCqD5decA0IWLSQZNYdeP7+
         70jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084843; x=1795689643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
        b=Of3qkyKf9vPToEkXyRlj3B+FlzuCASdxEe2r603IA0bZtWp3MGgyfivIU+uwEvqwRB
         Z/ucD9iuI1INMdflexcgy4YDLm4lOXcj1bSHzfSrm0sEd4ZkrM70gC1IcU45f2XIFj72
         7pYqr/j8O1rsR9HlgVtaGGWnBxxSSuZ26TZADK+ttRq1zvSSJIzV6yCm0NeAGuPUBrAZ
         zJgHSYhoK6bf3xfx+Sp0Ta9BOMkaj8XnPAoRBjy/GYLWInWGDjht9Bdh/PEVks1EbQW2
         IcdWsO+0c9KRZaec7KaaQPyn5RlSXLhP/ibFEjV8d1h/qt1CSQ/kLrISeY6nhWjdG/Zh
         Twkw==
X-Forwarded-Encrypted: i=1; AL+hErGIYVaqOemqFCZGxXYJ7JFioiq67VY9UGgaRfnh6vAai2TZDVClyi0M0/ORPzvA7VMkgn7tgMzTOv8=@lists.infradead.org
X-Gm-Message-State: APuU4Z9a2YWLYBwv2jFRy3rkYQpyBbgPiA/Wxg+sSRADvzbbd/YKT/b1
	eZEAiOTdqeE/Yncz6htz/HG0FmaSftRY1FYduixrdDYwmZLemyg5VurPEK3ynwZn5VKholtwl14
	j7+x8h6hkfmPHDpDwe9fx8R0PBwTcocPt1Q==
X-Gm-Gg: AYBFou29Sba1qjv4Pztz/qNrYkjQd5zUbc/2RVMtkYlGJrM29n/Hkp+DH/z584xGHOK
	Vd9t5ZN6cTPA14H1q9GEhoqPz1T+62B1LgpF5ksRuaVDFITof7yMa+SNcKut2Hbh7c+U0je5HJU
	W3EWUGLiXepwQS9HzCJGg3YZxOyYD7vqixhpVEHqNQVfGrJWQJUQ/d6JAwAPQnVlh16DnjMw4hu
	TeLC1Z2Vnu1RTWMvXp39qPaqj6YUE9E/YAbCSmJooKcW5R5A+dlWWb/VCf4K+QKEySmz0fmHjHl
	DvWDOapiLa2VxFuYnkMrxCgdlVEkI15ZdwRRsCUYaIDYYX6D09VxfyqUcaXrLJ5EqlibVq9jZgE
	zrozDEGErQYfmO+UcvoENCNOTnqtExqqjy2MjPxZTfMnmrKtyAeNYNLO/pt9BXub8btdQURS7hi
	HD97XgkMk8MaWCqryfcuL4NzHfjSXbdE14Udm3TqYn9bmPKCVR6gys3I/gBgGwpqkchm2/B9d8z
	MAmPsVli1Rpqkjf7fLaZDey1B+JceA=
X-Received: by 2002:a67:e7c1:0:b0:7d0:6f1c:b3fc with SMTP id
 ada2fe7eead31-7d6b9ecfa35mr2486007137.0.1795084843574; Thu, 19 Nov 2026
 02:40:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
 <87fqwyjwvk.fsf@bootlin.com> <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
 <87ld6pfc75.fsf@bootlin.com> <CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
 <87tslddsz7.fsf@bootlin.com>
In-Reply-To: <87tslddsz7.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:40:32 -0700
X-Gm-Features: Aa3M54qjaCUt9J365p8_dA5m7ajQO-qQNSq3Rt3oQKzZyARlHcvRPZIOw_smURU
Message-ID: <CADvTj4rNmrJK6kgVJVFEdZfA16SnzjZyayDt04AMSaMrmETfOQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Artem B. Bityuckiy" <dedekind@infradead.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_024044_927820_380627FD 
X-CRM114-Status: GOOD (  28.22  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMzoxOeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4KPiA+PiA+PiBJIHdvdWxkIHByZWZlciBpZiB5
b3UgY291bGQgd3JpdGUgeW91ciBvd24gY29tbWl0IGxvZ3MsIGdpdmluZyB1cyBtb3JlCj4gPj4g
Pj4gY29uZmlkZW5jZSBvbiB0aGUgd29yayB0aGF0IGhhcyBiZWVuIGFza2VkLiBZb3UgY2FuIHVz
ZSBhbiBMTE0gdG8KPiA+PiA+PiBpbXByb3ZlL2VuaGFuY2UgaXQgb2J2aW91c2x5Lgo+ID4+ID4K
PiA+PiA+IFRvIGJlIGhvbmVzdCBJJ3ZlIG5ldmVyIGJlZW4gZ3JlYXQgYXQgd3JpdGluZyBjb21t
aXQgbWVzc2FnZXMgaW4KPiA+PiA+IGdlbmVyYWwgYW5kIGhhdmUgZ290dGVuIGEgbG90IG1vcmUg
Y29tcGxhaW50cyBhYm91dCBjb21taXQgbWVzc2FnZXMKPiA+PiA+IG1pc3NpbmcgaW1wb3J0YW50
IGRldGFpbHMgcHJpb3IgdG8gdXNpbmcgTExNJ3MuIEkgY2FuIGJhcmVseSB0ZWxsIHRoZQo+ID4+
Cj4gPj4gRm9yIG1lIHRoZSBjb2RlIGlzIGdldHRpbmcgYmV0dGVyIGJ1dCB0aGUgY29tbWl0IGxv
Z3MgYXJlIHVuY2xlYXIuIFNvbWUKPiA+PiBkZXRhaWxzIHdoaWNoIGRvbid0IG5lZWQgKGltbykg
dG8gYmUgd3JpdHRlbiBhcmUgdGhlcmUsIGFuZCB0aGUgYmlnCj4gPj4gcGljdHVyZSBpcyBvZnRl
biBtaXNzaW5nIG9yIG5vdCBjbGVhcmx5IHN0YXRlZCBiZWZvcmUgdGhlIGRldGFpbHMuCj4gPj4K
PiA+PiBEb24ndCBnZXQgbWUgd3JvbmcsIHVzaW5nIGFuIExMTSB0byByZWZpbmUvcmV3b3JkL3Jl
b3JnYW5pemUgaXMgZmluZSwKPiA+PiBidXQgbGV0dGluZyB0aGUgTExNIHdyaXRlIGl0IGVudGly
ZWx5IGlzIG5vdCB3b3JraW5nIHdlbGwuCj4gPgo+ID4gSSBndWVzcyB0aGUgaXNzdWUgaXMgdGhh
dCBJIG9mdGVuIGRvbid0IGhhdmUgdGhlIGJlc3QgdW5kZXJzdGFuZGluZwo+ID4gb2Ygd2hhdCB0
aGUgYmlnIHBpY3R1cmUgdGhhdCBuZWVkcyBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2VzCj4gPiBpcyBzb21lIG9mIHRoZSB0aW1lLCBpZiBJIGRpZCB0aGVuIEkgd291bGQgdGhlbiBq
dXN0IGluc3RydWN0IHRoZSBMTE0gdG8KPiA+IG1ha2UgdGhvc2UgZWRpdHMgd2hlbmV2ZXIgSSBy
ZXZpZXcgcGF0Y2hlcyBiZWZvcmUgc2VuZGluZyB0aGVtLgo+ID4KPiA+IEkgdGhpbmsgSSBqdXN0
IGRvbid0IGhhdmUgZ29vZCBpbnR1aXRpb24gd2hlbiBpdCBjb21lcyB0byBwcmVkaWN0aW5nIHdo
YXQgaXMKPiA+IGltcG9ydGFudCB0byBleHBsYWluIGluIGNvbW1pdCBtZXNzYWdlcy4KPgo+IEkg
Z2V0IGl0LCBidXQgZm9yIHNvbWVvbmUgc3VibWl0dGluZyB0aGlzIG1hbnkgcGF0Y2hlcywgdGhh
dCBsYWNrIG9mCj4gdW5kZXJzdGFuZGluZyBpcyBwcmVjaXNlbHkgdGhlIHByb2JsZW06IGRlbGVn
YXRpbmcgdGhlIHdvcmRpbmcgdG8gYW4gTExNCj4gd2hlbiB5b3UgZG9uJ3Qga25vdyB0aGUgcmF0
aW9uYWxlIGRvZXNuJ3QgcmVtb3ZlIHRoZSBjb3N0LCBpdCBqdXN0Cj4gc2hpZnRzIGl0IG9udG8g
b3RoZXJzLgoKSXQncyBhIGJpdCB0cmlja3kgc2luY2UgaXQncyBub3QgdGhhdCBJIGRvbid0IGhh
dmUgYW55IHJhdGlvbmFsZSwgaXQncyBtb3JlCnRoYXQgSSBkb24ndCBhbHdheXMgaGF2ZSB0aGUg
YmVzdCBiaWcgcGljdHVyZSByYXRpb25hbGUgc2luY2UgdGhhdCdzIGEKYml0IG1vcmUgc3ViamVj
dGl2ZS4KClRoZSByYXRpb25hbGUgSSdtIHVzaW5nIGlzIGdlbmVyYWxseSBtb3JlIHJlbGF0ZWQg
dG8gYSBUTEErIHRlc3QKYW5kL29yIGZhdWx0IGluamVjdGlvbiB0ZXN0IHRoYXQgd2FzIHVzZWQg
dG8gY29uZmlybS9kaXNjb3ZlciB0aGUgYnVnLgoKSSBndWVzcyB0aGUgaXNzdWUgaXMgcHJvYmFi
bHkgdGhhdCB0aGUgcGF0aHdheSB1c2VkIHRvIHByb3ZlIHRoZQpidWcgY2FuIGJlIHNvbWV3aGF0
IGRldGFjaGVkIGZyb20gdGhlIGJpZ2dlciBwaWN0dXJlLgoKSSd2ZSB0d2Vha2VkIG15IHdvcmtm
bG93cyB0byBkbyBtb3JlIGFuYWx5c2lzIHRvIHRyeSBhbmQgZGVyaXZlCnRoZSBiaWdnZXIgcGlj
dHVyZSByYXRpb25hbGUgZm9yIGJldHRlciBjb21taXQgbWVzc2FnZXMgcmF0aGVyCnRoYW4gZm9j
dXNpbmcgYXMgbXVjaCBvbiB0aGUgbW9zdCBwcm94aW1hbCBmYWlsdXJlIHBhdGh3YXkgdG8KdGhl
IGJ1Zy4gSG9wZWZ1bGx5IGZyb20gdGhlcmUgaXQgd2lsbCBiZSBtb3JlIG9idmlvdXMgd2hhdCB0
aGUKY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGZvY3VzIG9uLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
