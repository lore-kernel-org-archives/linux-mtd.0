Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D521C47DD9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 02:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/385wR0SvUHpeapUH3Fld8AzyvsvV1c3Q8BdNNF4tsU=; b=dGfcE7UcszgCSU
	84dFpmeO198/bo2Gls+RgXVEImeguMMboRLfjoRJwSMX1hrvrKcaLLngRzIfvCGDnRPBZSQV96lDM
	MJuNyNsOwiN1AoTGiGIskTtQ5Xd4xBGKmQIZn3mZX9j/CoQ/9SxGQriS/+iHcDWzwE257e8tqWkac
	YB+soncXQjdxNyE6/sBILfGnwaalXGNsb2lPiAF3H0bkRiqHzQTm7kfnD7/5cnpXc/U/Z2hAFzp6j
	hKerGBUKw6Vw0Sa1a2+nZdymuZ068WEF1BHOuDudVqBXX1fS8qjrPvbH/CyI81qA/vTiP8cOfPBZe
	CQQ/JPObWKS6yB+IAEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reR0S-0000000GCWm-2xon;
	Mon, 26 Feb 2024 02:46:16 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reR0Q-0000000GCVX-1xs6
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 02:46:15 +0000
Message-ID: <85628515-9b75-4498-8a7f-1f1a33cfeca1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708915565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+PILNUvh9rhfqYpVarQEPUj15xIczPVax4wdDf61n4=;
	b=TJ7M1uflwrFPvWRyq6mngrdtz86MrpxnH9IwsnC5e82DVbw28EyhwEt3NsBtMYHOxCclmx
	ILXWaDIdntC4PTKDaLeyL7fi+wHhkwpiU54Ee90TNBS4/V+y6yjjvDDIvAVJci/wVoJbkC
	Oycc4G7q7F8Y2AexgWz3LryW7f4MHng=
Date: Mon, 26 Feb 2024 10:46:01 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] ubifs: remove SLAB_MEM_SPREAD flag usage
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, vbabka@suse.cz,
 roman gushchin <roman.gushchin@linux.dev>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
References: <20240224135217.830331-1-chengming.zhou@linux.dev>
 <1319891481.98257.1708893399313.JavaMail.zimbra@nod.at>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <1319891481.98257.1708893399313.JavaMail.zimbra@nod.at>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_184614_675167_4651CB58 
X-CRM114-Status: GOOD (  10.03  )
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

T24gMjAyNC8yLzI2IDA0OjM2LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJjaGVuZ21pbmcgemhvdSIgPGNoZW5nbWlu
Zy56aG91QGxpbnV4LmRldj4KPj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4+IEND
OiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2Vy
bmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1tbSIKPj4gPGxpbnV4
LW1tQGt2YWNrLm9yZz4sIHZiYWJrYUBzdXNlLmN6LCAicm9tYW4gZ3VzaGNoaW4iIDxyb21hbi5n
dXNoY2hpbkBsaW51eC5kZXY+LCAiWGlvbmd3ZWkgU29uZyIKPj4gPFhpb25nd2VpLlNvbmdAd2lu
ZHJpdmVyLmNvbT4sICJjaGVuZ21pbmcgemhvdSIgPGNoZW5nbWluZy56aG91QGxpbnV4LmRldj4s
ICJDaGVuZ21pbmcgWmhvdSIKPj4gPHpob3VjaGVuZ21pbmdAYnl0ZWRhbmNlLmNvbT4KPj4gR2Vz
ZW5kZXQ6IFNhbXN0YWcsIDI0LiBGZWJydWFyIDIwMjQgMTQ6NTI6MTcKPj4gQmV0cmVmZjogW1BB
VENIXSB1YmlmczogcmVtb3ZlIFNMQUJfTUVNX1NQUkVBRCBmbGFnIHVzYWdlCj4gCj4+IEZyb206
IENoZW5nbWluZyBaaG91IDx6aG91Y2hlbmdtaW5nQGJ5dGVkYW5jZS5jb20+Cj4+Cj4+IFRoZSBT
TEFCX01FTV9TUFJFQUQgZmxhZyBpcyBhbHJlYWR5IGEgbm8tb3AgYXMgb2YgNi44LXJjMSwgcmVt
b3ZlCj4+IGl0cyB1c2FnZSBzbyB3ZSBjYW4gZGVsZXRlIGl0IGZyb20gc2xhYi4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW5nbWluZyBaaG91IDx6aG91Y2hl
bmdtaW5nQGJ5dGVkYW5jZS5jb20+Cj4gCj4gQXBwbGllZC4KPiBOZXh0IHRpbWUgcGxlYXNlIGFk
ZCBhIHJlZmVyZW5jZSB0aGF0IG1ha2VzIHZlcnkgY2xlYXIgd2h5IHN1Y2ggYSBmbGFnCj4gaXMg
bm8gbG9uZ2VyIG5lZWRlZC4KPiBJdCB0b29rIG1lIGEgZmV3IG1pbnV0ZXMgdG8gZmlndXJlIHdo
eSBTTEFCX01FTV9TUFJFQUQgaXMKPiBub3cgYSBuby1vcC4KClVwZGF0ZSBjaGFuZ2Vsb2cgdG8g
bWFrZSBpdCBjbGVhcmVyOgoKVGhlIFNMQUJfTUVNX1NQUkVBRCBmbGFnIHVzZWQgdG8gYmUgaW1w
bGVtZW50ZWQgaW4gU0xBQiwgd2hpY2ggd2FzCnJlbW92ZWQgYXMgb2YgdjYuOC1yYzEsIHNvIGl0
IGJlY2FtZSBhIGRlYWQgZmxhZy4gQW5kIHRoZSBzZXJpZXNbMV0Kd2VudCBvbiB0byBtYXJrIGl0
IG9ic29sZXRlIHRvIGF2b2lkIGNvbmZ1c2lvbiBmb3IgdXNlcnMuIEhlcmUgd2UKY2FuIGp1c3Qg
cmVtb3ZlIGFsbCBpdHMgdXNlcnMsIHdoaWNoIGhhcyBubyBmdW5jdGlvbmFsIGNoYW5nZS4KClsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAyMjMtc2xhYi1jbGVhbnVwLWZsYWdz
LXYyLTEtMDJmMTc1M2U4MzAzQHN1c2UuY3ovCgpUaGFua3MhCgo+IAo+IFRoYW5rcywKPiAvL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
