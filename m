Return-Path: <SRS0=7f2K=JT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E68C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Apr 2021 13:17:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFEE961425
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Apr 2021 13:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFEE961425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aH5/ijNa9faf1epMfIpBQ+zO6Um/PjRA09LT/LlnEAI=; b=Sy3bjAatoIJc76cDHuKfGSIlP
	AFVRlCeGoNMjQeXmTWVWYYsaIh05jutVqPue8vB9kX2sXv5RbWF8OeAdfkQFCJt/q7yMeD21h05TY
	91Whn5GO+6zje9sG6mug4+WfDN0hPGQ33mPARkDgf8A9zxlMk9OyfsQdbenENW2eW5ewcwsLCR97i
	Xsn0bJlwCWA8DyuBHCQo6U4NI6oBnDxFqF/5suZDPc1o4lPedgbAs+J9F5xpnS/9ljfIvOr9JYRdb
	+Te7TFzyXlTic0aY2/scbMyTm8z8dFXJXyOYxKJIuYU/ZMujsrTt7WS2MUBrRdbrZgO80zJxAYz8n
	Zettfn0qQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZBu-00GnA3-7c; Thu, 22 Apr 2021 13:16:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZBr-00Gn9Z-W1
 for linux-mtd@desiato.infradead.org; Thu, 22 Apr 2021 13:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=5T9T9GEo6Ld3tP0aQQt4x4f5ORQfWDK8+3hnGKqhxD0=; b=pIjqCFhg23JWC478ths/h3hhlW
 OvchrCcxee4BTYzJVxzmmzxYOLGZUo/T4QOPI9eGY+Ssw5xYg+zG8T4S+nxRTPup0T1sPc2D05+75
 oH9pl4gjrPCYZm4rlyZTkSKHRNrLGcj3W78gljWRjojx1QTU4DIFnNOXhPqIuSNkeka0xhhOd+uKH
 TZqv2nMjtwLrt0UkkIjNldP9NzRJvpZCw6GYJVPBDncJu4nTWym+A45S5gKVyJ8Gy5b4ewnXZX/Vp
 GOYjLaculSQv0sABpmmHbtE+TLY5OKrb/i7EcQlR5RWeQ+l28yyFK88su7v0AS4QAJb9AFsfdH+X+
 6608kLJg==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZBo-00Di0V-L2
 for linux-mtd@lists.infradead.org; Thu, 22 Apr 2021 13:16:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 9A8041F433D9
Subject: Re: imx27: No space left to write bad block table
To: Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <S.Riedmueller@phytec.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?Jan_L=c3=bcbbe?= <j.luebbe@pengutronix.de>,
 "kernelci-results@groups.io" <kernelci-results@groups.io>
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
 <20210419173608.434f4b8d@xps13>
 <13112dfe42b99e0c5ef340d9382bb76014bb870c.camel@phytec.de>
 <7615b69a-3b5d-c785-76b9-94b70412e7ca@collabora.com>
 <CAOMZO5AG-fgZ7a12_Eioj8u+bjjJ5WPG0paS-A+2yXvurw8WFA@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <0be8dcae-e650-fe70-1388-44e644f4d3f8@collabora.com>
Date: Thu, 22 Apr 2021 14:16:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AG-fgZ7a12_Eioj8u+bjjJ5WPG0paS-A+2yXvurw8WFA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_061616_979638_806C8375 
X-CRM114-Status: GOOD (  34.37  )
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

