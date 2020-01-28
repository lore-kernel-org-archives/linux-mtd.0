Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A67C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 10:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F0C24681
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 10:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJ2yXZnT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="empNJ6YH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F0C24681
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5grKEx+TvwvzXXoEtu8WHvvldJfk1ejolpXmls3jE9k=; b=mJ2yXZnT2yhp5r
	pjJVWBncVUv+jyPkxb9cc5UIOTOnOITdIjOv5DNETCOOWkPIhShGhhnV1sYkeSt+rZpo1lJMGz+mC
	LpYrxZ15s26QIDMHJZzBafaViy3uZCpL0dd+r5SlXdjs7HhPQW57Lqbs29regRXqm4scPcQvb1AOQ
	bog0SPuux719Kqd1Q6csbSm0298jMrprygX6XrUTNjc1rY0XB+q4mC+k8i1bs5u8+XCGlMMbKbyv4
	QknF/ONnUiMXvKwajaXf3lWzwdQa9B1MqvFfmP7NIcD8C6f/E6UHxGt8zu9QzFZ/4KHz7aulmXlQv
	AThB7rngmnCM00DS3w3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwOIC-0005yR-LU; Tue, 28 Jan 2020 10:40:24 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwOI9-0005xs-7n
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 10:40:23 +0000
Received: by mail-il1-x12c.google.com with SMTP id v13so5330655iln.4
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2020 02:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fbzp0z9c2cpO6Qts9603vm1zEHkNKZbxKyRMBFcLZGQ=;
 b=empNJ6YHLmRjbI37AK2oMSdVva6iRmvjX+PPsMgRgN2f2qCB0p4xhv0SkUmolYa4Mq
 geEFmhjntSfMqKHyf3umLjq3JweHDqP2jAHzr7qD3kMY0F/h27vnsc7b/vf54Ksbm+PQ
 Urv5iabqFRAoLAfGrPvnMCVSrw7yM9VD2j5x55eNf0CM1SRvcODbV4TzQXTH38yq60MA
 hhznvirdqOKk50rFeMMN1Eh/SoAptOylwPC+cXBhtZ01pC79U7gC9ErBZIYfz4WfAHSh
 z4Cz0E7I9iwtdFIhj9QS3zGLfbGNbrhoLQx8ETfmPaQ8/h1A10elKtVwDaibJE3qZWAv
 egCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fbzp0z9c2cpO6Qts9603vm1zEHkNKZbxKyRMBFcLZGQ=;
 b=TDIncHEauteCtnoYGkzKsKwiPKAf2WGccgNdtF44PWU3Ms59tsup0HR5Mc3rDBnDD+
 WHjp6hekm/atfiV+UrU7s+YtCs5M5SSR6BXLUJ0ETvhW5zqbkRjzbBHm+V/J5BDLVBhK
 KBV4u13GSDhKEtiswAesFSDPl32DJr2usA42jbqyTzYA7qDxuMlZjIhRznqJfeZcImT8
 f5H9ln3dF1lbWCYQav8fm5WWdHq6S5lF/621MdJMOLgzwff+SVf2kHT4uFTFW/ukBJId
 nS5fH8kZHCYQ8odXe6FH9LeJSZouFbP73mNPX2G8+xhA8L7giQuOpAlzr1jsB2oIHidh
 9pqQ==
X-Gm-Message-State: APjAAAXvNWgYaI/rcueaC9jTaRIpUvO2FsL5XRG5WnS7U+EmVVmv1FzX
 OsSPsTjmGrFeFm51FXbpFV6ms8SJ6FVMFSn6/vI=
X-Google-Smtp-Source: APXvYqxRf62ooccXSmnFz5mhkGPvORvPm2uumVaIEXcrACo1D0K9xJIkfAQNhXnzgRG2QqqOn4jRKEXPxqxbEWTsBo8=
X-Received: by 2002:a92:390d:: with SMTP id g13mr1225629ila.53.1580208020169; 
 Tue, 28 Jan 2020 02:40:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Tue, 28 Jan 2020 02:40:19
 -0800 (PST)
