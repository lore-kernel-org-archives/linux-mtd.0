Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C281C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDFX3MAHOf/TXx2nbG2IZHnW1Dfejo1M1j2tQ7JWRxM=; b=CuWxFCvbEoRNTE
	TUYT2eZKLtasqRmaWR6xpmwhcX9kSaavbuQkKDBt4Zsol7+ObiVGo99WXK6XH9EXtrWw32xPz/ZDP
	krXOi6WWnKAHiGPaNAhyZ4TWz+cl9xq+OA0GLlPfeFr3Cll7AlwjeKScaacRXHzo01sQvsB/5Fynr
	AjYgwZaHVc1E/QfQFOBAhMmRXhmwXFMHLQxAbCOvv2iE30XKPfiCRpADQvuAmEZ4suAtLGyZxsHh4
	YN4FWIAWV01Rzx0EuBw25AeAmNXHou8K0g87+A7T1uoSx/fZgqjPfUt9gmYRdyav0pfDDp29825I6
	8plphpbCftLmLFCpq4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiLW-008vBf-2Q; Mon, 13 Dec 2021 10:14:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwi1d-008mWr-74
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 09:53:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 746991F44A0B;
 Mon, 13 Dec 2021 09:53:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639389219; bh=KzIEkt0Pnf8oSDZnNFpPbqadcja3KMzzDBPP+J7Iedw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fv5HNHGpu9Wq5mN73A3tH5QrrgoMtr+yrsL+2S0pRK+J2FH0PL+jp3VvGsKYNNM2q
 RHF5VljJ/gHNCc+MfqvKVQHX9OJ3CKPIJtN6w3OB41Ge6nNrwhH1e482E85TVrAbTH
 6Q4UmdCifr3weDEFoXJc2YBRopfsIdIWID3/HxgVq/8Kjp3qLgmGpumhltKW9NkT3l
 bmlrEZkVCqG7tJp5Nw9k3L1sWrjOSJjIGcffzt4fszjFSwnhIHnJk0cAGrHXtD9vbL
 WcDooXyWzU/26+xh55+cu/UzML7o7z+CGCQ+4P4jk5+7qG4axnMKLmuShQEdmA1Q3E
 VnLlrL9Gkm/Fw==
Date: Mon, 13 Dec 2021 10:53:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sean Nyekjaer <sean@geanix.com>, linux-kernel@vger.kernel.org, Marek
 Szyprowski <m.szyprowski@samsung.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211213105336.7be369b7@collabora.com>
In-Reply-To: <20211213103350.22590c13@xps13>
References: <20211129101908.6f1aa715@xps13>
 <20211129094129.xn364czofrgtvfb4@skn-laptop>
 <63be9121-18c3-1ef2-c448-f99fb861490f@samsung.com>
 <20211130124131.6pgu7enjgk6y536m@skn-laptop>
 <20211130141551.400331c8@collabora.com>
 <20211130132912.v6v45boce2zbnoy3@skn-laptop>
 <20211130143705.5d0404aa@collabora.com>
 <20211203143958.40645506@xps13>
 <20211209140721.6ki7gznvxwyn3cze@skn-laptop.hinnerup>
 <20211209152811.318bdf17@xps13>
 <20211210132535.gy7rqj5zblqlnz5y@skn-laptop.hadsten>
 <20211213101025.42c27b43@xps13>
 <20211213102801.569b50b1@collabora.com>
 <20211213103350.22590c13@xps13>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_015341_453225_BBEF104F 
X-CRM114-Status: GOOD (  22.08  )
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