K0phbiwgK2tlcm5lbGNpLXJlc3VsdHMKCk9uIDIyLzA0LzIwMjEgMDA6MjksIEZhYmlvIEVzdGV2
YW0gd3JvdGU6Cj4gSGkgR3VpbGxhdW1lLAo+IAo+IE9uIFdlZCwgQXByIDIxLCAyMDIxIGF0IDU6
NDQgUE0gR3VpbGxhdW1lIFR1Y2tlcgo+IDxndWlsbGF1bWUudHVja2VyQGNvbGxhYm9yYS5jb20+
IHdyb3RlOgo+IAo+PiBTb3JyeSBJJ20gbGF0ZSB0byB0aGUgcGFydHksIHdhcyBidXN5IHdpdGgg
c29tZSBvdGhlciBrZXJuZWxjaQo+PiBpc3N1ZXMuICBJIGdhdGhlciB0aGlzIGlzIGJlaW5nIHJl
dmVydGVkIGFueXdheSBub3csIGJ1dCBwbGVhc2UKPj4gbGV0IG1lIGtub3cgaWYgeW91IHN0aWxs
IG5lZWQgdG8gY2hlY2sgYW55dGhpbmcuICBBcyBmYXIgYXMgSSBjYW4KPj4gdGVsbCwgdGhlcmUg
aGFzbid0IGJlZW4gYW55IGF1dG9tYXRlZCBiaXNlY3Rpb24gbGFuZGluZyBvbiB0aGlzCj4+IGNv
bW1pdC4KPiAKPiBUaGFua3MuIFllcywgd2UgZGlkIHRoZSByZXZlcnQgaW4gbGludXgtbmV4dCwg
YnV0IEkgY291bGQgbm90IHNlZSB0aGUKPiBuZXh0LTIwMjEwNDIxIGJvb3QgbG9nIGZvciB0aGUg
aW14MjctcGh5dGVjLXBoeWNhcmQtcy1yZGsgYm9hcmQgdG8KPiBjb25maXJtIHRoYXQgdGhlIE5B
TkQgYmFkIGJsb2NrIHRhYmxlIGNhbiBiZSBmb3VuZCBhZ2Fpbi4KClRoaXMgZGV2aWNlIGlzIG9u
bHkgYXZhaWxhYmxlIGluIFBlbmd1dHJvbml4J3MgbGFiIHdoaWNoIGlzCmN1cnJlbnRseSBiZWlu
ZyBtb3ZlZCB0byBhIG5ldyBsb2NhdGlvbiwgc28gSSdtIGJlaW5nIHRvbGQuICBJCmd1ZXNzIHdl
J2xsIGNoZWNrIGFnYWluIHdoZW4gaXQncyBiYWNrIG9ubGluZS4KCkFyZSB5b3UgYXdhcmUgb2Yg
YW55IG90aGVyIHBsYXRmb3JtIGluIEtlcm5lbENJIHNob3dpbmcgdGhlIHNhbWUKaXNzdWU/ICBJ
IGNvdWxkIHRha2UgYSBsb29rIGJ1dCB0aGVyZSdzIGJlZW4gbW9yZSBib290IGZhaWx1cmUKcmVn
cmVzc2lvbnMgdGhhbiB1c3VhbCBvbiBsaW51eC1uZXh0IHJlY2VudGx5Li4uCgpCZXN0IHdpc2hl
cywKR3VpbGxhdW1lCgo+PiBJdCdzIGdlbmVyYWxseSBwb3NzaWJsZSB0byByZS1ydW4gYW55dGhp
bmcsIGkuZS4gbWFrZSBhIGtlcm5lbAo+PiBidWlsZCB3aXRoIGEgY3VzdG9tIHBhdGNoc2V0IGFu
ZCBydW4gb25lIGdpdmVuIHRlc3Qgb24gYW55IG9mIHRoZQo+PiBwbGF0Zm9ybXMgaW4gS2VybmVs
Q0kuICBUaGVyZSBqdXN0IGlzbid0IGFueSBwdWJsaWMgc2VsZi1zZXJ2aWNlCj4+IGZvciBkb2lu
ZyB0aGF0ICh5ZXQpLgo+Pgo+PiBCZXN0IHdpc2hlcywKPj4gR3VpbGxhdW1lCj4+Cj4+Pj4+IEkg
aGF2ZSB0ZXN0ZWQgdGhpcyBvbiBhbiBpLk1YIDYgYnkgc2ltdWxhdGluZyB0d28gYmFkIEJCVCBi
bG9ja3MgYnkgc2ltcGx5Cj4+Pj4+IHJldHVybmluZyAtRUlPIGluIG5hbmRfZXJhc2VfbmFuZCB3
aGVuIHRoZSBibG9jayB0byBiZSBlcmFzZWQgaXMgb25lIG9mCj4+Pj4+IHRoZQo+Pj4+PiBmaXJz
dCB0d28gQkJUIGJsb2Nrcy4KPj4+Pj4KPj4+Pj4gSSBoYXZlIHNlZW4gdGhpcyBvbmNlIG9uIGEg
Y3VzdG9tZXIgYm9hcmQgYnV0IHdlcmUgbm90IGFibGUgdG8gcmVwcm9kdWNlCj4+Pj4+IGl0Cj4+
Pj4+IGFueW1vcmUsIHRodXMgdGhlIHNpbXVsYXRpb24gb2YgdGhlIHR3byBiYWQgYmxvY2tzLgo+
Pj4+Pgo+Pj4+PiBXaXRob3V0IHRoZSBwYXRjaCBiZWxvdyBuZXcgdmVyc2lvbnMgb2YgdGhlIEJC
VCBjYW4gbm8gbG9uZ2VyIGJlIHdyaXR0ZW4KPj4+Pj4gdG8KPj4+Pj4gdGhlIGZpcnN0IHR3byBi
bG9ja3MgcmVzZXJ2ZWQgZm9yIHRoZSBCQlQgYnV0IHRoZXkgYXJlIHN0aWxsIGV2YWx1YXRlZCB0
bwo+Pj4+PiByZWFkCj4+Pj4+IHRoZSBCQlQgZnJvbSBkdXJpbmcgYm9vdCBkdWUgdGhlIGxhY2sg
b2YgYSB0ZXN0IGlmIHRoZXNlIGJsb2NrcyBhcmUgYmFkLgo+Pj4+PiBTbwo+Pj4+PiBjaGFuZ2Vz
IHRvIHRoZSBCQlQgYWZ0ZXIgdGhlc2UgdHdvIGJsb2NrcyB0dXJuIGJhZCBhcmUgb25seSBrZXB0
IGFuZCB1c2VkCj4+Pj4+IHVudGlsIHRoZSBuZXh0IHJlYm9vdCB3aGVyZSBhZ2FpbiB0aGUgb2xk
IHZlcnNpb24gb2YgdGhlIHR3byB3b3JuIGJsb2Nrcwo+Pj4+PiBpcwo+Pj4+PiB1c2VkIGFzIGEg
YmFzaXMuCj4+Pj4+Cj4+Pj4+IEkgdHJpZWQgdG8gdXNlIHRoZSBzYW1lIG1lY2hhbmlzbSB0aGF0
IGlzIHVzZWQgdG8gaWRlbnRpZnkgYmFkIGJsb2Nrcwo+Pj4+PiBkdXJpbmcgYQo+Pj4+PiBzY2Fu
IGZvciBiYWQgYmxvY2tzLiBCdXQgbWF5YmUgSSBtaXNzZWQgc29tZXRoaW5nIHRoZXJlPyBPciB3
ZXJlIG15Cj4+Pj4+IGFzc3VtcHRpb25zIHdyb25nIGluIHRoZSBmaXJzdCBwbGFjZT8KPj4+Pgo+
Pj4+IEhvbmVzdGx5IEkgZG9uJ3Qga25vdyB3aGF0IGlzIHdyb25nIGV4YWN0bHkgaW4gdGhpcyBw
YXRjaC4KPj4+Pgo+Pj4+IFdlIHdpbGwgcmV2ZXJ0IHRoZSBjb21taXQgYXMgaXQgY2xlYXJseSBi
cmVha3Mgc29tZXRoaW5nIGZ1bmRhbWVudGFsCj4+Pj4gYW5kIHRoZSBtZXJnZSB3aW5kb3cgaXMg
dG9vIGNsb3NlIHRvIGFkb3B0IGEgaGFja2lzaCBhdHRpdHVkZS4KPj4+Pgo+Pj4+IEkgd291bGQg
cHJvcG9zZSB0aGUgZm9sbG93aW5nIHRlc3RzIHdpdGggeW91ciBib2FyZDoKPj4+PiAtIEhhY2sg
dGhlIGNvcmUgdG8gYWxsb3cgeW91cnNlbGYgdG8gYWNjZXNzIGJhZCBibG9ja3MgZnJvbSB1c2Vy
c3BhY2UKPj4+PiAgIGZvciB0ZXN0aW5nIHB1cnBvc2VzLgo+Pj4+IC0gV2l0aCB0aGUgYmVsb3cg
Y29tbWl0LCB5b3Ugc2hvdWxkIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3IgdGhhbgo+Pj4+ICAgcmVw
b3J0ZWQgYnkgRmFiaW8uCj4+Pj4gLSBSZXZlcnQgdGhlIGNvbW1pdC4KPj4+PiAtIE1hbnVhbGx5
IGNoYW5nZSB0aGUgYmFkIGJsb2NrIG1hcmtlcnMgKG5hbmRkdW1wLCBmbGFzaF9lcmFzZSwKPj4+
PiAgIG5hbmR3cml0ZSkgdG8gZGVjbGFyZSB0aGUgdHdvIHRhYmxlcyBiYWQuIFJlYm9vdCBhbmQg
b2JzZXJ2ZSBpZiB0aGVyZQo+Pj4+ICAgYXJlIGFueSBpc3N1ZXMuIFlvdSBjYW4gdHJ5IHRvIHdv
cmsgZnJvbSB0aGVyZS4KPj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBpbnB1dCEgSSB3aWxsIGZvbGxv
dyB5b3VyIHN1Z2dlc3Rpb25zIGFuZCBsZXQgeW91IGd1eXMga25vdyBteQo+Pj4gZmluZGluZ3Mu
Cj4+Pgo+Pj4gUmVnYXJkcywKPj4+IFN0ZWZhbgo+Pj4KPj4+Pgo+Pj4+Pj4gLS0tODwtLS0KPj4+
Pj4+Cj4+Pj4+PiBjb21taXQgYmQ5YzlmZTJhZDA0NTQ2OTQwZjRhOTk3OWQ2NzllNjJjYWU2YWE1
MQo+Pj4+Pj4gQXV0aG9yOiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVj
LmRlPgo+Pj4+Pj4gRGF0ZTogICBUaHUgTWFyIDI1IDExOjIzOjM3IDIwMjEgKzAxMDAKPj4+Pj4+
Cj4+Pj4+PiAgICAgbXRkOiByYXduYW5kOiBiYnQ6IFNraXAgYmFkIGJsb2NrcyB3aGVuIHNlYXJj
aGluZyBmb3IgdGhlIEJCVCBpbgo+Pj4+Pj4gTkFORAo+Pj4+Pj4KPj4+Pj4+ICAgICBUaGUgYmxv
Y2tzIGNvbnRhaW5pbmcgdGhlIGJhZCBibG9jayB0YWJsZSBjYW4gYmVjb21lIGJhZCBhcyB3ZWxs
LiBTbwo+Pj4+Pj4gICAgIG1ha2Ugc3VyZSB0byBza2lwIGFueSBibG9ja3MgdGhhdCBhcmUgbWFy
a2VkIGJhZCB3aGVuIHNlYXJjaGluZyBmb3IKPj4+Pj4+IHRoZQo+Pj4+Pj4gICAgIGJhZCBibG9j
ayB0YWJsZS4KPj4+Pj4+Cj4+Pj4+PiAgICAgT3RoZXJ3aXNlIGluIHZlcnkgcmFyZSBjYXNlcyB3
aGVyZSB0d28gQkJUIGJsb2NrcyB3ZWFyIG91dCBpdCBtaWdodAo+Pj4+Pj4gICAgIGhhcHBlbiB0
aGF0IGFuIG9ic29sZXRlIEJCVCBpcyB1c2VkIGluc3RlYWQgb2YgYSBuZXdlciBhdmFpbGFibGUK
Pj4+Pj4+ICAgICB2ZXJzaW9uLgo+Pj4+Pj4KPj4+Pj4+ICAgICBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPgo+Pj4+Pj4gICAgIFNpZ25l
ZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+Pj4+
PiAgICAgTGluazoKPj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIx
MDMyNTEwMjMzNy40ODExNzItMS1zLnJpZWRtdWVsbGVyQHBoeXRlYy5kZQo+Pj4+Pj4KPj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jCj4+Pj4+PiBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMKPj4+Pj4+IGluZGV4IGRjZWQzMmExMjZkOS4u
NmUyNWE1Y2U1YmE5IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9iYnQuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYwo+Pj4+
Pj4gQEAgLTUyNSw2ICs1MjUsNyBAQCBzdGF0aWMgaW50IHNlYXJjaF9iYnQoc3RydWN0IG5hbmRf
Y2hpcCAqdGhpcywKPj4+Pj4+IHVpbnQ4X3QKPj4+Pj4+ICpidWYsCj4+Pj4+PiAgewo+Pj4+Pj4g
ICAgICAgICB1NjQgdGFyZ2V0c2l6ZSA9IG5hbmRkZXZfdGFyZ2V0X3NpemUoJnRoaXMtPmJhc2Up
Owo+Pj4+Pj4gICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKHRoaXMp
Owo+Pj4+Pj4gKyAgICAgICBzdHJ1Y3QgbmFuZF9iYnRfZGVzY3IgKmJkID0gdGhpcy0+YmFkYmxv
Y2tfcGF0dGVybjsKPj4+Pj4+ICAgICAgICAgaW50IGksIGNoaXBzOwo+Pj4+Pj4gICAgICAgICBp
bnQgc3RhcnRibG9jaywgYmxvY2ssIGRpcjsKPj4+Pj4+ICAgICAgICAgaW50IHNjYW5sZW4gPSBt
dGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZTsKPj4+Pj4+IEBAIC01NjAsNiArNTYxLDEwIEBA
IHN0YXRpYyBpbnQgc2VhcmNoX2JidChzdHJ1Y3QgbmFuZF9jaGlwICp0aGlzLAo+Pj4+Pj4gdWlu
dDhfdAo+Pj4+Pj4gKmJ1ZiwKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBhY3Ri
bG9jayA9IHN0YXJ0YmxvY2sgKyBkaXIgKiBibG9jazsKPj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGxvZmZfdCBvZmZzID0gKGxvZmZfdClhY3RibG9jayA8PCB0aGlzLQo+Pj4+Pj4+IGJi
dF9lcmFzZV9zaGlmdDsKPj4+Pj4+Cj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAvKiBD
aGVjayBpZiBibG9jayBpcyBtYXJrZWQgYmFkICovCj4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoc2Nhbl9ibG9ja19mYXN0KHRoaXMsIGJkLCBvZmZzLCBidWYpKQo+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+Pj4+ICsKPj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIFJlYWQgZmlyc3QgcGFnZSAqLwo+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgc2Nhbl9yZWFkKHRoaXMsIGJ1Ziwgb2ZmcywgbXRkLT53cml0ZXNp
emUsIHRkKTsKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghY2hlY2tfcGF0dGVy
bihidWYsIHNjYW5sZW4sIG10ZC0+d3JpdGVzaXplLAo+Pj4+Pj4gdGQpKSB7Cj4+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+IE1pcXXDqGwKPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBN
aXF1w6hsCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
