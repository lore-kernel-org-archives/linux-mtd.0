Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBE2C63793
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 10:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CA3261289
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 10:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CA3261289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1bKPDTgfMLxgnvyxEkzuwIpBFGL1z5BC3aHGOaUQw8=; b=SaahJKtIEdwiDr16NaT41DPFkz
	AXC7IvCzyqHNpcRb4mXvh5uBMs9SfkOisEg8zyZBqUtFvQ6idhNebV8Gb8FLkcXnvKOMQClckLptS
	9zabG9cXq85hxirEILYj3/tna0ESbHKd22nKZNiA6wGJpCNIpD+iMeQxD9jSJbOaqLEEEiKOmK3vx
	ZvEJFIMA+4F9E06CUb7PABgDAPVr2OebIvzHkwJoLiqimsJ6zOGyibom9+yw6NQ8El0OHkObRjuKj
	Rsq7YdhHXrE9rS0z3GE39B8XJ08BGOKF39Fuw7PaEpL2kXn1Mer7mEcn6V4NrVgQeszzbAMYQ3oIp
	yga/YjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6WFK-001GlO-R4; Thu, 22 Jul 2021 10:48:06 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6WFG-001GkF-VR
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 10:48:04 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 6A6D25F778;
 Thu, 22 Jul 2021 12:47:53 +0200 (CEST)
Subject: Re: ubifs: corrupted dirent (ENOENT), problably related to O_TMPFILE
 and linkat
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 chengzhihao1 <chengzhihao1@huawei.com>
References: <YPkj9NUxNLGG5tjL@emlix.com>
 <2125418384.6749.1626942814175.JavaMail.zimbra@nod.at>
