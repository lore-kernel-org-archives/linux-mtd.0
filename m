Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31603C43602
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10sAZk7/FuXIH7xnao9AMO+ICh7ryF9q5umZOq9nbCk=; b=ap0U3wYQThrsn8
	R3ioMhKoFfSqxEdZjdkZyfuNAyX6K5Sw1UU6lpPlYENsylxJNnPlscHeI3yjNObW9MVhEQ1jtAO9q
	9YsrZepSeFu5Vb61IDe/mW0UuCi0flqNg4slw6HnwmNCItO50kEdIGplbjT3/COAGFgnM54GhkMjY
	fY1rdkEH0NDxnqB2JAWpAZ4gDR9dqylV/Q+ykR7dKAG7lIaqGBsWGqObDB0sPydEuAM1OAgzjLmoH
	3Wie4MnDon3Xy9x5QBukMwMA9suBdqGZt3lqT4LDrTlSgqvk09/2Qeh2Ye5sUEmH30Uq4CqXa6Dkl
	q6XVhiI2EGKQD9qzn5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9F-0000000Eu14-19iO;
	Mon, 29 Jun 2026 14:39:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9C-0000000Etzy-3603
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:39:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D2DA1A0CF1;
	Mon, 29 Jun 2026 14:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BD655FF96;
	Mon, 29 Jun 2026 14:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AD09106F1890;
	Mon, 29 Jun 2026 16:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a42TAHzGWb/UyvAGGTx1OTIKOuKhNKN2lS2loDfeQ1o=;
	b=BJObYbhP2ptcR7KO8ZM6XBOW0dFJfiqXLlIUFz/SD6cljhqZ6uRQ4yC4PAKJaymsjATYJy
	D9uDH0KXWUn+GzfNHbZjJN+ql7GwPNfWv0pfIL9CFCm8MRD24ZM9UbiDJSxCh7a7SKDDd6
	1gvszjy1IqMInSL7HmmB1LVGvmTBR6SjdTDDMrcN3+mcBFpnvkaXyXUjKoFsgs6M4XdYyB
	7OEcMKzSHcNU2zmiQBFcyAkFa4ruPOPxw2lDEcaDppblSgBsyGTn+GQ2W/fEjvWj/He5EJ
	YLSnkPuygAyHyWImhUpXaobUcz1VqYghdzJ7EvTqUbbQQ+2ZO1ap5JKA1f2fnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com
In-Reply-To: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
Message-Id: <178274397897.256048.17604438269324216719.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:38 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_073942_907255_16CB5731 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCAxNCBKdW4gMjAyNiAwMToxMDo1MiAtMDcwMCwgSGFyc2hpdCBNb2dhbGFwYWxsaSB3
cm90ZToKPiBtdGRfY29uY2F0X2Rlc3Ryb3koKSBmcmVlcyBpdGVtLT5jb25jYXQgc28gY2FsbGlu
Zwo+IG10ZF92aXJ0X2NvbmNhdF9wdXRfbXRkX2RldmljZXMoaXRlbS0+Y29uY2F0KSBsZWFkcyB0
byBhIHVzZSBhZnRlciBmcmVlLgo+IAo+IEZpeCB0aGlzIGJ5IG1vdmluZyBtdGRfdmlydF9jb25j
YXRfcHV0X210ZF9kZXZpY2VzKCkgYmVmb3JlCj4gbXRkX2NvbmNhdF9kZXN0cm95KCkKPiAKPiAK
PiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogdmlydF9j
b25jYXQ6IGZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBtdGRfdmlydF9jb25jYXRfZGVzdHJveV9qb2lu
cygpCiAgICAgIGNvbW1pdDogNzVjMGMwOTU0MWI0OWRhYTA4ZmRkYmMyYzE4YzIyMzJmNGVhYjdk
OAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2ls
bCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlu
cyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
