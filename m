Return-Path: <SRS0=Dlpg=BJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5F5C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 14:19:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA602070B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 14:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IgFCJOKm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="ajYisd7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA602070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S60yqPBuj0bk7HQCL84wai5in1YYeSth87e3RwGi/qc=; b=IgFCJOKmEEiGieA5UrfXtCPE0
	CZXEzGYM+z0EHOqB/qjKO/M9AUs3igORKnWB3boRrkALCeFm+h4NNNmj+Dy2bwOg1fm05T6n1gjJO
	Glgj8DMhCxS4Dr/ygEKzBOkjpjzQv3E9JQzCDft5oz8q1FO/0mpeNCK78wk4Up0mYwOB4Jpe4mskJ
	1NrxECUi/6+QxWcg2xx5fusEa2iD0UlA7RAGJhe4tOltDmrIS2cng4K/THsX3GiPKBIscyPiDugR9
	tvW0ls+fTEL2PBjhL773mSSBn4H2/U72g/P19eEx/RROcDQKl8jpec1tdBSfNcoemclOj+zAbakav
	95awile2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k19OG-0002ct-St; Thu, 30 Jul 2020 14:18:36 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k19OD-0002br-Qr
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2020 14:18:35 +0000
Received: by mail-qk1-x742.google.com with SMTP id g26so25740416qka.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jul 2020 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XZbJJB2Vd7z56HA7iaeVyLLV94QolOdPT5I5Lnt/lZQ=;
 b=ajYisd7S9lMISpmj4yTD1guZg5Hd2IkN+h3NlyEOzRtlvrIgkGLifmMGxwp1h27nIC
 DmY758wMp1tqUHR1ddz5M59vrwtpyXhRrnppwWk2HqR+BOBLQEBPCkaCdvF5kjnmqkzx
 wiyX8jzOUI2hOo5EBoQf/R5yVQPlA5xhinTUzvt7SdRhrZga21gPabubZN54/pccIHZJ
 sMNRKZh2ENDhLuV2kQc6+N1xMO1LaJ1JlKjgTsaSwSCjmJeAqHOEJdQTBLhDYlPGErkm
 8UuarO+tg1nolZW9zlEK4MDxlU6WQscwrfB4CsaL/3X5fFjW5TWuYDCrvlRGNmBFhQFf
 V5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XZbJJB2Vd7z56HA7iaeVyLLV94QolOdPT5I5Lnt/lZQ=;
 b=DbFOc5sWIWzDVkdW7iQTC8nNYmAFYIA2EZ0p1+lKaJAL9+YbBxBusBte8+zDwTnkWj
 3dB0qRkDZEsJHp8xnmevSLdmIDEHG02Ye3HvONy4ItouC60utg9K5IawuNf9QBBxWYa2
 ONi/D6vbf0Rap4JYamPKyunc4nDES4x1mP68ChgJVYI/a7MybD7WhJ6ZkO0rb++Rzace
 WsHnk+/ODAjAYKTveBAU7Hc7R/PyfEIo0MuhbCR72DIEE/k/W4m2pDAi0brVIdnNz3Td
 0PBG+qF5hGxJYcG1L1M4yKwtYlGbxONWjJ3F2III31oSqp3Ibb9uFgurfqoVXMFWWqBZ
 OIQQ==
X-Gm-Message-State: AOAM531rIeSS+pPSrFLIqjbgegs8YuCQVLZnIqkA9Yu6/3ELfzSx6B1U
 bvDOVjSETWP5v0iKP85V3ssDClpNXgsA3Ws1h3fKwg==
X-Google-Smtp-Source: ABdhPJwNx1NlAJN42KEtdc2tz5YZMN4qeL9gMeY2g8ZNBeMlC7ltpPhdhuYSolG5jTfD4SdcSZBBXm/FOEZqqQJJqNM=
X-Received: by 2002:a37:9f0a:: with SMTP id i10mr7133510qke.368.1596118711204; 
 Thu, 30 Jul 2020 07:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
 <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
 <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
 <CAFmMkTEO7VNKJeYz2uoHsS-yN_aY8UuiQ2GcCq9NyAD5481ZGA@mail.gmail.com>
 <20200730053108.GA3861609@kroah.com>
 <CAFmMkTHXjfG7zMr0i_h65PvjAe4opPgvzdABH8W1EUGOmcA4Zg@mail.gmail.com>
 <CAK8P3a2SN3pdXV8=0jXfrsz8L64yV46fEM4zrSXfA25QK0GNuA@mail.gmail.com>
