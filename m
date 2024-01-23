Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A84AC47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbXVoU0X6KaiWuaylMiXCDv4lssUzLzydImtUwEiKnM=; b=plIa83ZngeBDIR
	U+Vkgx0o0pJQJsa6T9Gsikaf6tco5YfYeVmgKfRExi+pwuVC6EXNo+zc7uDSdyW51reaJJr9gNU0X
	JrTxYY/4fH+2wpZ834xmiolu/XKsBlBE9+nh51mc6nupuX7Jf2iUWMH8hthZfIdYY/x7STc5QYWvc
	UvagnmfXTYd/cIhY7/MiaVkXbdmL/qkWU6wf9d/Nm8BDYUYYeLDP4QWFQEizzwMpiXV1lH+P8szOE
	ITJP/TOndE5tWfIBUQ6LtFY6SMoXPADjtdpXP5+pj3tlNFmBdAxwwwR6sKoeAZT1N0TINiDexG7sg
	UcQsK/+/jmRlaEQWBNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSHev-00GnEz-1c;
	Tue, 23 Jan 2024 14:21:49 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSHel-00Gn8Z-0e
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 14:21:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id F2C013200A04;
	Tue, 23 Jan 2024 09:21:36 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 23 Jan 2024 09:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1706019696;
	 x=1706106096; bh=Wb2LadyDq3EncKOixdkKXF1xf+5ToI114DbbSpnU1nY=; b=
	PKayuLNrs/RNOnY9Pm3PTRTDtc1BuvHxlCD7DuFwY3X2d3w/3n1RTZ9LkQQmom3/
	w6idujhcC4sf3BbCM5+B3rKAeN6o49DZxzKkXiUHhjhwBc48BWX6QQG9FBbGrESz
	dY9isiD4klmX7hDZxIpR0XAo9bx2f3HmXbcXHrgnWu377wYBVGHNDJeydLYODUm3
	R2v4IQChjpBjq1THZkrhojBT62tPQZhhhJX7vhM3GS1LAQ5MUjk8AsVhFsBFrQgH
	doe9VBd2+6WHeaR4G96Yes5cYzvayqaI2fWvhDYf/ZZHo1Zb7cz6wduRTcnHpKrW
	6kE0Ci1RccWeYTA5fc/t/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706019696; x=
	1706106096; bh=Wb2LadyDq3EncKOixdkKXF1xf+5ToI114DbbSpnU1nY=; b=i
	aeyMu9IQJm8viLVFcRG2+AfApl0inhRKl32d9bxe+ynOLxLBL2s/6xnBdR+sart7
	wAZAjiA4uL/DTaIWBboS2/YhhyDMgMYyxOQ4f604bM7uJzQt+e/9izTFd+xJifVo
	xQ50WHbYZD/V2ZAwYra6Pek4hm9CLQF0AsKq4BVdceSEFeVHgMY+a42IjHl2qdAC
	3tidNdDH6brWPgcA3qtQ97S9I8mHpThso03DUhwzCMsTMvIaulq1IZgWkWvjI17h
	qB/abhBsPAnPQnf0Ws70h0wwPbXzEqjR98NOYls5N0AIzgYtr4Y02V+Cwfh6GpX1
	RL81i2NKrtG69Wlsq/MXA==
X-ME-Sender: <xms:b8uvZZutZyYhjvm11xsbDHd-yctTohxrZ96EclPn7v7Uk295CAYxIA>
    <xme:b8uvZSdJ-DzXvh4tLWbWKsloyBAkMqIGhWu0zDscTRdh84QtuWV6_vntH6OGKUGWc
    o9tQr6gGnuPR811080>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:b8uvZcyHxEDFbucCwS_wdJTB7xZCjv4VpoI1kQNX4uuVdNYjj6sBQw>
    <xmx:b8uvZQOGooI-lZsO5yozfuK-_cjQpfLDCPfU0iE3UrR2Mn2j9dL4qQ>
    <xmx:b8uvZZ-FoQRRZFNwPBfm4zrKoG5PrhcOqTLtRYQnZkkS4F1E545I9g>
    <xmx:cMuvZdVu3pmkvuhw0wgTNHs20QG_zyCJ2SI5aNTi4b7I7-93_VGCkA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C023DB6008D; Tue, 23 Jan 2024 09:21:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
In-Reply-To: <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
References: <CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com>
 <20240123111235.3097079-1-geert@linux-m68k.org>
 <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
Date: Tue, 23 Jan 2024 15:21:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 linux-hardening@vger.kernel.org, qat-linux@intel.com,
 linux-crypto@vger.kernel.org,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 Netdev <netdev@vger.kernel.org>
