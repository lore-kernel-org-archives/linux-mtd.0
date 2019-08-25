Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA3CC3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 22:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5FD52070B
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 22:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pu5GSsL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5FD52070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhOH+WLG/jrnKrYIouePxHoTmXHhI03L04YGAiTl/Zw=; b=pu5GSsL6WAsUN3
	homHrU7VjmORLk/oeUSCzuMdnXXESQh9Bhkn056Qe0Ey6MQxN9ahWs+emyCVH9RDUXLZNUQZEemlx
	5FMX8icjBoF1xApHeubHkFsJoykv2gGYh32BWhPGLmL/R4Njs1sRfRZCE9oJ4lXJGNdQo1hPtMM4l
	b6TjFFZ5JEKidQmgA6FazkX0okE1LROqtN7IXlZF0/UfMi5MnOgofcmm+cGquTOWX9l//yr+FapUW
	/3IhBh9pvP8UXmjjyrpjCdtcszU/ObD6yzQ+Xbvp9kOJRRLM1r33vnw3BAX880FsiEdAwjiBOtuqW
	B1v/RPUq7sPs4/L3wWrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i210y-0001Hb-W1; Sun, 25 Aug 2019 22:29:36 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i210u-0001HI-W3
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 22:29:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B8AC5608311C;
 Mon, 26 Aug 2019 00:29:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hOULfU3-LlB7; Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DE8B96083139;
 Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id E11y-rZCtny6; Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B6833608311C;
 Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Date: Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tao Ren <taoren@fb.com>
Message-ID: <216516045.73889.1566772168645.JavaMail.zimbra@nod.at>
In-Reply-To: <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
 <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAB4xhAIAALiMA4gvjD7k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_152933_179002_224B354B 
X-CRM114-Status: UNSURE (   7.06  )
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRhbyBSZW4iIDx0YW9yZW5A
ZmIuY29tPgo+IEFuOiAiUmljaGFyZCBXZWluYmVyZ2VyIiA8cmljaGFyZC53ZWluYmVyZ2VyQGdt
YWlsLmNvbT4sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5pZC5hdT4KPiBDQzogImxpbnV4
LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgIk9wZW5CTUMgTWFpbGxpc3Qi
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMjYuIEF1Z3Vz
dCAyMDE5IDAwOjA4OjA4Cj4gQmV0cmVmZjogUmU6IGtlcm5lbCBCVUcgYXQgZnMvamZmczIvZ2Mu
YzozOTUhCgo+IE9uIDgvMjUvMTkgMTI6MjIgUE0sIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToK
Pj4gT24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMjowNiBBTSBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PiB3cm90ZToKPj4+IExvb2tzIGxpa2UgYSBsYWNrIG9mIHJvYnVzdG5lc3MgdG8g
ZmlsZXN5c3RlbSBjb3JydXB0aW9uIHRvIG1lLiBMV04KPj4gCj4+IFdoYXQgZXhhY3RseSBtYWtl
cyB5b3UgdGhpbmsgc28/Cj4+IFRoZSBpbm9kZSBjYWNoZSBlbnRyeSBpcyBpbiBzdGF0ZSBJTk9f
U1RBVEVfVU5DSEVDS0VEIHdoaWxlIEdDIHJ1biwKPj4gd2hpY2ggaXMgbm90IGFsbG93ZWQuCj4+
IAo+PiBUYW8sIGlzIHRoZSBlcnJvciBwZXJzaXN0ZW50IG9yIGRpZCBpdCBoYXBwZW4gb25seSBv
bmNlPwo+IAo+IEhpIFJpY2hhcmQsCj4gCj4gSXQgcmFyZWx5IGhhcHBlbnMgKH4xIG91dCBvZiAx
MDAwIG1hY2hpbmVzIGluIG15IGVudmlyb25tZW50KSwgYnV0IG9uY2UgaXQKPiBoYXBwZW5zLCBp
dCdzIHBlcnNpc3RlbnQ6IHRoZSBtYWNoaW5lIHdpbGwgZmFsbCBpbnRvIHJlYm9vdCBsb29wIGR1
ZSB0byB0aGUKPiBjcmFzaC4KCkNhbiB5b3UgcHJvdmlkZSBtZSBhbiBpbWFnZSBvZiB0aGUgZmls
ZXN5c3RlbSBzdWNoIHRoYXQgSSBjYW4gaGF2ZSBhIGxvb2s/CkFuIGltYWdlIHdoZXJlIHRoZSBp
c3N1ZSBpcyBwZXJzaXN0ZW50Li4uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
