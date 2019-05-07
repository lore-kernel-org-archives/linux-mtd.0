Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BC3C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6144E205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e1qvZMvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6144E205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8wrZ39bRIPu7YRmtFDbrqkDOpCWx3qOV8z/pdz0ozc=; b=e1qvZMvRSuXD9v
	EdKzF5LrzzCvHseLi5orEjsKI85tGxuLJj0zrpuipundOOYTxaHsSOc/szxjGOyLIsw2DghXuHsVk
	Gayv4WDn/YaiGkheBhaAXxg4980/sF4nWKS2YAs3wShujklWkrRUooQ21aLoi+9o+ALiu7K8N9F9o
	nQkwbRBxCUluWZvkFo4HpvftzNEraIHm2SSsPO7EDlYrCEZSNJyKYFgsajsKnI4DxqF1wCHdkh+AI
	iFsFJ0oS2TUpl6ES+HvpnXXxy3gBB5s8OvRJly0Fb8OgWtF878xoo70Z6FStllapwFhry1e5Jg+Vk
	V6ilijN57aiZhn9M84EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2VN-00083x-Gs; Tue, 07 May 2019 15:59:45 +0000
Received: from gateway32.websitewelcome.com ([192.185.145.108])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2VK-00083d-GT
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 15:59:44 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 69CED2E14E
 for <linux-mtd@lists.infradead.org>; Tue,  7 May 2019 10:59:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id O2VIhPGsG90onO2VIhWSFb; Tue, 07 May 2019 10:59:40 -0500