T24gTW9uLCAxMyBEZWMgMjAyMSAxMDozMzo1MCArMDEwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gYm9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20gd3JvdGUgb24gTW9uLCAxMyBEZWMgMjAyMSAxMDoyODowMSArMDEwMDoK
PiAKPiA+IE9uIE1vbiwgMTMgRGVjIDIwMjEgMTA6MTA6MjUgKzAxMDAKPiA+IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gSGkgU2Vh
biwKPiA+ID4gCj4gPiA+IHNlYW5AZ2Vhbml4LmNvbSB3cm90ZSBvbiBGcmksIDEwIERlYyAyMDIx
IDE0OjI1OjM1ICswMTAwOgo+ID4gPiAgICAgCj4gPiA+ID4gT24gVGh1LCBEZWMgMDksIDIwMjEg
YXQgMDM6Mjg6MTFQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogICAgICAKPiA+ID4gPiA+
IEhpIFNlYW4sCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHNlYW5AZ2Vhbml4LmNvbSB3cm90ZSBvbiBU
aHUsIDkgRGVjIDIwMjEgMTU6MDc6MjEgKzAxMDA6Cj4gPiA+ID4gPiAgICAgICAgIAo+ID4gPiA+
ID4gPiBPbiBGcmksIERlYyAwMywgMjAyMSBhdCAwMjozOTo1OFBNICswMTAwLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOiAgICAgICAgCj4gPiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPiA+ID4gICAg
ICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gPiBGaW5lIGJ5IG1lLCBsZXRzIGRyb3AgdGhpcyBzZXJp
ZXMuICAgICAgICAgIAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEZZSSBJJ3ZlIGRyb3Bw
ZWQgdGhlIGVudGlyZSBzZXJpZXMgZnJvbSBtdGQvbmV4dC4gSSdtIHdhaXRpbmcgZm9yIHRoZQo+
ID4gPiA+ID4gPiA+IGZpeCBkaXNjdXNzZWQgYmVsb3cgKHdpdGhvdXQgYWJ1c2luZyB0aGUgY2hp
cCBtdXRleCA7LSkgKS4gICAgICAgICAgCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBDb29sLCBs
b29raW5nIGZvcndhcmQgdG8gdGVzdCBhIHBhdGNoIHNlcmllcyA6KSAgICAgICAgCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IFRlc3Q/IFlvdSBtZWFuICJ3cml0ZSI/IDopCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IENoZWVycywKPiA+ID4gPiA+IE1pcXXDqGwgICAgICAgIAo+ID4gPiA+IAo+ID4gPiA+IEhp
IE1pcXVlbCwKPiA+ID4gPiAKPiA+ID4gPiBTaG91bGQgd2UgdXMgYSBhdG9taWMgZm9yIHRoZSBz
dXNwZW5kZWQgdmFyaWFibGU/ICAgICAgCj4gPiA+IAo+ID4gPiBJIGhhdmVuJ3QgdGhvdWdodCBh
Ym91dCBpdCBleHRlbnNpdmVseSwgYW4gYXRvbWljIHZhcmlhYmxlIHNvdW5kIGZpbmUKPiA+ID4g
YnV0IEkgYW0gZGVmaW5pdGVseSBub3QgYSBsb2NraW5nIGV4cGVydC4uLiAgICAKPiA+IAo+ID4g
Tm8gbmVlZCB0byB1c2UgYW4gYXRvbWljIGlmIHRoZSB2YXJpYWJsZSBpcyBhbHJlYWR5IHByb3Rl
Y3RlZCBieSBhIGxvY2sKPiA+IHdoZW4gYWNjZXNzZWQsIGFuZCB0aGlzIHNlZW1zIHRvIGJlIGNh
c2UuICAKPiAKPiBNYXliZSB0aGVyZSB3YXMgYSBjb25mdXNpb24gYWJvdXQgdGhpcyBsb2NrOiBJ
IHRoaW5rIEJvcmlzIGp1c3QgZG8gbm90Cj4gd2FudCB0aGUgY29yZSB0byB0YWtlIGFueSBsb2Nr
IGR1cmluZyBhIHN1c3BlbmQgb3BlcmF0aW9uLiBCdXQgeW91IGNhbgo+IHN0aWxsIHVzZSBsb2Nr
cywgYXMgbG9uZyBhcyB5b3UgcmVsZWFzZSB0aGVtIGJlZm9yZSBzdXNwZW5kaW5nLgo+IAo+IEFu
ZCBhbHNvLCB0aGF0IGNoaXAgbG9jayBtaWdodCBub3QgYmUgdGhlIG9uZSB5b3Ugd2FudCB0byB0
YWtlIGJlY2F1c2UKPiBpdCdzIGJlZW4gaW50cm9kdWNlZCBmb3IgYW5vdGhlciBwdXJwb3NlLgoK
QWNjZXNzIHRvIHRoZSBzdXNwZW5kZWQgZmllbGQgaXMgYWxyZWFkeSBwcm90ZWN0ZWQgYnkgdGhl
IGNoaXAgbG9jaywKYW5kIEkgdGhpbmsgaXQncyBqdXN0IGZpbmUgdG8ga2VlcCBpdCB0aGlzIHdh
eS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
