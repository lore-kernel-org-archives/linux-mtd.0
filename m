Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF70EC04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 22:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD1B20881
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 22:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hro3WTe0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD1B20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mz8lzoUMmffUYTLk+LYY1sZs2Q/2WXyiIFbzQ1s6n9E=; b=hro3WTe0vAJgRrTHWPg5Pd7XI
	3msXI116RQljq39QQoHaQt4PwxGDorOZgKc2cX163Mr7BvUh78m87hB8elETv796Qg7ce2BiXLwhT
	Ixug6yIokK1cGF2chDSOpsUQHASP55BPhSYJY4Kty/VwYc9xvI6UbQCx4xRt93DD3Anv/5YG5QX/M
	9XI4/12+Ghv5HPaRCVkTGNG8Kty6vCnmGw4DMl4C/PkjcsC9E25jb3iBKXQ9tAz5ozesFXP26L9/q
	P99kZZmWXa5yFbwx/WSLM+GwKGYqfTarYO1FvW559kvCTNx2Ra7MurPO00P5+XycGGS/FaoTvW2BX
	VtP8eqeOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQfak-0004q3-Tf; Tue, 14 May 2019 22:08:10 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQfah-0004pY-Gc
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 22:08:08 +0000
Received: from jkletsky-mbp15.guidewire.com (inet.guidewire.com [199.91.42.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 34FB83B926;
 Tue, 14 May 2019 15:08:06 -0700 (PDT)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>
References: <20190510121727.29834-1-lede@allycomm.com>
 <3cb32209-f246-e562-2aee-fdf566a60b30@kontron.de>
 <1023ba21-b188-1dcc-3ecc-c563d4cb8a67@allycomm.com>
 <e53a0569-6eca-4385-007d-baffc3f5c7ea@kontron.de>
 <20190514220136.5f4624ee@xps13>
From: Jeff Kletsky <lede@allycomm.com>
Message-ID: <e38f0f4b-1881-0e2f-22ad-5f5c4fccaa4b@allycomm.com>
Date: Tue, 14 May 2019 15:08:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514220136.5f4624ee@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_150807_562476_85EFD48C 
X-CRM114-Status: GOOD (  14.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNS8xNC8xOSAxOjAxIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgoKPiBIaSBTY2hyZW1wZiwK
Pgo+IFNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4gd3JvdGUg
b24gVHVlLCAxNCBNYXkKPiAyMDE5IDE2OjExOjI4ICswMDAwOgo+Cj4+IEhpIEplZmYsCj4+Cj4+
IE9uIDE0LjA1LjE5IDE3OjQyLCBKZWZmIEtsZXRza3kgd3JvdGU6Cj4+PiBPbiA1LzEzLzE5IDY6
NTYgQU0sIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6Cj4+PiAgICAKPj4+PiBIaSBKZWZmLAo+Pj4+
Cj4+Pj4gWy4uLl0KPj4+PiBNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc3BsaXQgdGhpcyBw
YXRjaCBpbnRvIHRocmVlIHBhcnRzOgo+Pj4+ICogQWRkIHN1cHBvcnQgZm9yIHR3by1ieXRlIGRl
dmljZSBJRHMKPj4+PiAqIEFkZCAjZGVmaW5lLXMgZm9yIHRocmVlLWJ5dGUgYWRkcmVzc2luZyBm
b3IgcmVhZCBvcHMKPj4+PiAqIEFkZCBzdXBwb3J0IGZvciBHRDVGMUdRNFVGeHhHCj4+Pj4KPj4+
PiBBbnl3YXkgdGhlIGNvbnRlbnQgbG9va3MgZ29vZCB0byBtZSwgc286Cj4+Pj4KPj4+PiBSZXZp
ZXdlZC1ieTogRnJpZWRlciBTY2hyZW1wZjxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4+
Pj4KPj4+PiBbLi4uXQo+Pj4gWy4uLl0KPiBJIGFncmVlIHdpdGggRnJpZWRlciwgaWYgeW91IGRv
bid0IG1pbmQsIHBsZWFzZSBzcGxpdCB0aGlzIGNvbW1pdCBpbgo+IHRocmVlLgo+Cj4gVGhhbmtz
LAo+IE1pcXXDqGwKPgpTcGxpdCBhbmQgc3VwZXJzZWRlZCBieQpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvP3Nlcmllcz0xMDc4NzQKCkplZmYKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
