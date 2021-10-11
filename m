Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D5BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 07:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DB160F3A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 07:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95DB160F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yp0bBt7fCZJuzXvpeYfNaPhL5ndnRZh0O3hzgRIOLZI=; b=mwshe4abh8fOnLnLacGOzPjR6K
	c0RoaU2HIe2qKHjbpzOiAiORx2aprV/q7VkXxvKx0yGnsoY5NOyPCOLnQamtvBq1fsA+/SZX7fGVm
	E0JCyz5Jigv19HBes2lXueyQszZk0Y81T3vA0vkrb4mo/9yvNiM2O4jBpKHx8CswPbphxyzJunFkw
	QFwWMLmbOeZxURiOR6E4OBb7CLITz8LXfCQpbgOgmJRTYiV/CVCsHSbB/ptU/FF6QJaDR1TTSac7C
	7CEKUwt+Rjl6pxQInayY3rY+/M3oyPmL5Zsa2jdMKkTkM/B/txvXYcyliNs7cI6A8RlHVH3buHk5G
	fh3CFX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZpMY-0082AZ-Tl; Mon, 11 Oct 2021 07:04:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZpLk-0081fo-Pe
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 07:03:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F43461074;
 Mon, 11 Oct 2021 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633935832;
 bh=LO3lJPfriqc1V81Pj+EgxCPgaz8IAMTHZRso2RCz3xU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EBv7WvHTp3KmMnBQHeLmxkHZlKqyHwL3UUV8nDlBHiwGkW98INtLvw2H8s+6/VywB
 o2AW/RDjkXHuO0Q7/0Bvx5GIiS+YLSHMt565C3sHZtZWI4Kt4y7YhBwnp1pgSHtsCj
 1vVGn1XwqD9VxUb0dgQgeB/8ecPheXQ6qPHiyp0t+WscYQGj9C5WDi9kW7V5cWsdMu
 UMgjGG8hMmIyqYC0C+NQ95IpCRyABG0c3c9CaOycNIZap+c3Bs26TGwRAgBPovevud
 8+D3g0Uw/wW6rM39WMgMeFlvESZLoLlouyng68+ziEFqig/IHJvTLtoTNvUpLX3yDp
 gTEugByM8No2A==
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com, nsekhar@ti.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
 <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
 <YWPRbmaJQN85wRIO@atomide.com>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <f2125e81-07da-92ea-899a-d06ecae1919f@kernel.org>
Date: Mon, 11 Oct 2021 10:03:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWPRbmaJQN85wRIO@atomide.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_000352_894265_16C7C79B 
X-CRM114-Status: GOOD (  10.34  )
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

SGkgVG9ueSwKCk9uIDExLzEwLzIwMjEgMDg6NTMsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cj4gKiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+IFsy
MTEwMDkgMTQ6NTZdOgo+PiBPbiAwOC8xMC8yMDIxIDIxOjEwLCBSb2dlciBRdWFkcm9zIHdyb3Rl
Ogo+Pj4gS3J6eXN6dG9mLAo+Pj4KPj4+IE9uIDA3LzEwLzIwMjEgMjA6MzcsIEtyenlzenRvZiBL
b3psb3dza2kgd3JvdGU6Cj4+Pj4gT24gMDcvMTAvMjAyMSAxNDowOCwgUm9nZXIgUXVhZHJvcyB3
cm90ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IFRoaXMgc2VyaWVzIGNvbnZlcnRzIHRpLGdwbWMg
bWVtb3J5IGNvbnRyb2xsZXIgYW5kIHRpLGdwbWMtbmFuZCBhbmQKPj4+Pj4gdGksZ3BtYy1vbmVu
YW5kIE1URCBjb250cm9sbGVyIGJpbmRpbmdzIHRvIHlhbWwuCj4+Pj4+Cj4+Pj4+IGNoZWVycywK
Pj4+Pj4gLXJvZ2VyCj4+Pj4+Cj4+Pj4KPj4+PiBIaSwKPj4+Pgo+Pj4+IEFsdGhvdWdoIHlvdSBk
aWQgbm90IG1lbnRpb24gaXQgaGVyZSwgaXQgbG9va3MgbGlrZSB5b3UgaGF2ZSBzb21lCj4+Pj4g
ZGVwZW5kZW5jaWVzIGJldHdlZW4gdGhlIHBhdGNoZXMuIE1heWJlIHRoaXMgc2hhbGwgZ28gc2lt
cGx5IHZpYSBSb2IncyB0cmVlPwo+Pj4+Cj4+Pgo+Pj4gUm9iIGhhcyBhY2tlZCBhbGwgdGhlIERU
IGJpbmRpbmcgcGF0Y2hlcy4KPj4+IFNvIGl0IGlzIHVwdG8geW91IGFuZCBNaXF1w6hsIHRvIGRl
Y2lkZSB0aGUgYmVzdCB3YXkuIE1URCB0cmVlIG9yIE1lbW9yeSBjb250cm9sbGVyIHRyZWUKPj4+
IGZvciB0aGUgZHQtYmluZGluZ3MgcGF0Y2hlcy4KPj4+Cj4+PiBUaGUgQVJNOiBkdHMgY2hhbmdl
cyBzaG91bGQgZ28gdmlhIFRvbnkncyBPTUFQIFNvQyB0cmVlLgo+Pj4KPj4+IE9yIGlmIFRvbnkg
aXMgT0sgd2l0aCBpdCB0aGVuIG1heWJlIGFsbCBwYXRjaGVzIGNhbiBnbyB2aWEgVG9ueSdzIHRy
ZWU/IDopCj4+Pgo+Pgo+Pgo+PiBJIHJldmlld2VkIHRoZSB0d28gbWVtb3J5LWNvbnRyb2xsZXIg
cGF0Y2hlcywgc28gZmVlbCBmcmVlIHRvIHRha2UgdGhlbQo+PiB2aWEgTVREIG9yIE9NQVAgU29D
Lgo+IAo+IFNvdW5kcyBsaWtlIEkgc2hvdWxkIHBpY2sgdXAgdGhlc2UgYmVjYXVzZSBvZiB0aGUg
ZHRzIGNoYW5nZXMuCgpUaGVyZSBpcyBubyBkZXBlbmRlbmN5IHdpdGggdGhlIGR0cyBwYXRjaGVz
IGJ1dCBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY2FuIHBpY2sgdGhlbSBhbGwgdXAuClRoYW5r
cyEKCmNoZWVycywKLXJvZ2VyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
