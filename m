Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2527BC5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB70214D8
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IElHRoyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB70214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/yfgjTS3srpx/tRkWSlTPP60aSms+LlUhgqZxjHl5ng=; b=IElHRoyxrvew6lUGjRQh7T/VEO
	Hbr20hsgiNUh4h3hnlmDLycI87QPBMPxGHioHQH3cIAujoNRWCzoa5mY2hB8Sd+KRVGVx1Yn/JHNk
	H9nzHikZQ0MGH+hrwCQsUg/ciD3yxzuWduG8uAjZ4YFwuCYnmwHN7fWmFdEOI+c2bTxZJ/h7pvjkg
	kUrF8/Ulc2oBlfJojstEe8kkF3MqoVXvsRoO0zv0AT8Kaw3pv4QotiFN/llMhSW3a/6khsAILXmGO
	zmBErkwDo4yd6rRzOJ7Id4YGYnC2u9epQWA54U410oCUPRYcwk4j4Re9ZCFIwNa7kFGHMiKChAFPs
	NJm2qlPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSeGU-0003e1-VK; Thu, 07 Nov 2019 09:39:42 +0000
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSeGQ-0003co-Tv
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 09:39:41 +0000
Received: from qwerfdsa-5.local ([90.145.166.163])
 by smtp-cloud7.xs4all.net with ESMTPA
 id SeGDikAprPMT8SeGFiJDRA; Thu, 07 Nov 2019 10:39:27 +0100
To: linux-mtd@lists.infradead.org
From: Willem <itsme@xs4all.nl>
Subject: [PATCH] mtd-www: FAQ note about user-space tools
Openpgp: preference=signencrypt
Autocrypt: addr=itsme@xs4all.nl; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dd66d7fd-cd10-d8f5-b54a-17647d32a81a@xs4all.nl>
Date: Thu, 7 Nov 2019 10:39:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B825A3468F1E00A60192127D"
Content-Language: en-US
X-CMAE-Envelope: MS4wfONGJyKLOsu3zAWn4WZNS56vYkuscse8WaKTnRAnIlarGrK8+5dnthGAd3XYQl58xmdEupDxcpZm6Iat37ML36O2hYNu17OQ30purh1djnyJDUQ1VbC/
 cdRuKBu7tESYkxVl1CcUCUNSUAmYiyAT62wI234OyyJTjKsqh4Ub896wdJZCFBHtYAMACSfKeqDTOA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_013939_128371_6EA73714 
