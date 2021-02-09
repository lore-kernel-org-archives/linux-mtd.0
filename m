Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E409CC433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 20:06:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5431F64E8C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 20:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5431F64E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0EV2BWLsj/1OOd39ZE1RRDY1e4eB07Wi8RPpQODz8lA=; b=xub9jd4tP1btGrhVnnWE3AuqW
	9VxPtxMggVklI3I1rxP6CiGlZRjgdDkWYW4mpstGIrKkvv3dj+KZaZxIxnhDqCGKEBWVVkdbqUHPK
	q5cDLpGizbW3oY4NoZdey61+jQOcEkNCq8CPl1nrezN7i9o8j1tbMws3A7ty7CijcLcvOvNdJTAzv
	Vy31yYvZPhaerYgL5pYevhKouOu73/12UDC3U0PF9PrwwGHyu0QNQ0/IeYJ9DiOH8T8fFgloo8MJt
	cdnww4MGYAof0kXWkTgRN9dXwUcFdnqC4R/iNYEhqCo+PIztpAVhVBA0KWuwFBSPpFObMN2xH4qdX
	p+Q51H44g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ZH9-00029F-AM; Tue, 09 Feb 2021 20:06:19 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ZH6-000287-5s
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 20:06:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 815D46083270;
 Tue,  9 Feb 2021 21:06:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bkPIndMJRUBv; Tue,  9 Feb 2021 21:06:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 38A33608A38F;
 Tue,  9 Feb 2021 21:06:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 83PBCidjxaEH; Tue,  9 Feb 2021 21:06:14 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 17CAB60A358A;
 Tue,  9 Feb 2021 21:06:14 +0100 (CET)
Date: Tue, 9 Feb 2021 21:06:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <1923896038.379134.1612901174023.JavaMail.zimbra@nod.at>
In-Reply-To: <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: NVDMpjLzrmLV3u3YwGU4qvbOOzku6DaSHdFp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_150616_396400_CB0D1DA4 
X-CRM114-Status: UNSURE (   7.13  )
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
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlrbG9zLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBJIGRvIHdvbmRlciBp
ZiBNVVNFIHNob3VsZCBnbyB0byBkcml2ZXJzL210ZC8gaW5zdGVhZC4gICBMb25nIHRlcm0KPj4g
Z29hbCB3b3VsZCBiZSBtb3ZlIENVU0UgdG8gZHJpdmVycy9jaGFyIGFuZCBtb3ZlIHRoZSB0cmFu
c3BvcnQgcGFydCBvZgo+PiBmdXNlIGludG8gbmV0L2Z1c2UgbGVhdmluZyBvbmx5IHRoZSBhY3R1
YWwgZmlsZXN5c3RlbXMgKGZ1c2UgYW5kCj4+IHZpcnRpb2ZzKSB1bmRlciBmcy8uCj4+IAo+PiBC
dXQgZm9yIG5vdyBqdXN0IG1vdmluZyB0aGUgbWluaW1hbCBpbnRlcmZhY2UgbmVlZGVkIGZvciBN
VVNFIGludG8gYQo+PiBzZXBhcmF0ZSBoZWFkZXIgKDxuZXQvZnVzZS5oPikgd291bGQgd29yaywg
SSBndWVzcy4KPj4gCj4+IERvIHlvdSB0aGluayB0aGF0IHdvdWxkIG1ha2Ugc2Vuc2U/Cj4gCj4g
WWVzLCBJJ20gYWxsIGZvciBoYXZpbmcgTVVTRSBpbiBkcml2ZXJzL210ZC8uCj4gCj4gSSBwbGFj
ZWQgTVVTRSBpbml0aWFsbHkgaW4gZnMvZnVzZS8gYmVjYXVzZSBDVVNFIHdhcyBhbHJlYWR5IHRo
ZXJlIGFuZCBtdXNlLmMKPiBpbmNsdWRlcwo+IGZ1c2VfaS5oLiBTbyB0cmllZCB0byBiZSBhcyBs
aXR0bGUgaW52YXNpdmUgYXMgcG9zc2libGUuCgpJIGRpZCBhIHF1aWNrIHBhdGNoIHNlcmllcyB3
aGljaCBtb3ZlcyBDVVNFIGludG8gZHJpdmVycy9jaGFyLwoKaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcncvbWlzYy5naXQvbG9nLz9oPWZzX2Z1c2Vfc3Bs
aXQKCkRvZXMgdGhpcyBtb3JlIG9yIGxlc3Mgd2hhdCB5b3UgaGFkIGluIG1pbmQ/CklmIHNvLCBJ
J2Qgc3VibWl0IHRoZXNlIHBhdGNoZXMsIHJlYmFzZSBNVVNFIG9uIHRoZW0gYW5kIGRvIGEgdjQg
c29vbi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
