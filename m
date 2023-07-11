Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00129EB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NY8Gj2juA14Q9Q2o/mczhYIAyhIq4X3lzc2CWsZYplg=; b=b/8z7vM+NifZCX
	M4QZdKknBmevgijgD6cnEBZp1Fc6KHoHWxT3aCw/qzn+nMJwOATrMgSpVZXF0QthNkeWI5hNdQKSz
	6GUMD3v5+dMm7ctUE3wKVjeaHOyroUxO34pjdzl6SE5zjecWQwiEsHoMvgeIgkrQM2R61l0DSQMOH
	lLq7jbNBeX48sZIltEcyusNlgWdBmGzBCQDVK1izRxzM3660s5ej0R5kOr4FCk0uRvgNrOHyl+vKo
	QpREMnurVWoY/yUFiYxRQnTdgMSsuvLs8PJI5jFXG71WtDVOOqqgLvY2kqoJhJ4v/ZbnWiG7Qa4L6
	Va8vsofaXbXfOMoT2hKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFyu-00FLuJ-1v;
	Tue, 11 Jul 2023 16:12:52 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFyq-00FLsE-2U
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jul 2023 16:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689091951; x=1689696751; i=markus.elfring@web.de;
 bh=PU7KZ9CHDHb4Lhokiu8z2aAZLqdGM0mPweaH1uR583w=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=Az4lI0U7B5zd+wvdakHlSPLZv3JfShs3Jy/G0+Pk215NR2LhbGS8+q+hH7Tf0LUkkURcdAo
 DU0HQcDo4h7egrBMvfW/R9JP9Pci9shRBQiHqp9yxIVMqjSxXcx2nRpKS1sVO2+K+xJGIRW7c
 +JT8t6ielKm3mJARLdXJEDcm6fqjTubjwHZlx6sN0GkpMjyYGxQsF4rRnQ6H+6UZ0WVKYFOfw
 aZmS4Xsalk6MbK+gRTF/9DtcRgGmR0aA+dzUJZp72iQX6fXGaREwvIzb3N/IQdnmmEPkMSBti
 rX7mxla3MVLyI4xf/5rciR7hRFCB780jdRWhqWtEjoHKvYyz+3UA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4bO-1q8lJF1NBi-00BtSZ; Tue, 11
 Jul 2023 18:12:31 +0200
Message-ID: <743f4445-31a6-0e51-f432-08033bdcaf20@web.de>
Date: Tue, 11 Jul 2023 18:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Yang Rong <yangrong@vivo.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: opensource.kernel@vivo.com, LKML <linux-kernel@vger.kernel.org>,
 Lu Hongfei <luhongfei@vivo.com>
References: <20230711020752.2344-1-yangrong@vivo.com>
Subject: Re: [PATCH v3] mtd: core: Fix resource leak in a
 for_each_child_of_node() loop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230711020752.2344-1-yangrong@vivo.com>
X-Provags-ID: V03:K1:B0v6cdaZODTit4Q3w7wlJ9oZJc2g7F0tgOUsB1DZg+xje/PuU/z
 ACwsAWmL0CREy/J5uSlPwGdjRwPOeiZ1TIKzueRFNFHioXtVmRBh0+XzlIZ0I9lky/a2vk9
 nz1RmRqEPAshatraCYCbeuWArZDPX+NpDL4Lb635g4aTgRF8ycklJuO3q2c6IhSUnOCqppD
 C7HtQyekS7nCbvJvmH6wQ==
