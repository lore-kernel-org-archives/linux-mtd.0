Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DDCC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 22:12:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE9664DF2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 22:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE9664DF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tjgvxijrq+pgJUmnRYaYI2GJqlUQ7Ud7ypfzAJcU9X0=; b=I2ZjRFEII66uHvBeikgQr3g73
	YaByYoQa/LEaDcWdwZ3+tKJ81vVWhw6X0qmK/32Ys+Pamo2jD7u7pAPo7ssVapbWs2rTISpk6vTVX
	YGNq5Z3FdH5i9e107ZR0HkiYvII2tX1yWQe3l6QFYEjN+cFDA0bJorYpppHXTzfrQuk7q+qTpCCgL
	fAq/5W1uULay+8qgD/nVH96dyRsbTiLC2xP6ZfAVQAsZdpa8uZHdcVcgL354iMKybdHMcaoULJYKy
	LloHXnnRwgVW7U2S21Rt9NpiPpxYp62FTWEhTOTUnZYvOcFUEFUE8iMV6HUMgG/5kqRA2xBCyX1b+
	9HP427tfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5FVV-0003jO-3d; Thu, 28 Jan 2021 22:11:17 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5FVS-0003j2-P7
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 22:11:15 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A951F40007;
 Thu, 28 Jan 2021 22:11:11 +0000 (UTC)
Date: Thu, 28 Jan 2021 23:11:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Subject: Re: [PATCH V3] mtd: rawnand: qcom: update last code word register
Message-ID: <20210128231110.64266932@xps13>
In-Reply-To: <769ea3fe77eab9b37d863251e97bcb29@codeaurora.org>
References: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
 <20210114165325.3d510355@xps13>
 <769ea3fe77eab9b37d863251e97bcb29@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_171114_990661_5C97E785 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 manivannan.sadhasivam@linaro.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gRnJpLCAyOSBKYW4gMjAyMSAw
MzoxODo0NiArMDUzMDoKCj4gT24gMjAyMS0wMS0xNCAyMToyMywgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5v
cmc+IHdyb3RlIG9uIFN1biwgMTAgSmFuIDIwMjEKPiA+IDA5OjMxOjQ1ICswNTMwOgo+ID4gICAK
PiA+PiBGcm9tIFFQSUMgdmVyc2lvbiAyLjAgb253YXJkcyBuZXcgcmVnaXN0ZXIgZ290IGFkZGVk
IHRvICAKPiA+IAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhCj4gPiAgIAo+
ID4+IHJlYWQgbGFzdCBjb2Rld29yZC4gVGhpcyBjaGFuZ2Ugd2lsbCB1cGRhdGUgdGhlIHNhbWUu
ICAKPiA+IAo+ID4gICAgICAgIHRoZT8gICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eCj4gPiAgICAgICAgICAgICAgICAgICAgICAgUGxlYXNlIHJld29yZCB0aGlzIHNl
bnRlbmNlLiAgCj4gCj4gICAgRml4ZWQgdGhpcyBpbiBWNCBwYXRjaC4KPiA+ICAgCj4gPj4gRm9y
IGZpcnN0IHRocmVlIGNvZGUgd29yZCBSRUFEX0xPQ0FUSU9OX24gcmVnaXN0ZXIgd2lsbCBiZQo+
ID4+IHVzZS5Gb3IgbGFzdCBjb2RlIHdvcmQgUkVBRF9MT0NBVElPTl9MQVNUX0NXX24gcmVnaXN0
ZXIgd2lsbCBiZQo+ID4+IHVzZS4gIAo+ID4gCj4gPiAiRm9yIHRoZSBmaXJzdCB0aHJlZSBjb2Rl
d29yZHMsIFJFQURfTE9DQVRJT05fbiByZWdpc3RlcnMgd2lsbCBiZSB1c2VkLgo+ID4gVGhlIGxh
c3QgY29kZXdvcmQgcmVnaXN0ZXIgd2lsbCBiZSBhY2Nlc3NlZCB0aHJvdWdoCj4gPiBSRUFEX0xP
Q0FUSU9OX0xBU1RfQ1dfbi4iCj4gPiAKPiA+IEFsc28sIHBsZWFzZSBzcGVjaWZ5IHdoYXQgdGhl
c2UgcmVnaXN0ZXJzIHN0b3JlLiAgCj4gCj4gICAgVGhlIGxvY2F0aW9uIHJlZ2lzdGVyIGlzIG1h
aW5seSB1c2UgZm9yIHJlYWRpbmcgY29udHJvbGxlcgo+ICAgIGJ1ZmZlciB2aWEgQkFNIG1vZGUu
IFRoZSBiaXRzIG9mIHRoZSByZWdpc3RlciAiTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiwg
bj0wLi40Igo+ICAgIGFzIGZvbGxvdzoKClBlcmhhcHMgd2hhdCBJIGRvIG5vdCB1bmRlcnN0YW5k
IGlzOiB3aGVuIGlzIHRoaXMgImxhc3RfY3ciIHJlZ2lzdGVyCm1vcmUgdXNlZnVsIHRoYW4gdGhl
IHByZXZpb3VzIHNldD8KCj4gICAgWzk6MF0tYml0cyA6IChPRkZTRVQpIFRoaXMgYml0IGRlZmlu
ZXMgdGhlIG9mZnNldCBmcm9tIHRoZSBidWZmZXIgYmFzZSBhZGRyZXNzIHRvIGJlIHBpY2tlZCB1
cCBmb3IgRE1BLgo+ICAgIFsyNToxNl0tYml0czogKFNJWkUpIFRoaXMgYml0IG9mIGV2ZXJ5IHJl
Z2lzdGVyIHdpbGwgZGVmaW5lIHRoZSBzaXplIG9mIHRoZSBjaHVuayBmb3IgRE1BLgo+ICAgIDMx
LWJpdCA6ICAgICAgKExBU1QpIElmIHRoaXMgYml0IGlzIHNldCwgdGhlIGNvbnRyb2xsZXIgdGFr
ZXMgdGhlIHBhcnRpY3VsYXIgcmVnaXN0ZXIgdG8gc3BlY2lmeSB0aGUgbGFzdCBjaHVuawo+ICAg
ICAgICAgICAgICAgICAgICAgICAgb2YgZGF0YSBtYWRlIGF2YWlsYWJsZSBmb3IgRE1BLiBUaGlz
IGNodW5rIGlzIHBhcnQgb2YgdGhlIGludGVybmFsIGJ1ZmZlciBvZiB0aGUgY29udHJvbGxlci4K
PiAKPiA+ICAgCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
