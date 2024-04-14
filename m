Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081C9C4345F
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2024 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1pBpMH5pg4+8dxVCxMUaup3UPUZ6MNzNJ1nPBOZ97g=; b=IrAFtuFLMbezFq
	G5pcilEAS+5Ksm+RCmN08Z9oKC7AGEgcz7seSfKJdcWWe+T+4DeeE8DjikhEgHO6PRViuF+QiuMVf
	84tIKCt14ZM5tIxc4OICNOrvRXBZcePi16mRrarXeDxqya2JT7WI1kxBd70ICU8a/IPxpVi/xtSty
	cmA+M1q/XKutDLqZ6p+EANnqzTza63KTJxHItlsQW069DX+FzJjadGfDYwbr9kxkS4HmJ7839+8D7
	SPRnd+E6efmzHao418VczWGJ809FmFZvJi7+m58IQjs8coSJqXUxBMgI7eSM//MA2pDNCZ9NIAgK5
	f53+/k5GM27DY+kccdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvvzP-0000000582b-41WT;
	Sun, 14 Apr 2024 09:17:31 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvvzK-0000000581o-093b
	for linux-mtd@lists.infradead.org;
	Sun, 14 Apr 2024 09:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713086209; x=1713691009; i=markus.elfring@web.de;
	bh=s5ltjkK1gwJpndCII1TvY/cIdzI9eB2EsZ3Lgn3ig3E=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=CFa0btk3oTUPmhtLP1Jr4TeJI+C2q5qqpzNMiaUz338/aMdx3vyqH3dvrFyvAHEU
	 EJnRaIk005DV1njvWd/qJYRmwIr1l1L7bEGZo0TTh94NyzcX3L6lJfSPJsPgixgQv
	 OM9vVjtONSlDTKjc5VkTJ8pdRUJUFe822RTZ0Q86jT8QRR9WB/qbCzb09hVkdQ0Vd
	 5T04n73e47EkjPNE6QcUHOjXJBvauEF9PA8X2on7bLkSVjyqsh5oAJXxImhkWYztO
	 wV/1w4vtpzgtjwgt4mt/8dR4T743R1x25p4CrFAN579Tpmm9dzRUOgU5rfLwHpjNF
	 WcIF7vOPShuJy0T/cA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MidDR-1sQqUJ45dn-00fQIp; Sun, 14
 Apr 2024 11:16:49 +0200
Message-ID: <22f324ce-552a-4f6a-b4e5-2d84a00010aa@web.de>
Date: Sun, 14 Apr 2024 11:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Nan <linan122@huawei.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hou Tao <houtao1@huawei.com>,
 Yang Erkun <yangerkun@huawei.com>, Yu Kuai <yukuai3@huawei.com>,
 Zhang Yi <yi.zhang@huawei.com>
References: <20231208074629.1656356-1-linan666@huaweicloud.com>
Subject: Re: [PATCH v2] ubi: block: fix memleak in ubiblock_create()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20231208074629.1656356-1-linan666@huaweicloud.com>
X-Provags-ID: V03:K1:78p3dblrsqPURz0FRE4t9XDi/hn8Hkx9PEJPx94ac+U8J2gEHyd
 ATSHvvuSo0/6ZUrt4X79V1sVdDHxzZV0Fk6+QX6uvvcat67jFNb9mOdBPiUm9ZTf5/42ipC
 Iac82O8R4x7hKff4bxvwRukSDZSYCe5z5K42hTU7CBVN9OE5/DSMtHMxNUAmjsshKnCB8+3
 5jlJw7JL1UE6tfYrFbS/g==
UI-OutboundReport: notjunk:1;M01:P0:TlSKKbKkQYc=;AU2R7k6wO03BiwEwBd+BqUW+9HK
 SoJNi24iuSQwSBJApiqLcCwyCCOXrzvpx0Uva55LiNofjvIdiiXY32Y092MOm/3+sfx2fq5ZO
 fN9OQfgUCFD33Ldka6pCXv2h12h0bprrDoL83NegtShdz085dBcaMaZzG0G8WdADdrwpPFjBc
 ZQLAMdbbUAxxAYKN+yK5QDsBhe/puNEtnQ0H3cX9U9hoOvtic3aEMLcqDCMuSdA4KfP91g2mx
 BBGVXFFU8bN/wQj0SzvR/hM37H39BJ5T2Rv+ATpUReYhihmm3lYJcmXTYk64yMUYLGnQq9UmN
 qk9Xjk4M4ozID5fQkhUTUjyesOjefUsgcUCiAc+Hztts61F1SZCaOKAJkBAt+b+6fhZxzthln
 p8YeMXqYbNsBuLxf09vuq87bX9aPgffseFBgWQrG1hTBBNKxt3k6JQ3rNs8Re3Kybt362/btp
 v57x2xambw+D1imPhMrH6p1Y7wEBA2QhYXdkYzpfE1uzFsJ6KUPzQ8y7b+McfrdG6sL9OGW1c
 nj70r76lmmLiZdveXhmHapFBDKaCKU899oVk3jax1gtnBT3i3q0pt0p0d9bDGmy+9QtuhdOMW
 t5JD49bnlgVqx2aZyGFwLb3E8rhT9o2TVP4fd/hezaMhwg1r0S+3OBYYptwjda+dmgh+4PE8I
 9kokAAY5Spoz3d+vFb8Ct58qSdki7/hx05BxNjiaEJtDXnYG4bmv1J+kBHChqOBqcoCuEYbxY
 r0quBwEo7aphTzCZOsRtsTw/7p/z+Zqng0/zBKY3LQzVlgArW/btXROwpXoEAM6odhr8r+YAk
 NJ7K238adkuoXWAYncoh9BARU+fmIrMTM9yuzXBGu8Eik=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_021726_580472_C5A991F5 
X-CRM114-Status: UNSURE (   4.02  )
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

Q2FuIGl0IGJlIG5pY2VyIHRvIHVzZSB0aGUgdGVybSDigJxtZW1vcnkgbGVha+KAnSBpbnN0ZWFk
IG9mIOKAnG1lbWxlYWvigJ0KaW4gdGhlIHBhdGNoIHN1YmplY3Q/CgoK4oCmCj4gJ2dkJyB3aWxs
IG5vdCBiZSBwdXQgYW55bW9yZS4gRml4IGl0IGJ5IHB1dHRpbmcgJ2dkJyBkaXJlY3RseS4KCldv
dWxkIHRoZSBmb2xsb3dpbmcgd29yZGluZyB2YXJpYW50IGJlIG1vcmUgZGVzaXJhYmxlPwoKICAg
4oCmIGFueW1vcmUuCiAgIFRodXMgcGFzcyB0aGUgdmFyaWFibGUg4oCcZ2TigJ0gdG8gYSBwdXRf
ZGlzaygpIGNhbGwgZGlyZWN0bHkuCgoKV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCc
Rml4ZXPigJ0gYWNjb3JkaW5nbHk/CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
