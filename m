Return-Path: <SRS0=5cNT=72=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5036C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jun 2020 15:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F2620792
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jun 2020 15:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G0TBnV9C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vHy2fGLc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F2620792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQxJzDLdHLLVd8MPOd5sWpUVXAzViuJ5J13q3DVNkTM=; b=G0TBnV9Cn4ySh2
	MqJ+f9edDgebWmBaeRvN+inHgzLhB8MxZsRY3NtxQ6jeWnJ+gONdTRenVcRNtvCdRZKdKppkIjpjX
	SnNGV8G0ZO59eEeVJpG0xdOVcDYDb1T4YpnhzdbPFg+ijvcwp1GxjMGrGq+nSdzB4lk4QHY7NHgGb
	ZqCeMiZ2AjpTUzGpTBxdeZV7NJwjctlpwQxHu3eFoYTr7qqBfE7aIFlbrCR2l/nlStFGQP3Bsvozg
	VPT2w41BtXIfQtXt01LKliPzzgMNkk5bzL9aqIkWdb97PP/vO80nu/UQUOhhfuF+NauzxcABBKadc
	yrQId6+UKeYQOayYB1sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jk7tk-0006qN-Ep; Sat, 13 Jun 2020 15:16:44 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jk7tg-0006ps-E8
 for linux-mtd@lists.infradead.org; Sat, 13 Jun 2020 15:16:43 +0000
Received: by mail-il1-x142.google.com with SMTP id l6so11523830ilo.2
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jun 2020 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6fNrHRViBCmNMN6HkRzSmxJVnPWhBWv7Mu2Mxbxlp0M=;
 b=vHy2fGLcFLCbtpWWqJFnA1jlrFHl9io1ENiI+4kIfLPPcXyTE9Hq7EPUfMAFW79n65
 Qq+Pa7/+I8v8X57833OggvQM5WR27MlUEytmGK7bYEVVWTQGx0ae7YCr43Qsg++tUVtT
 ViUpKBrZ4pVg15Fj0MSCs1VEjFReakkIGylbGnjRdtU61qJ8uONU5V6mWhMcCZRZ6KgY
 kFatsN4gylTALbe7rmPmZIbU69GbMHwdLdGAp0cMJXsri2+7RC3JkL3Vj9M9cRnQwkFN
 5VvHfvZsXm10BqId4h71EQi+5PuNvKdENELyETs2965/b+naooHWB4WadicGKFsKnsBe
 FYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6fNrHRViBCmNMN6HkRzSmxJVnPWhBWv7Mu2Mxbxlp0M=;
 b=dbpnQPY9gVZ4t6d8eeUUj6Bb7JiNcj0QcxRfj+Lscpos5Y61p+Uvs97Y5WA6ImptOe
 qA7+rYDTiA3rf6AculaZJ6RcSzqUq8UO/lGNBXKERu91sXof8U3kj+H37veokHAdYepv
 7JuD19vAHEnysFSKLDWVsh9aOJ+q3FpCywrQcim2fPOIqWZ7qAfvd4WdsAJ2cGDFHeHX
 Wy5ODP7mg4v1MN8HKazaSMxSvy8H5CydB4CXF8kmgWIWdifIMR6ScLXw6H5i9tFPOWl3
 imNVa3X/Pg+tbbdzYUWnJycjq6+e6LpFyry6TWQpoSHwMfgN2SimgsUf3KB8LQJ8zHzh
 8pJw==
X-Gm-Message-State: AOAM533r0jJblSjbM29inQQRPXmCotOlgMXv87JuGn1wxdmbZul+NOvE
 VYwhkWUVnBRWV4MJpOljtlwnToE7Gl18NZVaXj4=
X-Google-Smtp-Source: ABdhPJxTvor6HLoEX1aH1Eqdwj9rApUr3ZkZUyfZRSr0Qhpp27x1XuOodUoa4HJv5dNmCae5bwJEXluoVvWPft0xTNQ=
X-Received: by 2002:a92:d704:: with SMTP id m4mr17667878iln.248.1592061399726; 
 Sat, 13 Jun 2020 08:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200605170720.2478262-1-noltari@gmail.com>
 <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
 <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
