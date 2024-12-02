Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A4D10DD1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ez20AzGfIxjXxF1cKG2Q/391MlVDEleJ4/RXFn4AoMY=; b=DPRx0hE+NdNh/N
	8yTaMFweSc43GZunsqBhU7cFmgp30ujhrzGOwQECzlXUXflCUlWmd4NFhRv7e6lcu8rhrHkH+kxTL
	oFmAH8m0GPSFhbzZvqnMde1qyuuCPSCwVzJ1UmLNzTbXJdyHiyoaO+5wuHpbBsqN4Azzq54OBjJeP
	3yjCEzthnAvAjtU/xJ2wtxz8LQpATkHfupT4toVfccvjAQohjpULGJFce5fz2znnEnzr+Yoe2A8Zp
	/QkmjtNdwy5SC7vGIUYaUDDGXBCwU6TiT7d2zXL5DEu4tHgqiMRSZgCk6usfyBb3MQUqcdvOl4NoP
	brBb6n66uXtRrOEIRQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Ry-00000005WCb-3e4o;
	Mon, 02 Dec 2024 09:10:38 +0000
Received: from mail.finteras.pl ([5.249.155.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Rv-00000005WBP-1NqV
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 09:10:36 +0000
Received: by mail.finteras.pl (Postfix, from userid 1002)
	id 006B582FC1; Mon,  2 Dec 2024 10:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finteras.pl; s=mail;
	t=1733130634; bh=4SsVKfavNtEL8KiAyuhM0WdCxWV7dwsn0eOpgkwr5fY=;
	h=Date:From:To:Subject:From;
	b=nZKezVQXuDJfziB1/Jnw9/owIqdrud2XZ8R0kKJmhhqaMvINV6Dou4D3MgHT3QgJV
	 4GEu1AlLPKvBlO9/KMFOWDl0U/v8RaEMU6C0/kBikbowJWiJlY+f0BmpUDlSt9ogS5
	 tDeuX7F1pIR/NMswdu2jtJbA2j0TL/InWyYAHexwOHdnb6QGM/6oCU50pg+2GdvFYU
	 PGLsV5xXqWnj52RxDbmVSO7V+gN9wWu0MiWsGwH1h7W/+4EQrFcDpJBtnw8T4cBxTZ
	 AN+k4j6UsuqWq4yuRVVYAo9zv3WVbgsA3MFZ1Hy4a+UiGXxjaUL26HLbdKdp/MrbPT
	 +Kt7KONFtLLyg==
Received: by mail.finteras.pl for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2024 09:10:21 GMT
Message-ID: <20241202084500-0.1.57.6rrt.0.3ddl30v0lf@finteras.pl>
Date: Mon,  2 Dec 2024 09:10:21 GMT
From: "Urszula Kurach" <urszula.kurach@finteras.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pakiety_telemedyczne_dla_pracownik=C3=B3w?=
X-Mailer: mail.finteras.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_011035_515601_C0B38B2E 
X-CRM114-Status: UNSURE (   1.99  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYWJ5bSB6YXB5dGHEhywgY3p5IGJ5bGlieSBQYcWE
c3R3byB6YWludGVyZXNvd2FuaSBkb3N0xJlwZW0gZG8gbmllbGltaXRvd2FuZWogb3BpZWtpIHRl
bGVtZWR5Y3puZWogcGVkaWF0cnksIG9ydG9wZWR5LCBuZXVyb2xvZ2Egb3JheiBsZWthcnp5IHdp
ZWx1IGlubnljaCBzcGVjamFsaXphY2ppPwoKT2ZlcnVqZW15IDMgcsOzxbxuZSBwYWtpZXR5LCBr
dMOzcmUgemFwZXduaWFqxIUgZG9zdMSZcCBkbyB1c8WCdWcgZG9wYXNvd2FueWNoIGRvIHBvdHJ6
ZWIgUGHFhHN0d2EgZmlybXkuIFBha2lldCBwb2RzdGF3b3d5IGRhamUgbW/FvGxpd2/Fm8SHIGtv
cnp5c3RhbmlhIHoga29uc3VsdGFjamkgaW50ZXJuaXN0eSBuYXdldCB3IHdlZWtlbmR5IGkgxZt3
acSZdGEsIG5hdG9taWFzdCBwYWtpZXQgcGXFgm55IG9iZWptdWplIGRvc3TEmXAgZG8gbGVrYXJ6
eSA0MiBzcGVjamFsaXphY2ppLCBhIHRha8W8ZSBhdHJha2N5am5lIHJhYmF0eSBuYSBiYWRhbmlh
IGxhYm9yYXRvcnlqbmUgaSBkaWFnbm9zdHlrxJkgb2JyYXpvd8SFLgoKRHppxJlraSB0YWtpbSBy
b3p3acSFemFuaW9tLCBQYcWEc3R3YSBwcmFjb3duaWN5IHp5c2thasSFIHdhcnRvxZtjaW93eSBi
ZW5lZml0IHBvemFwxYJhY293eSwgYSBmaXJtYSB6eXNrYSB6bW90eXdvd2FueSB6ZXNww7PFgiwg
bW5pZWogYWJzZW5jamkgY2hvcm9ib3d5Y2ggaSBkb2RhdGtvd2Ugb3N6Y3rEmWRub8WbY2kuCgpD
enkgbW9nxJkgcHJ6ZWRzdGF3acSHIHdpxJljZWogc3pjemVnw7PFgsOzdyBuYSB0ZW1hdCBkb3N0
xJlwbnljaCBwYWtpZXTDs3c/CgoKUG96ZHJhd2lhbQpVcnN6dWxhIEt1cmFjaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
