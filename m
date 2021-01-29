Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F591C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 05:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EDE64DFF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 05:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EDE64DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZXRQSVP07JvqgtZgNv4qsPBkg6kJ61qvJuvnwWrb8Nc=; b=btYjkKdXw17X5Hz7BAofIUQZ9
	EWITiW99Mjf4R0CDoSxyvWekcynAWegA3nsiyfCC0P9n3ZcvBiFBspLhWWehXrDikqq3VlaNpNDDL
	75L3dodKTRGo5x/1t6qAFb5KEZvg0+FmsvvD7638ozDMljvBw+/TYE9v6H5jLxZz8BVnPGfeTL0OP
	04mK45jUH2y/Aj/H6h1gn0YOp54UfWVO31bKZ0cwuZviu/NF/3EQgQhvAyJDg3dyNvI4ViCELO24L
	7rjs7eWVZoShUw+YZwuJ/yhd0vF1bmyItbxX1rgtc8MRUP1s0jhJf7DmpH+JYxDDczKf4bF2va3in
	qfo3rAPBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5LyO-0007C3-8J; Fri, 29 Jan 2021 05:05:32 +0000
Received: from m42-8.mailgun.net ([69.72.42.8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5LyK-0007BQ-JV
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 05:05:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611896727; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZJ29Q1zTcKf8BOTIllzMQ0k52SASQ7ZW0y10kmshp2I=;
 b=SjTydhCSQE6nW5y/QB6uFkPJblzLSuBZLgm0xDnlKHC6jVja9qkdOsxywQ3s90XHaaOOy75F
 jpTcc7gVFldDcZcrHnSr5XTvwuh81Vx9yO9n9YdtaFkAmO5gbdK3oKbBLmTBzFPhEDlibc+5
 gnQxM/BikcyNpOGNxjio6mch4Sg=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6013978a83b274b0af684465 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Jan 2021 05:05:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8B8FC433CA; Fri, 29 Jan 2021 05:05:13 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 11E29C433C6;
 Fri, 29 Jan 2021 05:05:13 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 29 Jan 2021 10:35:12 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH V3] mtd: rawnand: qcom: update last code word register
In-Reply-To: <20210128231110.64266932@xps13>
References: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
 <20210114165325.3d510355@xps13>
 <769ea3fe77eab9b37d863251e97bcb29@codeaurora.org>
 <20210128231110.64266932@xps13>
Message-ID: <189aaad7cfaf9e4cadd525b936430c8b@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_000528_702332_BD531929 
X-CRM114-Status: GOOD (  16.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMS0yOSAwMzo0MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBt
ZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gRnJpLCAyOSBKYW4gMjAyMSAwMzoxODo0NiAr
MDUzMDoKPiAKPj4gT24gMjAyMS0wMS0xNCAyMToyMywgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4g
PiBIZWxsbywKPj4gPgo+PiA+IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4g
d3JvdGUgb24gU3VuLCAxMCBKYW4gMjAyMQo+PiA+IDA5OjMxOjQ1ICswNTMwOgo+PiA+Cj4+ID4+
IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBvbndhcmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8K
Pj4gPgo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYQo+PiA+Cj4+ID4+IHJl
YWQgbGFzdCBjb2Rld29yZC4gVGhpcyBjaGFuZ2Ugd2lsbCB1cGRhdGUgdGhlIHNhbWUuCj4+ID4K
Pj4gPiAgICAgICAgdGhlPyAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl4KPj4gPiAgICAgICAgICAgICAgICAgICAgICAgUGxlYXNlIHJld29yZCB0aGlzIHNlbnRlbmNl
Lgo+PiAKPj4gICAgRml4ZWQgdGhpcyBpbiBWNCBwYXRjaC4KPj4gPgo+PiA+PiBGb3IgZmlyc3Qg
dGhyZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fbiByZWdpc3RlciB3aWxsIGJlCj4+ID4+IHVz
ZS5Gb3IgbGFzdCBjb2RlIHdvcmQgUkVBRF9MT0NBVElPTl9MQVNUX0NXX24gcmVnaXN0ZXIgd2ls
bCBiZQo+PiA+PiB1c2UuCj4+ID4KPj4gPiAiRm9yIHRoZSBmaXJzdCB0aHJlZSBjb2Rld29yZHMs
IFJFQURfTE9DQVRJT05fbiByZWdpc3RlcnMgd2lsbCBiZSB1c2VkLgo+PiA+IFRoZSBsYXN0IGNv
ZGV3b3JkIHJlZ2lzdGVyIHdpbGwgYmUgYWNjZXNzZWQgdGhyb3VnaAo+PiA+IFJFQURfTE9DQVRJ
T05fTEFTVF9DV19uLiIKPj4gPgo+PiA+IEFsc28sIHBsZWFzZSBzcGVjaWZ5IHdoYXQgdGhlc2Ug
cmVnaXN0ZXJzIHN0b3JlLgo+PiAKPj4gICAgVGhlIGxvY2F0aW9uIHJlZ2lzdGVyIGlzIG1haW5s
eSB1c2UgZm9yIHJlYWRpbmcgY29udHJvbGxlcgo+PiAgICBidWZmZXIgdmlhIEJBTSBtb2RlLiBU
aGUgYml0cyBvZiB0aGUgcmVnaXN0ZXIgCj4+ICJOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV19u
LCBuPTAuLjQiCj4+ICAgIGFzIGZvbGxvdzoKPiAKPiBQZXJoYXBzIHdoYXQgSSBkbyBub3QgdW5k
ZXJzdGFuZCBpczogd2hlbiBpcyB0aGlzICJsYXN0X2N3IiByZWdpc3Rlcgo+IG1vcmUgdXNlZnVs
IHRoYW4gdGhlIHByZXZpb3VzIHNldD8KCiAgIEZyb20gUVBJQyBWZXJzaW9uIDIuMCBvbndhcmRz
IGl0IGlzIG1hbmRhdG9yeSB0byB1c2UgCiJOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV19uLCBu
PTAuLjQiCiAgIHJlZ2lzdGVyIHRvIGV4dHJhY3QgbGFzdCBjb2RlIHdvcmQgZGF0YSBmcm9tIGNv
bnRyb2xsZXIgYnVmZmVyLiBVc2luZyAKcmVnaXN0ZXIgIk5BTkRfUkVBRF9MT0NBVElPTl9uLCBu
PTAuLjQiCiAgIHdlIGNhbiBleHRyYWN0IGFsbCBjb2RlIHdvcmRzIGV4Y2VwdCBsYXN0IGNvZGUg
d29yZC4KPiAKPj4gICAgWzk6MF0tYml0cyA6IChPRkZTRVQpIFRoaXMgYml0IGRlZmluZXMgdGhl
IG9mZnNldCBmcm9tIHRoZSBidWZmZXIgCj4+IGJhc2UgYWRkcmVzcyB0byBiZSBwaWNrZWQgdXAg
Zm9yIERNQS4KPj4gICAgWzI1OjE2XS1iaXRzOiAoU0laRSkgVGhpcyBiaXQgb2YgZXZlcnkgcmVn
aXN0ZXIgd2lsbCBkZWZpbmUgdGhlIAo+PiBzaXplIG9mIHRoZSBjaHVuayBmb3IgRE1BLgo+PiAg
ICAzMS1iaXQgOiAgICAgIChMQVNUKSBJZiB0aGlzIGJpdCBpcyBzZXQsIHRoZSBjb250cm9sbGVy
IHRha2VzIHRoZSAKPj4gcGFydGljdWxhciByZWdpc3RlciB0byBzcGVjaWZ5IHRoZSBsYXN0IGNo
dW5rCj4+ICAgICAgICAgICAgICAgICAgICAgICAgb2YgZGF0YSBtYWRlIGF2YWlsYWJsZSBmb3Ig
RE1BLiBUaGlzIGNodW5rIGlzIAo+PiBwYXJ0IG9mIHRoZSBpbnRlcm5hbCBidWZmZXIgb2YgdGhl
IGNvbnRyb2xsZXIuCj4+IAo+PiA+Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
