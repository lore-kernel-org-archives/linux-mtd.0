Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A44C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2024 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SgvTUhBp1fpnvMNGZif5WQiwz9afAKwuhhbS7yLbI4=; b=QehGVPb7PWPrFF
	ULYTo3ALKwGUkpXPiRU1e/zaKNatnHzpVKCakS7G1FbqMZasPd/2JDMHFZBfOt4xD0JBt529j5qPq
	AtVo/etDQY88lmsTxNt72d5Jl3ufyDLZTdBTSv9do4EGho0LqyiU47FGWzs/R1xmZI0pydB4kd11E
	vSH1/v2nDF+w/qvYlDDnXUBmewDppA9bcmqV2v6XCN/8Z42nIiIph0V7Wf4mxVQMcXsAUFLPIhlaF
	s6GUSTYhonPu/sAmLOMOTHxfo3nGvb0yp5SM4mMShD5mpIGA+pplGs5wYA2OQJCJDpcakCCjTW1gW
	bcU8UCaBbNJA/nZ5dm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLovV-00000000MQA-2kSi;
	Mon, 24 Jun 2024 19:00:29 +0000
Received: from ci74p00im-qukt09081501.me.com ([17.57.156.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLovR-00000000MNZ-3PeQ
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jun 2024 19:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
	t=1719255618; bh=pATsgfuynY3i5Yamo8zIYDydQ+ZELomD+Bybiq7ZWAY=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=ZaWP/RKAyX9rFS11X882aV/v6u4O5FPNYtfs89tRYktREY9I91A6IQJQ1DYW5zPFW
	 AbyafjCl/QOhY5W4/FE3Sz1GROWdbJod9pMN551QL/OMPe9lZP0pJlfcA+GClT9qEp
	 4Z0Xcfw5Lt/cniKGL94JPjop23dNxctsK/6rTVDy0UbE+opXI5jVCqeK5erZJTi9O/
	 qgOU8Q7FpCQzSwrZM4/VlfjDL32yz9zVoYIKWA7FQRIBq4MBPU6ROIPTjeJG8eGQDm
	 YqQr7lZJqxxI6+lY7yeCLewZDDKTBJ0Xz17i6nnstpp8nmM0PHAetjens8wJxR9mec
	 rBhsLAAqJNXzA==
Received: from [172.20.144.3] (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09081501.me.com (Postfix) with ESMTPSA id 42D6B25C051B;
	Mon, 24 Jun 2024 19:00:13 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
From: Gagan Sidhu <broly@mac.com>
In-Reply-To: <Znc8_hcjH3_0plN4@makrotopia.org>
Date: Mon, 24 Jun 2024 13:00:08 -0600
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
 Richard Weinberger <richard@nod.at>,
 ZhaoLong Wang <wangzhaolong1@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 yangerkun <yangerkun@huawei.com>,
 yi zhang <yi.zhang@huawei.com>
Message-Id: <5234146D-E9D8-4D05-95F0-D3308F9CAFFD@mac.com>
References: <251ae039-9f46-081b-a7ee-fe47de268865@huawei.com>
 <EFEC7C06-A3B2-46D6-99F4-ADA7F7199188@mac.com>
 <45d2ef27-95cc-16c4-8b0a-4413421d785b@huawei.com>
 <772249DB-434C-4AB9-AE6B-1CB684E1E11A@mac.com>
 <e562e94b-274d-4a82-3dad-d3e1109a2607@huawei.com>
 <7558AC97-FFFC-4593-B946-9F8FBD8D62FA@mac.com>
 <da6f4aa8-e79d-d70a-eeb5-0068ffc1ef52@huawei.com>
 <BE6684D5-1CEE-46AA-84BF-C6146667D84B@mac.com>
 <69656f63-d2ad-8215-eba6-12603fb38f62@huawei.com>
 <4FBEAA67-7829-481C-8EB0-06621B73F935@mac.com>
 <Znc8_hcjH3_0plN4@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
X-Mailer: Apple Mail (2.3445.104.21)
X-Proofpoint-ORIG-GUID: gTRDLq10rEvO02APYPW2llV3MOb1jbZ4
X-Proofpoint-GUID: gTRDLq10rEvO02APYPW2llV3MOb1jbZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_15,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406240151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_120026_760649_21EF8101 
X-CRM114-Status: GOOD (  11.68  )
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

YWN0dWFsbHkgdGhlIGlzc3VlIHdhcyByZXNvbHZlZC4gd2UgYXJlIGRpc2N1c3NpbmcgdW5leHBl
Y3RlZCBiZWhhdmlvdXIgd2hlbiBib3RoIE1URF9VQklfR0xVRUJJIGFuZCBNVERfVUJJX0JMT0NL
IGFyZSBlbmFibGVkLgoKZGlzYWJsaW5nIE1URF9VQklfR0xVRUJJIGZpeGVkIG15IGlzc3VlLCBh
bmQgZXZlcnl0aGluZyBtb3VudGVkIGFzIGV4cGVjdGVkIGFmdGVyd2FyZHMuCgp0aGUgcXVlc3Rp
b24gd2FzIHdoeSB1YmlibG9jazBfMCB3YXMgbm90IGJlaW5nIG1vdW50ZWQgd2hlbiBNVERfVUJJ
X0dMVUVCSSB3YXMgZW5hYmxlZCwgYW5kIHRoZSBldmlkZW5jZSBzdWdnZXN0ZWQgaXQgd2FzIHNv
bWVob3cgYmVpbmcgYXNzaWduZWQgdGhlIGxhYmVsIE1URF9VQklWT0xVTUUKCmJ1dCBpZiBubyBv
bmUgY2FyZXMgdGhhdOKAmXMgZmluZSBsb2wKClRoYW5rcywKR2FnYW4KCj4gT24gSnVuIDIyLCAy
MDI0LCBhdCAzOjA3IFBNLCBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4gd3Jv
dGU6Cj4gCj4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDg6NDM6NDdQTSAtMDYwMCwgR2FnYW4g
U2lkaHUgd3JvdGU6Cj4+IFsuLi5dCj4+IEdMVUVCSSBzaG91bGQgYmUgb3BlcmF0aW5nIG9uIHRo
ZSAvZGV2L210ZGJsb2NrWCBkZXZpY2UgYW5kIG5vdCB1YmlibG9jazBfMCBhbmQgdGh1cyB0aGUg
Ym9vdCBwcm9jZWR1cmUgY3JlYXRlZCBieSBvcGVud3J0IHNob3VsZCBiZSB1bmFmZmVjdGVkLgo+
PiAKPj4gYXQgbGVhc3QgdGhhdOKAmXMgaG93IGkgd291bGQgdW5kZXJzdGFuZCB0aGUgc2l0dWF0
aW9uIGlmIGVhY2ggYXJlIGNyZWF0aW5nIHRoZWlyIG93biBkZXZpY2VzLgo+PiAKPj4gd2UgbmVl
ZCB0byBmaWd1cmUgb3V0IGEgc29sdXRpb24gb3IgbWF5YmUgbWFzdGVyIHJpY2ggc2hvdWxkIGVu
ZCBvdXIgb25nb2luZyBkaXNjdXNzaW9uIGJlY2F1c2UgdGVjaG5pY2FsbHkg4oCcaXTigJlzIG5v
dCBtYWlubGluZeKAnSBhbmQgd2XigJlyZSBwcm9iYWJseSBib3JpbmcgdGhlIHJlY2lwaWVudHMu
Cj4gCj4gSSd2ZSBzdWdnZXN0ZWQgYSBzaW1wbGUgc29sdXRpb24gaGVyZToKPiAKPiBodHRwczov
L2xrbWwub3JnL2xrbWwvMjAyNC82LzE3LzE2MDIKPiAKPiBZb3UgY291bGQgdHJ5IHRoYXQgYW5k
IGxldCB1cyBrbm93IGlmIGl0IHJlc29sdmVzIHRoZSBpc3N1ZSBmb3IgeW91LgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
