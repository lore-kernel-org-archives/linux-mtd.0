Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD756C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 18:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AklmbtVZRdlATHX6fHJ6jMdKBvzljV1A62+4RS7Xb/k=; b=n0MdjBO4DJ+Ak8/SYWUajjrCGA
	1svbSNDJwTHyfMhYiksT5XSMQ5SHdCWKxNraztSvqrBH9ZCRm0ondiajdhyd9WHEx75onrYDzGCnd
	mGHpofsUuTZBcTurZOR//oFJ1yi7faaKey5VLkEApUOpRIXpFZY22v7XjOGVp8Yj5oVDjX5rx7J+Q
	at3j/wYjAcSK4EUbQxGA/n8zL7LIvUT7GSSUz7N3kn+N6BS+mQNcYM8wVpGbq5YIv4Ve75O0w5J25
	+vT8MOwXjCBBJ7vqThqws1uhUFHJKy4/C6IgBX5g5x1TeEjVuC3F5EdVAwrxd8UqxfqcafxeVhPsF
	CyjCCcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNIgZ-001yUl-81; Thu, 24 Feb 2022 18:17:51 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNIgV-001yUQ-Dj
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 18:17:49 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 1E4EF5FFEC;
 Thu, 24 Feb 2022 19:17:44 +0100 (CET)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <LW@KARO-electronics.de>,
 Brian Norris <computersforpeace@gmail.com>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
 <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
 <20220224162958.184079e4@xps13>
 <0a5497bf-7716-e8c8-7e79-7df6602d5104@emlix.com>
 <20220224170357.1f99a77a@xps13>
From: =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <6ba60b49-1e12-01a3-842f-4f6c96998a04@emlix.com>
Date: Thu, 24 Feb 2022 19:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20220224170357.1f99a77a@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_101747_876585_D276DE4A 
X-CRM114-Status: GOOD (  22.31  )
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

