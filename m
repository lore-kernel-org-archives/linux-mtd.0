Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871CCCFD31C
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2S9sGyEyK6FO/VmqmWu3VbcXIFFerHUVElSW5EtIbU=; b=so7UQbFCzN0bne
	NWut7cvJj23cFiy+qXJbwd9VJ9J+fGF19t16LkmJPrpYCLowEkiNC//3mNxvFE3QOJAbdHJyqCo+h
	+yQRUEAJR+8596InkIxtoEoLvhzixNM/ePNcQ/HbmlHfBCTKVSFmwrScMnHoJi9pVlFWx+5DUP6rp
	TrhxAGF2gOaTo6PqDmF9e0+nqKsIYgQVyuRqPv6FmzgMuhfS0XxFUZXt5PJ51GjRTogcsfY32UNL4
	dEi7uCbr+HdaqXtf4Q8nujLhtivx9vjqcIfUSCgCysmw7hFW6l9EuWOXI3u+lEfHBMnjvk2xRXDXQ
	f9OZAzZGVBbr31BnoFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRtE-0000000BHEQ-48jP;
	Mon, 24 Nov 2025 08:25:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRtB-0000000BHDg-2K64
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 08:25:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB02A4E4188F;
	Mon, 24 Nov 2025 08:25:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78F6A606FC;
	Mon, 24 Nov 2025 08:25:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E57121037000C;
	Mon, 24 Nov 2025 09:25:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763972732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gCy5N1WBUXX+tDLm3V71pH2fTObTCZIir5hgNTKW1Ds=;
	b=MYQ83/h5nHT/hZoOVwcUOoBmqvn0Hd0YkGB5ulSw7ewaBdxoYduMryrWLTPLe653F3y6vn
	H+StQbP1jTlQTEKYsHmdkDMN1o2NvHs7GSwrOxVcs08NIrcyu9nCNb9qMn9+9qUiyJ2OsD
	C952Cn9TTADIr4fFlF87qLTmoFdnhcixMFOo9uLXW4LcyyO0lw+4UYWgge97qPSh+anhqO
	MeEbvT6Y9BvAEiq/Me0FykD63VBgbGb0IqzWs8Rq2NNu1O9XDogSfPt2kGEWu3/momtprH
	1pq3Pk201aE/IDTsdRYO1lBYZa6+vNrsUwhTW0kmWbrK9TYuMFDnBJOK4MooLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Marc Olberding" <molberding@nvidia.com>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
In-Reply-To: <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org> (Michael Walle's message
	of "Mon, 24 Nov 2025 09:12:38 +0100")
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
	<87jyzfzwpw.fsf@bootlin.com> <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 24 Nov 2025 09:25:28 +0100
Message-ID: <87bjkrzvk7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_002537_728973_7DE07FD2 
X-CRM114-Status: GOOD (  14.43  )
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

SGksCgpPbiAyNC8xMS8yMDI1IGF0IDA5OjEyOjM4ICswMSwgIk1pY2hhZWwgV2FsbGUiIDxtd2Fs
bGVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEhpLAo+Cj4+PiArCQkubm9fc2ZkcF9mbGFncyA9IFNF
Q1RfNEssCj4+Cj4+IFRoaXMgb25lIGlzIHRoZSByaWdodCBmaXggYW5kIHNob3VsZCBzdGFuZCBh
bG9uZSBpbiBpdHMgb3duIHBhdGNoIChmaXJzdAo+PiBpbiB0aGUgc2VyaWVzIGlmIHlvdSBhZGQg
c3VwcG9ydCBmb3IgdGhlIGJsb2NrIHByb3RlY3Rpb24pLgo+Cj4gT25seSBpZiB0aGF0IGZsYXNo
IHJlYWxseSBkb2Vzbid0IGhhdmUgU0ZEUC4gQnV0IHNpbmNlIHRoZSBlbnRyeQo+IGRpZG4ndCBo
YXZlIGEgc2l6ZSBwcm9wZXJ0eSB0aGUgZmxhc2ggKm11c3QqIGhhdmUgU0ZEUCBpbiB0aGUgZmly
c3QKPiBwbGFjZS4gIE90aGVyd2lzZSBpdCB3b24ndCBldmVuIGJlIHByb2JlZC4gUGxlYXNlIHBy
b3ZpZGUgYSBkdW1wIG9mCj4gdGhlIFNGRFAgdGFibGVzLCBzZWUgWzFdLgoKU0ZEUCBkYXRhIGlz
IGluIGxvcmUsIGJ1dCBub3QgdGhlIHBhcmFtcyB3aGljaCBhcmUgbWlzc2luZyAoPykgTWFyYywg
Y2FuCnlvdSBjb21wYXJlIHdpdGggeW91ciBkYXRhPwpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTAxMTAtd2luYm9uZC02LTEyLXJjMS1ub3Itdm9sYXRpbGUtYml0LXYzLTEtNzM1MzYz
ZjhjYzdkQGJvb3RsaW4uY29tLwoKPiBBbHNvIHBsZWFzZSBwcm92aWRlIHRoZSBjb250ZW50cyBv
Zgo+IC9zeXMva2VybmVsL2RlYnVnL3NwaS1ub3Ivc3BpTi5OL3BhcmFtcy4KPgo+IC1taWNoYWVs
CgpNeSB1bmRlcnN0YW5kaW5nICh3aGljaCBtYXkgY2xlYXJseSBiZSBlcnJvbmVvdXMpIGlzIHRo
YXQgbW9zdCBvZiB0aGVzZQpmbGFzaGVzIHN1cHBvcnQgNEsgYmxvY2tzIGJ1dCBzb21laG93IGRv
bid0IGFkdmVydGlzZSBpdCBpbiB0aGVpciBTRkRQCmRhdGEsIHNvIGV2ZXJ5IHRpbWUgd2UgZGVz
Y3JpYmUgYSBjaGlwIHdlIG11c3QgcmVtZW1iZXIgdG8gdGljayB0aGF0CmZsYWcuIEkgZ3Vlc3Mg
YWxsXldtb3N0IGNoaXBzIGhhdmUgNGsgYmxvY2tzIGNvbXBhdGliaWxpdHkgc3VwcG9ydCwgYnV0
IGluCmdlbmVyYWwgd2UgcHJlZmVyIHRvIHVzZSBiaWdnZXIgYmxvY2tzICh0aGUgb25lcyBhZHZl
cnRpc2VkIGluIHRoZSBTRkRQCmRhdGEpLiBNaWNoYWVsLCBhbSBJIGJlaW5nIG1pc2xlYWQgYnkg
dGhlIGRlY2FkZXMgb2YgaGlzdG9yeSB0aGF0IHdlbnQKdGhyb3VnaCB0aGUgc3BpLW5vciBjb3Jl
PyA6KQoKPiBbMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9tdGQvc3BpLW5v
ci5odG1sI21pbmltdW0tdGVzdGluZy1yZXF1aXJlbWVudHMKPgo+Pgo+Pj4gIAkJLmZpeHVwcyA9
ICZ3aW5ib25kX25vcl9tdWx0aV9kaWVfZml4dXBzLAo+Pj4gIAl9LCB7Cj4+PiAgCQkuaWQgPSBT
Tk9SX0lEKDB4ZWYsIDB4NTAsIDB4MTIpLAo+Pgo+PiBUaGFua3MsCj4+IE1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
