Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E42C6FD1C
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Mar 2023 09:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xRDbzh3V0P3wWBb2Qzb5+7tAnuP0DWAqlYKi54QTis=; b=HqRDk4sehXhX8t
	/V1lKYX3q48MdeF5jSr7qF5mE3eOG+rcf7u65bVWtssbrXAtAnVdpO3n4HPcr8rqEazOyXiZUhK6t
	MZm/LkqWDdv6sgi43tixcvJpHPxxHSpNy4K1xLM5V7tltMxisj1TJtEywlC8zKGxeZnghZFIQD7li
	bMJJVS0KQQ6+1GliK/tVq4xR39iLR3X0M/2X0lLanQmzvYnu1WYNAcFXX/oUAVjdsD9K8UELi8TU/
	Npe2PCdiBINlXSYiBldt9CchOoLPgZi0NX+VZ957x9wJtVHsshAeR2llPoFmgJYgLW7k5ubMZNWE8
	PvM5LFgkm0Tdl5hqQwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg0Ra-006VKD-2x;
	Sat, 25 Mar 2023 09:44:14 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg0RV-006VJ2-1G
	for linux-mtd@lists.infradead.org;
	Sat, 25 Mar 2023 09:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679737434; i=markus.elfring@web.de;
	bh=KT3i+XCwOpBgEiE2fWQZLWXtbQK7aLmFAw3Ez2jHa1Y=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=jboFmKu+n5eM01Gkil+cVMh5DMDjPj6tHWmGomWZU80m4AImJbbCpEE4l3yah3gUD
	 irYtT4Ppy/lwuuS2YXz98HB/UQ6BDvckGWSQEIwPRDdAdl0SXghKZVsUKjIZ6VHrrd
	 zitnxGwyxe7jx6lOb3SkZxJ5Lt1vlkeO5fjQ+8gLZ/grYkWA6jFRQLe1aJAcTjv5VR
	 +Y6zy5OFJBgBishIuj4g3KpLWWg4xsnzZSIeE/IZCEbS6ohlV94rL48odPs6hk274o
	 N+XcEgi9wFINHRZdV31Xo8lYOCRBaIdkcAXKkPiiDaSfBhLAmukTxjE8Xc94dqn1x0
	 GfG8h8RHORWDw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Myv70-1qRf6e1jH8-00vo7V; Sat, 25
 Mar 2023 10:43:54 +0100
Message-ID: <5eeddd9f-7e68-6798-5a17-76e59278d968@web.de>
Date: Sat, 25 Mar 2023 10:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH resent] mtd: cfi_cmdset_0001: Fix exception handling in
 cfi_intelext_setup()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
In-Reply-To: <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
X-Provags-ID: V03:K1:SQOftfhZ5atvEUhY7+UaBk+J1ViVanb6XOugrqglrpZOrM5Ik0W
 vpnNbosTgnEQfItq5M5SrJOabW58VJd/dMZhN3LoHsE6JBic2otGqR1iqFNSg5AclLMwJb7
 CzF8vv2SlGzRpy/lhPhEvUeYgAWPZRGxTLgFMNAeWH5W1v0APcVI9nTAcovkmOGooDSkmB9
 vpyDWgrhFLUvrDf6bEakw==
UI-OutboundReport: notjunk:1;M01:P0:mIYw/rqJ+Zw=;muK+JFnOyudj8qp9W8OGaC/Y0e2
 Dw/VEetUaxOzhTaaHQEtNccC48YQL0q6QrpAo3MbP6Rf/Gi5fXC+JwclfQhcgjHjYPNxi1DY4
 L4kpMqyPXaaaWOMG5On6TvKTt2Wwa/bjSe9L9ZWCrXLNGmybgRYa9M0T+Bh4Y25e70E2rDtdR
 E+7dnz/cu47qstp9Fk55z+hcTN0wIc7L5etSTjPKhyxztLM5EY2cgmAbn7lGK6DLRtBv+P574
 S/JKE6UcG0uifuHvsaKIFe1sbFPjd3IfakZtWn+K9A9jqqMtWFyk8F5BuCRRIybVfGYHZgy+z
 7Vw86hpdgSMqPfEEVGhryqdyoeakNXJUn9etqdw3OPKQvsfc25v3yyckgfPkRDk9GxdJHC+i1
 xVgNf2YlLyCg9fj7zvJuaR3z43eQ1CgevrLG+oIGFWkReWj8XpfEjIsYCqKRTQyUDzoGpzHNs
 NMvQVueCm73ntmM1XBFEVidLGSXENGelAIUwOFyX6J6rHImJb5yaomiCJkI/6o3kZ6Q5OJQLU
 ypBNbmz+0UTD+b1Rmno7Qo9G2csr/uHkEkaSHZtcoX0PhTB73zrr4jtd31iqOqMSd3BVB0cJW
 5zm/fdHQm6Tk0P5mDfhVS83kZMRAJXWtDhJmA0Ffe3/fdU8JVwvQ3rgRlLYNkkiKX03mwfNSM
 AfcTZqhFrv+z+C+Ht06JzpIUzfsgYcNQ+OJNWyOMFzVObctuFcbCevpvJh7YD3BVAC0aPARj4
 W0/sKAX9CQ7iLoLl0Xe7+mKSTDkldwsk+K+opnjUI04yS1Ag7NTrId4lVezpa2ny+GxfNf6v0
 3cPNCWExWWIjxzsbUZNTbCSHQlmkBPJJz9ZqAzmfuUtPswd1le7PCRL+GNFxiUmeXP+GCysst
 gX7lfOK3GeTGFHV1caRB35HKkFTpLjrjCAQmuVFZggijGy+bRJ6BS0P7k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_024409_713775_51C828A2 