X-CRM114-Status: UNSURE (   8.14  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------B825A3468F1E00A60192127D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

the attached patch contains an update to the mtd-www ubifs faq:

 * Mention user-space tools for unwrapping UBI and UBIFS images.
   Note that I am the author of the ubidump tool.
 * A note about the vidhdrofs argument to modprobe.


willem


--------------B825A3468F1E00A60192127D
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="faq-ubifs.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="faq-ubifs.patch"

LS0tIGEvZmFxL3ViaWZzLnhtbAorKysgYi9mYXEvdWJpZnMueG1sCkBAIC05MTUsMTIgKzkx
NSwxOSBAQCBtb3VudCAtdCB1YmlmcyAvZGV2L3ViaTBfMCAvbW50L3ViaWZzCiAKIDxoMj48
YSBuYW1lPSJMX3ViaWZzX2V4dHJhY3QiPkhvdyBkbyBJIGV4dHJhY3QgZmlsZXMgZnJvbSBh
biBVQkkvVUJJRlMgaW1hZ2U/PC9hPjwvaDI+CiAKLTxwPlVuZm9ydHVuYXRlbHksIGF0IHRo
ZSBtb21lbnQgdGhlcmUgYXJlIG5vIHVzZXItc3BhY2UgdG9vbHMgd2hpY2ggY2FuCi11bndy
YXAgVUJJIGFuZCBVQklGUyBpbWFnZXMuIFVCSUZTIGNhbm5vdCBiZSBsb29wLWJhY2sgbW91
bnRlZCBlaXRoZXIsCi1iZWNhdXNlIGl0IGRvZXMgbm90IHdvcmsgd2l0aCBibG9jayBkZXZp
Y2VzLjwvcD4KKzxwPgorICAgIFRoZXJlIGFyZSBhIGNvdXBsZSBvZiBweXRob24gdG9vbHMg
Zm9yIGV4dHJhY3RpbmcgYW5kIGFuYWx5emluZyBVQkkgaW1hZ2VzLgorICAgIDx1bD4KKyAg
ICAgICAgPGxpPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9qcnNwcnVpdHQvdWJpX3Jl
YWRlci8iPnViaV9yZWFkZXI8L2E+IC0gQ29sbGVjdGlvbiBvZiBQeXRob24gc2NyaXB0cyBm
b3IgcmVhZGluZyBpbmZvcm1hdGlvbiBhYm91dCBhbmQgZXh0cmFjdGluZyBkYXRhIGZyb20g
VUJJIGFuZCBVQklGUyBpbWFnZXMuPC9saT4KKyAgICAgICAgPGxpPjxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9ubGl0c21lL3ViaWR1bXAvIj51YmlkdW1wPC9hPiAtIFRvb2wgZm9y
IHZpZXdpbmcgYW5kIGV4dHJhY3RpbmcgZmlsZXMgZnJvbSBhbiBVQklGUyBpbWFnZS48L2xp
PgorICAgIDwvdWw+CisgICAgVGhlcmUgaXMgYWxzbyBhIGNvbXBhbnkgc2VsbGluZyBhIGNs
b3NlZCBzb3VyY2Ugd2luZG93cyB0b29sIHRvIGRvIHRoZSBzYW1lLgorPC9wPgogCi08cD5I
b3dldmVyLCBrZXJuZWwgbW9kdWxlcyBleGlzdCB0aGF0IGFsbG93IHlvdSB0byBjcmVhdGUg
YSB2aXJ0dWFsIE1URAotb250byB3aGljaCBVQklGUyBjYW4gYmUgbW91bnRlZC4gWW91IGhh
dmUgdHdvIG9wdGlvbnM6Cis8cD4KKyAgICBVQklGUyBjYW5ub3QgYmUgbG9vcC1iYWNrIG1v
dW50ZWQgYmVjYXVzZSBpdCBkb2VzIG5vdCB3b3JrIHdpdGggYmxvY2sgZGV2aWNlcy4KKyAg
ICBIb3dldmVyLCBrZXJuZWwgbW9kdWxlcyBleGlzdCB0aGF0IGFsbG93IHlvdSB0byBjcmVh
dGUgYSB2aXJ0dWFsIE1URAorICAgIG9udG8gd2hpY2ggVUJJRlMgY2FuIGJlIG1vdW50ZWQu
IFlvdSBoYXZlIHR3byBvcHRpb25zOgogPG9sPgogCTxsaT48Y29kZT5uYW5kc2ltPC9jb2Rl
Piwgd2hpY2ggY2FuIHNpbXVsYXRlIHZhcmlvdXMgTkFORCBkZXZpY2VzLgogCVlvdSBjYW4g
ZmluZCBhbiBpbmNvbXBsZXRlIGxpc3Qgb2YgdGhvc2UgZGV2aWNlcwpAQCAtOTcxLDcgKzk3
OCw3IEBAIHViaW1rdm9sIC9kZXYvdWJpMCAtTiAiTXkgVUJJRlMgdm9sdW1lIG5hbWUiIC1z
ICRWT0xTSVpFCiB1Yml1cGRhdGV2b2wgL2Rldi91YmkwXzAgdWJpZnMuaW1nCiAKICMgTW91
bnQgaXQgdG8gYW55IGRlc2lyZWQgbW91bnQgcG9pbnQKLW1vdW50IC9kZXYvdWJpMF8wIC9t
bnQvdWJpZnMKK21vdW50IC10IHViaWZzIC9kZXYvdWJpMF8wIC9tbnQvdWJpZnMKIDwvcHJl
PgogCiA8cD5Ob3cgeW91IGhhdmUgdGhlIGZpbGVzeXN0ZW0gaW4gPGNvZGU+L21udC91Ymlm
czwvY29kZT4uIFVzZQpAQCAtOTg3LDkgKzk5NCwxMyBAQCB0aGUgcHJvY2VzcyBpcyBzaW1w
bGVyLgogV3JpdGUgdGhlIGltYWdlIHRvIHRoZSBNVEQgdmlhIDxjb2RlPnViaWZvcm1hdCAt
ZiB1YmkuaW1nPC9jb2RlPgogKGFzc3VtaW5nIHRoYXQgaXMgdGhlIG5hbWUgb2YgeW91ciBp
bWFnZSBmaWxlKS4KIFlvdSBzaG91bGQgYmUgYWJsZSB0byBza2lwIHRoZSBpbnN0cnVjdGlv
bnMgYWJvdmUgYWZ0ZXIKLTxjb2RlPm1vZHByb2JlIHViaSBtdGQ9MDwvY29kZT4sIHNpbmNl
Cis8Y29kZT5tb2Rwcm9iZSB1YmkgbXRkPS9kZXYvbXRkMCwyMDQ4PC9jb2RlPiwgc2luY2UK
IHRoZSBVQkkgaW1hZ2Ugc2hvdWxkIHRha2UgY2FyZSBvZiB0aGUgdm9sdW1lKHMpIGl0c2Vs
Zi4KLQorPHA+CisgICAgTm90ZSB0aGF0IHRoZSA8aT52aWRoZHJvZnM8L2k+ICggdGhlIHNl
Y29uZCBhcmd1bWVudCBhZnRlciA8Y29kZT5tdGQ9PC9jb2RlPikgaXMgaW1wb3J0YW50LAor
ICAgIGZvciBpbWFnZXMgd2l0aCBhIGxhcmdlciBlcmFzZWJsb2NrIHNpemUgdGhpcyB3aWxs
IGFsc28gYmUgYSBsYXJnZXIgdmFsdWUuCisgICAgV2l0aCAyNTZLIGVyYXNlYmxvY2tzIHlv
dSB3b3VsZCBuZWVkIDQwOTYgdGhlcmUuCis8L3A+CiAKIDxoMj48YSBuYW1lPSJMX3NtYWxs
ZXJfanJuIj5JIG5lZWQgbW9yZSBzcGFjZSAtIHNob3VsZCBJIG1ha2UgVUJJRlMgam91cm5h
bCBzbWFsbGVyPzwvYT48L2gyPgogCgo=
--------------B825A3468F1E00A60192127D
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------B825A3468F1E00A60192127D--

