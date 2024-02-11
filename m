Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5ECC4829B
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Feb 2024 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mt5R/tspwGFlLKtdHQ3k4bML68Fh7+J/VScNKUw1dCQ=; b=nWW8urciYACKkX
	mzre3iTuGCvXxrmTZxdsc+dBlnVslPvN8rCBjfPAtswWfGn+/PkBPjsN71oVnEL3CVL6/JHI2Be10
	dt+ZSch+sYqiVudazYDh4CLCmvM/WPFUP7GdyEjjAvgKasYIMtnho4sznSfCdm/4VjDVAMT0zlN5C
	56SQHHaAfHsu+xVK+IEOQ8slRWp0pCG+ox5vr6CDvZW07QiNocFoIOelMimKiGfpWMbKFt180jCrT
	yaNevduGB1MB/AOcdeRDZZ9w7iONJOb5XveoMkn85TDChP7MvSM4nsEaLFC7hiA3+5J8dz0X1kFTa
	ATxPsevN+tXWe6emanrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZ5xl-00000002YcL-1R04;
	Sun, 11 Feb 2024 09:17:25 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZ5xh-00000002Yav-2Uim;
	Sun, 11 Feb 2024 09:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1707643010; x=1708247810; i=erick.archer@gmx.com;
	bh=rSHYS9qHk/jwImtw4+JVwsbnbAy0pXklABl265nds1E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=P8Np99p/+p9ERHHFhS7PD/pOfT2dBBXJIHtsDOJ8QeWuiL8RS4wg58MC1tDUtF3I
	 GIJgL1Qv1ogbXlkXsE3dLCbmWzBs5EYt8Dkotr82zFA2LN59zWfIoZ+t3loKmIc2U
	 VM47LRH4J8VPJ4aBZaxmaFbDghDcda92em6l6ER4JIcQVsWgfIFUsA+Vg2oh/MRvA
	 hDeJ0yHCkdzrL2Nml9oj9ophK1f/0V2WnyODJze/8qIdeHvm9ubBEGsZTEdOJrAjG
	 ewiseXCZxU2EY5Lhqc/U8Akb5/fG1+xNt+UnWY/xBAAhkMkR2pZcFxX+1hFJTSzIL
	 E4dl311syDfFl6Mc9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MDQeK-1rjaLv3tI6-00ATNc; Sun, 11 Feb 2024 10:16:50 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: Erick Archer <erick.archer@gmx.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: Prefer struct_size over open coded arithmetic
Date: Sun, 11 Feb 2024 10:16:33 +0100
Message-Id: <20240211091633.4545-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:T+hTP+nIP/OHyAruT5vbyzud6ys/lN69HGWrX4oTcE/i2FVhsLb
 KB1+1LMkHVn67DYnshciNkLlvXJBH7PrHaD6kPazuidAQ3uf7+ILEuHn5Zug3nf5IWR0uLP
 dQ8jOMugei9vxKq8tNZK0YEo3hnZmFtY2P9kqlssEl7RsuygsGmnYzSjBGSbzhdIDw837pK
 wZXnBXQy57CiHMIASp4JA==
UI-OutboundReport: notjunk:1;M01:P0:NSjmnwszXxk=;Cbh7RAxypTb5l0v+Ku1wyOW3xX4
 2FZLp9I9qGqFp+d8FikX8Mb/wxlht9YG9qt1CThsj//a/h5HF++hqJyWvp8s8bpQ1DCp7h2J4
 bvHP/orYTs1qm1TyPc2oSzxWu2lwQTwO0mIpQ17idfrdOcnVdOqp2Sj3uqtGa3p+aUEhdg7HR
 qyazQNUAnNw+Rm3a1izZTMDwjK//gpp9KwThVr/fd00ZMlO4KNWTEGzS2uYtqdwc+7k+0eskv
 TazVSmv5nzuEmGxT5/enrL9wluwpJzdudwgZEsnRs2vW5zxs4pR8JpaGQe2SwfPzxDehLsOWU
 Rz+m4X7qrsoUXkwjEqRDjwJc5/zyG28dABjemoW9LPKWaHnbfCqc20rAcT70EDjM9JSBOxdP7
 8Suh84GDpLmXFSY2va1VIUEDWcAETfS5YhfsbmB+wMi5VMKlEYSLk1uJ58rVPfN1q+Zozz8Z5
 lpDMnHVIga52kjN1m+nj30z4AVhsXwE9R8ck/N3UuiLD+UOs8fIhAEcOjobLbu9KsJkPToVgR
 OQPs9w1hJn2lU+kVkpea+Q0aVOSDMQafkDwQu4RYWBH6D3IWTrFq724+a8uEb9cKRwLhTb/h8
 DTRKlGw0Z49mn5o3qdVIqL8zB0+hsAlN0MkjVoj8KuWQnZQUdODeeraM/8Gjjaq6b9+H8cUdO
 WVT8/ytmHjbeDcCSVNEp0qJyNCu9M/iaNm3bzGR37WcuSTqKA+15SX7YfHWv/nCjnLb1i5gr1
 MA0ctpGc1u24wlGJ4YCxupldxRrbxhpJJRKhweMz3StESKeJtnOiu5Q8YCuPL9mKzAMFa0nCg
 cINxvhCxkLxbckyyyVzNI/VQJHstAhTQpdn02cGmDVikI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_011721_937853_249541FC 