From: Sebastian Gross <sebastian.gross@emlix.com>
Organization: emlix
Message-ID: <3b009a01-1f13-e029-0341-9728d4dc16ea@emlix.com>
Date: Thu, 22 Jul 2021 12:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2125418384.6749.1626942814175.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_034803_207691_D0E98849 
X-CRM114-Status: GOOD (  34.87  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNy8yMi8yMSAxMDozMyBBTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiBzZ0BlbWxpeC5jb20KPj4gQW46ICJsaW51
eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPj4gQ0M6ICJyaWNoYXJkIiA8
cmljaGFyZEBub2QuYXQ+LCAiQXJ0ZW0gQml0eXV0c2tpeSIgPGRlZGVraW5kMUBnbWFpbC5jb20+
LCAiQWRyaWFuIEh1bnRlciIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPiwKPj4gImNoZW5nemhp
aGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiBHZXNlbmRldDogRG9ubmVyc3RhZywg
MjIuIEp1bGkgMjAyMSAwOTo1MzoyNAo+PiBCZXRyZWZmOiB1YmlmczogY29ycnVwdGVkIGRpcmVu
dCAoRU5PRU5UKSwgcHJvYmxhYmx5IHJlbGF0ZWQgdG8gT19UTVBGSUxFIGFuZCBsaW5rYXQKPj4g
VGhlIGNvZGUgKGRpci5jOnViaWZzX2xvb2t1cCkgd2UgcmFuIGludG8gc3RhdGVzCj4+Cj4+ICAg
ICAgICAgLyoKPj4gICAgICAgICAgKiBUaGlzIHNob3VsZCBub3QgaGFwcGVuLiBQcm9iYWJseSB0
aGUgZmlsZS1zeXN0ZW0gbmVlZHMKPj4gICAgICAgICAgKiBjaGVja2luZy4KPj4gICAgICAgICAg
Ki8KPj4gSSdkIGxvdmUgdG8sIGJ1dCBob3c/IHNpbmNlIHJlY292ZXJ5LmMgc2hvdWxkIGhhdmUg
dGFrZW4gY2FyZSBvZiB0aGF0IGJlZm9yZQo+PiBBRkFJSwo+IAo+IFVCSUZTIGNvZGUgc29tZXRp
bWVzIGNvbnRhaW5zIGEgbGl0dGxlIHBvcnRpb24gb2YgaHVtb3IuCkkgYXBwcmVjaWF0ZSB0aGF0
IC0gaW4gZmFjdCBpdCBrZXB0IG1lIGdvaW5nIGRpZ2dpbmcgaW50byB0aGUgcHJvYmxlbSB0aGUg
bGFzdCB0d28gZGF5cyA9KQoKPj4gU3lzdGVtCj4+Cj4+ICAgTGludXggNC4xOS4xODYgIzI2IFNN
UCBXZWQgSnVsIDIxIDEzOjE5OjA4IENFU1QgMjAyMSBhcm12N2wgR05VL0xpbnV4Cj4gCj4gVGhp
cyBpcyBuZXcgZW5vdWdoIHRvIGNvbnRhaW4gZWUxNDM4Y2U1ZGM0ICgidWJpZnM6IENoZWNrIGxp
bmsgY291bnQgb2YgaW5vZGVzIHdoZW4ga2lsbGluZyBvcnBoYW5zLiIpLgpDb25maXJtZWQKCj4g
U28gaXQgbXVzdCBiZSBzb21ldGhpbmcgZGlmZmVyZW50Lgo+IApBZ3JlZWQKCj4+Cj4+IHdpdGgg
Zm9sbG93aW5nIHBhdGNoZXMgb2Ygd2hpY2ggSSB0aG91Z2h0IHRoZXkgbWlnaHQgc29sdmUgdGhl
IHByb2JsZW0KPj4gICAzMjViNzMxOTgzZDAxMGQzNTg1MDViZjJjNDBmNWUwMDY5YWY2MmQyCj4g
Cj4gWW91IHdhbnQgdGhpcyBvbmUgZGVmaW5pdGVseS4gSXQgY291bGQgZXhwbGFpbiB0aGUgcHJv
YmxlbSB5b3Ugc2VlLgo+IEJUVzogQXBwbHlpbmcgdGhpcyBwYXRjaCB3aWxsIG5vdCByZWNvdmVy
IHRoZSBjb3JydXB0ZWQgZnMuIEl0IGp1c3QgbWFrZXMgc3VyZQo+IHRoYXQgdGhlIGNvcnJ1cHRp
b24gZG9lcyBub3QgaGFwcGVuLgpJIGFtIG5vdCBzbyBzdXJlIGFueW1vcmUgYnV0IEkgdGhpbmsg
dGhpcyBvbmUgd2FzIGFscmVhZHkgcHJlc2VudCB3aGVuIEkgcmVwcm9kdWNlZCB0aGUgY29ycnVw
dGlvbiBmb3IgdGhlIHRoaXJkIHRpbWUuCgo+IAo+PiAgIGRkN2RiMTQ5YmNkOTE0ZGI4ZmRlYjE5
Y2Q1NTk3YzA3NDAxMjFiYzcKPiAKPiBUaGlzIG9uZSBpcyB1bnJlbGF0ZWQuIEluIHdvcnN0IGNh
c2UgeW91J2xsIGhpdCBhbiBVQklGUyBhc3NlcnQuCkFja25vd2xlZGdlZC4gSSdsbCBkcm9wIGl0
LgoKPj4gQ2FuIHlvdSBnaXZlIG1lIGhpbnRzIGhvdyB0byBwcm9jZWVkIG9uIHRoaXM/Cj4+IC0g
YXJlIHRoZXJlIGFueSBwYXRjaGVzIGZyb20gNS4xNC1yYzIgSSBtaWdodCBoYXZlIG1pc3NlZAo+
PiAtIGhvdyB0byByZXByb2R1Y2UgdGhlIGVycm9yIG1vcmUgcmVsaWFibGUsIGllLiBmaW5kIHRo
ZSByaWdodCB0aW1lIHRvIGN1dCBwb3dlcgo+PiAgIEl0IGlzIG5vdyBhdCBhcm91bmQgNHMgYWZ0
ZXIgaXNzdWVpbmcgJ2tpbGwnLiBXaXRoIGEgbWFyZ2luIG9mIDUwMG1zCj4+ICAgYW5kIHN0ZXAg
d2lkdGggb2YgMjVtcwo+IAo+IENhbiB5b3UgcmVwcm9kdWNlIHVzaW5nIGEgcmVjZW50IGtlcm5l
bD8KQXMgc3RhdGVkIEkgYW0gYWxyZWFkeSBoYXZpbmcgYSBoYXJkIHRpbWUgdG8gcmVwcm9kdWNl
IGl0IGFzIGl0IGlzLiBUaGUgbGFzdCB0aW1lIHRvb2sgbWUgfjIwMDAgcnVucy4KQnV0IEkgd2ls
bCB0cnkgYW55d2F5LgpDYW4geW91IGdpdmUgbWUgYSBwb2ludGVyIHdoZW4gdGhlcmUgbWlnaHQg
YSBnb29kIHRpbWUvcGxhY2UgdG8gY3V0IHRoZSBwb3dlcj8KRHVyaW5nIHRoZSBsaW5rYXQgb3Ig
ZnN5bmMgY2FsbD8gT3IgbWF5YmUgYSBjZXJ0YWluIGZ1bmN0aW9uIGluIHRoZSB1YmlmcyBkcml2
ZXI/Cgo+IAo+PiAtIHdpdGggdGhlIG1lbnRpb25lZCBhYm92ZSBJIG1pZ2h0IGdldCBteSBoYW5k
cyBvbiBtb3JlIHVzZWZ1bAo+PiAgIGluZm9ybWF0aW9uIHRoYW4gdGhlIGJsYW5rIHRuYyBhbmQg
am91cm5hbCBzcGFtIHdpdGggZW5hYmxlZCBERUJVRyAoaGFkIHRvIHNldAo+PiAgIExPR19CVUYg
dG8KPj4gICAyNCAoMTZNKSB0byBjYXB0dXJlL3NhdmUgYWxsIG1lc3NhZ2VzCj4+IC0gaG93IHRv
IHJlY292ZXIgYnkgaGFuZAo+IAo+IFdpdGhvdXQgaW5zcGVjdGluZyB0aGUgZmlsZXN5c3RlbSB0
aGlzIGltcG9zc2libGUgdG8gYW5zd2VyLgo+IFlvdSBoYXZlIHNvbWUgcmVjb3ZlcnkgdG9vbCBp
biBtaW5kPwpObyBub3QgcGFydGljdWxhciBhIHRvb2wgYnV0IGJ5IHRoZSBtZXRob2QgSSBzdWdn
ZXN0ZWQgYmVsb3cuCgo+IAo+PiAtIG1pZ2h0IGl0IGJlIHNhZmUgdG8ganVzdCBnZXQgcmlkIG9m
IHRoZSBpbm9kZSBpbiB1Ymlmc19yZWFkZGlyIHdoZW4gaXQgY2FuIG5vdAo+PiAgIGJlIGZvdW5k
PyBJbiBvdXIgcGFydGljdWxhciBjYXNlIGl0IGlzIGp1c3QgYSBjb3JlZHVtcCBhbiB3ZSBkb24n
dCBjYXJlIGZvcgo+PiAgIGRhdGEgbG9zcyBhcyBsb25nIGFzIHdlIGNhbiBzdGlsbCB1c2UgdGhl
IHJlc3Qgb2YgdGhlIHZvbHVtZS8KPj4gICBmaWxlc3lzdGVtLgo+IAo+IFllcy4gTWF5YmUgaXQg
bWFrZXMgc2Vuc2UgdG8gbWFrZSBVQklGUyBhdCB0aGlzIHN0YWdlIG1vcmUgZm9yZ2l2aW5nIGlu
c3RlYWQgb2YKPiB0aGUgY3VycmVudCBzaXR1YXRpb24uCnViaWZzX3JlYWRkaXIgaGFkIHRoZW4g
dG8gY2hlY2sgaWYgdGhlIGlub2RlcyBpdCBnb3QgYXJlIGFjdHVhbGx5IGJlIGZvdW5kIGJ5IHRu
YyBhbmQgdGhlbiByZW1vdmUgaXQuClNlZW1zIHF1aXRlIGhhY2t5IHRvIG1lIGFuZCBub3QgcmVh
bGx5IHVwc3RyZWFtLXdvcnRoeS4KQXJlIHRoZXJlIG90aGVyIHBsYWNlcyB3aGVyZSBhICJmYXVs
dHkiIGlub2RlIGNhbiBiZSAiZGlzY292ZXJlZCI/CgpSZWdhcmRzCgoKU2ViYXN0aWFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
