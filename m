Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF9EC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 07:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CF164E68
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 07:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CF164E68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WgBZb0auZVgaPKd1X6+msjx+QAdZ/sjoXMgVKIGTwsk=; b=PK2m1sntY9tk01wtO9iESAu/P
	O51mIS68m5JlHAF9jepPQuMfGhL0suJu5HgBnlaF2g21Aj67i/S+/gdl6q9FjvyZXhXK8+aiOXhgU
	ytfR7cc/TnGdL+STcLJX9JowzAbkSPe8L6P2wfboc4XL9W0MvL6bVK4GbfHrEzHjGz2BvRn8ouCJD
	qu7jqlwNb1lmbUwBitDBOOwQ02Zi5ExpRIajWLaYuBO5xbzkUUbUAChVALGAx44betxp3HfW1fwYl
	zqB2TxYQs4EGDzOXuANryJgVOT8iusxhAhMX9SiJQtaeibP/GyedFY6NcweB/HuZ4EA9zfkAFjIfW
	7pyK4+1gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCdX3-0001YW-Mp; Thu, 18 Feb 2021 07:15:25 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCdWz-0001Y5-UD
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 07:15:23 +0000
Received: by mail-io1-xd33.google.com with SMTP id a7so978927iok.12
 for <linux-mtd@lists.infradead.org>; Wed, 17 Feb 2021 23:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZNFPkJ4OYHirDwdaMJskHmcYw62wS8549Eel6XQsIGQ=;
 b=g91lVyyl+qmUuj5qD+W2KutV2T6VIwclMdLESh600xtjd+MFxrOWOo+uC4h9N4+Hpo
 CUjXXKmAfW3NV/DYauLHtH3qRc6Co9aoqXAjUJAK7s3YsfbXixYO8RWxZGecF60DkJjb
 uk2NrWId81CP4b53L6ClXmk79nZkIFTzohbF+JdSjOrojKbtBOojIgG7v8L9NKVWPaVl
 ihj1RD9C2ycpHb4Sw/TuWruqnZ9UuWuTHu6U124/xn6v/MdNVXxv3LHr6AIMwA3mLa5g
 PXfwqckBJVVO8TeiPEYxessmAwNX6dXx7rc1arLPRAvCKUO9YmEUeOaymfNLAUFyp9J/
 vjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZNFPkJ4OYHirDwdaMJskHmcYw62wS8549Eel6XQsIGQ=;
 b=c0uedDTYpqqVH2yhbg/MnZAXIePCnok7aFDl0hYY2nxd4fc8OZBeIWROZpRU1fYsVA
 hnfris9Y51KLsp04ILusCMTk8IWDiMPvLplC/gNaVDWzEEUFbyvaAM57Laso+LUxCu0I
 PhQK/XZ4Pf648Sv1jrVZ6aAn0OssxIh4knYL1X3m345S/AwiUDBmJg2riaUJAgOwUctf
 f6XF3dkJEwUy++xhgD6tqA6AqADJPBqf0T7N/jzhvWEQTbRvXJrhNqa9bVcwhES3BF2/
 XqFHOG3HruQtnMzakW0Xh/hhUT3iLzsOzCLmbFKL/doTXJ+OoI0YZzJO+8lT/PdbEiVK
 KU3g==
X-Gm-Message-State: AOAM532pZsrQkLsb/ESdpyC5cBxOz27GNMQAsc0a+JvY0fLY8+e3sBkT
 lyypUsulDtyCGY2cnwQqgeu2VQT8ZHs2nF/8dbQ=
X-Google-Smtp-Source: ABdhPJzU2FQb/sAzn19kXfosB/7x8B8+BV/6aFBEklr+Epn4vTzlTmSYr+FPlLjyOlExXthKn6Bj/S1aeutDu2d+H7c=
X-Received: by 2002:a5d:818b:: with SMTP id u11mr2445614ion.59.1613632518881; 
 Wed, 17 Feb 2021 23:15:18 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <OFCC984357.9DDA18A5-ON48258680.001E5476-48258680.001F9A54@mxic.com.tw>
