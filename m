Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D263C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:28:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F76764EDF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F76764EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lsmSplGZKjfz0m39r//mwt1NmuXQSbkDQVTulnLIf68=; b=GDPNa2sHM8cJypXKGj9PGOWim
	Mhg6T9YSi7yRysk1+Aun9p+B8Oq9mUJAVGj92nMTJsw0bEOOC3WCdE+vuC8dIOFHLiqn3Dug8QhVt
	8RjYj+ed2VlT1uWk2Zj0Mjsf1ItT15JwXR0inxPMAh0XNyPOp9bH8tT53ov6LT7Cyk4hvNochbgml
	61XdrbM9p4FLgUpp1pEK35L1CC5ZzLHNEQon79vnkKjqFmZoWVl39XghNufOoX+okADjVyh3UK6Zu
	unCnc0pVmSrITobjop8E8SDko8akuyfw+T3zWkKTcUJad+4Op4QarNhlUZ6J8sheI9800+vTgo365
	jQWryN0UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSTk-0058Aj-Mx; Wed, 03 Mar 2021 14:27:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS8Q-0053Be-K1
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=BJrGy+HVAyyk2n20HAopeTwIYv3YviICTIZ0RdYdNPo=; b=OpfwiABwXX3k3fq5WVt4w9ZlgJ
 jz+gElsRiZp26sRcWKljc+4O0SR7dovXjITZgGU1PJov5CEocME33pkY6WgXqCO9NzDvQ23AWJROd
 IjPhggy8UqdFTB6FifogBjKBWuNVSLhpRY3fUBZE8fpdG/wQJqHAe4SLWXRvBIIg2jCEChRcb6oQ+
 OV0MgsxXOoV0lyPAGKpg+aYbTKzu3Ce7DbcEwH59L89cJJgFLx8iwGRGHFPOdvoooYusQs47Lvg/z
 Kk0eV2tn0cMri5X/atNl67WcZ63RoeAvx3ZfwxhD5GwwRqKlNI1K55GJVjaaBrpdKvLhPFRTVcInc
 fQArYg3A==;
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHRo2-002otr-PX
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 13:45:00 +0000
Received: by mail-il1-x133.google.com with SMTP id h18so21370117ils.2
 for <linux-mtd@lists.infradead.org>; Wed, 03 Mar 2021 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BJrGy+HVAyyk2n20HAopeTwIYv3YviICTIZ0RdYdNPo=;
 b=BbpGPDWIx4QQNWHZyRaz353b8jPu2r1o0DNjoC5/YYDmqvrHgKAmGCvtYZN3cTcmLY
 EQC+1+FDExdKMXuRb23UdMfqy5cTcFUJUxJP3MudhBSWJ9BHTsddNShCxCNpTShkRJ0B
 iWvXGy78GDI4gTrdRXFZg9VYCrVjNujJBc2GjtL2WxoLtYkJDNMfMWCD2I64nYSDm0St
 2VbIcWAsa9rAtRBWZfl/my+mHGkzKwzDZgo+lxi0wqF0WL8Zf/E+MfaU6DxuBmD/x00/
 rTXTDqk2FdTjlnN4FxjTdfUb1zG99ZPbHqf7oTlqheUMK77aU/YAl8jmmzsiCX7PF9r/
 Cm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BJrGy+HVAyyk2n20HAopeTwIYv3YviICTIZ0RdYdNPo=;
 b=hhzfghCNu0KPFQi1nu/AvnvOsR/pXj0iuteNPxOi0pNoPZE2MIOBGEqLLGEtrquWTo
 J8+picboPJCq1isuyTP5oAPUnScjr0LWxHlRE6tK73XDgkTIFqXtgiO1X3MANpO/dBDI
 /0ouEYR0Ha+pUY5tyKSBbwOc/H9TzT2SWrqDFRSQUVzXWIkkglbOusxUwlIcUvjj5QB8
 kx0MpRxlkFdpnKesbWbqM0NuLOEIsU3y8sKUwThqTwHMUqst6DEiKvC9xkv00wKaKyol
 jLEhBHC+dMcYUdUiLAAoymdaSzJo4bU5t4qhv0Ac+Kt/S3hqnk8wSgNjmcfQcIKZPdjl
 LQiA==
X-Gm-Message-State: AOAM533OpCZLLPTPzUMFzVcyKeN7IEAvXVrJ45SUIMmlML/ntcKl1FiH
 VsGUpDLzcRCHcvq6ABW6i/rOfxfSdnBBV1uQL+s=
X-Google-Smtp-Source: ABdhPJzcsdYJX9Qt6KukJwz3iagDOPjIjn+AJ6RhSCYzYIsFYKW4ElBhGFLvVLad6z0hbcNQri+Peem3BNHTga9zVVY=
X-Received: by 2002:a92:d981:: with SMTP id r1mr21525648iln.98.1614779089366; 
 Wed, 03 Mar 2021 05:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
 <729a56daea261808db672472e47d8c20@walle.cc>
 <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
 <c4db1916-18fe-5167-31c1-6bc652bb6212@ti.com>
