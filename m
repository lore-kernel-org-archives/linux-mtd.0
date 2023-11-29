Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8953C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Yr66osmDfRiLp8/C1MokTRVrQ+NSEGVzTNwUNJB8cw=; b=hBQZ/4vLJ8DO5+
	7CShFN1LbpiC5ZXgqm7eZSSnKkwcNuyb8a0ecV+U24knunOClVNmJG8AC80mV/Mv20CEdAIoaPos7
	Cr8jShxpCRL6B9BdaTZcwE1Fdc7S2I4bkFdZinwJuUjBRPE017n22OPLnkk1kDmvtpnaYTUmuFjV4
	4r2d6nkVk+HkVEtRv07wZEAPFpr1RUYEHcejXxh5NMmWC6Wam+cCV2ZEievfTlVn1OtFBerH1IvAd
	4gbr3r8cCJLhAzYjP8dfVpnrmQdduRvWfYQd4aIGayj1UHtjvzrM4S8phj3qRAh1ivRz7gj2VkiC2
	0l0dSGdZYqS19htRTlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GEs-007WSU-0f;
	Wed, 29 Nov 2023 08:48:10 +0000
Received: from gardel.0pointer.net ([85.214.157.71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GEo-007WMV-1h
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 08:48:08 +0000
Received: from gardel-login.0pointer.net (gardel-mail [85.214.157.71])
	by gardel.0pointer.net (Postfix) with ESMTP id 89847E80466;
	Wed, 29 Nov 2023 09:47:59 +0100 (CET)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id 27B33160279; Wed, 29 Nov 2023 09:47:58 +0100 (CET)
Date: Wed, 29 Nov 2023 09:47:58 +0100
From: Lennart Poettering <lennart@poettering.net>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: systemd-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
	dxld@darkboxed.org
Subject: Re: [systemd-devel] How to properly wait for udev?
Message-ID: <ZWb6vp7K5tx9Lx2s@gardel-login>
References: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
 <ZWRTfaWFzgSfd9_Z@gardel-login>
 <CAFLxGvwJjhLEgDP73WepEbVmh9qXECaKrsarhp-hg3LMGVBn5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvwJjhLEgDP73WepEbVmh9qXECaKrsarhp-hg3LMGVBn5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_004806_715966_40C90B55 
X-CRM114-Status: GOOD (  12.51  )
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

T24gTW8sIDI3LjExLjIzIDIxOjMyLCBSaWNoYXJkIFdlaW5iZXJnZXIgKHJpY2hhcmQud2VpbmJl
cmdlckBnbWFpbC5jb20pIHdyb3RlOgoKPiBPbiBNb24sIE5vdiAyNywgMjAyMyBhdCA5OjI54oCv
QU0gTGVubmFydCBQb2V0dGVyaW5nCj4gPGxlbm5hcnRAcG9ldHRlcmluZy5uZXQ+IHdyb3RlOgo+
ID4gSWYgdGhleSBjb25jZXB0dWFsbHkgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYmxvY2sgZGV2aWNl
IGVxdWl2YWxlbnRzLCB3ZQo+ID4gbWlnaHQgd2FudCB0byBleHRlbmQgdGhlIHVkZXYgbG9naWMg
dG8gc3VjaCBVQkkgZGV2aWNlcyB0b28uICBQYXRjaGVzCj4gPiB3ZWxjb21lLgo+Cj4gV2h5IGRv
ZXNuJ3QgdWRldiBmbG9jaygpIGV2ZXJ5IGRldmljZSBpdCBpcyBwcm9iaW5nPwo+IE9yIGFza2Vk
IGRpZmZlcmVudGx5LCB3aHkgaXMgdGhpcyBmZWF0dXJlIG9wdC1pbiBpbnN0ZWFkIG9mIG9wdC1v
dXQ/CgpTb21lIHNvZnR3YXJlIHJlYWxseSBkb2Vzbid0IGxpa2UgaXQgaWYgd2UgdGFrZSBCU0Qg
bG9ja3Mgb24gdGhlaXIKZGV2aWNlcywgaGVuY2Ugd2UgZG9uJ3QgdGFrZSBpdCBibGFua2V0IGV2
ZXJ5d2hlcmUuIEFuZCB3aGF0J3MgbW9yZQppbXBvcnRhbnQgZXZlbjogZm9yIHZhcmlvdXMgZGV2
aWNlcyBpdCBzaW1wbHkgaXNuJ3Qgc2FmZSB0byBqdXN0CndpbGx5LW5pbGx5IGV2ZW4gb3BlbiB0
aGVtICh0YXBlIGRyaXZlcnMgYW5kIHRoaW5ncywgd2hpY2ggbWlnaHQgc3RhcnQKdG8gcHVsbCBp
biBhIHRhcGUgaWYgd2UgZG8pLiBGb3Igb3RoZXJzIHdlIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGV2
ZW4Kb3BlbiB0aGluZyBhdCBhbGwgd2l0aCB0aGUgd3JvbmcgZmxhZ3MgKGZvciBleGFtcGxlLCBi
ZWNhdXNlIHRoZXkgYXJlCm91dHB1dCBvbmx5KS4KCkJvY2sgZGV2aWNlcyBoYXZlIHJlbGF0aXZl
bHkgd2VsbCBkZWZpbmVkIHNlbWFudGljcywgdGhlcmUgaXQncwpnZW5lcmFsbHkgc2FmZSB0byBk
byB0aGlzLCBoZW5jZSB3ZSBkby4KCkhlbmNlLCBpdCBtaWdodCBiZSBzYWZlIGZvciBVQkksIGJ1
dCBmb3IgdGhlIGdlbmVyYWwgY2FzZSBpdCBtaWdodApub3QgYmUuCgpUaGF0IHNhaWQsIHdvdWxk
IEJTRCBsb2NraW5nIGV2ZW4gYWRkcmVzcyB5b3VyIGlzc3VlPyBJZiB5b3UgZGV2aWNlcwphcmUg
ZXhjbHVzaXZlIGFjY2VzcyB0aGluZ3MgYW5kIHdlIGZpcnN0IG9wZW4oKSB0aGVtIGFuZCB0aGVu
IGZsb2NrKCkKdGhlbSwgdGhlbiB0aGF0J3Mgbm90IGF0b21pYy4gU28gaWYgeW91ciB0ZXN0IGNh
c2VzIG9wZW4gdGhlIGRldmljZXMsCnRoZW4gZmxvY2soKSB0aGVtIHlvdSBtaWdodCBzdGlsbCBn
ZXQgaW50byBjb25mbGljdCB1ZGV2IGJlY2F1c2UgaXQKanVzdCBvcGVuKCllZCB0aGUgZGV2aWNl
LCBidXQgZGlkbiN0IGdldCB0byBjYWxsIGZsb2NrKCkgeWV0LgoKRG9lc24ndCBVQkkgaGF2ZSBz
b21ldGhpbmcgbGlrZSBPX0VYQ0wtYmVoYXZpb3VyIHRoYXQgZ3JhbnRzIHRydWUKZXhjbHVzaXZl
IGFjY2Vzcz8KCkxlbm5hcnQKCi0tCkxlbm5hcnQgUG9ldHRlcmluZywgQmVybGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