In-Reply-To: <CAAx3WaA2uoCki+1AV9QFZybbszfS5wecWKf1PfDvgV5u9EVL=g@mail.gmail.com>
References: <CAA=hcWRQmXa4_hh3KzKmqeaEkGsbdTEimsPjh=tZWribMkM0dA@mail.gmail.com>
 <CAA=hcWRwi_EsMD2OBzVWtyX_SPJf05vqc09zhQzFdguKi0k=FA@mail.gmail.com>
 <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
 <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
 <20200127120638.2jpgvedxecwgwz6u@qschulz>
 <CAA=hcWSXrBKX=EbF5KHkWxmWQ+6Tcqvv4exxbWUOniDR6EDiRQ@mail.gmail.com>
 <CAAx3WaA2uoCki+1AV9QFZybbszfS5wecWKf1PfDvgV5u9EVL=g@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 28 Jan 2020 21:40:19 +1100
Message-ID: <CAA=hcWTxX5GrnEJzKCJFhbe9mFvy8A7hG+EXbmczZSafyspfpw@mail.gmail.com>
Subject: Re: [yocto] lost busybox mysteriously
To: Gabriele Zampieri <gabbla.malist@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_024021_340314_A6190028 
X-CRM114-Status: GOOD (  24.53  )
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
Cc: connman <connman@lists.01.org>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andy Pont <andy.pont@sdcsystems.com>,
 Yocto discussion list <yocto@yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR2FicmllbGUsCgpPbiAxLzI4LzIwLCBHYWJyaWVsZSBaYW1waWVyaSA8Z2FiYmxhLm1hbGlz
