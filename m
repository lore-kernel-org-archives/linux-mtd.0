Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB59C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:27:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EF564EC3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79EF564EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XKc9JGo6AaLQrkdmtfJXQc0lqZmx0v7aISESi3EosLA=; b=SD1RcRiUeienH4gMhyW4Ss9Mz
	FKTHEMi7UshVC4cFro1LhfRP3BwJoyx9WianYVS3NIdezBnwkEKci3/n2IhJBaCkH6U2abSt/gvuN
	d48kvAwIM/KECxSfCPUdCBZTFcJOqhLBKU1oXCM0aemBhztYAXpmZ6mO5dbsjUUnp9B4TT0qQdZh9
	Xfn+A6Y+VzY66givcJ0Uo5ad2JpgmLNPfcBJBcDT7NgpTbm4jbdcCPkbfA3fhQ/KX+JWSZzQHFV+n
	ocb4D0Kw0p1VWSvnvI7c1uGfJguEFxTNdZ6GXdXUjaqEjdaJ1tywwHltgjUtYNtoaqagpYIP912rO
	EnT+76iJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTO7-005NTI-IC; Wed, 03 Mar 2021 15:26:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSSM-0057jj-0T; Wed, 03 Mar 2021 14:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fTjwCAs8NFhD6G8Me32PjCtQRtajdWLNU8hPxq2kLwY=; b=p3Saz3w5cFi+iwbXAmTtpzCRAz
 c8vNU8snj/X5Z2fi5ExR5aH0yatQEDFMPfgDALdLi21txAn3R2jf5XcZ66TfrSY/D6nQBpAh+RwS3
 tGj+Q1+dVa7pm+m/NkORWz9rwoc1ReLHK29tqiP0W+y5ohU3Rn2jL0VycroFZIZRD+wPe5/agis/Q
 cjX7U4eTcCjgOBEtM1Gq72CKiYxlbfcedH2IqPm1HFvwttBtWHTR+I+NHMyX8iB5FRV2dkcRj5j/s
 0xt8+HOmcmm+ASRrSCbKTLB8TFrGIDOudTvlTYpKWpnh3aG7/U5G9NKTqTkeDY1/bZmXLPcvmjf66
 nKvUlu5w==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHROg-002iQk-TB; Wed, 03 Mar 2021 13:18:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614777516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTjwCAs8NFhD6G8Me32PjCtQRtajdWLNU8hPxq2kLwY=;
 b=OG2D8K0+PfCuA5USdfd+Vx6vvOPTyS3EUyRmE7sqZ415QTN8GcaX9NJMw0mxPVVFu1pGLR
 m/nhsBzCaOzVYjLB8Jp0BgoRT32O09qY+clnqr6yXiqa/1CU+6464zYukujhq7ChdCD79P
 71x09r4i/F0vei3pckPBC7HbLpQl/ms=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 531B1AD29;
 Wed,  3 Mar 2021 13:18:36 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:18:29 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Meyer <thomas@m3y3r.de>, linux-um@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Wei Li <liwei391@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
 linuxppc-dev@lists.ozlabs.org, kgdb-bugreport@lists.sourceforge.net,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Kelley <mikelley@microsoft.com>,
 linux-hyperv@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>
Subject: lkml delivery: was: Re: [PATCH next v4 00/15] printk: remove
 logbuf_lock
Message-ID: <YD+MpccJp4gX6bOP@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_131839_864390_AAD69132 
X-CRM114-Status: GOOD (  11.56  )
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