X-CRM114-Status: GOOD (  13.67  )
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

VGhpcyBpcyBhbiBlZmZvcnQgdG8gZ2V0IHJpZCBvZiBhbGwgbXVsdGlwbGljYXRpb25zIGZyb20g
YWxsb2NhdGlvbgpmdW5jdGlvbnMgaW4gb3JkZXIgdG8gcHJldmVudCBpbnRlZ2VyIG92ZXJmbG93
cyBbMV0uCgpBcyB0aGUgImNoaXAiIHZhcmlhYmxlIGlzIGEgcG9pbnRlciB0byAic3RydWN0IG10
a19uZmNfbmFuZF9jaGlwIiBhbmQKdGhpcyBzdHJ1Y3R1cmUgZW5kcyBpbiBhIGZsZXhpYmxlIGFy
cmF5OgoKc3RydWN0IG10a19uZmNfbmFuZF9jaGlwIHsKCVsuLi5dCgl1OCBzZWxzW10gX19jb3Vu
dGVkX2J5KG5zZWxzKTsKfTsKCnRoZSBwcmVmZXJyZWQgd2F5IGluIHRoZSBrZXJuZWwgaXMgdG8g
dXNlIHRoZSBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlciB0bwpkbyB0aGUgYXJpdGhtZXRpYyBpbnN0ZWFk
IG9mIHRoZSBhcmd1bWVudCAic2l6ZSArIGNvdW50ICogc2l6ZSIgaW4gdGhlCmRldm1fa3phbGxv
YygpIGZ1bmN0aW9uLgoKVGhpcyB3YXksIHRoZSBjb2RlIGlzIG1vcmUgcmVhZGFibGUgYW5kIHNh
ZmVyLgoKTGluazogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vz
cy9kZXByZWNhdGVkLmh0bWwjb3Blbi1jb2RlZC1hcml0aG1ldGljLWluLWFsbG9jYXRvci1hcmd1
bWVudHMgWzFdCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8xNjAg
WzJdClJldmlld2VkLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5v
cmc+ClNpZ25lZC1vZmYtYnk6IEVyaWNrIEFyY2hlciA8ZXJpY2suYXJjaGVyQGdteC5jb20+Ci0t
LQpDaGFuZ2VzIGluIHYyOgotIEFkZCB0aGUgIlJldmlld2VkLWJ5OiIgdGFnLgotIEZpeCBhIHNw
ZWxsaW5nIGVycm9yIGluIHRoZSBjb21taXQgbWVzc2FnZS4gQ2hhbmdlICJtb3JlIHNhZmVyIiBm
b3IKICAic2FmZXIiIChVd2UgS2xlaW5lLUvDtm5pZykKLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9tdGtfbmFuZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKaW5kZXggNjAxOThlMzNkMmQ1Li4xNzQ3
N2JiMmQ0OGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwpAQCAtMTM1Niw3ICsxMzU2LDcgQEAg
c3RhdGljIGludCBtdGtfbmZjX25hbmRfY2hpcF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IG10a19uZmMgKm5mYywKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQoKLQljaGlwID0gZGV2bV9r
emFsbG9jKGRldiwgc2l6ZW9mKCpjaGlwKSArIG5zZWxzICogc2l6ZW9mKHU4KSwKKwljaGlwID0g
ZGV2bV9remFsbG9jKGRldiwgc3RydWN0X3NpemUoY2hpcCwgc2VscywgbnNlbHMpLAogCQkJICAg
IEdGUF9LRVJORUwpOwogCWlmICghY2hpcCkKIAkJcmV0dXJuIC1FTk9NRU07Ci0tCjIuMjUuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
