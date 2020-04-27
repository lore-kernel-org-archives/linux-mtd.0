Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49000C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9200214D8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZX4yuGn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="i7mq7G6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9200214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4Ks/BZ34WgPt1gUOlql9TP4nTgqG9eiw1vB9KFDiIU=; b=dZX4yuGnj0UwaK
	bYYjVnshMtFQrtDKDzCQuGaxzCFjJVvUxzDZgKsUqzfIoV8hN+tiD8SPHqxZx8Z2DIlk+l1EBG9oY
	f1jJxpzi+Wn3m7v5pC0P3SCNp5QyjITNLpMQnCZlbA3BQ3kHivU7wvNVyrrhTW7FvFMOaOkTtTO4R
	NPWH0uRMslf3zGEH60Gw9mIXD1TR89WfrrUFaPFFQhcUL4Y9fDHOG+tTSiF5FOp5ob5G22hIypQyf
	31dUcQBdFIey/SfesazPiwEEj+a5/iI/ic8sTEtkM4sUgEQecCyP8BPthCTGuN5k5qZLnukXcf1Jq
	rib7oCHhOUvJ1JOu+SvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT88W-0002bd-2a; Mon, 27 Apr 2020 18:05:44 +0000
Received: from gateway36.websitewelcome.com ([192.185.196.23])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT88S-0002Zd-Py
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:05:42 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 9B1A0400C8FA1
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 12:23:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id T88EjF8eUXVkQT88EjP6tm; Mon, 27 Apr 2020 13:05:26 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YO/ZEFUeNMND48D5WMalVPzLhs8hz8EAhwiXufKHxFs=; b=i7mq7G6xxay3QoEF1EVwXZR1CU
 H6BWBRMRa8Z7USHKcjMhyeRwzSrFKRsexH4IAQOLFn9ybt2wzxuuiaiWdxGQ/5xBn1QiIRvIs/uil
 Zuxlbv+naVuDTpbuoa+sOS6pY9cQhWpoY1XazaTqSiPv3kYEFdo3q8n+SNa7OnztIs3lDwgRJFYIj
 x60NBj2UQDZ2wmqR6YIUdQYNHbrlSV6ONFAhU+dsaF938aJRGleQtz9MYEKFHk98lOcqpjPDFB4GL
 az4cXljIYSDb94/+ixqAI22YIERpmDZ8l3yVVFlTvGAtQf2be8+FkZ60GByHN0DbrbBerh3tTBw9p
 6ALqZCeQ==;
Received: from [201.162.241.110] (port=24934 helo=[192.168.43.132])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jT88D-000BBs-Nk; Mon, 27 Apr 2020 13:05:25 -0500
Subject: Re: [RFC PATCH] mtd: lpddr: Fix bad logic in print_drs_error
To: Joe Perches <joe@perches.com>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <2e19547dcec386b47923211896f43053b60ebc60.camel@perches.com>
 <20200427152913.47a48b46@xps13>
 <e2c8b5ea654600ac36949f8f0621913ceaf96ddc.camel@perches.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <ec299851-687c-ee15-2d1c-18687588b74a@embeddedor.com>
