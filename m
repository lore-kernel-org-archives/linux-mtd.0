Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292A3C02198
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2025 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLefWPgLsd0dHwmtXS/RrkWqhdvsWqnvOyGLa6FnMUM=; b=Gjzxt3yI2xTyuo
	N6Ogd0dXbm7V3FDwX1/RQIqwbkzqXO7DRqjHRzXF/8CsZ1Kh1Jaairz68AkW55mGOvAOxFBm8blsf
	WI+a4IXX8+JIVzBRbwIX2pwuxb7yV+bkSdVxVUUyDk8/Ym+MLgD240WquWbk4B/kWyOFn/xSh2eCe
	DpRAVq8ne5faF0nbYB+9nCZxAe9ZIl4He99q7n8ZRbvDPAjwR2jcfHIr6GtKdnTVtpSO7xE/c52Ms
	2Yb77IVqTsq/q9zlKCI+6q1brsAqUeg45QNfMwRn/MMGQqujnfDBM2OesaZQUpttqOGLZVZiSu6nM
	49lUhPABzBgb2rM6xqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiCv-00000003yAb-1S8c;
	Wed, 05 Feb 2025 16:24:57 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiCF-00000003y1y-3lmp
	for linux-mtd@lists.infradead.org;
	Wed, 05 Feb 2025 16:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738772618; x=1739377418; i=markus.elfring@web.de;
	bh=77uy2s9GS4L1rOWI0ZFpp+8lDhVNd43z9Dx6rLxFDGw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=xBo4HOKZjPxyH0nA88EATEFM2cQ/8HE3NMhTO+uoW3iDck26A0vMwicAMkk9hutc
	 GzR4CXMp372hnuZm75Kv66jl27j4o7ciElR36EP+7obaC6i7z8iMhTiywCxRIfMFn
	 gyDKI4qKnHDSSklFs/ZC7aoRtpJul4WbpRzZaRQCqsDfLUKdeIYyIxv3PwwpS6gNv
	 /MTb7IOHbsCe9L4PNv2tIthOoOYu03O759qGl5B0B1RVxMKPGIrIFrK948Zszmplp
	 /fIxQ0AA/ATEgT0QexMR8Jhq2n4WnQqRMnW1iR1paVLZWg8lHyospUIzi7WwQ65lx
	 +SiTAZ3MULAPY9fN0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.30]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQud-1tuNrl0B9X-00NGSj; Wed, 05
 Feb 2025 17:23:38 +0100
Message-ID: <ffd401b5-9b0d-4339-befd-19b704479ade@web.de>
Date: Wed, 5 Feb 2025 17:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, amitrkcian2002@gmail.com,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, git@amd.com
References: <20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
X-Provags-ID: V03:K1:nb45Msh4es1jIjg2htR0yzCwxwqa+PQfNxb8WzJvDhi+A4tDdKk
 JlAjSuKVKmnScTYqJvlRsNtUb8O53nzSCSHI2Im7+tYYwcgd56SjcZyofaU59CjHZhlicUw
 4+t55KXYiLnbXMaKB/vD2+gli4iN6xrRt2zVb0tQaay2uAAmZR6rXsTPHAzVy0CKTx8EcDS
 yFAltVy4+8eratwOOqvwg==
