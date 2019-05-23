Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C858C282E1
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 19:16:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E28621841
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 19:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s29RcKXJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E28621841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTjmMTgPL/+110E5hUcsON+oyLwX01M9Y3dRzdTcC18=; b=s29RcKXJSPTxka
	f+Qd6s0tnKG0aeKGo2Gy30guZ07GKjZ6mlHaOjhf8XreSMrE/3ZOA0uyc6PjXfQXMAC8nMBHorZ/z
	tzccwbzcvbl/j6QOv+mDGNHtMdIw2hJdf7iEDduhxQHoAlFYjSYPHw7pocvUxW7g96Mj07o1yb7Os
	MfjV6QBUp9z0jOmqT2lzZF1f6xiiXo98fkzu0FW0+LskEWdIcLzNaGvofeESyRTiuxqEk26pl0T9w
	kLn3NqzxFbu8neHzVNeOHDZbmb1b4t+an7NAKinaoR+gc+OEybYs1ygKmLvvGRQNpwKZoMwae9NaH
	vmzv3rtz00SJlGcjsKAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTtCL-0001Zr-0y; Thu, 23 May 2019 19:16:17 +0000
Received: from gateway23.websitewelcome.com ([192.185.47.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTtCI-0001ZV-Ay
 for linux-mtd@lists.infradead.org; Thu, 23 May 2019 19:16:15 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id B6A1C564C
 for <linux-mtd@lists.infradead.org>; Thu, 23 May 2019 14:16:11 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id TtCEhvnZo4FKpTtCEhI9fe; Thu, 23 May 2019 14:16:11 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=55194 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hTtCB-0043Zg-MW; Thu, 23 May 2019 14:16:07 -0500
Date: Thu, 23 May 2019 14:16:06 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2] mtd: onenand_base: Avoid fall-through warnings
Message-ID: <20190523191606.GA9838@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hTtCB-0043Zg-MW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:55194
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_121614_458201_C1F15CDA 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tk9USUNFIFRIQVQ6CgoiLi4ud2UgZG9uJ3Qga25vdyB3aGV0aGVyIHdlIG5lZWQgZmFsbHRocm91
Z2hzIG9yIGJyZWFrcyBoZXJlIGFuZCB0aGlzCmlzIGp1c3QgYSBjaGFuZ2UgdG8gYXZvaWQgaGF2
aW5nIG5ldyB3YXJuaW5ncyB3aGVuIHN3aXRjaGluZyB0bwotV2ltcGxpY2l0LWZhbGx0aHJvdWdo
IGJ1dCB0aGlzIGNoYW5nZSBtaWdodCBiZSBlbnRpcmVseSB3cm9uZy4iWzFdCgpTZWUgdGhlIG9y
aWdpbmFsIHRocmVhZCBvZiBkaXNjdXNzaW9uIGhlcmU6CgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9wYXRjaHdvcmsvcGF0Y2gvMTAzNjI1MS8KClNvLCBpbiBwcmVwYXJhdGlvbiB0byBlbmFibGlu
ZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCB0aGlzIHBhdGNoIHNpbGVuY2VzCnRoZSBmb2xsb3dp
bmcgd2FybmluZ3M6Cgpkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6IElu
IGZ1bmN0aW9uIOKAmG9uZW5hbmRfY2hlY2tfZmVhdHVyZXPigJk6CmRyaXZlcnMvbXRkL25hbmQv
b25lbmFuZC9vbmVuYW5kX2Jhc2UuYzozMjY0OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1h
eSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBpZiAoT05FTkFORF9J
U19ERFAodGhpcykpCiAgICAgIF4KZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFz
ZS5jOjMyODQ6Mjogbm90ZTogaGVyZQogIGNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6
CiAgXn5+fgpkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI4ODoxNzog
d2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD1dCiAgIHRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNfVU5MT0NLX0FMTDsKZHJp
dmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOjMyOTA6Mjogbm90ZTogaGVyZQog
IGNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8xR2I6CiAgXn5+fgoKV2FybmluZyBsZXZlbCAz
IHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKCkFsc28sIG5vdGljZSB0aGF0IHRo
aXMgcGF0Y2ggZG9lc24ndCBjaGFuZ2UgYW55IGZ1bmN0aW9uYWxpdHkuIFNlZSB0aGUKbW9zdCBy
ZWNlbnQgdGhyZWFkIG9mIGRpc2N1c3Npb24gaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3BhdGNod29yay9wYXRjaC8xMDc3Mzk1LwoKVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdv
aW5nIGVmZm9ydHMgdG8gZW5hYmxlCi1XaW1wbGljaXQtZmFsbHRocm91Z2guCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDUwOTA4NTMxOC4zNGE5ZDRiZUB4cHMxMy8KCkNj
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpTdWdnZXN0ZWQtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ClN1Z2dlc3Rl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IEd1
c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQpDaGFuZ2VzIGlu
IHYyOgogLSBBZGQgYnJlYWtzIGluc3RlYWQgb2YgZmFsbC10aHJvdWdoIG1hcmtpbmdzIHdpdGhv
dXQgYWx0ZXJpbmcgYW55CiAgIGZ1bmN0aW9uYWxpdHkuCiAtIFVwZGF0ZSBjaGFuZ2Vsb2cgdGV4
dC4KCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmMgfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVu
YW5kX2Jhc2UuYwppbmRleCBmNDFkNzYyNDg1NTAuLmZkMGRhNWMzNDdkYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCisrKyBiL2RyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwpAQCAtMzI4MCwxMiArMzI4MCwxNSBAQCBzdGF0
aWMgdm9pZCBvbmVuYW5kX2NoZWNrX2ZlYXR1cmVzKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQkJ
aWYgKCh0aGlzLT52ZXJzaW9uX2lkICYgMHhmKSA9PSAweGUpCiAJCQkJdGhpcy0+b3B0aW9ucyB8
PSBPTkVOQU5EX0hBU19OT1BfMTsKIAkJfQorCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFT
X1VOTE9DS19BTEw7CisJCWJyZWFrOwogCiAJY2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzJH
YjoKIAkJLyogMkdiIEREUCBkb2VzIG5vdCBoYXZlIDIgcGxhbmUgKi8KIAkJaWYgKCFPTkVOQU5E
X0lTX0REUCh0aGlzKSkKIAkJCXRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNfMlBMQU5FOwog
CQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX1VOTE9DS19BTEw7CisJCWJyZWFrOwogCiAJ
Y2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzFHYjoKIAkJLyogQS1EaWUgaGFzIGFsbCBibG9j
ayB1bmxvY2sgKi8KLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
