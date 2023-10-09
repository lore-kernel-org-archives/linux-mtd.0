Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2346E95A8E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCxjtrQAUdrhdJHiUm9ejEKxZSl90FcEvZl8hhSWDyU=; b=ec0GVDfo7yAoGt
	dFuxwRmb3zBTf0Bfy5WIO6TNBo4pTPG8OlrR9eXeHEeyd3BKyai/IKue8D35h0jxGrDIonNotCtwO
	b6odJtzbcBZ0cEr/cOh68ktNJn9zAKmY2PP9OsfYW7B2YfFLJ672VHqqg6gKhRwWUD4qjF+e/HTV2
	qx6sAUp03ycLUVDE+fO7xNT5dA5z2lr2G/s8gzAxzn0tFDLtpVVZoQg7Z/qvfdegO216rI9WHwb9S
	o378cmSnClLiKqQ7IZkLjLsXWJOwloQS3n9ho/N6Bfx4RzTxlzLlSYdBqtxylcjtiogEEoGKWTh4l
	Qc3jn1VXsYR6Sxzujfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpptM-00Ak8r-2H;
	Mon, 09 Oct 2023 13:01:48 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpptK-00Ak7E-0f
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 13:01:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 99C6D3200A73;
	Mon,  9 Oct 2023 09:01:40 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute5.internal (MEProxy); Mon, 09 Oct 2023 09:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1696856500; x=1696942900; bh=+HqiSDOtGV7pVYCmWD6TeVp+aZyfN+epDEj
	dzDSwCc8=; b=q5Gwt06ooVR8QVXl6tJx68BvzKrEjhAiclQoQzjChzVB08CuqM3
	tJAza/SKAbt57OOc4ea888Ndd58nO+yhUSwNlQZvZ+HznFaX3Dl/IiFiLhDYjMck
	s03XnUc+Mt5tevQOkurdm3rV094HYZvmGyET9WcKSo4Cx+hn8HmNHut342JPLf1m
	NlzVh7OLn2NWXI4HoeCxoEgwW4L5AUNlQYUitroo8rqWuQucK7n3a4GXlymIRqY3
	Fw3AqTr/cN1JF5wVeslICCo+tXfy+3LRi+V/nUBl3jDIsKwCDax3Fw32j6YFwSFE
	MNsEz1ORaTjwYpJWIRWlOhPqAtLT0//2PVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696856500; x=1696942900; bh=+HqiSDOtGV7pVYCmWD6TeVp+aZyfN+epDEj
	dzDSwCc8=; b=Qe8ZzvlJ1ZdMACxOexpk/lvAlE5NiIwUz2za4IpIRCImS+7GoRa
	UX3GD9OzqjAsOLaB9yX0QpslMHTokgZiPjsQQl5Xl0I0l2lbs5DSlaqVVQez9WDz
	lvyFBgWk5jZBAOQM9UbAdotbcaOv00/qhgzo4UwfS9Jo8K6kWFEewyd91edHgqcQ
	xAP8iqNyoGPxlebzkAo7KPyyNxTNdG9QMyJ8CxTsAmsA+G8SDrlMbUFMOpCx+pTi
	oRM0SwqHuyij1KaQ1CnRATyBKQutxzsXToVZB0w4Fi2L2Z/GB4z8KdqKcmXyKxKV
	nFbTodBcm67uzZezDwsi1DT9rT9khMCGLWg==
X-ME-Sender: <xms:svkjZRJroI60BZgal-hTyKkctb2vrRgDA2Khpso2MCPxSNLsY4jb9Q>
    <xme:svkjZdLeDXNQYzkB3Y8K9UnGkyHAMbHkVZHlel-69P37IfGqRtiyxZlDQYDAP14lP
    qC79kMd6UjY-jnLQbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:svkjZZvjEPDBbUZtfUHCE1Q8O0AYquBWXPSeSZXSd3tG3XnSeOYe1A>
    <xmx:svkjZSaXdeXSLHo1hBY2NI33MH5OgJszZTnsaMhlKrxdE6oKbMl8yg>
    <xmx:svkjZYZDKeBoCGqK3P8FSJtMXcUFWvw2VMjwaK_0wkklZjbigL2jzA>
    <xmx:tPkjZWnNVgj5vT105OkT5ZHrbSKbUZvcSCgEeOUxd2-cv_Bevpp2Yw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC4D91700090; Mon,  9 Oct 2023 09:01:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <55a03e14-7a92-4cf0-82d4-5cbde64d69db@app.fastmail.com>
In-Reply-To: <20231009144610.4ff82afa@xps-13>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <20231009144610.4ff82afa@xps-13>
Date: Mon, 09 Oct 2023 15:01:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "David Woodhouse" <dwmw2@infradead.org>, linux-kbuild@vger.kernel.org,
 "Richard Weinberger" <richard@nod.at>,
 "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata
 to prevent section mismatch warning
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_060146_274665_81567D21 
X-CRM114-Status: GOOD (  16.98  )
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