SGkgTWlxdWVsLAoKQW0gMjQuMDIuMjIgdW0gMTc6MDMgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+
IGRnQGVtbGl4LmNvbSB3cm90ZSBvbiBUaHUsIDI0IEZlYiAyMDIyIDE2OjU1OjI3ICswMTAwOgo+
PiBBbSAyNC4wMi4yMiB1bSAxNjoyOSBzY2hyaWViIE1pcXVlbCBSYXluYWw6Cj4+PiBkZ0BlbWxp
eC5jb20gd3JvdGUgb24gV2VkLCAyMyBGZWIgMjAyMiAxMTo1OTowMiArMDEwMDogIAo+Pj4+IEFt
IDIyLjAyLjIyIHVtIDIzOjAyIHNjaHJpZWIgSGFuIFh1Oj4+PiBDb3VsZCB5b3UgcGxlYXNlIGRl
c2NyaWJlIG1vcmUgZGV0YWlscyBhYm91dCB3aGF0IGtpbmQgb2YgZXJyb3IsIGhvdyB0byAgCj4+
Pj4+IHJlcHJvZHVjZSBpdCBhbmQgb24gd2hpY2gga2VybmVsIHZlcnNpb24/ICAgIAo+Pj4+Cj4+
Pj4gWW91IG5lZWQgYSBmbGFzaCB0aGF0IGhhcyBvbmUgYmFkIGJsb2NrIHdoZXJlIHByb2dyYW1t
aW5nIHRoZSBCQk0gc2V0cwo+Pj4+IE5BTkRfU1RBVFVTX0ZBSUwgaW4gaXRzIHN0YXR1cyByZWdp
c3Rlci4gVGhlIGxhdGVzdCBrZXJuZWxzIHNob3VsZCBzdGlsbAo+Pj4+IGhhdmUgcHJvYmxlbXMg
d2hlbiB0aGlzIGhhcHBlbnMgaW4gYSBVQkkuICAKPj4+Cj4+PiBJIGJlbGlldmUgd2Ugc2hvdWxk
IHRyeSB0byB0YWNrbGUgIndoeSIgdGhpcyBoYXBwZW5zIG1vcmUgdGhhbiB0cnkgdG8KPj4+IHdv
cmthcm91bmQgaXRzIGNvbnNlcXVlbmNlcy4gQ2FuIHlvdSBnaXZlIG1vcmUgZGV0YWlscyBhYm91
dCB3aHkgd2UgZ2V0Cj4+PiB0aGlzIHN0YXR1cz8gIAo+Pgo+PiBVaG0sIHRoZSBibG9jayBpcyBi
YWQsIGJyb2tlbi4gSXQgc2hvd3MgdGhlIHNhbWUgYmVoYXZpb3IgZXZlbiBhZnRlcgo+PiBwb3dl
ciBjeWNsaW5nLiBUaGUgb3RoZXIgYmxvY2tzIGFyZSBvay4gSSBkb24ndCB0aGluayBpdCBpcyBv
dXIgZmF1bHQKPj4gdGhhdCBpdCBkaWVkIHNvIGVhcmx5Lgo+IAo+IEJ1dCB3aHkgYWZ0ZXIgYSBw
b3dlciBjeWNsZSBhcmUgd2UgdHJ5aW5nIHRvIHdyaXRlIHRoZSBCQk0/CgpJIGRpZCBub3Qgd2Fu
dCB0byBpbXBseSB0aGF0IExpbnV4IHRyaWVzIHRvIHdyaXRlIHRoZSBibG9jayBhZnRlciBldmVy
eQpwb3dlciBjeWNsZS4gVUJJIG5vdGljZXMgdGhhdCB0aGUgYmxvY2sgaXMgYnJva2VuIG9uY2Ug
YW5kIG1hbmFnZXMgdG8KbWFyayBpdCBhcyBiYWQgaW4gdGhlIEJCVCwgc28gYWZ0ZXIgcG93ZXIg
Y3ljbGUgaXQgd2lsbCBub3QgdHJ5IHRvIHdyaXRlCnRvIHRoYXQgYmxvY2sgYWdhaW4uIFdoYXQg
SSB3YW50ZWQgdG8gc2F5IGlzIHRoYXQgbWFudWFsIHRlc3Rpbmcgb2YgdGhlCmJsb2NrIGFmdGVy
IHBvd2VyIGN5Y2xpbmcgc2hvd3MgdGhhdCB0aGUgYmxvY2sgcmVtYWlucyB1bnVzYWJsZS4KClRo
ZSBwcm9ibGVtIGlzIHRoYXQgVUJJIHN3aXRjaGVzIHRvIHJlYWQtb25seSBtb2RlIGFmdGVyIGl0
IG1hcmtlZCB0aGUKYmxvY2sgYXMgYmFkIGluIHRoZSBCQlQgYmVjYXVzZSB0aGUgcmVkdW5kYW50
IEJCTSBpbiB0aGUgT09CIG9mIHRoZQpibG9jayBjb3VsZCBub3QgYmUgd3JpdHRlbi4gQW5kIHdl
IGRvbid0IHdhbnQgdG8gZ2V0IGludG8gYSBzaXR1YXRpb24Kd2hlcmUgd2UgaGF2ZSB0byByZWJv
b3QgdGhlIHN5c3RlbSwgZXNwZWNpYWxseSBpZiBpdCBpcyBiZWNhdXNlIG9mCnNvbWV0aGluZyB3
ZSBkb24ndCBuZWVkLgoKV2UgY291bGQgY2hhbmdlIG5hbmRfYmxvY2tfbWFya2JhZF9sb3dsZXZl
bCB0byByZXR1cm4gc3VjY2VzcyBhcyBsb25nCmFzIHVwZGF0aW5nIHRoZSBCQlQgc3VjY2VlZHMs
IGlmIHlvdSB0aGluayB0aGF0IHRoaXMgaXMgdGhlIGNvcnJlY3QKYXBwcm9hY2guCgo+IElzIGl0
IHRoYXQgdGhlcmUgYXJlIHRvbyBtYW55IEVDQyBlcnJvcnMgYW5kIHNvIHdoZW4gcmVhZGluZyB0
aGUgYmxvY2sgaXQKPiBpcyBkZWNsYXJlZCBiYWQgYW5kIHRoZSBzeXN0ZW0gdHJpZXMgdG8gc2V0
IHRoZSBCQk0vQkJUIGJpdD8gT3IgaXMgaXQKPiBhbHJlYWR5IG1hcmtlZCBiYWQgc29tZXdoZXJl
IGFuZCBzb21ldGhpbmcgc2lsbHkgaGFwcGVucyB3aGljaCBhdAo+IHNvbWUgcG9pbnQgdHJpZXMg
dG8gcmUtd3JpdGUgdGhlIEJCTT8KCkkgZ3Vlc3Mgd2hlbiBwcm9ncmFtbWluZyB0aGUgQkJNIGZh
aWxzIHdpdGggYW4gZXJyb3IgaW4gdGhlIHN0YXR1cwpyZWdpc3RlciB0aGUgc2FtZSBwcm9iYWJs
eSBoYXBwZW5lZCB3aGVuIFVCSSB0cmllZCB0byB3cml0ZSBkYXRhIHRvIHRoZQpibG9jay4KCj4g
QXJlIHlvdSB1c2luZyBmYXN0bWFwPyBkbyB5b3UgdXNlIGEgQkJUPwoKWWVzIGFuZCB5ZXMuIFRo
ZSBmYWN0IHRoYXQgd2UgdXNlIGEgQkJUIGlzIHdoeSB3ZSB3YW50IHRvIHNldApOQU5EX0JCVF9O
T19PT0JfQkJNLgoKQmVzdCByZWdhcmRzLAoKICBEYW5pZWwKCi0tIApEaXBsLi1NYXRoLiBEYW5p
ZWwgR2zDtmNrbmVyLCBlbWxpeCBHbWJILCBodHRwOi8vd3d3LmVtbGl4LmNvbQpGb24gKzQ5IDU1
MSAzMDY2NC0wLCBGYXggKzQ5IDU1MSAzMDY2NC0xMSwKR290aGFlciBQbGF0eiAzLCAzNzA4MyBH
w7Z0dGluZ2VuLCBHZXJtYW55ClNpdHogZGVyIEdlc2VsbHNjaGFmdDogR8O2dHRpbmdlbiwgQW10
c2dlcmljaHQgR8O2dHRpbmdlbiBIUiBCIDMxNjAKR2VzY2jDpGZ0c2bDvGhydW5nOiBIZWlrZSBK
b3JkYW4sIERyLiBVd2UgS3JhY2tlClVzdC1JZE5yLjogREUgMjA1IDE5OCAwNTUKCmVtbGl4IC0g
eW91ciBlbWJlZGRlZCBsaW51eCBwYXJ0bmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
