Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192B2C77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXmaO+TAjAhws5+pfG2UnTUw5/szNVAotfIaoLUNA4Y=; b=k0vM7/q9aqJLNi
	W4NkXQYmRCCqVs6UGEHt/vBvhbSrqmp4d1NszFinOGMUERmENHxm5kRl0WJyccf7QOUi9P1MpJqbC
	tZXULpNkI74EcIKSQHFMOoouGjvod43SVtx44EypXLxMkAKDXqCnBJsFa3sFjA3QF641Mcihn5LQv
	j9XDaIT/KAYlC/oAA1jJ8tAawTZby4mKg3ZOBXY7lPdvcFwBCogPe+Vmjp9miut2KfEo/dvGVHsyg
	fkKHR/9Wb6o5Io1X9eIkyVjBbM4+J0yi13Nz5JkuQz0fACdRtpoC/i60Fj4fDMDmcVmQ9HVMsgoUY
	pzHswCEuXtT/5cyJAX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65kn-00EjcP-2F;
	Mon, 05 Jun 2023 08:39:53 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65kk-00Ejay-2O
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jun 2023 08:39:52 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685954385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NEMRNsdscbTD6NMLgzrnXZmkcIKkIRRDQ7fmKdMLLtY=;
	b=XtxA91YOgMEZ+1k1LsXOFKb+qwUtD/dvTceyDvJOaMFJ0pfQd71e0TayMBa7r3RlqHIofi
	Y2PhSSlhHYl6gYLlOS2In3UgU5B0VJhHY8dm45AQI7WZ0JajL0HS5tTEeUGlIS4lRmQWcQ
	B101QzswEUwWRtEau/+sym6SroA5hp+yHp+V+IKm/YUZAlq6DwwB9BcvRCqoB/91728Zl7
	F2Xho730HxTe+mfcKP8l51tcWLdJ2c+SqeRBRM7uhTCjd+YGODyFh2j56MOAEAX22Ch9Br
	HWaAt6WPg1gC5zZs1dE2RCceJwy/DvzlnNhgj3XOvP1IE2/27G0lKSmBGxMBEQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D997EC000C;
	Mon,  5 Jun 2023 08:39:44 +0000 (UTC)
Date: Mon, 5 Jun 2023 10:39:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Bean Huo <beanhuo@micron.com>, JaimeLiao <jaimeliao.tw@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Message-ID: <20230605103943.064d142e@xps-13>
In-Reply-To: <CAP1tNvTS=kW_pPM5Vn4COmCXR7L6wj+CXtKs_Tnf=UQk2i7=Bg@mail.gmail.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
	<20230526201420.231092a0@xps-13>
	<CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
	<20230529101240.53065e04@xps-13>
	<CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
	<20230529134619.255d0b07@xps-13>
	<PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvQg+3O6LOaAnAMXionvLUy2FkF7yWtjXUma-ZLL3EE7nQ@mail.gmail.com>
	<20230601093734.3c752d2f@xps-13>
	<PH0PR08MB7889C9577C6AD5BA2221B74DDB499@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvTS=kW_pPM5Vn4COmCXR7L6wj+CXtKs_Tnf=UQk2i7=Bg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_013951_105259_55473C94 
X-CRM114-Status: GOOD (  12.79  )
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

SGkgQWxleGFuZGVyLAoKZWFnbGUuYWxleGFuZGVyOTIzQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmks
IDIgSnVuIDIwMjMgMTI6NTI6MDggKzAzMDA6Cgo+IEhlbGxvLgo+IAo+ID4gQXMgeW91IG1lbnRp
b25lZCBubyBFQ0MgZXJyb3IuICBBbmQgU3F1YXNoRlMgY29tcGxhaW5zOiBVbmFibGUgdG8gcmVh
ZCBkYXRhIGNhY2hlLgo+ID4gV2Ugd2FudCB0byBzZWUgSS9PeCwgUkUjLCBXRSMgYW5kIFIvQiMs
IHRvIGNoZWNrIGlmIGNvbW1hbmQgaW5wdXQgYW5kIGRhdGEgb3V0cHV0IHByb3Blcmx5Lgo+ID4g
SXQgaXMgYmV0dGVyIHRvIGNhcHR1cmUgdGhlIGNvbW1hbmQgMzFoLCBhbmQgaXRzIGZvbGxvd2lu
ZyBkYXRhLiAgCj4gCj4gSSBvbmx5IGhhdmUgYSB0d28tY2hhbm5lbCBvc2NpbGxvc2NvcGUgOikK
PiBJbiBhbnkgY2FzZSwgaW4gb3JkZXIgdG8gY2FwdHVyZSB0aGUgcmlnaHQgbW9tZW50LCBJIG5l
ZWQgdG8gc29tZWhvdwo+IGxvb3AgY29tbWFuZCAweDMxCj4gd2hlbiBhbiBlcnJvciBvY2N1cnMg
aW4gb3JkZXIgdG8gdGFrZSBhIHBpY3R1cmUuIFJpZ2h0Pwo+IAo+IFBsZWFzZSwgdGVsbCBtZSB3
aGVyZSBJIGNhbiBwYXRjaCB0aGUgbmFuZF9iYXNlIHRvIGdldCBzdWNoIGFuCj4gaW5maW5pdHkg
bG9vcCBvbiBlcnJvcj8KCkFueXdoZXJlIGluIHRoZSBjb3JlIHlvdSBjb3VsZCBqdXN0IG1ha2Ug
eW91ciBvd24gZXhlY19vcCBzZXF1ZW5jZSBhbmQKY2FsbCBpdCBpbiBhIGxvb3AgSSBndWVzcz8K
CkJlYW4sIHdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gcGljdHVyZSBwcmVjaXNlbHk/IEhhdmUgeW91
IGV2ZXIgaGFkIGFueQppc3N1ZXMgd2l0aCB0aGVzZSBjb21tYW5kcz8gQ2FuIEFsZXhhbmRlciB0
cnkgdG8gYWRkIGEgc3VyZ2ljYWwgZGVsYXkKc29tZXdoZXJlPwoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