SGkgSm9obiwKCk9uIFdlZCAyMDIxLTAzLTAzIDExOjE1OjEzLCBKb2huIE9nbmVzcyB3cm90ZToK
PiBIZWxsbywKPiAKPiBIZXJlIGlzIHY0IG9mIGEgc2VyaWVzIHRvIHJlbW92ZSBAbG9nYnVmX2xv
Y2ssIGV4cG9zaW5nIHRoZQo+IHJpbmdidWZmZXIgbG9ja2xlc3NseSB0byBib3RoIHJlYWRlcnMg
YW5kIHdyaXRlcnMuIHYzIGlzCj4gaGVyZSBbMF0uCgpIYXZlIHlvdSBnb3Qgc29tZSByZXBseSBm
cm9tIGxrbWwgdGhhdCBpdCBoYXMgbm90IGRlbGl2ZXJlZCB0aGVyZSwKcGxlYXNlPwoKSSBhbSBu
b3QgYWJsZSB0byBnZXQgdGhlIHBhdGNoc2V0IHVzaW5nIGI0IHRvb2w6CgokPiBiNCBhbSAtbyB0
ZXN0IDIwMjEwMzAzMTAxNTI4LjI5OTAxLTEtam9obi5vZ25lc3NAbGludXRyb25peC5kZQpMb29r
aW5nIHVwIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAzMDMxMDE1MjguMjk5MDEtMS1q
b2huLm9nbmVzcyU0MGxpbnV0cm9uaXguZGUKR3JhYmJpbmcgdGhyZWFkIGZyb20gbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWh5cGVydgpBbmFseXppbmcgMiBtZXNzYWdlcyBpbiB0aGUgdGhyZWFkCi0t
LQpUaHJlYWQgaW5jb21wbGV0ZSwgYXR0ZW1wdGluZyB0byBiYWNrZmlsbApHcmFiYmluZyB0aHJl
YWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvbGttbApTZXJ2ZXIgcmV0dXJuZWQgYW4gZXJyb3I6IDQw
NApHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkClNlcnZlciBy
ZXR1cm5lZCBhbiBlcnJvcjogNDA0CkdyYWJiaW5nIHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9y
Zy9saW51eHBwYy1kZXYKTG9hZGVkIDIgbWVzc2FnZXMgZnJvbSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eHBwYy1kZXYvCi0tLQpXcml0aW5nIHRlc3QvdjRfMjAyMTAzMDNfam9obl9vZ25l
c3NfcHJpbnRrX3JlbW92ZV9sb2didWZfbG9jay5tYngKICBFUlJPUjogbWlzc2luZyBbMS8xNV0h
CiAgRVJST1I6IG1pc3NpbmcgWzIvMTVdIQogIEVSUk9SOiBtaXNzaW5nIFszLzE1XSEKICBFUlJP
UjogbWlzc2luZyBbNC8xNV0hCiAgRVJST1I6IG1pc3NpbmcgWzUvMTVdIQogIEVSUk9SOiBtaXNz
aW5nIFs2LzE1XSEKICBFUlJPUjogbWlzc2luZyBbNy8xNV0hCiAgRVJST1I6IG1pc3NpbmcgWzgv
MTVdIQogIEVSUk9SOiBtaXNzaW5nIFs5LzE1XSEKICBFUlJPUjogbWlzc2luZyBbMTAvMTVdIQog
IFtQQVRDSCBuZXh0IHY0IDExLzE1XSBwcmludGs6IGttc2dfZHVtcGVyOiByZW1vdmUgQGFjdGl2
ZSBmaWVsZAogIOKckyBbUEFUQ0ggbmV4dCB2NCAxMi8xNV0gcHJpbnRrOiBpbnRyb2R1Y2UgYSBr
bXNnX2R1bXAgaXRlcmF0b3IKICBFUlJPUjogbWlzc2luZyBbMTMvMTVdIQogIFtQQVRDSCBuZXh0
IHY0IDE0LzE1XSBwcmludGs6IGttc2dfZHVtcDogcmVtb3ZlIF9ub2xvY2soKSB2YXJpYW50cwog
IEVSUk9SOiBtaXNzaW5nIFsxNS8xNV0hCi0tLQpUb3RhbCBwYXRjaGVzOiAzCi0tLQpXQVJOSU5H
OiBUaHJlYWQgaW5jb21wbGV0ZSEKQ292ZXI6IHRlc3QvdjRfMjAyMTAzMDNfam9obl9vZ25lc3Nf
cHJpbnRrX3JlbW92ZV9sb2didWZfbG9jay5jb3ZlcgogTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIxMDMwMzEwMTUyOC4yOTkwMS0xLWpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGUK
IEJhc2U6IG5vdCBmb3VuZAogICAgICAgZ2l0IGFtIHRlc3QvdjRfMjAyMTAzMDNfam9obl9vZ25l
c3NfcHJpbnRrX3JlbW92ZV9sb2didWZfbG9jay5tYngKCgphbmQgSSBkbyBub3Qgc2VlIGl0IGF0
IGxvcmUuIEl0IGhhcyBvbmx5IGZvdW5kIGNvcGllcyBpbiBsaW51eC1oeXBlcnYKYW5kIGxpbnV4
LXBwY2RldiBtYWlsaW5nIGxpc3RzLApzZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDIxMDMwMzEwMTUyOC4yOTkwMS0yLWpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGUvCgpCZXN0IFJl
Z2FyZHMsClBldHIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
