Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6993DCA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lL0Pn9WP5aTrNyIdcIC/aiKnMNobR5oLrun7ZwrJzWw=; b=P7sMix9deSP9NJ
	e2eFBHNH57MalbS8HMmKinvSfbGRIoXc9eeP26cQB1Tdh7za79poWPEJZLgiliPRCohNhIoRsBD9/
	6odyIVXPWOXLzbai+2D0ilCktil62o3v7+Z9Zf3cLdYlqX4GYe+29Rek+YKibmj0VGcuLxeRnvyuf
	IIZyqFjMe6tx3DL7rPXZsMZHuIJ1+dch4N38HF9AFI/cemMgDQXTbSLOAVbzg4IJpvE+y+47LKBHS
	t8ODg4u3Wgv6MqMoqiuuA1bBGJ5vgXOqoTwCApHbYu23tUsbsPCOE6V7eM8vUx/f8bogUZg8cz3vt
	vMRbe5ePeIGk6ow4ymVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKdx-0000000BDAC-24qf;
	Mon, 12 Oct 2026 18:21:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKdv-0000000BD9f-0zeA
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:21:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CA1F41A11E9;
	Mon, 12 Oct 2026 18:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E81D601A6;
	Mon, 12 Oct 2026 18:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49A6D11D70602;
	Mon, 12 Oct 2026 20:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1KoVUXlucQrVW4bBWlvJlG2dmQ6Fg2nhuw6P+GEzKSM=;
	b=ewBuk4+NCSxnhTPtqOWinCmkIBQQ5Lw9K73+VkzXN6GCQmy2FyPhMI4PM8uUNtG30Op1e2
	BQvkWDNo2RdzgywnX7QOhAKdb47F3a4nwX/XjBcerUyq8nzpK6JmBLf8IHZZJ/lWWdb3i7
	FO++DJRdcCbAkAfnZq1As0nuk3y7i5AwIAEglwnbwo5LmSmCpo2RN5OC1t2bGz+lXBGUWa
	BAKIRNgGEWolKZa+Wg86ywBYYkoymsHxJ+JJb2ZMDVqUwAM2J6Sgq4mYbJ/Povp7DfMxYk
	ukpn0gEIZIt4uxGSEmRUZHcS0yq8cC9YHxjKQvVVA8lDNs0NNgBIlv68vRvm3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
References: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: fix read location register usage
 in config_nand_cw_read()
Message-Id: <179182925022.590599.2183404092012307300.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:20:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112059_419546_3082B85E 
X-CRM114-Status: UNSURE (   7.13  )
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

T24gTW9uLCAyOCBTZXAgMjAyNiAwOTowMTo1MyArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
T24gUVBJQyB2MiBjb250cm9sbGVycywgd2hlbiB0aGUgbGFzdCBjb2Rld29yZCBpcyBiZWluZyBy
ZWFkLCB0aGUgcmVhZAo+IGxvY2F0aW9uIHZhbHVlcyBtdXN0IGJlIHByb2dyYW1tZWQgaW50byB0
aGUgUkVBRF9MT0NBVElPTl9MQVNUX0NXXyoKPiByZWdpc3RlcnMuIFByaW9yIHRvIGNvbW1pdCA4
YzUyOTMyZGE1ZTYgKCJtdGQ6IHJhd25hbmQ6IHFjb206IGNsZWFudXAKPiBxY29tX25hbmRjIGRy
aXZlciIpLCB0aGUgY29uZmlnX25hbmRfY3dfcmVhZCgpIGZ1bmN0aW9uIGRpZCBpdCByaWdodCwK
PiBidXQgc2luY2UgdGhlbiBpdCBhbHdheXMgd3JpdGVzIHRoZSByZWFkIGxvY2F0aW9uIHZhbHVl
cyB0byB0aGUKPiBSRUFEX0xPQ0FUSU9OXyogcmVnaXN0ZXJzIGV2ZW4gaWYgdGhlIGFjdHVhbCBj
b2Rld29yZCBpcyB0aGUgbGFzdCBvbmUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0
LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHFjb206IGZpeCByZWFkIGxvY2F0aW9uIHJl
Z2lzdGVyIHVzYWdlIGluIGNvbmZpZ19uYW5kX2N3X3JlYWQoKQogICAgICBjb21taXQ6IDk0NjIz
OTQyYTY2ZTAzMTgyNjc1NmY5YzkyZGJkZTlhMTJlMmI0ZDIKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