Subject: Re: Build regressions/improvements in v6.8-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_062139_287003_FCBF5F0A 
X-CRM114-Status: GOOD (  12.43  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQsIGF0IDEyOjQ1LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cgo+PiA2OCBlcnJvciByZWdyZXNzaW9uczoKPgo+PiAgKyAva2lzc2tiL3NyYy9hcmNoL3Bvd2Vy
cGMvc3lzZGV2L3VkYmdfbWVtY29ucy5jOiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciAnbWVtY29uc19nZXRjJyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdOiAgPT4gODA6NQo+
PiAgKyAva2lzc2tiL3NyYy9hcmNoL3Bvd2VycGMvc3lzZGV2L3VkYmdfbWVtY29ucy5jOiBlcnJv
cjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnbWVtY29uc19nZXRjX3BvbGwnIFstV2Vycm9y
PW1pc3NpbmctcHJvdG90eXBlc106ICA9PiA1Nzo1Cj4+ICArIC9raXNza2Ivc3JjL2FyY2gvcG93
ZXJwYy9zeXNkZXYvdWRiZ19tZW1jb25zLmM6IGVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yICdtZW1jb25zX3B1dGMnIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc106ICA9PiA0NDo2
Cj4KPiBwb3dlcnBjLWdjY3s1LDEyLDEzfS9wcGM2NF9ib29rM2VfYWxsbW9kY29uZmlnCgpJIG5v
dyBzZW50IHBhdGNoZXMgZm9yIHBvd2VycGMgYm9va2Ugd2FybmluZ3MKCj4+ICArIC9raXNza2Iv
c3JjL2FyY2gvc2gva2VybmVsL2NwdS9pbml0LmM6IGVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yICdsMl9jYWNoZV9pbml0JyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdOiAgPT4g
OTk6MjkKPgo+IHNoNC1nY2MxWzEyM10vc2U3ezYxOSw3NTB9X2RlZmNvbmZpZwo+IHNoNC1nY2Mx
WzEyM10vc2gte2FsbHttb2Qsbm8seWVzfSxkZWZ9Y29uZmlnCj4gc2g0LWdjYzExL3NoLWFsbG5v
Y29uZmlnCgpJIGFzc3VtZSB0aGUgc2ggbWFpbnRhaW5lcnMgd2lsbCBldmVudHVhbGx5IGdldCB0
byB0aGF0Cgo+PiAgKyAva2lzc2tiL3NyYy9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2Zsb3BweV82
NC5oOiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnc3BhcmNfZmxvcHB5X2lycScg
Wy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXTogID0+IDIwMDoxMwo+PiAgKyAva2lzc2tiL3Ny
Yy9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2Zsb3BweV82NC5oOiBlcnJvcjogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciAnc3VuX3BjaV9mZF9kbWFfY2FsbGJhY2snIFstV2Vycm9yPW1pc3Npbmct
cHJvdG90eXBlc106ICA9PiA0Mzc6Ngo+Cj4gc3BhcmM2NC1nY2N7NSwxMSwxMiwxM30vc3BhcmM2
NC1hbGxtb2Rjb25maWcKCkFuZHJldyBNb3J0b24gZGlkIGEgcGF0Y2ggZm9yIHRoZSBzcGFyYyB3
YXJuaW5ncywgYW5kIEFuZHJlYXMgTGFyc3NvbgppcyBqb2luaW5nIGFzIGEgbWFpbnRhaW5lciwg
c28gaG9wZWZ1bGx5IGhlIGNhbiBwaWNrIHRoYXQgdXAgc29vbi4KPiBzcGFyYzY0LWdjY3s1LDFb
MTIzXX0vc3BhcmM2NC1hbGxtb2Rjb25maWcKPgo+PiAgKyAva2lzc2tiL3NyYy9hcmNoL3NwYXJj
L3Zkc28vdmNsb2NrX2dldHRpbWUuYzogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
J19fdmRzb19jbG9ja19nZXR0aW1lJyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdOiAgPT4g
MjU0OjEKPj4gICsgL2tpc3NrYi9zcmMvYXJjaC9zcGFyYy92ZHNvL3ZjbG9ja19nZXR0aW1lLmM6
IGVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdfX3Zkc29fY2xvY2tfZ2V0dGltZV9z
dGljaycgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXTogID0+IDI4MjoxCj4+ICArIC9raXNz
a2Ivc3JjL2FyY2gvc3BhcmMvdmRzby92Y2xvY2tfZ2V0dGltZS5jOiBlcnJvcjogbm8gcHJldmlv
dXMgcHJvdG90eXBlIAoKVGhlcmUgYXJlIHByb3RvdHlwZXMgaW4gaW5jbHVkZS92ZHNvL2dldHRp
bWUuaCB0aGF0IHNob3VsZCBiZQp1c2VkIGhlcmUsIGJ1dCB1bmZvcnR1bmF0ZWx5IHRoZSBzcGFy
YyBpbXBsZW1lbnRhdGlvbiBkb2VzCm5vdCBtYXRjaCB0aGUgcHJvdG90eXBlcyBiZWNhdXNlIHNw
YXJjIGlzIG1pc3NpbmcgdGhlIGdldHRpbWU2NApzdXBwb3J0LgoKPiBzcGFyYzY0LWdjY3s1LDEy
LDEzfS9zcGFyYzY0LXthbGxubyxkZWZ9Y29uZmlnCj4gc3BhcmM2NC1nY2MxMS9zcGFyYzY0LXth
bGx7bW9kLG5vfSxkZWZ9Y29uZmlnCj4KPj4gICsgL2tpc3NrYi9zcmMvYXJjaC94ODYvdW0vc2hh
cmVkL3N5c2RlcC9rZXJuZWwtb2Zmc2V0cy5oOiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBl
IGZvciDigJhmb2/igJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXTogID0+IDk6Ngo+Cj4g
dW0teDg2XzY0LWdjYzEyL3VtLXthbGx7bW9kLHllc30sZGVmfWNvbmZpZwoKSSBtYWRlIGEgcGF0
Y2ggZm9yIGFyY2gvdW0geWVzdGVyZGF5LgoKPiBzcGFyYzY0LWdjYzFbMTJdL3NwYXJjNjQtYWxs
bW9kY29uZmlnCj4KPj4gICsgL2tpc3NrYi9zcmMvZHJpdmVycy9zY3NpL21waTNtci9tcGkzbXJf
dHJhbnNwb3J0LmM6IGVycm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiAxNjgwIGJ5dGVzIGlzIGxhcmdl
ciB0aGFuIDE1MzYgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDE4MTg6
MQoKSSBzZW50IGEgcGF0Y2ggaW4gTm92ZW1iZXIgd2hlbiB0aGUgcmVncmVzc2lvbiBzdGFydGVk
LCBtaXNzZWQKdGhlIHJlcGx5IGFib3V0IG5lZWRpbmcgYW5vdGhlciBjaGFuZ2UKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL0NBRmRWdk94SDRVUWp3dzQxMjRFMnR0dVRna256a0hvUHhWU0ZP
UWdMZm9WX2RrQU53UUBtYWlsLmdtYWlsLmNvbS8KCj4+ICArIHtzdGFuZGFyZCBpbnB1dH06IEVy
cm9yOiBkaXNwbGFjZW1lbnQgdG8gdW5kZWZpbmVkIHN5bWJvbCAuTDEwNSBvdmVyZmxvd3MgOC1i
aXQgZmllbGQgOiAgPT4gNTkwLCA1OTMKPj4gICsge3N0YW5kYXJkIGlucHV0fTogRXJyb3I6IGRp
c3BsYWNlbWVudCB0byB1bmRlZmluZWQgc3ltYm9sIC5MMTM1IG92ZXJmbG93cyA4LWJpdCBmaWVs
ZCA6ICA9PiA2MDMKPj4gICsge3N0YW5kYXJkIGlucHV0fTogRXJyb3I6IGRpc3BsYWNlbWVudCB0
byB1bmRlZmluZWQgc3ltYm9sIC5MMTQwIG92ZXJmbG93cyA4LWJpdCBmaWVsZCA6ICA9PiA2MDYK
Pj4gICsge3N0YW5kYXJkIGlucHV0fTogRXJyb3I6IGRpc3BsYWNlbWVudCB0byB1bmRlZmluZWQg
c3ltYm9sIC5MNzYgb3ZlcmZsb3dzIDEyLWJpdCBmaWVsZDogID0+IDU5MSwgNTk0Cj4+ICArIHtz
dGFuZGFyZCBpbnB1dH06IEVycm9yOiBkaXNwbGFjZW1lbnQgdG8gdW5kZWZpbmVkIHN5bWJvbCAu
TDc3IG92ZXJmbG93cyA4LWJpdCBmaWVsZCA6IDYwNyA9PiA2MDcsIDU4MiwgNTg1Cj4+ICArIHtz
dGFuZGFyZCBpbnB1dH06IEVycm9yOiBkaXNwbGFjZW1lbnQgdG8gdW5kZWZpbmVkIHN5bWJvbCAu
TDk3IG92ZXJmbG93cyAxMi1iaXQgZmllbGQ6ICA9PiA2MDcKPj4gICsge3N0YW5kYXJkIGlucHV0
fTogRXJyb3I6IHBjcmVsIHRvbyBmYXI6IDYwNCwgNTkwLCA1NzcsIDU5MywgNTcyLCA1NjksIDU5
OCwgNTk5LCA1OTYsIDYxMCA9PiA2MTAsIDU3NCwgNTk5LCA1NjksIDU5OCwgNTk2LCA2MDEsIDU5
MCwgNjA0LCA1OTUsIDU3MiwgNTc3LCA1OTMKPgo+IFNIIElDRSBjcmlja2V0cwoKTGludXMgZGlk
IGEgcGF0Y2ggZm9yIHRoZSBzeXNjYWxsLCBhbmQgSSBzZW50IGFub3RoZXIgb25lIGZvcgphcmNo
L3NoIHRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmluZyBhZ2FpbjoKCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9DQUhrLT13amg2Q3lwbzhXQy1NY1hnU3pDYW91M1VYY2N4Qis3UFZlU3VH
UjhBakNwaGdAbWFpbC5nbWFpbC5jb20vCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8wN2Q4
ODc3Yi1kOTMzLTQ2ZjQtOGNhNC1jMTBlZDYwMmYzN2VAYXBwLmZhc3RtYWlsLmNvbS8KClJlc2Vu
dCBtaW5lIG5vdy4KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