X-Authority-Reason: nr=8
Received: from [189.250.119.7] (port=38980 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hO2VH-003XnA-Nl; Tue, 07 May 2019 10:59:39 -0500
To: Richard Weinberger <richard@nod.at>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
 <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
 <20190415104458.7faeec57@xps13>
 <ee1f8c4a-92b0-db9d-6110-3acadeb9e457@embeddedor.com>
 <20190416192408.0e321563@xps13>
 <8df20a3a-3068-1fb7-0421-e6c417550125@embeddedor.com>
 <3034821c-3cd0-b0c5-a6fd-548fd87486a4@embeddedor.com>
 <785015370.48464.1557244145722.JavaMail.zimbra@nod.at>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Message-ID: <cf70787e-5c3a-d639-1025-7fa15d935732@embeddedor.com>
Date: Tue, 7 May 2019 10:59:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <785015370.48464.1557244145722.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.119.7
X-Source-L: No
X-Exim-ID: 1hO2VH-003XnA-Nl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.119.7]:38980
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_085942_631485_9BC8C13A 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Kees Cook <keescook@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzcvMTkgMTA6NDkgQU0sIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKCj4+IEhpIGFs
bCwKPj4KPj4gVGhhbmtzIGEgbG90IGZvciB0aGlzLCBSaWNoYXJkOgo+Pgo+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0L2xvZy8/
aD1tdGQlMkZuZXh0JnF0PWdyZXAmcT1mYWxsLXRocm91Z2gKPj4KPj4gVGhlcmUgYXJlIG9ubHkg
dHdvIG9mIHRoZXNlIHdhcm5pbmdzIGxlZnQgdG8gYmUgYWRkcmVzc2VkIGluCj4+IE1URFsxXToK
Pj4KPj4gICAgICAgID4gQEAgLTMyODAsMTIgKzMyODAsMTQgQEAgc3RhdGljIHZvaWQgb25lbmFu
ZF9jaGVja19mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPj4gICAgICAgID4gICAgICAg
ICAgICAgICAgICAgICAgIGlmICgodGhpcy0+dmVyc2lvbl9pZCAmIDB4ZikgPT0gMHhlKQo+PiAg
ICAgICAgPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aGlzLT5vcHRpb25zIHw9IE9O
RU5BTkRfSEFTX05PUF8xOwo+PiAgICAgICAgPiAgICAgICAgICAgICAgIH0KPj4gICAgICAgID4g
KyAgICAgICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPj4gICAgICAgID4KPj4gICAgICAgID4g
ICAgICAgY2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzJHYjoKPj4gICAgICAgID4gICAgICAg
ICAgICAgICAvKiAyR2IgRERQIGRvZXMgbm90IGhhdmUgMiBwbGFuZSAqLwo+PiAgICAgICAgPiAg
ICAgICAgICAgICAgIGlmICghT05FTkFORF9JU19ERFAodGhpcykpCj4+ICAgICAgICA+ICAgICAg
ICAgICAgICAgICAgICAgICB0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTXzJQTEFORTsKPj4g
ICAgICAgID4gICAgICAgICAgICAgICB0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX1VOTE9D
S19BTEw7Cj4+ICAgICAgICA+ICsgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4+Cj4+
ICAgICAgICBUaGlzIGxvb2tzIHN0cmFuZ2UuCj4+Cj4+ICAgICAgICBJbiBPTkVOQU5EX0RFVklD
RV9ERU5TSVRZXzJHYjoKPj4gICAgICAgIE9ORU5BTkRfSEFTX1VOTE9DS19BTEwgaXMgc2V0IHVu
Y29uZGl0aW9uYWxseS4KPj4KPj4gICAgICAgIEJ1dCB0aGVuLCB1bmRlciBPTkVOQU5EX0RFVklD
RV9ERU5TSVRZXzFHYiwgdGhlIHNhbWUgb3B0aW9uIGlzIHNldCBvbmx5Cj4+ICAgICAgICBpZiBw
cm9jZXNzIGlzIGV2YWx1YXRlZCB0byB0cnVlLgo+Pgo+PiAgICAgICAgU2FtZSBwcm9ibGVtIHdp
dGggT05FTkFORF9IQVNfMlBMQU5FOgo+PiAgICAgICAgLSBpdCBpcyBzZXQgaW4gT05FTkFORF9E
RVZJQ0VfREVOU0lUWV80R2Igb25seSBpZiBPTkVOQU5EX0lTX0REUCgpCj4+ICAgICAgICAtIGl0
IGlzIHVuc2V0IGluIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMkdiIG9ubHkgaWYgIU9ORU5BTkRf
SVNfRERQKCkKPj4KPj4gICAgICAgIE1heWJlIHRoaXMgcG9ydGlvbiBzaG91bGQgYmUgcmV3b3Jr
ZWQgYmVjYXVzZSBJIGFtIHVuc3VyZSBpZiB0aGlzIGlzIGEKPj4gICAgICAgIG1pc3NpbmcgZmFs
bCB0aHJvdWdoIG9yIGEgYnVnLgo+Pgo+Pgo+PiBUaGFua3MKPj4gLS0KPj4gR3VzdGF2bwo+Pgo+
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEwMzYyNTEvCj4g
Cj4gRGlkIHdlIG1pc3MgdGhpcyBwYXRjaD8gQUZBSUNUIGl0IGlzIGluIC1uZXh0IHRvby4KPiAK
CldoYXQgaXMgcGVuZGluZyB0byBiZSByZXNvbHZlZCBhcmUgdGhlc2Ugd2FybmluZ3M6Cgpkcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6IEluIGZ1bmN0aW9uIOKAmG9uZW5h
bmRfY2hlY2tfZmVhdHVyZXPigJk6CmRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jh
c2UuYzozMjY0OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1X
aW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBpZiAoT05FTkFORF9JU19ERFAodGhpcykpCiAgICAg
IF4KZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOjMyODQ6Mjogbm90ZTog
aGVyZQogIGNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6CiAgXn5+fgpkcml2ZXJzL210
ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI4ODoxNzogd2FybmluZzogdGhpcyBzdGF0
ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIHRoaXMt
Pm9wdGlvbnMgfD0gT05FTkFORF9IQVNfVU5MT0NLX0FMTDsKZHJpdmVycy9tdGQvbmFuZC9vbmVu
YW5kL29uZW5hbmRfYmFzZS5jOjMyOTA6Mjogbm90ZTogaGVyZQogIGNhc2UgT05FTkFORF9ERVZJ
Q0VfREVOU0lUWV8xR2I6CiAgXn5+fgoKVGhlIGZpbmFsIHZlcnNpb24gb2YgdGhlIHBhdGNoIGlu
IC1uZXh0IGRvZXMgbm90IGFkZHJlc3MgdGhlbS4KClRoYW5rcwotLQpHdXN0YXZvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