UI-OutboundReport: notjunk:1;M01:P0:VOTOCMzYi7U=;Azcce+cJjxTU2kOGeXRTVvyY5Cs
 OsfppYx4i9jJziKuJLqaweGr1XbThXGkig5fKKTSeB579ODYf9Im5Q9GiOfAVxm4kghARCWKG
 mx+1/Jg/PPW8btajiHLLBBS6YawYyvKAE9gIxTLtAhzsjg8jVuYmB//k5GqSgVpfaZRPJSNrB
 +X0uBDbFcHLmqn7pMhiLx9zDyVNcnrfMUPJZmNxllMkRPPmcI/CxbsHqrTurnWZLXHWm6cx+/
 fQxIY9T68lMHC0zqDdynhyyF1cqo/47bPYzACrx8grpBmVZJLtr6pXeeNYZMa2HrKfkIWLcNV
 vVFX65Ixi8SodwButo2DOKvi/lXCeyRwNbhfTGAtROPIMI2HXmGxS3Ki4KFdtJiWXVU2X7OZo
 9PVauPpx/3qdLUX5xVKc+mPj8fOsGUPRtKOub9E74biZCqEvWiAD4higZE3HKZsFbXd0Hf81r
 uhyIkfEhqVPeEk9JAcysWSCO8jURIMxp/qfyGlo8Zarq65wg4Fn0qltI8gXKskMwEdMEE+PnI
 KtvKzrZCUt7Vu92WgZJELxOerJ6h9T5BRA60zqgq3pk9k7asCAtJukZBU7sh/ZS6hVhNbLODC
 F42zSmGvlEsOFGQQ8uqe5gPQm4Sx9gKKFmJ7EhHI8GBc0yYeMidxD/z+StQqJpvZinXeJf7DS
 GPnpHDmtJyVA6FErez1q/GiPAWJmWCwxCaajyYbENMcfvA17yjNiaWjXERYc1uN83SP6Dl4pU
 cYES+RtSmmm9nOv/mN23MH/cYcGpaVT+T9bt694zySXy5alYfz/P2slmpk2jsZTcvNmT3vHqw
 JrR75skWbqq6HSgOkAZz9CQjxBBY/TK0gXRXftQIYkkkm1aIs+5xTGlu8Q7ORVu6KlJb/gm0P
 lNMITLswpEnBJb9qTAbn3vV3v61/e+9EyYoKBqKn9l+tAqi01s6Mqm8ud4wY6vnSRhziuc/9O
 dxAAavT4T07dlOgoaEK86ELrUeI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_091249_273783_84D6F3BF 
X-CRM114-Status: UNSURE (   6.77  )
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

PiBFbnN1cmUgY2hpbGQgbm9kZSByZWZlcmVuY2VzIGFyZSBwcm9wZXJseSBkZWNyZW1lbnRlZCBp
biB0aGUgZXJyb3IgcGF0aAo+ICAgb2YgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4KCldp
bGwgbGVhZGluZyBzcGFjZSBjaGFyYWN0ZXJzIGJlIG9taXR0ZWQgKGZyb20gbXkgd29yZGluZyB2
YXJpYW50IHN1Z2dlc3Rpb24pCmZvciB0aGUgZmluYWwgY29tbWl0IG1lc3NhZ2U/CgoK4oCmCj4g
LS0tCj4gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcxMDA2MTQxMi4yMjcy
LTEteWFuZ3JvbmdAdml2by5jb20vCj4gVGhlIG1vZGlmaWNhdGlvbnMgbWFkZSBjb3BhcmVkIHRv
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIGFyZSBhcyBmb2xsb3dzOgoKSG93IGRvIHlvdSB0aGluayBh
Ym91dCB0aGUgb21pc3Npb24gb2YgYSBsaW5lIGhlcmUKKHNvIHRoYXQgYSByZXBlYXRlZCB0eXBv
IGNhbiBiZSBhdm9pZGVkKT8KCldvdWxkIHRoZSBzdWJzZXF1ZW50IGVudW1lcmF0aW9uIGxvb2sg
YSBiaXQgbmljZXIgaWYgZWFjaCB0ZXh0IGl0ZW0Kd2lsbCBiZSBkZWxpbWl0ZWQgYnkgYSBzcGFj
ZSBjaGFyYWN0ZXI/CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