In-Reply-To: <CAK8P3a2SN3pdXV8=0jXfrsz8L64yV46fEM4zrSXfA25QK0GNuA@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Thu, 30 Jul 2020 11:18:20 -0300
Message-ID: <CAFmMkTFiqDtTw2v8RJktzY--WxGd7Fdz2fKA3YxXzA8ZiDS1XQ@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_101834_193553_8D113CD6 
X-CRM114-Status: GOOD (  22.44  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMTE6MDkgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAzMCwgMjAyMCBhdCAyOjIxIFBNIERhbmllbCBH
dXRzb24gPGRhbmllbEBlY2x5cHNpdW0uY29tPiB3cm90ZToKPiA+IEVsIGp1ZS4sIDMwIGp1bC4g
MjAyMCAyOjMxIGEuIG0uLCBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPiBlc2NyaWJpw7M6Cj4gPj4KPiA+PiBBZ2FpbiwgbW9kdWxlIHBhcmFtZXRlcnMgYXJl
IHdvcmtpbmcgb24gYSBwZXItY2h1bmstb2YtY29kZSBiYXNpcywgd2hpbGUKPiA+PiB5b3Ugd2Fu
dCB0byB3b3JrIG9uIGEgcGVyLWRldmljZSBiYXNpcywKPiA+Cj4gPgo+ID4gSSB0aGluayB0aGVy
ZSBpcyBhIG1pc3VuZGVyc3RhbmRpbmcuICBXaGF0IEkgd2FudCBpcyB0byBjb250cm9sICh0dXJu
IG9uIG9yIG9mZikgaXMgYSB2ZXJ5IHNwZWNpZmljIGNvZGUgc25pcHBldCB0aGF0IHByb3ZpZGVz
IHRoZSAiZnVuY3Rpb25hbGl0eSIgb2YgdHJ5aW5nIHRvIHR1cm4gdGhlIGNoaXAgd3JpdGFibGUu
IFRoZSByZXN0IG9mIHRoZSBkZXZpY2UgZHJpdmVyIGlzIGZpbmUuCj4gPiBJIGFzc3VtZSB0aGF0
IHRoZSBvbmUgdGhhdCBkb2Vzbid0IHVuZGVyc3RhbmQgaXMgbWUuCj4gPgo+Cj4gSSBsb29rZWQg
YXQgdGhlIHNvdXJjZSBjb2RlIGFnYWluIGFuZCBmb3VuZCB0aGF0IHRoZSBleGlzdGluZyBtb2R1
bGUKPiBwYXJhbWV0ZXIgYXBwbGllcyB0byBib3RoIHRoZSBwbGF0Zm9ybSBhbmQgcGNpIGRldmlj
ZSBmcm9udC1lbmRzLCBib3RoCj4gb2Ygd2hpY2ggZ28gdGhyb3VnaAo+Cj4gICAgICAgICAvKiBQ
cmV2ZW50IHdyaXRlcyBpZiBub3QgZXhwbGljaXRseSBlbmFibGVkICovCj4gICAgICAgICBpZiAo
IWlzcGktPndyaXRlYWJsZSB8fCAhd3JpdGVhYmxlKQo+ICAgICAgICAgICAgICAgICBpc3BpLT5u
b3IubXRkLmZsYWdzICY9IH5NVERfV1JJVEVBQkxFOwo+CgpJIHRoaW5rIHlvdSBtaXNzZWQKaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS1wY2kuYyNMNDQKCiAgICAvKiBUcnkgdG8gbWFr
ZSB0aGUgY2hpcCByZWFkL3dyaXRlICovCiAgICBwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwg
QkNSLCAmYmNyKTsKICAgIGlmICghKGJjciAmIEJDUl9XUEQpKSB7CiAgICAgICAgYmNyIHw9IEJD
Ul9XUEQ7CiAgICAgICAgcGNpX3dyaXRlX2NvbmZpZ19kd29yZChwZGV2LCBCQ1IsIGJjcik7CiAg
ICAgICAgcGNpX3JlYWRfY29uZmlnX2R3b3JkKHBkZXYsIEJDUiwgJmJjcik7CiAgICB9CgppbiB0
aGUgcHJvYmUgZnVuY3Rpb24sIGFuZCBpcyBleGVjdXRlZCBhbHdheXMgYW5kIHVuY29uZGl0aW9u
YWxseS4KCi8qIFRyeSB0byBtYWtlIHRoZSBjaGlwIHJlYWQvd3JpdGUgKi8KcGNpX3JlYWRfY29u
ZmlnX2R3b3JkKHBkZXYsIEJDUiwgJmJjcik7CmlmICghKGJjciAmIEJDUl9XUEQpKSB7CmJjciB8
PSBCQ1JfV1BEOwpwY2lfd3JpdGVfY29uZmlnX2R3b3JkKHBkZXYsIEJDUiwgYmNyKTsKcGNpX3Jl
YWRfY29uZmlnX2R3b3JkKHBkZXYsIEJDUiwgJmJjcik7Cn0KCj4gU2V0dGluZyB0aGUgUENJIGRl
dmljZSB3cml0YWJsZSBpbiBoYXJkd2FyZSBtYWtlcyBpdCBwb3NzaWJsZSB0bwo+IGFjdHVhbGx5
IHdyaXRlIHRvIGl0ICpvbmx5KiBpZiB0aGUgbW9kdWxlIHBhcmFtZXRlciBpcyBhbHNvIHNldCB0
byAnMScuCj4gT25lIG1pZ2h0IGRpc2FncmVlIHdpdGggdGhhdCBkZXNpZ24sIGJ1dCBJIGRvbid0
IHRoaW5rIHlvdXIgcGF0Y2gKPiB3b3VsZCBtYWtlIGl0IGFueSBiZXR0ZXIsIGl0IGp1c3QgbWVh
bnMgb25lIHdvdWxkIGhhdmUgdG8gc2V0Cj4gdHdvIG1vZHVsZSBwYXJhbWV0ZXJzIGluc3RlYWQg
b2Ygb25lLgo+Cj4gICAgICBBcm5kCgoKCi0tIApEYW5pZWwgR3V0c29uCkFyZ2VudGluYSBTaXRl
IERpcmVjdG9yCkVuZ2luaWVlcmluZyBEaXJlY3RvcgpFY2x5cHNpdW0KCkJlbG93IFRoZSBTdXJm
YWNlOiBHZXQgdGhlIGxhdGVzdCB0aHJlYXQgcmVzZWFyY2ggYW5kIGluc2lnaHRzIG9uCmZpcm13
YXJlIGFuZCBzdXBwbHkgY2hhaW4gdGhyZWF0cyBmcm9tIHRoZSByZXNlYXJjaCB0ZWFtIGF0IEVj
bHlwc2l1bS4KaHR0cHM6Ly9lY2x5cHNpdW0uY29tL3Jlc2VhcmNoLyN0aHJlYXRyZXBvcnQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