In-Reply-To: <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Sat, 13 Jun 2020 11:16:28 -0400
Message-ID: <CAC=U0a0=7UHY2fH+2HS5hbxThe9rYvqTKggFJP4mm-5ib52dtA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_081642_210425_2CFDEACB 
X-CRM114-Status: GOOD (  24.38  )
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWx2YXJvLAoKCk9uIFNhdCwgSnVuIDEzLCAyMDIwIGF0IDU6MDEgQU0gw4FsdmFybyBGZXJuw6Fu
ZGV6IFJvamFzCjxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBLYW1hbCwKPgo+ID4g
RWwgMTIganVuIDIwMjAsIGEgbGFzIDIwOjQ3LCBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWls
LmNvbT4gZXNjcmliacOzOgo+ID4KPiA+IE9uIEZyaSwgSnVuIDUsIDIwMjAgYXQgMTowNyBQTSDD
gWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+
ID4+IE1URF9PUFNfQVVUT19PT0IgaXMgd3JpdHRpbmcgT09CIHdpdGggRUNDIGVuYWJsZWQsIHdo
aWNoIGNoYW5nZXMgYWxsIEVDQyBieXRlcwo+ID4+IGZyb20gYW4gZXJhc2VkIHBhZ2UgdG8gMHgw
MCB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgd2l0aCBtdGQtdXRpbHMuCj4gPj4g
ICAgICAgICB8IEJCSSB8ICAgSkZGUzIgICB8ICAgRUNDICAgfCAgIEpGRlMyICAgfCBTcGFyZSAg
fAo+ID4+IDAwMDAwODAwICBmZiBmZiAxOSA4NSAyMCAwMyAwMCAwMCAgMDAgMDAgMDAgMDAgMDgg
ZmYgZmYgZmYKPiA+Pgo+ID4+IEhvd2V2ZXIsIGlmIE9PQiBpcyB3cml0dGVuIHdpdGggRUNDIGRp
c2FibGVkLCB0aGUgSkZGUzIgY2xlYW5tYXJrZXJzIGFyZQo+ID4+IGNvcnJlY3RseSB3cml0dGVu
IHdpdGhvdXQgY2hhbmdpbmcgdGhlIEVDQyBieXRlczoKPiA+PiAgICAgICAgIHwgQkJJIHwgICBK
RkZTMiAgIHwgICBFQ0MgICB8ICAgSkZGUzIgICB8IFNwYXJlICB8Cj4gPj4gMDAwMDA4MDAgIGZm
IGZmIDE5IDg1IDIwIDAzIGZmIGZmICBmZiAwMCAwMCAwMCAwOCBmZiBmZiBmZgo+ID4KPiA+IEJv
dGggYnJjbWFuZF93cml0ZV9vb2JfcmF3KCkgYW5kIGJyY21uYW5kX3dyaXRlX29vYigpIHVzZQo+
ID4gYnJjbW5hbmRfd3JpdGUoKSB0aGF0IHVzZXMgUFJPR1JBTV9QQUdFIGNtZCwgbWVhbnMgYWxz
byBwcm9ncmFtcyBkYXRhCj4gPiBhcmVhcyBhbmQgRUNDIHdoZW4gZW5hYmxlZCAgaXMgYWx3YXlz
IGNhbGN1bGF0ZWQgb24gREFUQStPT0IuICBzaW5jZQo+Cj4gQXJlIHlvdSBzdXJlIGFib3V0IHRo
YXQ/IEkgdGhpbmsgdGhhdCBIVyBFQ0MgaXMgb25seSBjYWxjdWxhdGVkIGZvciBEQVRBLCBub3Qg
Zm9yIE9PQi4KPiBUaGUgZmFjdCB0aGF0IHdl4oCZcmUgbm90IHdyaXRpbmcgYW55IERBVEEgc2Vl
bXMgdG8gYmUgdGhlIHByb2JsZW0gdGhhdCBpcyBjaGFuZ2luZyBhbGwgRUNDIGJ5dGVzIHRvIDB4
MDAuCj4KCk9ubHkgdHJ1ZSBmb3IgMS1iaXQgaGFtbWluZyBjb2RlIG9uIGVhcmx5IGNvbnRyb2xs
ZXIgdmVyc2lvbnMuICBGb3IKQkNIIGFsZ29yaXRobXMgYm90aCBkYXRhK29vYiBhcmUgY292ZXJl
ZC4gQW5kIHRoZSBjb250cm9sbGVyIGRyaXZlcgppbnRlbnRpb25hbGx5IGRvZXMgbm90IGltcGxl
bWVudCBhIHNwYXJlIGFyZWEgcHJvZ3JhbSBjbWQsIGV2ZW4gZm9yCk9PQiB3cml0ZXMuIEFsc28g
QlJDTU5BTkRfQUNDX0NPTlRST0xfUEFSVElBTF9QQUdFPTAgKHdoZW4gcHJlc2VudCkKZG9lcyBu
b3QgYWxsb3cgZm9yIHNwYXJlIGFyZWFzIG9ubHkgd3JpdGVzLgoKPiA+IGluIGJvdGggY2FzZXMg
d2Ugb25seSB3YW50IHRvIG1vZGlmeSBPT0IsIGRhdGEgaXMgYWx3YXlzIGFzc3VtZWQgdG8gYmUK
PiA+IDB4ZmZzIChtZWFucyBlcmFzZWQgc3RhdGUpLiBTbyBhcyBmYXIgYXMgdGhpcyBhcGkgYWx3
YXlzIGlzIHVzZWQgb24KPiA+IHRoZSBlcmFzZWQgcGFnZSBpdCBzaG91bGQgYmUgZ29vZC4gQXJl
IHRoZSBzdWItcGFnZXMvb29iIGFyZWFzIHJlYWQgYnkKPiA+IGpmZnMyICBhbHNvIHJlYWQgd2l0
aG91dCBlY2MgZW5hYmxlZD8uIEp1c3Qgd2FudCB0byBiZSBzdXJlIHRoYXQgaXQKPiA+IGRvZXMg
bm90IGJyZWFrIGFueSBvdGhlciB1dGlsaXRpZXMgbGlrZSBuYW5kd3JpdGUuCj4KPiBObywgc3Vi
LXBhZ2VzL29vYiBhcmVhcyByZWFkIGJ5IEpGRlMyIHdpdGggRUNDIGVuYWJsZWQuCj4gSSBkb27i
gJl0IHRoaW5rIHRoaXMgYnJlYWtzIGFueXRoaW5nIGF0IGFsbCwgc2luY2UgSSB0ZXN0ZWQgbmFu
ZHdyaXRlIHdpdGggT09CIGVuYWJsZWQgYW5kIGV2ZXJ5dGhpbmcgd2FzIHdyaXR0ZW4gcGVyZmVj
dGx5Lgo+CgpHb2luZyBieSB0aGUgY29tbWl0IG1lc3NhZ2UgeW91IGFyZSBhc3N1bWluZyAxLWJp
dCBoYW1taW5nICBjb2RlLCB0aGF0CmlzIHRoZSBvbmx5IGV4Y2VwdGlvbiBvbiBlYXJseSB2ZXJz
aW9uIGNvbnRyb2xsZXJzIHdoZXJlIG9ubHkgZGF0YSB3YXMKY292ZXJlZCBmb3IgZWNjIGNhbGN1
bGF0aW9ucyB3aGVuIGVuYWJsZWQuCldoaWNoIHZlcnNpb24gb2YgdGhlIGNvbnRyb2xsZXIgYXJl
IHlvdSB1c2luZyAgPy4gRGlkIHlvdSB0ZXN0IHdpdGgKQkNILTQgb3IgYW55IEJDSCA/LgoKPiBC
VFcsIEkgdHJpZWQgYW5vdGhlciBhcHByb2FjaCB0aGF0IGZvcmNlZCBNVERfT1BTX0FVVE9fT09C
IHRvIGJlIHdyaXR0ZW4gYXMgcmF3IE9PQiwgYnV0IGl0IHdhcyByZWplY3RlZDoKPiBodHRwOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAyMDA1MDQwOTQy
NTMuMjc0MTEwOS0xLW5vbHRhcmlAZ21haWwuY29tLwo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8y
MDIwLzUvNC8yMTUKPgoKQXJlIHRoZXJlIGFueSBvdGhlciB1c2UgY2FzZXMgb3RoZXIgdGhhbiBq
ZmZzMiB3aGVyZSBvbmx5IG9vYiBuZWVkcyB0bwpiZSBtb2RpZmllZCA/LiBCdXQgc3VyZWx5IGlu
dGVudGlvbmFsbHkgZGlzYWJsaW5nIGVjYyBpbnN0ZWFkIG9mCmZvcmNpbmcgaXQgaXMgdGhlIHdh
eSwgYnV0IEkgYW0gbm90IHN1cmUgaXQgd2lsbCBzdGlsbCB3b3JrIGZvciBvdGhlcgpCQ0ggYWxn
b3JpdGhtcyB0aG91Z2ggd2hlcmUgYm90aCBkYXRhIGFuZCBvb2IgYXJlIGNvdmVyZWQuCgo+ID4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFy
aUBnbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYyB8IDkgKy0tLS0tLS0tCj4gPj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA4IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jCj4gPj4gaW5kZXggOGY5ZmZiNDZhMDlmLi41NjYyODE3NzA4NDEgMTAwNjQ0
Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+PiBAQCAt
MjI3OSwxMyArMjI3OSw2IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfd3JpdGVfcGFnZV9yYXcoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdWludDhfdCAqYnVmLAo+ID4+ICAgICAgICByZXR1
cm4gbmFuZF9wcm9nX3BhZ2VfZW5kX29wKGNoaXApOwo+ID4+IH0KPiA+Pgo+ID4+IC1zdGF0aWMg
aW50IGJyY21uYW5kX3dyaXRlX29vYihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgcGFnZSkK
PiA+PiAtewo+ID4+IC0gICAgICAgcmV0dXJuIGJyY21uYW5kX3dyaXRlKG5hbmRfdG9fbXRkKGNo
aXApLCBjaGlwLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1NjQpcGFnZSA8
PCBjaGlwLT5wYWdlX3NoaWZ0LCBOVUxMLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNoaXAtPm9vYl9wb2kpOwo+ID4+IC19Cj4gPj4gLQo+ID4+IHN0YXRpYyBpbnQgYnJjbW5h
bmRfd3JpdGVfb29iX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgcGFnZSkKPiA+PiB7
Cj4gPj4gICAgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Cj4g
Pj4gQEAgLTI2NDIsNyArMjYzNSw3IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfaW5pdF9jcyhzdHJ1
Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCwgc3RydWN0IGRldmljZV9ub2RlICpkbikKPiA+PiAgICAg
ICAgY2hpcC0+ZWNjLndyaXRlX29vYl9yYXcgPSBicmNtbmFuZF93cml0ZV9vb2JfcmF3Owo+ID4+
ICAgICAgICBjaGlwLT5lY2MucmVhZF9vb2JfcmF3ID0gYnJjbW5hbmRfcmVhZF9vb2JfcmF3Owo+
ID4+ICAgICAgICBjaGlwLT5lY2MucmVhZF9vb2IgPSBicmNtbmFuZF9yZWFkX29vYjsKPiA+PiAt
ICAgICAgIGNoaXAtPmVjYy53cml0ZV9vb2IgPSBicmNtbmFuZF93cml0ZV9vb2I7Cj4gPj4gKyAg
ICAgICBjaGlwLT5lY2Mud3JpdGVfb29iID0gYnJjbW5hbmRfd3JpdGVfb29iX3JhdzsKPiA+Pgo+
ID4+ICAgICAgICBjaGlwLT5jb250cm9sbGVyID0gJmN0cmwtPmNvbnRyb2xsZXI7Cj4gPj4KPiA+
PiAtLQo+ID4+IDIuMjYuMgo+ID4+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gw4FsdmFyby4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
