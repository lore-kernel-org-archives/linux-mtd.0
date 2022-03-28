Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A1EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3GHw5p6wOijuIxDtnWlNjU2zLiMvevCJZb4VaopRjB8=; b=1X767JdgZQ8PX21Pm5x8B/4tlZ
	JDBFGjMR6ueDrtHJx6kqM/s6S4VVNmIi87qnbFY78vma7cYyjEqCxRf/wXlIMYi+LNF5JFYlesZae
	qo0c6AcVuqVpYq0E5DBGitOmfm3sCWpgiNSsLDdqvBbWkaB/V4sxD9Zi36VhARRZytP2TNxjyPt85
	kPLAl9E4Ju0k5Ua0pM0Kfbn/7CPoBbsmjDqvsrmIlWh2AzD2nJFPRQUa66NMhbNgfYOneOWm3r0Ho
	H5O7lJRayWQZstYibo9GIwVmubx9SvEzCJFeKGFyB+AG2ytbZhyfhhWfEvgQ5r9M69ynLp0/uCRZ4
	UurLQzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYl6N-007vJA-EQ; Mon, 28 Mar 2022 08:51:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYl6K-007vIM-8F
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 08:51:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E85A96081103;
 Mon, 28 Mar 2022 10:51:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id j0iTAEzubVXU; Mon, 28 Mar 2022 10:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7F1D66081107;
 Mon, 28 Mar 2022 10:51:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7suryUJ87ubV; Mon, 28 Mar 2022 10:51:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 583396081103;
 Mon, 28 Mar 2022 10:51:45 +0200 (CEST)
Date: Mon, 28 Mar 2022 10:51:45 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Message-ID: <598533037.192422.1648457505190.JavaMail.zimbra@nod.at>
In-Reply-To: <20220328104557.4f065c25@xps13>
References: <20220325120025.17931-1-zajec5@gmail.com>
 <798660053.192180.1648452469848.JavaMail.zimbra@nod.at>
 <237eda25-8fc0-38df-0da0-96364a9f9359@gmail.com>
 <20220328104557.4f065c25@xps13>
Subject: Re: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: nandwrite: warn about writing 0xff blocks
Thread-Index: yWDuOj/W1yqivHoywkw6C0/rOk891w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_015148_465082_CE89D971 
X-CRM114-Status: GOOD (  12.57  )
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
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiA+IFdoaWxlIEkgbGlrZSB0aGUgcGF0Y2ggSSdt
IHN0aWxsIG5vdCBzbyBjb252aW5jZWQgd2h5IHdlIGNhbid0IG1ha2UKPj4gPiBza2lwYWxsZmZz
PXRydWUgYnkgZGVmYXVsdC4KPj4gCj4+IEkgdGhvdWdodCBpdCdzIGFib3V0IGNoYW5naW5nIC8g
YnJlYWtpbmcgdXNlciBpbnRlcmZhY2U6Cj4+IAo+PiBbMjAyMi0wMy0yNV0gWzExOjQwOjUzIENF
VF0gPGRlclJpY2hhcmQ+IG1yYXluYWw6IGkgdGhpbmsgd2Ugc2hvdWxkIG1ha2UKPj4gLS1za2lw
LWFsbC1mZnMgZGVmYXVsdCBpbiBuYW5kd3JpdGUKPj4gWzIwMjItMDMtMjVdIFsxMTo0MDo1NiBD
RVRdIDxkZXJSaWNoYXJkPiB3aGF0IGRvIHlvdSB0aGluaz8KPj4gWzIwMjItMDMtMjVdIFsxMTo0
MjowMCBDRVRdIDxybWlsZWNraT4gaSB3YXMgcHJlcGFyaW5nIGEgcGF0Y2ggd2l0aCB3YXJuaW5n
IGlmCj4+IGFueSAweGZmIGJsb2NrIGhhcyBiZWVuIHdyaXR0ZW4KPj4gWzIwMjItMDMtMjVdIFsx
MTo0MjozMyBDRVRdIDxybWlsZWNraT4gaSBkaWRuJ3Qga25vdyBkZWZhdWx0aW5nIHRvCj4+IC0t
c2tpcC1hbGwtZmZzIGNhbiBiZSBkb25lCj4+IFsyMDIyLTAzLTI1XSBbMTE6NDc6MDUgQ0VUXSA8
bXJheW5hbD4gd2VsbCwgdGhhdCB3b3VsZCBicmVhayB0aGUgdXNlciBpbnRlcmZhY2UKPiAKPiBJ
bmRlZWQgSSByYWlzZWQgdGhpcyBpc3N1ZSBidXQgSSBhbSBub3Qgb3Bwb3NlZCB0byB0aGlzIGNo
YW5nZSBpZgo+IGV2ZXJ5Ym9keSBhZ3JlZXMgdGhhdCBpdCdzIGEgZ29vZCBtb3ZlLiBJbiBwYXJ0
aWN1bGFyLCB0aGUgTkFORAo+IHN1YmxheWVyIHdpbGwgZ2l2ZSB0aGUgc2FtZSAiZW1wdHkiIGRh
dGEgdG8gdXNlcnNwYWNlIHdoZXRoZXIgaXQKPiBwcm9ncmFtbWVkIGVtcHR5IHBhZ2VzIG9yIHNr
aXBwZWQgdGhlbS4gU28gSSBndWVzcyB3ZSBhcmUgZmluZSBhZ2FpbnN0Cj4gZGlyZWN0IHJlZ3Jl
c3Npb25zIChidXQgd2UgbWlnaHQgYnJlYWsgY2xldmVyIHNjcmlwdHMgZG9pbmcgc3RyYW5nZQo+
IHRoaW5ncykuCj4gCj4gSSB3b3VsZCBnbyBmb3IgdGhpcyBzb2x1dGlvbjoKPiAtIEJyaW5nIHN1
cHBvcnQgZm9yIHRoZSBkb3VibGUgZmxhZyAtW25vLV1za2lwLWZmcwo+IC0gTWFrZSB0aGUgdXNl
IG9mIC1za2lwLWZmcyB0aGUgZGVmYXVsdAo+IFNvIHRoYXQgaXQgaXMgZWFzeSBmb3Igc2NyaXB0
aW5nIHBlb3BsZSB0byBlbnN1cmUgdGhlaXIgd2F5IGlzIGZpbmU/CgpBbHNvIGVtaXQgYSB3YXJu
aW5nIHRoYXQgYSAweGZmIHBhZ2UgaXMgYmVpbmcgc2tpcHBlZCBpZiB0aGUgdXNlcgpubyBub3Qg
c3BlY2lmeSBhbnl0aGluZyBhdCB0aGUgY29tbWFuZCBsaW5lLgpUaGVuIHVzZXJzIHdpbGwgbm90
aWNlIHRoYXQgdGhlIGRlZmF1bHQgaGFzIGNoYW5nZWQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