dEBnbWFpbC5jb20+IHdyb3RlOgo+IEhJIEpILAo+Cj4gLSBDYW4geW91IHN0b3Agb24gdWJvb3Qg
YW5kIHRyeSAibmFuZCBiYWQiPyBUaGlzIHdpbGwgbGlzdCB0aGUgYmFkIGJsb2Nrcwo+IG9uIHlv
dXIgZGV2aWNlLgo9PiBuYW5kIGJhZAoKRGV2aWNlIDAgYmFkIGJsb2NrczoKCgo+IC0gSG93IGRv
IHlvdSBmbGFzaCB5b3VyIHViaSBwYXJ0aXRpb24ocyk/CgpJIGJvb3QgekltYWdlLWluaXRyYW1m
cyBrZXJuZWwgdG8gTGludXggdXNlciBzcGFjZSwgdGhlbiBydW46CnViaWRldGFjaCAtcCAvZGV2
L210ZDUKdWJpZm9ybWF0IC9kZXYvbXRkNSAteQp1YmlhdHRhY2ggLW0gNQp1Ymlta3ZvbCAvZGV2
L3ViaTAgLXMgMTYwTWlCIC1OIHJvb3Rmc19kYXRhCm1vdW50IC10IHViaWZzIHViaTA6cm9vdGZz
X2RhdGEgL21udApjcCAtYWRyIC95b2N0b19yb290ZnMvKiAvbW50Cgo+IC0gRHVyaW5nIGJvb3Qs
IGRvZXMgdWJpZnMgbGF5ZXIgY29tcGxhaW4gYWJvdXQgdGhlIHBhcnRpdGlvbiBpcyBpdCB0cnlp
bmcKPiB0byBtb3VudD8gSXQgd2lsbCBpbiBjYXNlIG9mIGNvcnJ1cHRlZCBtZXRhZGF0YSBhbmQg
bWF5IHJlc3VsdCBpbiBhIHJlYWQKPiBvbmx5IG1vdW50LgoKVGhlcmUgaXMgbm8gcGFydGl0aW9u
IGludm9sdmVkIGR1cmluZyB0aGUgYm9vdCwgYWxsIHBhcnRpdGlvbnMgc3RhcnQKaW4gdXNlciBz
cGFjZSBhZnRlciBib290aW5nLgoKPiAtIEl0J3MgcHJldHR5IHdlaXJkIHRoYXQgYnVzeWJveCBo
YXMgZ29uZSBhbmQgdGhlIHBhcnRpdGlvbiBpcyBpbnRhY3QuCj4gRGlkbid0IHlvdSBtZXNzZWQg
d2l0aCBhbnkgc2NyaXB0PyBDYW4geW91IHJlcGxpY2F0ZSBvbiBhbm90aGVyIGJvYXJkPwoKSSBk
b24ndCB0aGluayBpdCB3YXMgYmFkIGJsb2NrIHByb2JsZW0sIGJlY2F1c2UgaXQgaXMgYSBuZXcg
dmVyc2lvbgpoYXJkd2FyZSwgd2hpY2ggaGFzIHNvbWUgcHJvYmxlbSBpbiBwb3dlciBzdXBwbHks
IGNvdWxkIHVuc3RhYmxlIG9yCmluc3VmZmljaWVudCBwb3dlciBzdXBwbHkgY2F1c2UgTVREIC8g
TkFORCBjcmFzaD8KClRoYW5rIHlvdSBHYWJyaWVsZSwKCktpbmQgcmVnYXJkcywKCi0gamgKCj4K
PiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCA3OjI1IEFNIEpIIDxqdXBpdGVyLmhjZUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4+IE9uIDEvMjcvMjAsIFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVs
ekBzdHJlYW11bmxpbWl0ZWQuY29tPiB3cm90ZToKPj4gPiBIaSBKSCwKPj4gPgo+PiA+IE9uIE1v
biwgSmFuIDI3LCAyMDIwIGF0IDEwOjEzOjM3UE0gKzExMDAsIEpIIHdyb3RlOgo+PiA+PiBIaSBB
bmR5LAo+PiA+Pgo+PiA+PiBUaGFua3MgZm9yIHRoZSByZXNwb25zZS4KPj4gPj4KPj4gPj4gT24g
MS8yNy8yMCwgQW5keSBQb250IDxhbmR5LnBvbnRAc2Rjc3lzdGVtcy5jb20+IHdyb3RlOgo+PiA+
PiA+IEpIIHdyb3RlLi4uCj4+ID4+ID4KPj4gPj4gPj5UaGF0IHRoZSBzYW1lIHByb2JsZW0gb2Yg
bWlzc2luZyBidXN5Ym94IHdhcyBub3QganVzdCBvY2N1cnJlZAo+PiA+PiA+PiBkdXJpbmcKPj4g
Pj4gPj50aGUgZGV2aWNlIHJ1bm5pbmcgaW4gdGhlIG1pZGRsZSBvZiBvcGVyYXRpb24sIGl0IHdh
cyBhbHNvIG9jY3VycmVkCj4+ID4+ID4+ZHVyaW5nIGJvb3RpbmcgaW1hZ2UgZnJvbSBOQU5ELCBJ
IHNhdyBzZXZlcmFsIHRpbWVzIHRoYXQgdGhlIGZpcnN0Cj4+ID4+ID4+IGFuZAo+PiA+PiA+PnNl
Y29uZCBjeWNsZXMgb2YgYm9vdGluZyBpbWFnZSBmcm9tIE5BTkQgd2VyZSB3b3JraW5nIHdlbGws
IHRoZW4KPj4gPj4gPj4gc29tZQo+PiA+PiA+PmZvbGxvd2luZyBib290aW5nIHByb2Nlc3Mgd291
bGQgYmUgY3Jhc2hlZCBieSBtaXNzaW5nIGJ1c3lib3gsIHRoZW4KPj4gPj4gPj5jb3VsZCBub3Qg
cnVuIHdob2xlIHNoZWxsIGNvbW1hbmRzLiBJIGhhdmUgYmVlbiBwb25kZXJpbmcgaWYgaXQKPj4g
Pj4gPj4gY291bGQKPj4gPj4gPj5iZSBjYXVzZWQgYnkgTkFORCBpc3N1ZSBvciBuZXR3b3JrIHZp
cnVzIC8gZmlzaHk/IEFwcHJlY2lhdGUgYW55Cj4+ID4+ID4+Y2x1ZXMuCj4+ID4+ID4gVGhlIGZp
cnN0IHN0ZXAgaXMgZm9yIHVzIHRvIHVuZGVyc3RhbmQgd2hhdCDigJxtaXNzaW5n4oCdIG1lYW5z
PyAgSGF2ZQo+PiA+PiA+IHlvdQo+PiA+PiA+IGdvdCBhbnkgbWVjaGFuaXNtIChVLUJvb3QsIFNE
IGNhcmQgYm9vdCwgZXRjLikgdGhhdCB3aWxsIGFsbG93IHlvdQo+PiA+PiA+IHRvCj4+ID4+ID4g
bW91bnQgYW5kIGxvb2sgYXQgdGhlIGNvbnRlbnRzIG9mIHRoZSBOQU5EIGZpbGUgc3lzdGVtPwo+
PiA+Pgo+PiA+PiBNZWFucyB0aGF0IGJ1c3lib3ggd2FzIG5vdCB0aGVyZSBhbnltb3JlLCBpdCBt
eXN0ZXJpb3VzbHkgbG9zdCwgYWxsCj4+ID4+IHNoZWxsIGNvbW1hbmRzIHdvdWxkIG5vIGxvbmdl
ciBhdmFpbGFibGUuIEl0IGNhbm5vdCB0byBydW4gbW91bnQgb3IKPj4gPj4gYW55IHNoZWxsIGNv
bW1hbmRzLiBUaGVyZSB3YXMgdHdvIHNjZW5hcmlvcyB3aGVuIHRoYXQgaGFwcGVuZWQ6Cj4+ID4+
Cj4+ID4+IC0gSW4gdGhlIG1pZGRsZSBvZiBydW5uaW5nLCB0aGUgZGV2aWNlIGFsbCBvZiBjZXJ0
YWluIGNvdWxkIG5vdCBydW4KPj4gPj4gc2hlbGwgY29tbWFuZHMgYW5kIGZhaWxlZCBteXN0ZXJp
b3VzbHkKPj4gPj4KPj4gPj4gLSBEdXJpbmcgdGhlIHUtYm9vdCBib290aW5nIGtlcm5lbCBwcm9j
ZXNzLCB0aGVyZSB3ZXJlIGZ1bGwgZXJyb3JzIG9mCj4+ID4+IGZhaWxpbmcgc2hlbGwgY29tbWFu
ZHMuIExldCBtZSBtYWtlIGl0IGNsZWFyLCAgdGhhdCBib290aW5nIGVycm9yIGRpZAo+PiA+PiBu
b3Qgb2NjdXIgaW4gdGhlIGZpcnN0IG9yIHNlY29uZCBrZXJuZWwgYm9vdGluZyBhZnRlciB0aGUg
bmV3IGltYWdlCj4+ID4+IGluc3RhbGxhdGlvbiwgaXQgaGFwcGVuZWQgaW4gdGhlIGZvbGxvd2lu
ZyBrZXJuZWwgYm9vdGluZywgYnV0IHRoZXJlCj4+ID4+IHdhcyBub3RoaW5nIHRvIGRlbGV0ZSBi
dXN5Ym94IGFjY2lkZW50YWxseSwgYnVzeWJveCB3YXMganVzdAo+PiA+PiBteXN0ZXJpb3VzbHkg
ZGlzYXBwZWFyZWQuIEJlY2F1c2UgSSBjb3VsZCBub3QgcnVuIGxzLCBJIGRpZCBub3Qga25vdwo+
PiA+PiBpZiB0aGVyZSBhcmUgb3RoZXIgdGhpbmdzIG1pc3NpbmcuIElmIHlvdSBhc2sgaG93IEkg
Y291bGQga25vdyB0aGUKPj4gPj4gYnVzeWJveCB3YXMgbWlzc2luZywgSSByYW4gdGhlIHpJbWFn
ZS1pbml0cmFtZnMgdG8gYm9vdCB0aGUgbGludXggaW4KPj4gPj4gUkFNLCB0aGVuIG1vdW50IHRo
ZSB1YmkwIHRvIGZpbmQgIG91dCBidXN5Ym94IHdhcyBnb25lLgo+PiA+Pgo+PiA+Pgo+PiA+PiA+
IElmIHlvdSBsb29rIGF0IHRoZSAvYmluIGRpcmVjdG9yeSAobHMgLWxhIC9iaW4vYnVzeSopIHdo
YXQgZG8geW91Cj4+ID4+ID4gc2VlPwo+PiA+PiA+IEhhdmUgdGhlIGZpbGVzIGJlZW4gZGVsZXRl
ZD8gVHJ1bmNhdGVkPyBaZXJvIGxlbmd0aD8KPj4gPj4KPj4gPj4gQ291bGQgbm90IHJ1biBscyBv
ciBhbnkgc2hlbGwgY29tbWFuZHMgd2hlbiB0aGUgYnVzeWJveCB3YXMgbWlzc2luZy4KPj4gPj4K
Pj4gPgo+PiA+IC9iaW4vbHMgLWxhIC9iaW4vYnVzeSogPwo+PiA+Cj4+ID4gTWF5YmUgc29tZXRo
aW5nIGlzIG1lc3Npbmcgd2l0aCB0aGUgUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZS4gT3IKPj4g
PiBzb21ldGhpbmcgaXMgcmVtb3ZpbmcgdGhlIHN5bWxpbmtzIGZyb20gc29tZSBiaW5hcmllcyB0
byBidXN5Ym94Lgo+Pgo+PiBObywgY291bGQgbm90IHJ1biAvYmluL2xzIGFzIGl0IHdhcyAgbGlu
a2VkIHRvICAvYmluL2J1c3lib3gubm9zdWlkLAo+PiB0aGUgL2Jpbi9idXN5Ym94Lm5vc3VpZCB3
YXMgZGFtYWdlZCBmb3Igc29tZSByZWFzb24uCj4+Cj4+ID4+ID4gV2hhdCBmaWxlIHN5c3RlbSBh
cmUgeW91IHVzaW5nIG9uIHRoZSBOQU5EIGZsYXNoPyAgSG93IGFyZSB0aGUKPj4gPj4gPiBkZXZp
Y2VzCj4+ID4+ID4gYmVpbmcgcmVzZXQgZHVyaW5nIHRoZSB2YXJpb3VzIGJvb3QgY3ljbGVzPyAg
SWYgaXQgaXMgYSBoYXJkd2FyZQo+PiA+PiA+IHJlc2V0Cj4+ID4+ID4gdGhlbiBzb21lIGZpbGUg
c3lzdGVtcyBhcmUgbGVzcyByZXNpbGllbnQgdG8gaXQgdGhhbiBvdGhlcnMgYnV0IEkKPj4gd291
bGQKPj4gPj4gPiBleHBlY3QgaW4gdGhhdCBjYXNlIG1vcmUgZnVuZGFtZW50YWwgYm9vdCBpc3N1
ZXMuCj4+ID4+Cj4+ID4+IFVCSUZTLCBtb3N0IGRldmljZSByZXNldCBvciBib290IGN5Y2xlcyB3
ZXJlIGNhbGxpbmcgaGFsdCBvciByZWJvb3QsCj4+ID4+IGJ1dCBpdCBzb21ldGltZSBpdCBjb3Vs
ZCBqdXN0IHVzZSBwb3dlciBjeWNsZS4KPj4gPj4KPj4gPgo+PiA+IElJUkMsIFVCSUZTIGlzIHNh
ZmUgZnJvbSBwb3dlciBjeWNsZXMuCj4+Cj4+IEdvb2QgdG8ga25vdy4gVGhhbmsgeW91Lgo+Pgo+
PiA+IFF1ZW50aW4KPj4gPgo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+PiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4KPj4KPj4gVmlldy9SZXBs
eSBPbmxpbmUgKCM0ODE3MSk6Cj4+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3lv
Y3RvL21lc3NhZ2UvNDgxNzEKPj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3Rv
cHJvamVjdC5vcmcvbXQvNzAxMjgyNDUvMzYxODIzNwo+PiBHcm91cCBPd25lcjogeW9jdG8rb3du
ZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZwo+PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55
b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vdW5zdWIgIFsKPj4gZ2FiYmxhLm1hbGlzdEBnbWFpbC5j
b21dCj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCj4+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