In-Reply-To: <OFCC984357.9DDA18A5-ON48258680.001E5476-48258680.001F9A54@mxic.com.tw>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 18 Feb 2021 08:15:07 +0100
Message-ID: <CAEyMn7YPx8hQ1wX==gNbk7PHeWm_ugxiL1=23aDEDFhBzGQ9bw@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: zhengxunli@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_021522_025573_D13356A5 
X-CRM114-Status: GOOD (  35.51  )
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
Cc: Tudor.Ambarus@microchip.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 p.yadav@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWmhlbmd4dW4sCgpBbSBEby4sIDE4LiBGZWIuIDIwMjEgdW0gMDY6NDcgVWhyIHNjaHJpZWIg
PHpoZW5neHVubGlAbXhpYy5jb20udHc+Ogo+Cj4gSGksCj4KPiA8VHVkb3IuQW1iYXJ1c0BtaWNy
b2NoaXAuY29tPiB3cm90ZSBvbiAyMDIxLzAyLzE2IOS4i+WNiCAwNzoxNTozMzoKPgo+ID4gPFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4KPiA+IDIwMjEvMDIvMTYg5LiL5Y2IIDA3OjE1Cj4g
Pgo+ID4gVG8KPiA+Cj4gPiA8bWljaGFlbEB3YWxsZS5jYz4sIDxwLnlhZGF2QHRpLmNvbT4sIDx5
Y2xsaW5AbXhpYy5jb20udHc+LAo+ID4gPHpoZW5neHVubGlAbXhpYy5jb20udHc+LCA8anVsaWVu
c3VAbXhpYy5jb20udHc+LAo+ID4KPiA+IGNjCj4gPgo+ID4gPGhlaWtvLnRoaWVyeUBnbWFpbC5j
b20+LCA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gPgo+ID4gU3ViamVjdAo+ID4K
PiA+IFJlOiBzcGktbm9yOiBtYXhyb25peCBNWDI1TDEyODM1RiBzdXBwb3J0Cj4gPgo+ID4gSGks
IGFsbCwKPiA+Cj4gPiAremhlbmd4dW5saSwganVsaWVuc3UgJiB5Y2xsaW4KPiA+Cj4gPiBPbiAy
LzE2LzIxIDExOjQ4IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4gPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQo+ID4g
a25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPiA+Cj4gPiA+IEFtIDIwMjEtMDItMTYgMTA6Mjcs
IHNjaHJpZWIgUHJhdHl1c2ggWWFkYXY6Cj4gPiA+PiBPbiAxNS8wMi8yMSAxMDo1M1BNLCBIZWlr
byBUaGllcnkgd3JvdGU6Cj4gPiA+Pj4gSGkgYWxsLAo+ID4gPj4+Cj4gPiA+Pj4gSSBmYWNlZCBh
biBpc3N1ZSB3aXRoIGEgU1BJIGZsYXNoIG9uIG91ciBib2FyZC4gV2UgdXNlIGEgbWFjcm9uaXgK
PiA+ID4+PiBNWDI1TDEyODM1RiBbMV0uIFVuZm9ydHVuYXRlbHkgdGhpcyBmbGFzaCBoYXMgdGhl
IHNhbWUgSkVERUMgSUQgbGlrZQo+ID4gPj4+IHRoZSBNWDI1TDEyODA1RCBbMl0uCj4gPiA+Pj4K
PiA+ID4+PiBUaGUgbmV3ZXIgTVgyNUwxMjgzNUYgaGFzIHN1cHBvcnQgZm9yIGR1YWwvcXVhZCBy
ZWFkIG1vZGUgYW5kIFJEU0ZEUAo+ID4gPj4+IHdoaWxlIHRoZSBvbGRlciBkb2Vzbid0Lgo+ID4g
Pj4+Cj4gPiA+Pj4gSSB0aG91Z2h0IHRoYXQgSSBjb3VsZCBkbyBhIGZpeHVwIHdpdGggYSBkZXZp
Y2Ugc3BlY2lmaWMKPiA+ID4+PiBwb3N0X2JmcHRfZml4dXBzKCkgY2FsbCBidXQgYnkgbm93IHRo
aXMgc2VlbXMgbm90IHBvc3NpYmxlLiBUaGUKPiBvbGRlcgo+ID4gPj4+IE1YMjVMMTI4MDVEIGhh
cyBubyBmbGFncyBzZXQgdGhhdCBhbGxvd3MgYSBjYWxsIHRvCj4gPiA+Pj4gc3BpX25vcl9zZmRw
X2luaXRfcGFyYW1zKCkgYW5kIGltcGxlbWVudHMgdGhlIGZpeHVwLgo+ID4gPj4+Cj4gPiA+Pj4g
SGFzIGFueW9uZSBhbiBpZGVhIGhvdyB0byBzb2x2ZSB0aGlzPwo+ID4KPiA+IE1heWJlIG1hY3Jv
bml4IGNhbiBoZWxwIHdpdGggc29tZSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gZGlmZmVyZW50aWF0
ZQo+ID4gYmV0d2VlbiBmbGFzaGVzIGF0IHJ1bnRpbWUuCj4KPiBJbiBmYWN0LCB0aGUgZHVwbGlj
YXRlIElEIGFsc28gY2F1c2VkIHVzIHRyb3VibGUuIE1heWJlIHlvdSBjYW4gcmVmZXIgdG8KPiBv
dXIgY29sbGVhZ3VlcycgcGF0Y2hlcyBhbmQgYWRkIGEgbmV3IElEIGJlZm9yZSB0aGUgb2xkIElE
LgoKQnV0IGRvZXNuJ3QgdGhhdCBtZWFuIEkgaGF2ZSB0byBleHBsaWNpdGx5IHNldCB0aGUgcmln
aHQgdXNlZCBmbGFzaApkZXZpY2UgaW4gbXkgZHRiPyBDdXJyZW50bHkgSSBoYXZlIHNldCAiamVk
ZWMsc3BpLW5vciIgYW5kIGxldCB0aGUKbXRkL3NwaSBzdWJzeXN0ZW0gZmluZCB0aGUgcmlnaHQg
dmFsdWVzIHRvIHVzZS4gQXMgd2UgaGF2ZSAyIG90aGVyCmRldmljZXMgYXMgYWx0ZXJuYXRpdmVz
IEkgd291bGRuJ3QgbGlrZSB0byBkbyB0aGF0LgoKQW5kIHdoYXQgYWJvdXQgdGhlIG9sZCBkZXZp
Y2UuIFdpbGwgdGhpcyBvbmUgYmUgY29ycmVjdGx5IGNvbmZpZ3VyZWQKd2hlbiBkZXRlY3Rpbmcg
YXV0b21hdGljYWxseT8KCj4KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXgtbXRkL3BhdGNoLzE1ODc2MzExMjMtMjU0NzQtMi1naXQtc2VuZC1lbWFpbC1tYXNvbmNj
eWFuZ0BteGljLmNvbS50dy8KPgo+ID4gTXkgZmlyc3QgdGhvdWdodCBpcyB0byBpbnRyb2R1Y2Ug
YSBTUElfTk9SX0hBU19TRkRQIGZsYWcuIEZvciB0aGUgZmxhc2gKPiA+IHRoYXQgZG9lc24ndCBz
dXBwb3J0IFNGRFAgdGFibGVzLCB0aGVyZSBzaG91bGQgYmUgbm8gZnVuY3Rpb25hbCBjaGFuZ2Us
Cj4gPiBmb3IgdGhlIG9uZSB0aGF0IHN1cHBvcnQgU0ZEUCBpdCBzaG91bGQgZmlsbCB0aGUgcHJv
cGVydGllcyBmcm9tIHRoZQo+ID4gU0ZEUCB0YWJsZXMuCj4gPgo+ID4gPj4KPiA+ID4+IFRoZSBw
b3N0X3NmZHAgZml4dXAgaXMgYWx3YXlzIHJ1biByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIGZs
YXNoIGhhcwo+ID4gPj4gU0ZEUCBvciBub3QuIFlvdSBjYW4gdHJ5IHB1dHRpbmcgeW91ciBmbGFz
aC1zcGVjaWZpYyBmaXh1cHMgdGhlcmUuCj4gPiA+Cj4gPiA+IFdlbGwgdGhlIHByb2JsZW0gaGVy
ZSBpcywgdGhhdCB0aGUgU0ZEUCBzZXR1cCBpcyBza2lwcGVkIHRob3VnaCB0aGUKPiA+ID4gZmxh
c2ggd291bGQgc3VwcG9ydCBTRkRQLiBJZiB0aGUgamVkZWMgaWQgd2Fzbid0IGFscmVhZHkgaW4g
dGhlIHRhYmxlLAo+ID4gPiB0aGVyZSB3b3VsZCBiZSB0aGUgZmxhZyBTUElfTk9SX1FVQURfUkVB
RCBhbmQgdGhlIFNGRFAgd291bGQgYmUKPiA+ID4gcGFyc2VkLiBCdXQgYmVjYXVzZSB0aGVyZSBp
cyBhbHJlYWR5IHRoZSBsZWdhY3kgZGV2aWNlICh3aGljaCBsaWtlbHkKPiA+ID4gZG9lc24ndCBz
dXBwb3J0IFNGRFApIGl0IHJlYWxseSBkb2Vzbid0IGZpdC4KPiA+ID4KPiA+ID4gSXRzIHVuY2xl
YXIgdG8gbWUsIHdoeSB0aGUgU0ZEUCBpcyBvbmx5IHBhcnNlZCBpZiBvbmUgb2YgdGhlCj4gPiA+
IFNQSV9OT1JfKl9SRUFEIGZsYWdzIGFyZSBzZXQuCj4gPgo+ID4gTXkgZ3Vlc3MgaXMgdGhhdCBh
IG5ldyBTRkRQIGZsYWcgd2FzIG5vdCBuZWNlc3NhcnkuIFNGRFAgZGVmaW5lcwo+IG11bHRpcGxl
Cj4gPiB0YWJsZXMsIGJ1dCB0aGVyZSBpcyBqdXN0IG9uZSB0aGF0IGlzIG1hbmRhdG9yeSwgQkZQ
VC4gQkZQVCBkZWZpbmVzIERVQUwKPiA+IGFuZCBRVUFEIHBhcmFtZXRlcnMuIEZyb20gdGhlIHNw
aS1ub3IgY29kZSwgYSBCRlBUIHdpdGhvdXQgRFVBTCBvciBRVUFECj4gPiBzdXBwb3J0IGRvZXNu
J3QgbWFrZSBzZW5zZSwgZXZlbiB0aG91Z2ggRFVBTCBvciBRVUFEIGFyZSBub3QgbWFuZGF0b3J5
Cj4gPiBpbiBCRlBUIGFzIEkgc2VlIGluIHRoZSBzdGFuZGFyZC4gU28gcHJvYmFibHkgaXQgd2Fz
IGp1c3QgYSB3YXkgdG8gYXZvaWQKPiA+IGFkZGluZyBhIGV4dHJhIGZsYWcuIFdlIGhhdmUgdG8g
Y2hlY2sgdGhlIGdpdCBoaXN0b3J5IGZvciBhIG1vcmUKPiBhY2N1cmF0ZQo+ID4gZGVzY3JpcHRp
b24sIHRoaXMgd2FzIGp1c3QgYSBndWVzcy4KPiA+Cj4gPiBUaGlua2luZyBsb3VkLCBub3cgd2Ug
ZG8gYSBzdGF0aWMgaW5pdGlhbGl6YXRpb24gb2YgZmxhc2ggcGFyYW1zLCB0aGF0Cj4gPiBjYW4g
YmUgb3ZlcndyaXR0ZW4gZHluYW1pY2FsbHkgYnkgU0ZEUC4gSG93IGFib3V0IGRvaW5nIHRoZSBw
YXJhbXMgaW5pdAo+ID4gdGhlIG90aGVyIHdheSBhcm91bmQuIFRyeSBmaXJzdCB0byBkeW5hbWlj
YWxseSBkaXNjb3ZlciB0aGUgcGFyYW1zIHZpYQo+ID4gU0ZEUCwgYW5kIGlmIFNGRFAgZmFpbHMg
b3IgaWYgaXQgaXMgbm90IGRlZmluZWQsIGRvIHRoZSBzdGF0aWMgaW5pdCB2aWEKPiA+IGZsYWdz
LiBUaGF0IHdvdWxkIHNwYXJlIHNvbWUgY29kZS4gQW5kIG5ldyBmbGFzaCBJRHMgd2lsbCBoYXZl
IGxlc3MKPiBmbGFncwo+ID4gZGVjbGFyZWQsIGFuZCB3ZSdsbCBiZXR0ZXIgdHJhY2sgZmF1bHR5
IFNGRFAgZmxhc2hlcy4KPiA+Cj4KPiBUaGFua3MsCj4gWmhlbmd4dW4KClRoYW5rIHlvdQotLSAK
SGVpa28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
