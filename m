Return-Path: <SRS0=I5F2=JS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16F4C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 20:46:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F7F261425
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 20:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F7F261425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U7S/fw27J6WUr9wUsXYhLCjqK3S7fDVYKOv7LVl680M=; b=InAlRp3S30QpVC8EDwJoDkFR3
	3Gl8T9bEtVFgcPY72xBqtUaf2Mj8mwoXvhZxRt+Nt2QD3P3KvQrxzW7PNwImwsHVyAdHBaMYOtYwx
	yUGtJNcYper3zhYVa8jlIz6J7JPxnR4xk+3wlcvfdBEcxfwk3TE99Z+Pgt+XWKqDSlq0+KDMuLm/H
	5PU/xcWJ+SG5nGnJQJV/eA/4B/M3/y2sLPNoOQaTCHFa98exqiDc5blvLZ/msYLm9wWMvM5xLBJ1j
	p9x4QujCkMakGg5YiuuIpkf8LN1k+VOTgcsfpBRWycKPOaw7tGboATdV5x3pPKndkLaLyNDwf3Uyg
	8lrIZs+RQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZJid-00FAci-Tg; Wed, 21 Apr 2021 20:45:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJia-00FAcC-UC
 for linux-mtd@desiato.infradead.org; Wed, 21 Apr 2021 20:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=nboK94RNhPwYlPQyYOGgKSqZEzcHNsCguxWVh1cAhT8=; b=0I9G6/KdXzNMx3tqsYUYYJu8q2
 LdAO7qqLbw+GQ5n1fYP8R+jQxCVVVFxIC0e95EBxCx2IHYc4U8FYUPC+/NT/kJIalmslmYO1F/uiz
 VksKJZ6aytRQdVnR2zX/S4hsCRIPWZgFTck6XKEUBeOA/nKqijA3iylbvhiP0+obI1QmDHKkv8J5+
 kG/wDj1bpphGEmG6arrFvnGY8X7T2WmCuQ55nKkgY7nvxB1fF8kk/fiXJIbh2ZVnUYCeLluWLOMQC
 O3jNnnOcWyuS4wIyMRRnV4mnCmJihObmPq/EzJI0yCzcIpWPBuDDzr67KXtqPbi1vUxg8y669gcW2
 eXHZIIGA==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJiX-00DBBE-NK
 for linux-mtd@lists.infradead.org; Wed, 21 Apr 2021 20:45:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 5A6C51F41E0C
Subject: Re: imx27: No space left to write bad block table
To: =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <S.Riedmueller@phytec.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Cc: "festevam@gmail.com" <festevam@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
 <20210419173608.434f4b8d@xps13>
 <13112dfe42b99e0c5ef340d9382bb76014bb870c.camel@phytec.de>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <7615b69a-3b5d-c785-76b9-94b70412e7ca@collabora.com>
Date: Wed, 21 Apr 2021 21:44:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <13112dfe42b99e0c5ef340d9382bb76014bb870c.camel@phytec.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_134502_042162_64626337 
X-CRM114-Status: GOOD (  32.67  )
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

