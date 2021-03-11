Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5864DC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 09:51:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C341664D74
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 09:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C341664D74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3NsavtO9RW3Pe7+7B5VMd3uQc2UV6jOT4ouSham1AiI=; b=cOxDWZ9DCWmI23hZ+nwva48Cj
	zG9U6mjHnN8vny0vzjtPXHWkqL5xsRe8HKvHKqQZ74G/mAHOPVKvXO/ET16nIn/f9zPp4aLptzwRc
	nBjCg9ouCxlqzdvopm+ng4XJ/K+dYS5ZPpWTtAZNjwVfe8GnM8kdHwQzhq+npL/BJHa6oJku+l2s8
	HCED/LsiF4tyOwCh0IKYzU7Os9P5L7rJJvoevKoNDBjHbe6bjPNhh8w9fUv58q9Y6m49K965NcwMS
	6DNsPFs+4q3hsb8l7+0DUya+hJEr6i30W8y3+lCVSROO/i1n2ABT8TpttwNRwLlowynNh5AoGOGmO
	NghjPOBHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKHyH-008mkB-Ks; Thu, 11 Mar 2021 09:51:09 +0000
Received: from relay13.mail.gandi.net ([217.70.178.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKHy9-008miT-FS
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 09:51:03 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay13.mail.gandi.net (Postfix) with ESMTPSA id 6CEA98000D;
 Thu, 11 Mar 2021 09:50:56 +0000 (UTC)
Date: Thu, 11 Mar 2021 10:50:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky
 <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH next v4 02/15] mtd: mtdoops: synchronize kmsg_dumper
Message-ID: <20210311105055.4a0e864d@xps13>
In-Reply-To: <20210303101528.29901-3-john.ogness@linutronix.de>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <20210303101528.29901-3-john.ogness@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_095101_911944_489ACDB8 
X-CRM114-Status: GOOD (  12.55  )
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

SGVsbG8sCgpKb2huIE9nbmVzcyA8am9obi5vZ25lc3NAbGludXRyb25peC5kZT4gd3JvdGUgb24g
V2VkLCAgMyBNYXIgMjAyMQoxMToxNToxNSArMDEwMDoKCj4gVGhlIGttc2dfZHVtcGVyIGNhbiBi
ZSBjYWxsZWQgZnJvbSBhbnkgY29udGV4dCBhbmQgQ1BVLCBwb3NzaWJseQo+IGZyb20gbXVsdGlw
bGUgQ1BVcyBzaW11bHRhbmVvdXNseS4gU2luY2UgdGhlIHdyaXRpbmcgb2YgdGhlIGJ1ZmZlcgo+
IGNhbiBvY2N1ciBmcm9tIGEgbGF0ZXIgc2NoZWR1bGVkIHdvcmsgcXVldWUsIHRoZSBvb3BzIGJ1
ZmZlciBtdXN0Cj4gYmUgcHJvdGVjdGVkIGFnYWluc3Qgc2ltdWx0YW5lb3VzIGR1bXBpbmcuCj4g
Cj4gVXNlIGFuIGF0b21pYyBiaXQgdG8gbWFyayB3aGVuIHRoZSBidWZmZXIgaXMgcHJvdGVjdGVk
LiBSZWxlYXNlIHRoZQo+IHByb3RlY3Rpb24gaW4gYmV0d2VlbiBzZXR0aW5nIHRoZSBidWZmZXIg
YW5kIHRoZSBhY3R1YWwgd3JpdGluZyBpbgo+IG9yZGVyIGZvciBhIHBvc3NpYmxlIHBhbmljIChp
bW1lZGlhdGUgd3JpdGUpIHRvIGJlIHdyaXR0ZW4gZHVyaW5nCj4gdGhlIHNjaGVkdWxpbmcgb2Yg
YSBwcmV2aW91cyBvb3BzIChkZWxheWVkIHdyaXRlKS4KPiAKPiBBbiBhdG9taWMgYml0IChyYXRo
ZXIgdGhhbiBhIHNwaW5sb2NrKSB3YXMgY2hvc2VuIHNvIHRoYXQgbm8KPiBzY2hlZHVsaW5nIG9y
IHByZWVtcHRpb24gc2lkZS1lZmZlY3RzIHdvdWxkIGJlIGludHJvZHVjZWQuIFRoZSBNVEQKPiBr
bXNnX2R1bXBlciBtYXkgZHVtcCBkaXJlY3RseSBvciBpdCBtYXkgYmUgZGVsYXllZCAodmlhIHNj
aGVkdWxlZAo+IHdvcmspLiBEZXBlbmRpbmcgb24gdGhlIGNvbnRleHQsIGRpZmZlcmVudCBNVEQg
Y2FsbGJhY2tzIGFyZSB1c2VkLgo+IEZvciBleGFtcGxlLCBtdGRfd3JpdGUoKSBleHBlY3RzIHRv
IGJlIGNhbGxlZCBpbiBhIG5vbi1hdG9taWMKPiBjb250ZXh0IGFuZCBtYXkgdGFrZSBhIG11dGV4
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gT2duZXNzIDxqb2huLm9nbmVzc0BsaW51dHJvbml4
LmRlPgo+IFJldmlld2VkLWJ5OiBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4KClJldmll
d2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
