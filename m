Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19837606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ttgl8Pv7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WhUJ/GcR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bGIChuBvrS2Q0iQjhFjAOQBF3HiSAisT72nVFohEBoc=; b=Ttgl8Pv7RAJiOgxDM9+uAMFAQE
	M9H+elEP4hawAuRtdqQJD7quSjSzcqPRBp/LiUIqJ+UvBWBTAWUUx5qh5QO5yiYMsN+ZaDYtMfUo2
	gmfbsPHDlpNOF80LKRCx3ULkptNHQxMGU9TKeW1wPdJhFmFKvREN31i3vKGkcoUZT1XA1mnCj/V4Q
	8oRQcklz+2GvNlgCs8TnzkTmN6maUuqPlOn+ybrRY3yQ03e8rhq6prl0btiq28CJp55wf0nIOZRtH
	PWTDYfCSirW8TtHnnd7Zdt9AykDJgpZWXfhO0CM/wCDt2LhcuDRZC/av0u4BuwZn/IZnpETD9oAp7
	gnVFuezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8me-00000009BiU-49PO;
	Wed, 25 Nov 2026 08:55:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8mc-00000009Bhd-2aFF
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 08:55:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE99C1A17AF;
	Wed, 25 Nov 2026 08:55:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99E0260480;
	Wed, 25 Nov 2026 08:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBB3A11E68022;
	Wed, 25 Nov 2026 09:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795596916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ltkcJXou2Sk6MxEHxOTGoZvucs99rnFqVFhzyx4fQeU=;
	b=WhUJ/GcRVLR49m8UGrh3NO45/FZkFiqSZwvkLmHB4/Fzu50+lSCW6OShejxSp8aV7b++J/
	EJGJUSuXkZRbt6S3zGiOhMs5mY6bt9xqN/XFAygmdtI54dL1rtO8JSl/7ewmjKLX/kH9T2
	2UlDTVOLYPrDXDWYF6d6IzP25zEL52x7V5VDMcwcIfrFMOco6FaxA8LmoB3QcGcSPooqHA
	y+HjEuE6kEyUjUy3ql+keeLqXw1t2RLWR1XP/3kFPkV6WGF3+jO/84EWjkyrKblX8XDiFx
	s154sJ9IAK+0Crg4TLc50d4ZT+Pp8iL5xgW1RViC9kAqq0yugvmK7GkGmR1QGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
In-Reply-To: <20261123070440.3060882-4-leeonion.muyu@gmail.com> (Ping Li's
	message of "Mon, 23 Nov 2026 15:04:40 +0800")
References: <20261123055020.1995251-1-ping.li@horizon.auto>
	<20261123070440.3060882-1-leeonion.muyu@gmail.com>
	<20261123070440.3060882-4-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 09:55:13 +0100
Message-ID: <875wxl1ea6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_005518_792167_CE902CCE 
X-CRM114-Status: GOOD (  17.31  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTEvMjAyNiBhdCAxNTowNDo0MCArMDgsIFBpbmcgTGkgPGxlZW9uaW9uLm11eXVAZ21h
aWwuY29tPiB3cm90ZToKCj4gcjg1Ml9kb19kbWEoKSBvbmx5IGJvdW5jZXMgYnVmZmVycyB0aGF0
IGFyZSBub3QgUjg1Ml9ETUFfTEVOCj4gYWxpZ25lZC4gIEFuIGFsaWduZWQgdm1hbGxvYydkIGJ1
ZmZlciBwYXNzZXMgdGhpcyBjaGVjayBhbmQgZ2V0cwo+IGZlZCB0byBkbWFfbWFwX3NpbmdsZSgp
LCB3aGljaCBpcyBvbmx5IHZhbGlkIGZvciBsaW5lYXItbWFwCj4gYWRkcmVzc2VzLiAgU3VjaCBi
dWZmZXJzIGFyZSBub3QgaHlwb3RoZXRpY2FsOiBtdGRibG9jaydzIHdyaXRlCj4gY2FjaGUgaXMg
dm1hbGxvYydlZCwgYW5kIFVCSUZTIHBhc3NlcyB2bWFsbG9jJ2VkIExQVCBidWZmZXJzLgo+Cj4g
RXh0ZW5kIHRoZSBib3VuY2UgY29uZGl0aW9uIHdpdGggYSB2aXJ0X2FkZHJfdmFsaWQoKSBjaGVj
ayBzbwo+IHRoYXQgbm9uLWxpbmVhci1tYXAgYnVmZmVycyBnbyB0aHJvdWdoIHRoZSBleGlzdGlu
ZyBpbnRlcm5hbAo+IGJvdW5jZSBidWZmZXIgaW5zdGVhZC4KPgo+IEZpeGVzOiA2N2UwNTRlOTE5
MjQ4ICgibXRkOiBuYW5kOiBBZGQgZHJpdmVyIGZvciBSaWNvaCB4RC9TbWFydE1lZGlhIHJlYWRl
ciIpCj4gU2lnbmVkLW9mZi1ieTogUGluZyBMaSA8bGVlb25pb24ubXV5dUBnbWFpbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYwo+
IGluZGV4IDkyYzQ3ZDM1MWMyNy4uNGRiZmMwNTNmYjIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3I4NTIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYwo+
IEBAIC0xODgsOCArMTg4LDggQEAgc3RhdGljIHZvaWQgcjg1Ml9kb19kbWEoc3RydWN0IHI4NTJf
ZGV2aWNlICpkZXYsIHVpbnQ4X3QgKmJ1ZiwgaW50IGRvX3JlYWQpCj4gIAkgIGZyb20gZGV2aWNl
LCBmb3Igd3JpdGVzIGZpcnN0IGZpbGwgdGhlIGJ1ZmZlciAgZnJvbSBtZW1vcnkqLwo+ICAJZGV2
LT5kbWFfc3RhdGUgPSBkb19yZWFkID8gRE1BX0lOVEVSTkFMIDogRE1BX01FTU9SWTsKPiAgCj4g
LQkvKiBpZiBpbmNvbWluZyBidWZmZXIgaXMgbm90IHBhZ2UgYWxpZ25lZCwgd2Ugc2hvdWxkIGRv
IGJvdW5jZSAqLwo+IC0JaWYgKCh1bnNpZ25lZCBsb25nKWJ1ZiAmIChSODUyX0RNQV9MRU4tMSkp
Cj4gKwkvKiBpZiBpbmNvbWluZyBidWZmZXIgaXMgbm90IHVzYWJsZSBmb3IgRE1BLCB3ZSBzaG91
bGQgZG8gYm91bmNlICovCj4gKwlpZiAoIXZpcnRfYWRkcl92YWxpZChidWYpIHx8ICh1bnNpZ25l
ZCBsb25nKWJ1ZiAmIChSODUyX0RNQV9MRU4KPiAtIDEpKQoKV2h5IGRvIHdlIG5lZWQgYSBsb2Nh
bCBib3VuY2UgaWYgdGhlIGNvcmUgY2FuIGRvIGl0IHdpdGggTkFORF9VU0VTX0RNQT8KCkFsc28g
cGxlYXNlIGFkZCBDYzogc3RhYmxlIHRvIHRoZXNlIHRocmVlIHBhdGNoZXMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