UI-OutboundReport: notjunk:1;M01:P0:P0t7kW7oplE=;mer0gC9EbYTyFEWI/InPIk40UCH
 J+vqscsBnYOiEtpaXv67EDbNGJWojWbzZCNwp9g37DrrFi38J7RtmaIj8ZgvMYRPcASWMVSJa
 Jw4asosl5om2uD3ElhAl4NjDDqcgh9XU5ZOgNGzCAeRwmPZLNdT4M/dvh8QESBNHw9NIZlq3P
 ms/qDGbtO71WMOsiTmuMPhn9QsdMTL4cOLyQgxQ6O5C3PbLo8lfkrsq20ngx0SEfXExbRJxJ7
 tPbL4Amc8vLPAlGFsDzx0v3166V80xsZDd1YznKiv+9DcGxXGgJIaFY273A8dvPHVABiRtpJd
 Rla1yz6SmE6+h0wHf5bqPVQePjk4uAPSVTzfljwTu+/xutv6YOe3KFsk/Z7UZi51lLhnWyPGf
 G6paeLSMK7APAg6uE9PFobVZfHc8jgsaDCCQu8Vwi7zkP+mVfFfh4/CZQh5koh2iptacKlJOX
 hrOaZRmvAly2Ul/kf5o7jpeH5VR8B8SkXjjb5TLU62g9RJIDXF6Rbt6yGlZf50cTWDdtPo1tC
 KQn2vseAJvjRpVe87WdKPWrQc0KSirkV9rzLIpyfz+bw4n1vQgb3SE1pQ+NgFAHDiLVJixVZk
 Uxc2qy/6RJThU2ivynLHBSBcUqmFEJVDxF3nKTdvsQSuNkgNroxf3YS/IXAnRaoGWBCPN6uAx
 lw++ipOLJ7U57P7y9x2eXAwFkqeLWpjaA8RZXCIXNYxfFhE+CRKNzSQvKGo2XCmbS8FlqafUn
 aUdlQI6pPWYPsQYj0ueu7jyBcgm7glngHIHqsH68WzobYWO9lkZWv7UiGmo4dWPLGoia9db8n
 Jk6R1S5UrgFbVQaq4NHYwtFJtBs4U9XJ/YuZ4GIFPK7E+QnAQKJb+L7JgGXv6Lw8eDjYK+cUG
 in4TrJsZdLylKyRV1tYfLxKPfxCawsZFX5UnDM8jRG/miNeso8+uH9rf/qYs1aoaE+rLoGnHV
 Pwf2BCmHdYmUC0E7780JG1MUyRW1S8r2ohOpno4Xtu/t9kuHwBcqfY+Gs9j5V9IDllA4B8/xl
 n/Rr8E0CHaP7Tf/pGANiCrgB0gL5r6/+AR7o2ENQT+nPWmYG6uDQSczDkx4S3CErJZmopJd9Y
 YMIQK6hjso1k6vf5jL9PSaaulg/rghWzEIJL4SIF4zTk5LQ6sVgv7jCVtwG1EQ0u0kBTIerWw
 1wUPtOdNYAzokCmPCdkDXhPF7SlstJvQE0pdBizbCVXlMDgu9kAVhqCpIK9OgG/mLvdOZaQDj
 pH9LEpVUTg2t8VGBynN2d5of671377GsSN/oJX+5Hws4lKUqdjsY01dDvGW56PUw0hB1C/14q
 agVifyjL84exbyES30on7j8LW2HOgkBbmq1E7IwGFon5GYr/MBQfx6RV/vloQzf0+j0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_082416_306450_496D411E 
X-CRM114-Status: UNSURE (   6.55  )
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

SSBzdWdnZXN0IHRvIGltcHJvdmUgaW1wbGVtZW50YXRpb24gZGV0YWlscyBhbm90aGVyIGJpdCBh
dCBhIGZldyBzb3VyY2UgY29kZSBwbGFjZXMuCgpFeGFtcGxlczoK4oCmCj4gKysrIGIvZHJpdmVy
cy9tdGQvbXRkX3ZpcnRfY29uY2F0LmMKPiBAQCAtMCwwICsxLDI1NCBAQArigKYKPiArc3RhdGlj
IGludCBtdGRfdmlydF9jb25jYXRfY3JlYXRlX2l0ZW0oc3RydWN0IGRldmljZV9ub2RlICpwYXJ0
cywKPiArCQkJCSAgICAgICB1bnNpZ25lZCBpbnQgY291bnQpCj4gK3sKCisJc3RydWN0IG10ZF92
aXJ0X2NvbmNhdF9ub2RlICppdGVtIF9fZnJlZShrZnJlZSkgPSBremFsbG9jKHNpemVvZigqaXRl
bSksIEdGUF9LRVJORUwpOwoKCuKApgo+ICtpbnQgbXRkX3ZpcnRfY29uY2F0X25vZGVfY3JlYXRl
KHZvaWQpCj4gK3sK4oCmCgorZV9ub21lbToKKwlyZXQgPSAtRU5PTUVNOworcHV0X3BhcnRzOgor
CW9mX25vZGVfcHV0KHBhcnRzKTsKCj4gK2Rlc3Ryb3lfaXRlbXM6Cj4gKwltdGRfdmlydF9jb25j
YXRfZGVzdHJveV9pdGVtcygpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30K4oCmCgoKUmVnYXJk
cywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