T24gMjAvMDQvMjAyMSAwNzoyNiwgU3RlZmFuIFJpZWRtw7xsbGVyIHdyb3RlOgo+IEhpIE1pcXVl
bCwKPiAKPiBPbiBNb24sIDIwMjEtMDQtMTkgYXQgMTc6MzYgKzAyMDAsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+IEhpIFN0ZWZhbiwKPj4KPj4+PiBJbnRlcmVzdGluZy4gTWF5YmUgSSBvdmVybG9v
a2VkIHRoZSBiZWxvdyBjb21taXQgd2hlbiBhcHBseWluZy4gSW5kZWVkLAo+Pj4+IEJCVCBtYXkg
YmUgY29uc2lkZXJlZCBhcyBiYWQgYmxvY2tzLCBzbyBJIHdvbmRlciBpZiB0aGUgYmVsb3cgY2hh
bmdlIGlzCj4+Pj4gdmFsaWQgbm93Li4uCj4+Pj4KPj4+PiBHdWlsbGF1bWUsIHdvdWxkIHlvdSBo
YXZlIGEgd2F5IHRvIHJldmVydCB0aGlzIHBhdGNoIG9uIHRvcCBvZgo+Pj4+IGxpbnV4LW5leHQ/
IFN0ZWZhbiwgd291bGQgeW91IG1pbmQgZ2l2aW5nIG1vcmUgZGV0YWlscyBvbiB0aGUgdGVzdGlu
Zwo+Pj4+IHByb2NlZHVyZT8gIAoKU29ycnkgSSdtIGxhdGUgdG8gdGhlIHBhcnR5LCB3YXMgYnVz
eSB3aXRoIHNvbWUgb3RoZXIga2VybmVsY2kKaXNzdWVzLiAgSSBnYXRoZXIgdGhpcyBpcyBiZWlu
ZyByZXZlcnRlZCBhbnl3YXkgbm93LCBidXQgcGxlYXNlCmxldCBtZSBrbm93IGlmIHlvdSBzdGls
bCBuZWVkIHRvIGNoZWNrIGFueXRoaW5nLiAgQXMgZmFyIGFzIEkgY2FuCnRlbGwsIHRoZXJlIGhh
c24ndCBiZWVuIGFueSBhdXRvbWF0ZWQgYmlzZWN0aW9uIGxhbmRpbmcgb24gdGhpcwpjb21taXQu
CgpJdCdzIGdlbmVyYWxseSBwb3NzaWJsZSB0byByZS1ydW4gYW55dGhpbmcsIGkuZS4gbWFrZSBh
IGtlcm5lbApidWlsZCB3aXRoIGEgY3VzdG9tIHBhdGNoc2V0IGFuZCBydW4gb25lIGdpdmVuIHRl
c3Qgb24gYW55IG9mIHRoZQpwbGF0Zm9ybXMgaW4gS2VybmVsQ0kuICBUaGVyZSBqdXN0IGlzbid0
IGFueSBwdWJsaWMgc2VsZi1zZXJ2aWNlCmZvciBkb2luZyB0aGF0ICh5ZXQpLgoKQmVzdCB3aXNo
ZXMsCkd1aWxsYXVtZQoKPj4+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBvbiBhbiBpLk1YIDYgYnkgc2lt
dWxhdGluZyB0d28gYmFkIEJCVCBibG9ja3MgYnkgc2ltcGx5Cj4+PiByZXR1cm5pbmcgLUVJTyBp
biBuYW5kX2VyYXNlX25hbmQgd2hlbiB0aGUgYmxvY2sgdG8gYmUgZXJhc2VkIGlzIG9uZSBvZgo+
Pj4gdGhlCj4+PiBmaXJzdCB0d28gQkJUIGJsb2Nrcy4KPj4+Cj4+PiBJIGhhdmUgc2VlbiB0aGlz
IG9uY2Ugb24gYSBjdXN0b21lciBib2FyZCBidXQgd2VyZSBub3QgYWJsZSB0byByZXByb2R1Y2UK
Pj4+IGl0Cj4+PiBhbnltb3JlLCB0aHVzIHRoZSBzaW11bGF0aW9uIG9mIHRoZSB0d28gYmFkIGJs
b2Nrcy4KPj4+Cj4+PiBXaXRob3V0IHRoZSBwYXRjaCBiZWxvdyBuZXcgdmVyc2lvbnMgb2YgdGhl
IEJCVCBjYW4gbm8gbG9uZ2VyIGJlIHdyaXR0ZW4KPj4+IHRvCj4+PiB0aGUgZmlyc3QgdHdvIGJs
b2NrcyByZXNlcnZlZCBmb3IgdGhlIEJCVCBidXQgdGhleSBhcmUgc3RpbGwgZXZhbHVhdGVkIHRv
Cj4+PiByZWFkCj4+PiB0aGUgQkJUIGZyb20gZHVyaW5nIGJvb3QgZHVlIHRoZSBsYWNrIG9mIGEg
dGVzdCBpZiB0aGVzZSBibG9ja3MgYXJlIGJhZC4KPj4+IFNvCj4+PiBjaGFuZ2VzIHRvIHRoZSBC
QlQgYWZ0ZXIgdGhlc2UgdHdvIGJsb2NrcyB0dXJuIGJhZCBhcmUgb25seSBrZXB0IGFuZCB1c2Vk
Cj4+PiB1bnRpbCB0aGUgbmV4dCByZWJvb3Qgd2hlcmUgYWdhaW4gdGhlIG9sZCB2ZXJzaW9uIG9m
IHRoZSB0d28gd29ybiBibG9ja3MKPj4+IGlzCj4+PiB1c2VkIGFzIGEgYmFzaXMuCj4+Pgo+Pj4g
SSB0cmllZCB0byB1c2UgdGhlIHNhbWUgbWVjaGFuaXNtIHRoYXQgaXMgdXNlZCB0byBpZGVudGlm
eSBiYWQgYmxvY2tzCj4+PiBkdXJpbmcgYQo+Pj4gc2NhbiBmb3IgYmFkIGJsb2Nrcy4gQnV0IG1h
eWJlIEkgbWlzc2VkIHNvbWV0aGluZyB0aGVyZT8gT3Igd2VyZSBteQo+Pj4gYXNzdW1wdGlvbnMg
d3JvbmcgaW4gdGhlIGZpcnN0IHBsYWNlPwo+Pgo+PiBIb25lc3RseSBJIGRvbid0IGtub3cgd2hh
dCBpcyB3cm9uZyBleGFjdGx5IGluIHRoaXMgcGF0Y2guCj4+Cj4+IFdlIHdpbGwgcmV2ZXJ0IHRo
ZSBjb21taXQgYXMgaXQgY2xlYXJseSBicmVha3Mgc29tZXRoaW5nIGZ1bmRhbWVudGFsCj4+IGFu
ZCB0aGUgbWVyZ2Ugd2luZG93IGlzIHRvbyBjbG9zZSB0byBhZG9wdCBhIGhhY2tpc2ggYXR0aXR1
ZGUuCj4+Cj4+IEkgd291bGQgcHJvcG9zZSB0aGUgZm9sbG93aW5nIHRlc3RzIHdpdGggeW91ciBi
b2FyZDoKPj4gLSBIYWNrIHRoZSBjb3JlIHRvIGFsbG93IHlvdXJzZWxmIHRvIGFjY2VzcyBiYWQg
YmxvY2tzIGZyb20gdXNlcnNwYWNlCj4+ICAgZm9yIHRlc3RpbmcgcHVycG9zZXMuCj4+IC0gV2l0
aCB0aGUgYmVsb3cgY29tbWl0LCB5b3Ugc2hvdWxkIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3IgdGhh
bgo+PiAgIHJlcG9ydGVkIGJ5IEZhYmlvLgo+PiAtIFJldmVydCB0aGUgY29tbWl0Lgo+PiAtIE1h
bnVhbGx5IGNoYW5nZSB0aGUgYmFkIGJsb2NrIG1hcmtlcnMgKG5hbmRkdW1wLCBmbGFzaF9lcmFz
ZSwKPj4gICBuYW5kd3JpdGUpIHRvIGRlY2xhcmUgdGhlIHR3byB0YWJsZXMgYmFkLiBSZWJvb3Qg
YW5kIG9ic2VydmUgaWYgdGhlcmUKPj4gICBhcmUgYW55IGlzc3Vlcy4gWW91IGNhbiB0cnkgdG8g
d29yayBmcm9tIHRoZXJlLgo+IAo+IFRoYW5rcyBmb3IgdGhlIGlucHV0ISBJIHdpbGwgZm9sbG93
IHlvdXIgc3VnZ2VzdGlvbnMgYW5kIGxldCB5b3UgZ3V5cyBrbm93IG15Cj4gZmluZGluZ3MuCj4g
Cj4gUmVnYXJkcywKPiBTdGVmYW4KPiAKPj4KPj4+PiAtLS04PC0tLQo+Pj4+Cj4+Pj4gY29tbWl0
IGJkOWM5ZmUyYWQwNDU0Njk0MGY0YTk5NzlkNjc5ZTYyY2FlNmFhNTEKPj4+PiBBdXRob3I6IFN0
ZWZhbiBSaWVkbXVlbGxlciA8cy5yaWVkbXVlbGxlckBwaHl0ZWMuZGU+Cj4+Pj4gRGF0ZTogICBU
aHUgTWFyIDI1IDExOjIzOjM3IDIwMjEgKzAxMDAKPj4+Pgo+Pj4+ICAgICBtdGQ6IHJhd25hbmQ6
IGJidDogU2tpcCBiYWQgYmxvY2tzIHdoZW4gc2VhcmNoaW5nIGZvciB0aGUgQkJUIGluCj4+Pj4g
TkFORAo+Pj4+ICAgICAKPj4+PiAgICAgVGhlIGJsb2NrcyBjb250YWluaW5nIHRoZSBiYWQgYmxv
Y2sgdGFibGUgY2FuIGJlY29tZSBiYWQgYXMgd2VsbC4gU28KPj4+PiAgICAgbWFrZSBzdXJlIHRv
IHNraXAgYW55IGJsb2NrcyB0aGF0IGFyZSBtYXJrZWQgYmFkIHdoZW4gc2VhcmNoaW5nIGZvcgo+
Pj4+IHRoZQo+Pj4+ICAgICBiYWQgYmxvY2sgdGFibGUuCj4+Pj4gICAgIAo+Pj4+ICAgICBPdGhl
cndpc2UgaW4gdmVyeSByYXJlIGNhc2VzIHdoZXJlIHR3byBCQlQgYmxvY2tzIHdlYXIgb3V0IGl0
IG1pZ2h0Cj4+Pj4gICAgIGhhcHBlbiB0aGF0IGFuIG9ic29sZXRlIEJCVCBpcyB1c2VkIGluc3Rl
YWQgb2YgYSBuZXdlciBhdmFpbGFibGUKPj4+PiAgICAgdmVyc2lvbi4KPj4+PiAgICAgCj4+Pj4g
ICAgIFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBSaWVkbXVlbGxlciA8cy5yaWVkbXVlbGxlckBwaHl0
ZWMuZGU+Cj4+Pj4gICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4+Pj4gICAgIExpbms6IAo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW10ZC8yMDIxMDMyNTEwMjMzNy40ODExNzItMS1zLnJpZWRtdWVsbGVyQHBoeXRl
Yy5kZQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0
LmMKPj4+PiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMKPj4+PiBpbmRleCBkY2Vk
MzJhMTI2ZDkuLjZlMjVhNWNlNWJhOSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2JidC5jCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQu
Ywo+Pj4+IEBAIC01MjUsNiArNTI1LDcgQEAgc3RhdGljIGludCBzZWFyY2hfYmJ0KHN0cnVjdCBu
YW5kX2NoaXAgKnRoaXMsCj4+Pj4gdWludDhfdAo+Pj4+ICpidWYsCj4+Pj4gIHsKPj4+PiAgICAg
ICAgIHU2NCB0YXJnZXRzaXplID0gbmFuZGRldl90YXJnZXRfc2l6ZSgmdGhpcy0+YmFzZSk7Cj4+
Pj4gICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKHRoaXMpOwo+Pj4+
ICsgICAgICAgc3RydWN0IG5hbmRfYmJ0X2Rlc2NyICpiZCA9IHRoaXMtPmJhZGJsb2NrX3BhdHRl
cm47Cj4+Pj4gICAgICAgICBpbnQgaSwgY2hpcHM7Cj4+Pj4gICAgICAgICBpbnQgc3RhcnRibG9j
aywgYmxvY2ssIGRpcjsKPj4+PiAgICAgICAgIGludCBzY2FubGVuID0gbXRkLT53cml0ZXNpemUg
KyBtdGQtPm9vYnNpemU7Cj4+Pj4gQEAgLTU2MCw2ICs1NjEsMTAgQEAgc3RhdGljIGludCBzZWFy
Y2hfYmJ0KHN0cnVjdCBuYW5kX2NoaXAgKnRoaXMsCj4+Pj4gdWludDhfdAo+Pj4+ICpidWYsCj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50IGFjdGJsb2NrID0gc3RhcnRibG9jayArIGRp
ciAqIGJsb2NrOwo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGxvZmZfdCBvZmZzID0gKGxv
ZmZfdClhY3RibG9jayA8PCB0aGlzLSAgCj4+Pj4+IGJidF9lcmFzZV9zaGlmdDsgIAo+Pj4+ICAK
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAvKiBDaGVjayBpZiBibG9jayBpcyBtYXJrZWQg
YmFkICovCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNjYW5fYmxvY2tfZmFzdCh0
aGlzLCBiZCwgb2ZmcywgYnVmKSkKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+Pj4+ICsKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBSZWFkIGZp
cnN0IHBhZ2UgKi8KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBzY2FuX3JlYWQodGhpcywg
YnVmLCBvZmZzLCBtdGQtPndyaXRlc2l6ZSwgdGQpOwo+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmICghY2hlY2tfcGF0dGVybihidWYsIHNjYW5sZW4sIG10ZC0+d3JpdGVzaXplLAo+Pj4+
IHRkKSkgewo+Pj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTWlxdcOobCAgCj4+Cj4+IFRoYW5r
cywKPj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