T24gTW9uLCBPY3QgOSwgMjAyMywgYXQgMTQ6NDYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9u
IE1vbiwgT2N0IDA5LCAyMDIzIGF0IDEwOjQzOjQ2QU0gKzAyMDAsIEFybmQgQmVyZ21hbm4gd3Jv
dGU6Cj4+ID4gT24gTW9uLCBPY3QgOSwgMjAyMywgYXQgMDk6MjIsIE1hc2FoaXJvIFlhbWFkYSB3
cm90ZTogIAo+PiA+ID4gT24gTW9uLCBPY3QgOSwgMjAyMyBhdCA1OjAy4oCvQU0gVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gPiBDYW4gd2UgaW5zdGVh
ZCBxdWVzdGlvbiB0aGUgdXNlIG9mIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKT8KPiBJ
IGRvbid0IGhhdmUgdGhlIGhpc3RvcnkgaW4gbWluZCwgYnV0IHdoeSBub3QganVzdCBzd2l0Y2gg
dG8gcmVndWxhcgo+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSByZWdpc3RyYXRpb24gaW5zdGVh
ZD8gSXQgc2VlbXMgbGlrZSB0aGUKPiBvcmlnaW5hbCBhdXRob3JzIGp1c3QgZGlkIG5vdCBjYXJl
IGFib3V0IHRoZSByZW1vdmUgcGF0aCBhbmQgd2VyZQo+IGhhcHB5IHRvIHNraXAgaXRzIGltcGxl
bWVudGF0aW9uLgo+Cj4gT24gbXRkIGRldmljZXMgb25lIGNhbiBhcmd1ZSB0aGF0IHRoZSBmbGFz
aCB1bmRlcmx5aW5nIHN0b3JlcyB0aGUKPiByb290ZnMgYW5kIHRodXMgY2Fubm90IGJlIHJlbW92
ZWQsIGJ1dCBJIGJlbGlldmUgdG9kYXkgdGhpcyBpcyBhCj4gcXVlc3Rpb25hYmxlIChzb2Z0d2Fy
ZSkgZGVzaWduLgoKSXQgd2FzIGNoYW5nZWQgdG8gbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9i
ZSgpIGluIGNvbW1pdAozYTJhMTNmYTkwMmQyICgibXRkOiB0eHg5bmRmbWM6IHVzZSBtb2R1bGVf
cGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkiKQp3aXRoIGEgc2hvcnQgY2hhbmdlbG9nIHRleHQ6Cgpj
b21taXQgM2EyYTEzZmE5MDJkMjMyYTFlNTY1ODI2NDdhZWQ2Y2IyNTkxMzQ5YgpBdXRob3I6IEpp
bmdvbyBIYW4gPGpnMS5oYW5Ac2Ftc3VuZy5jb20+CkRhdGU6ICAgVHVlIE1hciA1IDEzOjMxOjI0
IDIwMTMgKzA5MDAKCiAgICBtdGQ6IHR4eDluZGZtYzogdXNlIG1vZHVsZV9wbGF0Zm9ybV9kcml2
ZXJfcHJvYmUoKQogICAgCiAgICBUaGlzIHBhdGNoIHVzZXMgbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cl9wcm9iZSgpIG1hY3JvIHdoaWNoIG1ha2VzCiAgICB0aGUgY29kZSBzbWFsbGVyIGFuZCBzaW1w
bGVyLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBKaW5nb28gSGFuIDxqZzEuaGFuQHNhbXN1bmcu
Y29tPgogICAgU2lnbmVkLW9mZi1ieTogQXJ0ZW0gQml0eXV0c2tpeSA8YXJ0ZW0uYml0eXV0c2tp
eUBsaW51eC5pbnRlbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPERh
dmlkLldvb2Rob3VzZUBpbnRlbC5jb20+CgpJbnN0ZWFkIG9mIGp1c3Qgc2ltcGxpZnlpbmcgdGhl
IGNvZGUsIEkgdGhpbmsgdGhhdCB3YXMgYWN0dWFsbHkKYSBidWdmaXggYmVjYXVzZSBpdCBwcmV2
ZW50ZWQgYm90aCB0aGUgcHJvYmUgYW5kIHJlbW92ZSBjYWxsYmFja3MKZnJvbSBnZXR0aW5nIGNh
bGxlZCBhZnRlciBnZXR0aW5nIGRyb3BwZWQgKGRlZmVycmVkIHByb2JlIG9yCnVuYmluZC9yZWJp
bmQpLiBVc2luZyBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgaXMgcHJvYmFibHkKZXZlbiBiZXR0
ZXIgaGVyZSwgYnV0IHRoZW4gd2UgbmVlZCB0byByZW1vdmUgYm90aCB0aGUgX19pbml0CmFuZCBf
X2V4aXQgYW5ub3RhdGlvbnMuCgogICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