In-Reply-To: <c4db1916-18fe-5167-31c1-6bc652bb6212@ti.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 3 Mar 2021 14:44:38 +0100
Message-ID: <CAEyMn7Z0mYTrtd6TwKJqL6He9g-6o0yYJ2H78oG8gZy9mxXETw@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, Michael Walle <michael@walle.cc>,
 p.yadav@ti.com, 
 ycllin@mxic.com.tw, zhengxunli@mxic.com.tw, juliensu@mxic.com.tw, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_134500_390321_0B55090C 
X-CRM114-Status: GOOD (  25.40  )
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

SGkgVmlnbmVzaCwKCkFtIERpLiwgMi4gTcOkcnogMjAyMSB1bSAwNjo0OSBVaHIgc2NocmllYiBW
aWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Ogo+Cj4KPgo+IE9uIDMvMS8yMSA4
OjU1IFBNLCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPiBPbiAzLzEvMjEg
NDo0MiBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiA+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUKPiA+Pgo+ID4+IEFtIDIwMjEtMDMtMDEgMTU6MDksIHNjaHJpZWIgVHVkb3Iu
QW1iYXJ1c0BtaWNyb2NoaXAuY29tOgo+ID4+PiBPbiAzLzEvMjEgMzo1MCBQTSwgTWljaGFlbCBX
YWxsZSB3cm90ZToKPiA+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cKPiA+Pj4+IHRoZSBjb250ZW50IGlzIHNh
ZmUKPiA+Pj4+Cj4gPj4+PiBBbSAyMDIxLTAzLTAxIDE0OjM2LCBzY2hyaWViIFByYXR5dXNoIFlh
ZGF2Ogo+ID4+Pj4+IEkgdGhpbmsgcHJpbnRpbmcgdGhlIGNvcnJlY3QgZmxhc2ggbmFtZSBpcyBz
b21ld2hhdCBpbXBvcnRhbnQuIE90aGVyCj4gPj4+Pj4gdGhhbiB0aGUgaGFuZGZ1bCBvZiBwZW9w
bGUgd2hvIGFyZSByZWFkaW5nIHRoaXMgdGhyZWFkLCBmZXcgd291bGQKPiA+Pj4+PiBrbm93Cj4g
Pj4+Pj4gdGhhdCBTUEkgTk9SIGNhbGxzIG14MjVsMTI4MzVmIGFzIG14MjVsMTI4MDVkIG9yIHZp
Y2UgdmVyc2EuIFRoaXMgY2FuCj4gPj4+Pj4gY2F1c2UgYSBsb3Qgb2YgY29uZnVzaW9uIGFtb25n
IHBlb3BsZSB0cnlpbmcgdG8gZGVidWcgYW55IGlzc3Vlcy4KPiA+Pj4+Cj4gPj4+PiBVbmZvcnR1
bmF0ZWx5LCB0aGlzIGlzIGtpbmQgb2YgYSBtZXNzLiBJZiBtdWx0aXBsZSBmbGFzaCBkZXZpY2Vz
Cj4gPj4+PiBzaGFyZSB0aGUgc2FtZSBpZCwgaXQgc2VlbXMgdG8gYmUgZmlyc3QgY29tZSBmaXJz
dCBzZXJ2ZS4gVGhlIGtlcm5lbAo+ID4+Pj4gd2lsbCBwcmludCB0aGUgbmFtZSB3aGljaCB3YXMg
aW50cm9kdWNlZCBmaXJzdC4KPiA+Pj4+Cj4gPj4+PiBUaGlzIGlzbid0IHRoZSBvbmx5IGZsYXNo
IHdoaWNoIGlzIGFmZmVjdGVkLiBIYXZlIGEgbG9vayBhdAo+ID4+Pj4gICBkcml2ZXJzL210ZC9z
cGktbm9yL3dpbmJvbmQuYwo+ID4+Pj4gVGhlcmUgYXJlIGFsbCBraW5kIG9mIGZsYXNoIG5hbWVz
LCBzb21lIG9mIHRoZW0gYXJlIG5vdCBldmVuIGV4aXN0aW5nCj4gPj4+PiBhcyB0aGlzIHBhcnRp
Y3VsYXIgc3RyaW5nLCBlZy4gdGFrZSB3MjVxNjRqd20sIGl0cyBhY3R1YWxseSAiV2luYm9uZAo+
ID4+Pj4gVzI1UTY0SlctSU0gb3IgVzI1UTY0SlctSk0iLgo+ID4+Pj4KPiA+Pj4+IFNvIHllcywg
aXQgd291bGQgYmUgbmljZSB0byBoYXZlIHN1Y2ggYSB0aGluZywgYnV0IGZvciBub3csIEkgd2ls
bAo+ID4+Pj4gdGFrZSB0aGUga2VybmVsIG91dHB1dCBhcyBhIHJvdWdoIGVzdGltYXRpb24gd2hh
dCBtaWdodCByZWFsbHkgYmUKPiA+Pj4+IHVzZWQgb24gdGhlIGJvYXJkLgo+ID4+Pj4KPiA+Pj4K
PiA+Pj4gSG93IGFib3V0IG5hbWluZyB0aGVtIHNvbWV0aGluZyBsaWtlICJ1cGRhdGVkLWZsYXNo
LW5hbWUgfHwKPiA+Pj4gZmlyc3QtbmFtZSIuCj4gPj4+IEFueXdheSwgdGhlc2UgYXJlIGp1c3Qg
d29ya2Fyb3VuZHMuIE1hbnVmYWN0dXJlcnMgc2hvdWxkbid0IHVzZSB0aGUKPiA+Pj4gc2FtZQo+
ID4+PiBKRURFQyBJRCBmb3IgbmV3IGZsYXNoZXMuIFRoZXkgc2hvdWxkIGF0IGxlYXN0IGFkZCBh
biBleHRlbmRlZCBJRC4KPiA+Pgo+ID4+IE1oLCB3aGF0IGFib3V0IGEgbGlzdCBvZiBuYW1lcz8g
SSBtZWFuIHllcyBpdCBpcyBhIHdvcmthcm91bmQsIGJ1dAo+ID4+IHRoZXJlIGlzIGFjdHVhbCBo
YXJkd2FyZSBkb2luZyB0aGlzLCBzbyBJTUhPIGxpbnV4IGhhcyB0byBkZWFsIHdpdGgKPiA+PiBp
dCBpbiBzb21lIHdheS4gT1RPSCB0aGF0IGxpc3QgbWlnaHQgYmUgbG9uZyBhbmQgZG9lc24ndCBs
b29rIGdvb2QKPiA+PiBpbiBkbWVzZyAob3Igd2hlcmV2ZXIgdGhhdCBzdHJpbmcgbWlnaHQgYmUg
dXNlZCkuCj4gPj4KPiA+PiBJdCBtaWdodCBjb21lIGluIGhhbmR5IHRvIGhhdmUgYSBtZWNoYW5p
c20gaW4gcGxhY2UgaWYgc29tZW9uZQo+ID4+IHJlYWxseSBjYXJlcyBhYm91dCBpdCB0aG91Z2gu
Cj4gPj4KPiA+Cj4gPiBBIGxpc3Qgb2YgbmFtZXMgd2l0aCBkaWZmZXJlbnRpYXRpb24gYXQgcnVu
LXRpbWUsIHdoZXJlIHBvc3NpYmxlLAo+ID4gc291bmRzIGdvb2QuIE90aGVyd2lzZSB3ZSdsbCBz
dGljayB0byBhIGRlZmF1bHQgbmFtZSwgd2hhdGV2ZXIgdGhhdAo+ID4gd2lsbCBiZS4gRG8geW91
IGNhcmUgdG8gc2NyYXRjaCBhIHBhdGNoIGZvciB0aGUgbGlzdCBvZiBuYW1lcyBpZGVhPwo+ID4K
PiA+IFdlJ2xsIHN0aWxsIGhhdmUgYSBzaW5nbGUgZmxhc2ggZW50cnksIHdpdGggYSBsaXN0IG9m
IG5hbWVzLCBhbmQgd2UKPiA+IHN0aWxsIG5lZWQgdG8gZWl0aGVyIGRvIHRoZSBTRkRQIGRldGVj
dGlvbiBmaXJzdCwgb3IgdG8gdHJpZ2dlciB0aGUKPiA+IFNGRFAgZGV0ZWN0aW9uIHdpdGggYW4g
ZXhwbGljaXQgZmxhc2ggaW5mbyBmbGFnLiBJJ2xsIGZvbGxvdyBQcmF0eXVzaCdzCj4gPiBzdGVw
cyBhbmQgZXZhbHVhdGUgdGhlICJkZXRlY3QgU0ZEUCBmaXJzdCIgaWRlYS4KPiA+Cj4KPiBJZiB3
ZSBkbyBnbyBkb3duIHRoZSByb2FkIG9mICJkZXRlY3QgU0ZEUCBmaXJzdCIsIHdlIHNob3VsZCBh
ZGQKPiBTUElfTk9SX1NLSVBfU0ZEUCB0byBmbGFzaGVzIHRoYXQgY3VycmVudGx5IGRvbid0IGNs
YWltIERVQUwvUVVBRC9PQ1RBTAo+IGNhcGFiaWxpdHkgY3VycmVudGx5IGluIG9yZGVyIHRvIGF2
b2lkIGFueSBzdXJwcmlzZXMgZHVlIHRvIHdyb25nIHZhbHVlcwo+IGluIHRoZSB0YWJsZS4KCkRv
ZXMgdGhpcyBtZWFuIHRoYXQgYWxsIGVudHJpZXMgdGhhdCBoYXZlIERVQUwvUVVBRC9PQ1RBTCBk
ZWZpbmVkIGNhbgpoYXZlIHRoZW0gcmVtb3ZlZCBBbmQgdGhlIGNvcnJlY3QgdmFsdWVzIHdpbGwg
YmUgZGV0ZWN0ZWQvc2V0IGJ5IFNGRFA/CgotLSAKSGVpa28KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
