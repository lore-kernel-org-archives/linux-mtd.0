Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3007C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 21:13:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5CB9207FC
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 21:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDwQNtbq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5CB9207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXbdVsx3AUV5FPBzk1z5q1X2TWMn7gln2ryaq2A98nM=; b=DDwQNtbq37Ldez
	G3Nl7P4U/l8dQfC91IrznnzWyH7Xm6FAaNpIje912eicVLavZlBICjDMaHpfB2e/iLjc5JXg9nYLf
	8LNkEnrByjRBCW2Sn0c94qoMTE9LRgjAnl2YIEE++gLQ40PY2Q+FpGU61LFSwzmngNQQcAzb9d/9d
	Egcw+8r8J/dsKP8xei5A4sobooPrTfB8avG8f4szU+VbRkA8qvdpWfCwRdDHdo0yaY7PZ6KSGFUun
	wZcHphAZPu4gru0y831LaenzLE9d8VGw+7nRp1U2+nzzyJFGXhBYGC7gbIjK6LVZ3pRDTYaFjiePK
	oKNKJ7W1DCR9gO6piu6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHDLL-0006Q7-E3; Wed, 25 Mar 2020 21:13:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHDLG-0006Jg-NE
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 21:13:40 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9295EFF802;
 Wed, 25 Mar 2020 21:13:36 +0000 (UTC)
Date: Wed, 25 Mar 2020 22:13:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL] CFI and HyperFlash changes for v5.7-rc1
Message-ID: <20200325221335.6049f70d@xps13>
In-Reply-To: <9f7fe986-bba8-e7d8-889b-2fff4a2e9a76@ti.com>
References: <9f7fe986-bba8-e7d8-889b-2fff4a2e9a76@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_141338_921882_695DE64F 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKClZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4gd3JvdGUg
b24gVHVlLCAyNCBNYXIgMjAyMAoxNToyNToxMiArMDUzMDoKCj4gSGkgTWlxdWVsIFJpY2hhcmQs
Cj4gCj4gSGVyZSBpcyB0aGUgQ0ZJIGFuZCBIeXBlckZsYXNoIHJlbGF0ZWQgUFIgZm9yIHY1Ljct
cmMxCj4gCj4gUmVnYXJkcwo+IFZpZ25lc2gKPiAKPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDExYTQ4YTVhMThjNjNmZDc2MjFiYjA1MDIyOGNlYmYxMzU2NmU0ZDg6Cj4g
Cj4gICBMaW51eCA1LjYtcmMyICgyMDIwLTAyLTE2IDEzOjE2OjU5IC0wODAwKQo+IAo+IGFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgZ2l0QGdpdG9saXRlLmtl
cm5lbC5vcmc6cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9jZmkv
Zm9yLTUuNwo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBiNmZlOGJjNjdkMmQz
M2E5ZWZmMWIwNzg1NDgyYmNjZDE0OTc5MTE1Ogo+IAo+ICAgbXRkOiBoeXBlcmJ1czogbW92ZSBk
aXJlY3QgbWFwcGluZyBzZXR1cCB0byBBTTY1NCBIQk1DIGRyaXZlciAoMjAyMC0wMy0wMyAxMDox
MzoxMSArMDUzMCkKClB1bGxlZCBpbnRvIG10ZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