Date: Mon, 27 Apr 2020 13:09:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e2c8b5ea654600ac36949f8f0621913ceaf96ddc.camel@perches.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.241.110
X-Source-L: No
X-Exim-ID: 1jT88D-000BBs-Nk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.132]) [201.162.241.110]:24934
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_110540_982966_7BBEEAE8 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpJdCBzZWVtcyB0aGF0IHRoaXMgZml4IHNob3VsZCBiZSB0YWdnZWQgZm9yIC1zdGFibGUu
CgpJIGNhbiBjcmVhdGUgYSB0aHJlZS1wYXRjaCBzZXJpZXMgZm9yIHRoaXMgKGFzIE1pcXVlbCBz
dWdnZXN0ZWQpLCBzdGFydGluZwp3aXRoIHRoZSBwYXRjaCB0aGF0IGZpeCB0aGUgd3JvbmcgY29u
ZGl0aW9uLCBzbyBpdCBjYW4gYmUgcG9ydGVkIHRvCi1zdGFibGUsIHNlcGFyYXRlbHkuCgpJJ2xs
IGluY2x1ZGUgeW91IFJlcG9ydGVkLWJ5LCBKb2UuCgpUaGFua3MKLS0KR3VzdGF2bwoKT24gNC8y
Ny8yMCAxMjozMywgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gTW9uLCAyMDIwLTA0LTI3IGF0IDE1
OjI5ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBKb2UsCj4gCj4gSGVsbG8gTWlx
dWVsLgo+IAo+PiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPiB3cm90ZSBvbiBNb24sIDMw
IE1hciAyMDIwIDEyOjU2OjU5IC0wNzAwOgo+Pgo+Pj4gVXBkYXRlIGxvZ2ljIGZvciBicm9rZW4g
dGVzdC4KPj4+IFVzZSBhIG1vcmUgY29tbW9uIGxvZ2dpbmcgc3R5bGUuCj4+Pgo+Pj4gTWlzY2Vs
bGFuZWE6Cj4+Pgo+Pj4gbyBDb2FsZXNjZSBmb3JtYXRzCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPj4+IC0tLQo+Pj4KPj4+IEZvdW5kIGJ5IGlu
c3BlY3Rpb24gb2YgaW5jbHVkZSBmaWxlcyB1c2luZyBwcmludGsuCj4+Pgo+Pj4gSXQgYXBwZWFy
cyB0aGUgbG9naWMgaW4gdGhpcyBmdW5jdGlvbiBpcyBicm9rZW4gZm9yIHRoZQo+Pj4gY29uc2Vj
dXRpdmUgdGVzdHMgb2YKPj4+Cj4+PiAJaWYgKHByb2dfc3RhdHVzICYgMHgzKQo+Pj4gCQkuLi4K
Pj4+IAllbHNlIGlmIChwcm9nX3N0YXR1cyAmIDB4MikKPj4+IAkJLi4uCj4+PiAJZWxzZSAocHJv
Z19zdGF0dXMgJiAweDEpCj4+PiAJCS4uLgo+Pj4KPj4+IExpa2VseSB0aGUgZmlyc3QgdGVzdCBz
aG91bGQgYmUKPj4+Cj4+PiAJaWYgKChwcm9nX3N0YXR1cyAmIDB4MykgPT0gMHgzKQo+Pgo+PiBJ
IGhhZCBhIGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIHRoZSBwYXRjaCBqdXN0IHdpdGggdGhlIGNv
bW1pdCBsb2csIEkKPj4gdGhpbmsgdGhlIGFib3ZlIHRleHQgaXMgYXMgaW1wb3J0YW50Lgo+Pgo+
PiBJbiBmYWN0LCB3b3VsZCB5b3UgbWluZCBkb2luZyB0aGUgcHJpbnRrLT5wcl9ub3RpY2UgaW4g
YSBmaXJzdCBwYXRjaCwKPj4gYW5kIGZpeCB0aGUgd3JvbmcgY29uZGl0aW9uIGluIGEgc2VwYXJh
dGUgY2hhbmdlPwo+Pgo+Pj4gQW5kIHRoaXMgZnVuY3Rpb24gaXMgb25seSB1c2VkIGluIGRyaXZl
cnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYwo+Pj4gcGVyaGFwcyBpdCBzaG91bGQgYmUgbW92ZWQg
dGhlcmUuCj4+Cj4+IEFncmVlZCwgZG8gbm90IGhlc2l0YXRlIHRvIG1vdmUgdGhlIGZ1bmN0aW9u
IGFzIHN1Z2dlc3RlZCBpbiBhIHRoaXJkCj4+IHBhdGNoLgo+IAo+IFlvdSBhcmUgdGhlIG1haW50
YWluZXIgaGVyZSBubz8KPiAKPiBJIHRoaW5rIHlvdSAob3IgcGVyaGFwcyB0aGUgYXV0aG9yIEFs
ZXhleSBLb3JvbGV2IGJ1dCBoZSBoYXNuJ3QKPiBiZWVuIGFjdGl2ZSBpbiBhIGRlY2FkZSkgc2hv
dWxkIGJlIGRvaW5nIGFsbCB0aGlzLgo+IAo+IEkganVzdCBpZGVudGlmaWVkIHRoZSBsb2dpYyBk
ZWZlY3QuCj4gCj4+PiAgaW5jbHVkZS9saW51eC9tdGQvcGZvdy5oIHwgMzEgKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAxNyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQv
cGZvdy5oIGIvaW5jbHVkZS9saW51eC9tdGQvcGZvdy5oCj4+PiBpbmRleCAxMjJmMzQzLi4xYzA4
ZTc1IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvcGZvdy5oCj4+PiArKysgYi9p
bmNsdWRlL2xpbnV4L210ZC9wZm93LmgKPj4+IEBAIC0xMjcsMzEgKzEyNywyOCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcHJpbnRfZHJzX2Vycm9yKHVuc2lnbmVkIGRzcikKPj4+ICAJaW50IHByb2df
c3RhdHVzID0gKGRzciAmIERTUl9SUFMpID4+IDg7Cj4+PiAgCj4+PiAgCWlmICghKGRzciAmIERT
Ul9BVkFJTEFCTEUpKQo+Pj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRTUi4xNTogKDApIERldmlj
ZSBub3QgQXZhaWxhYmxlXG4iKTsKPj4+IC0JaWYgKHByb2dfc3RhdHVzICYgMHgwMykKPj4+IC0J
CXByaW50ayhLRVJOX05PVElDRSJEU1IuOSw4OiAoMTEpIEF0dGVtcHQgdG8gcHJvZ3JhbSBpbnZh
bGlkICIKPj4+IC0JCQkJCQkiaGFsZiB3aXRoIDQxaCBjb21tYW5kXG4iKTsKPj4+ICsJCXByX25v
dGljZSgiRFNSLjE1OiAoMCkgRGV2aWNlIG5vdCBBdmFpbGFibGVcbiIpOwo+Pj4gKwo+Pj4gKwlp
ZiAoKHByb2dfc3RhdHVzICYgMHgwMykgPT0gMHgwMykKPj4+ICsJCXByX25vdGljZSgiRFNSLjks
ODogKDExKSBBdHRlbXB0IHRvIHByb2dyYW0gaW52YWxpZCBoYWxmIHdpdGggNDFoIGNvbW1hbmRc
biIpOwo+Pj4gIAllbHNlIGlmIChwcm9nX3N0YXR1cyAmIDB4MDIpCj4+PiAtCQlwcmludGsoS0VS
Tl9OT1RJQ0UiRFNSLjksODogKDEwKSBPYmplY3QgTW9kZSBQcm9ncmFtIGF0dGVtcHQgIgo+Pj4g
LQkJCQkJImluIHJlZ2lvbiB3aXRoIENvbnRyb2wgTW9kZSBkYXRhXG4iKTsKPj4+ICsJCXByX25v
dGljZSgiRFNSLjksODogKDEwKSBPYmplY3QgTW9kZSBQcm9ncmFtIGF0dGVtcHQgaW4gcmVnaW9u
IHdpdGggQ29udHJvbCBNb2RlIGRhdGFcbiIpOwo+Pj4gIAllbHNlIGlmIChwcm9nX3N0YXR1cyAm
ICAweDAxKQo+Pj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRTUi45LDg6ICgwMSkgUHJvZ3JhbSBh
dHRlbXB0IGluIHJlZ2lvbiAiCj4+PiAtCQkJCQkJIndpdGggT2JqZWN0IE1vZGUgZGF0YVxuIik7
Cj4+PiArCQlwcl9ub3RpY2UoIkRTUi45LDg6ICgwMSkgUHJvZ3JhbSBhdHRlbXB0IGluIHJlZ2lv
biB3aXRoIE9iamVjdCBNb2RlIGRhdGFcbiIpOwo+Pj4gKwo+Pj4gIAlpZiAoIShkc3IgJiBEU1Jf
UkVBRFlfU1RBVFVTKSkKPj4+IC0JCXByaW50ayhLRVJOX05PVElDRSJEU1IuNzogKDApIERldmlj
ZSBpcyBCdXN5XG4iKTsKPj4+ICsJCXByX25vdGljZSgiRFNSLjc6ICgwKSBEZXZpY2UgaXMgQnVz
eVxuIik7Cj4+PiAgCWlmIChkc3IgJiBEU1JfRVNTKQo+Pj4gLQkJcHJpbnRrKEtFUk5fTk9USUNF
IkRTUi42OiAoMSkgRXJhc2UgU3VzcGVuZGVkXG4iKTsKPj4+ICsJCXByX25vdGljZSgiRFNSLjY6
ICgxKSBFcmFzZSBTdXNwZW5kZWRcbiIpOwo+Pj4gIAlpZiAoZHNyICYgRFNSX0VSQVNFX1NUQVRV
UykKPj4+IC0JCXByaW50ayhLRVJOX05PVElDRSJEU1IuNTogKDEpIEVyYXNlL0JsYW5rIGNoZWNr
IGVycm9yXG4iKTsKPj4+ICsJCXByX25vdGljZSgiRFNSLjU6ICgxKSBFcmFzZS9CbGFuayBjaGVj
ayBlcnJvclxuIik7Cj4+PiAgCWlmIChkc3IgJiBEU1JfUFJPR1JBTV9TVEFUVVMpCj4+PiAtCQlw
cmludGsoS0VSTl9OT1RJQ0UiRFNSLjQ6ICgxKSBQcm9ncmFtIEVycm9yXG4iKTsKPj4+ICsJCXBy
X25vdGljZSgiRFNSLjQ6ICgxKSBQcm9ncmFtIEVycm9yXG4iKTsKPj4+ICAJaWYgKGRzciAmIERT
Ul9WUFBTKQo+Pj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRTUi4zOiAoMSkgVnBwIGxvdyBkZXRl
Y3QsIG9wZXJhdGlvbiAiCj4+PiAtCQkJCQkiYWJvcnRlZFxuIik7Cj4+PiArCQlwcl9ub3RpY2Uo
IkRTUi4zOiAoMSkgVnBwIGxvdyBkZXRlY3QsIG9wZXJhdGlvbiBhYm9ydGVkXG4iKTsKPj4+ICAJ
aWYgKGRzciAmIERTUl9QU1MpCj4+PiAtCQlwcmludGsoS0VSTl9OT1RJQ0UiRFNSLjI6ICgxKSBQ
cm9ncmFtIHN1c3BlbmRlZFxuIik7Cj4+PiArCQlwcl9ub3RpY2UoIkRTUi4yOiAoMSkgUHJvZ3Jh
bSBzdXNwZW5kZWRcbiIpOwo+Pj4gIAlpZiAoZHNyICYgRFNSX0RQUykKPj4+IC0JCXByaW50ayhL
RVJOX05PVElDRSJEU1IuMTogKDEpIEFib3J0ZWQgRXJhc2UvUHJvZ3JhbSBhdHRlbXB0ICIKPj4+
IC0JCQkJCSJvbiBsb2NrZWQgYmxvY2tcbiIpOwo+Pj4gKwkJcHJfbm90aWNlKCJEU1IuMTogKDEp
IEFib3J0ZWQgRXJhc2UvUHJvZ3JhbSBhdHRlbXB0IG9uIGxvY2tlZCBibG9ja1xuIik7Cj4+PiAg
fQo+Pj4gICNlbmRpZiAvKiBfX0xJTlVYX01URF9QRk9XX0ggKi8KPj4+Cj4+Pgo+Pgo+PiBUaGFu
a3MsCj4+IE1pcXXDqGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