X-CRM114-Status: GOOD (  12.03  )
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

RGF0ZTogVHVlLCAyMSBNYXIgMjAyMyAyMDoxMzo1MSArMDEwMAoKVGhlIGxhYmVsIOKAnHNldHVw
X2VycuKAnSB3YXMgdXNlZCB0byBqdW1wIHRvIGFub3RoZXIgcG9pbnRlciBjaGVjayBkZXNwaXRl
IG9mCnRoZSBkZXRhaWwgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiDigJxj
ZmlfaW50ZWxleHRfc2V0dXDigJ0KdGhhdCBpdCB3YXMgZGV0ZXJtaW5lZCBhbHJlYWR5IHRoYXQg
YSBjb3JyZXNwb25kaW5nIHZhcmlhYmxlIGNvbnRhaW5lZAphIG51bGwgcG9pbnRlciBiZWNhdXNl
IG9mIGEgZmFpbGVkIG1lbW9yeSBhbGxvY2F0aW9uLgoKKiBUaHVzIHVzZSBtb3JlIGFwcHJvcHJp
YXRlIGxhYmVscyBpbnN0ZWFkLgoKKiBEZWxldGUgYSByZWR1bmRhbnQgY2hlY2suCgoKVGhpcyBp
c3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCgpGaXhl
czogMWRhMTc3ZTRjM2Y0MTUyNGU4ODZiN2YxYjhhMGMxZmM3MzIxY2FjMiAoIkxpbnV4LTIuNi4x
Mi1yYzIiKQpTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3Vy
Y2Vmb3JnZS5uZXQ+Ci0tLQogZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAxLmMgfCAx
OCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8w
MDAxLmMgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwppbmRleCA1NGY5MmQw
OWQ5Y2YuLmEwNjMxOGNkNWVhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAxLmMKKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAxLmMKQEAg
LTYxNCw3ICs2MTQsNyBAQCBzdGF0aWMgc3RydWN0IG10ZF9pbmZvICpjZmlfaW50ZWxleHRfc2V0
dXAoc3RydWN0IG10ZF9pbmZvICptdGQpCiAJCQkJICAgIHNpemVvZihzdHJ1Y3QgbXRkX2VyYXNl
X3JlZ2lvbl9pbmZvKSwKIAkJCQkgICAgR0ZQX0tFUk5FTCk7CiAJaWYgKCFtdGQtPmVyYXNlcmVn
aW9ucykKLQkJZ290byBzZXR1cF9lcnI7CisJCWdvdG8gZnJlZV9tdGQ7CgogCWZvciAoaT0wOyBp
PGNmaS0+Y2ZpcS0+TnVtRXJhc2VSZWdpb25zOyBpKyspIHsKIAkJdW5zaWduZWQgbG9uZyBlcm51
bSwgZXJzaXplOwpAQCAtNjMwLDcgKzYzMCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRkX2luZm8gKmNm
aV9pbnRlbGV4dF9zZXR1cChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAkJCW10ZC0+ZXJhc2VyZWdp
b25zWyhqKmNmaS0+Y2ZpcS0+TnVtRXJhc2VSZWdpb25zKStpXS5udW1ibG9ja3MgPSBlcm51bTsK
IAkJCW10ZC0+ZXJhc2VyZWdpb25zWyhqKmNmaS0+Y2ZpcS0+TnVtRXJhc2VSZWdpb25zKStpXS5s
b2NrbWFwID0ga21hbGxvYyhlcm51bSAvIDggKyAxLCBHRlBfS0VSTkVMKTsKIAkJCWlmICghbXRk
LT5lcmFzZXJlZ2lvbnNbKGoqY2ZpLT5jZmlxLT5OdW1FcmFzZVJlZ2lvbnMpK2ldLmxvY2ttYXAp
Ci0JCQkJZ290byBzZXR1cF9lcnI7CisJCQkJZ290byByZWxlYXNlX2xvb3A7CiAJCX0KIAkJb2Zm
c2V0ICs9IChlcnNpemUgKiBlcm51bSk7CiAJfQpAQCAtNjM4LDcgKzYzOCw3IEBAIHN0YXRpYyBz
dHJ1Y3QgbXRkX2luZm8gKmNmaV9pbnRlbGV4dF9zZXR1cChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkK
IAlpZiAob2Zmc2V0ICE9IGRldnNpemUpIHsKIAkJLyogQXJnaCAqLwogCQlwcmludGsoS0VSTl9X
QVJOSU5HICJTdW0gb2YgcmVnaW9ucyAoJWx4KSAhPSB0b3RhbCBzaXplIG9mIHNldCBvZiBpbnRl
cmxlYXZlZCBjaGlwcyAoJWx4KVxuIiwgb2Zmc2V0LCBkZXZzaXplKTsKLQkJZ290byBzZXR1cF9l
cnI7CisJCWdvdG8gcmVsZWFzZV9sb29wOwogCX0KCiAJZm9yIChpPTA7IGk8bXRkLT5udW1lcmFz
ZXJlZ2lvbnM7aSsrKXsKQEAgLTY2MCwxOCArNjYwLDE4IEBAIHN0YXRpYyBzdHJ1Y3QgbXRkX2lu
Zm8gKmNmaV9pbnRlbGV4dF9zZXR1cChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAkvKiBUaGlzIGZ1
bmN0aW9uIGhhcyB0aGUgcG90ZW50aWFsIHRvIGRpc3RvcnQgdGhlIHJlYWxpdHkKIAkgICBhIGJp
dCBhbmQgdGhlcmVmb3JlIHNob3VsZCBiZSBjYWxsZWQgbGFzdC4gKi8KIAlpZiAoY2ZpX2ludGVs
ZXh0X3BhcnRpdGlvbl9maXh1cChtdGQsICZjZmkpICE9IDApCi0JCWdvdG8gc2V0dXBfZXJyOwor
CQlnb3RvIHJlbGVhc2VfbG9vcDsKCiAJX19tb2R1bGVfZ2V0KFRISVNfTU9EVUxFKTsKIAlyZWdp
c3Rlcl9yZWJvb3Rfbm90aWZpZXIoJm10ZC0+cmVib290X25vdGlmaWVyKTsKIAlyZXR1cm4gbXRk
OwoKLSBzZXR1cF9lcnI6Ci0JaWYgKG10ZC0+ZXJhc2VyZWdpb25zKQotCQlmb3IgKGk9MDsgaTxj
ZmktPmNmaXEtPk51bUVyYXNlUmVnaW9uczsgaSsrKQotCQkJZm9yIChqPTA7IGo8Y2ZpLT5udW1j
aGlwczsgaisrKQotCQkJCWtmcmVlKG10ZC0+ZXJhc2VyZWdpb25zWyhqKmNmaS0+Y2ZpcS0+TnVt
RXJhc2VSZWdpb25zKStpXS5sb2NrbWFwKTsKK3JlbGVhc2VfbG9vcDoKKwlmb3IgKGk9MDsgaTxj
ZmktPmNmaXEtPk51bUVyYXNlUmVnaW9uczsgaSsrKQorCQlmb3IgKGo9MDsgajxjZmktPm51bWNo
aXBzOyBqKyspCisJCQlrZnJlZShtdGQtPmVyYXNlcmVnaW9uc1soaipjZmktPmNmaXEtPk51bUVy
YXNlUmVnaW9ucykraV0ubG9ja21hcCk7CiAJa2ZyZWUobXRkLT5lcmFzZXJlZ2lvbnMpOworZnJl
ZV9tdGQ6CiAJa2ZyZWUobXRkKTsKIAlrZnJlZShjZmktPmNtZHNldF9wcml2KTsKIAlyZXR1cm4g
TlVMTDsKLS0KMi40MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
