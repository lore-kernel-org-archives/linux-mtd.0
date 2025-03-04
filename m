Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5853C282D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0NCsARO3mjv1T4536/Q21n/K8Cj3A86mO8JJKn9Dg0=; b=JJaTYtrGQk2gL2
	nahqJK7kFqwtd+hRYu7bjBo5C9PeZA/Mj9yMdEtsKptOqiAvFFOGs2Dtx4R+ZHuQ2s3gnIpGXZGb/
	3it3s1+wqiyaZ4nIyNgHbsNegcix2BZE6Whrmb1c+3dMJojG6ZmTcZT6BfuhEezf3qYRx+ctZrBrR
	WFcvDL5vDKzc/T6DnzCLyn/00KE8U/S+INhIhF+REkCggkWUGVXn7l1OyFMw2rAGEzStuOaJIJpbU
	qBbQ6cN+XyIq4jDfXiK4xzaRL1/Q1ZsAZhefHoZ1KWYx5+mz/3AcXwkadA6CwXD/u7GtoWktw1iK7
	KyEFotemCtCa+N50BZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYNC-000000067dT-3eXc;
	Tue, 04 Mar 2025 19:56:14 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXqH-0000000601H-0WFP
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 19:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741116117; x=1741720917; i=markus.elfring@web.de;
	bh=7bItaIpL50iONjJ6ezepTySgEuIy1conWnocyy7c1HI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KBZjIhKSGu+H7K0E+EmJW7txizonPwtF66pEUvS9fagnc5l+pb/HAzddRr0fZCu8
	 PHvrGleKfwz7NzUpkhSAz7ojIfz623sJAYVysL5zi8T6FQwuuSmwEQhx0XTjQu5F6
	 7k4yw7oQB2QPMVS6Pb+Bjwz5at56x9RfJX6+qTZiwBi7bSSDpmUP67ZGAF04lrgVD
	 +yzDbRQXcVoYn8OhHOSdnTX9EnFXc4jUEJ5wfG2kNY5815IqMilwXFnq1wWmaysjG
	 R0KQE6kQmLAbyACKj+dcKdL9PPLzAuJSpjWKP0cM7+hRbOFqM0HTuRSd4iNjdDrTc
	 sWSTHq6uie7WC9Qv/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.64]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MfKtN-1tMFUk24Et-00nQUv; Tue, 04
 Mar 2025 20:21:57 +0100
Message-ID: <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de>
Date: Tue, 4 Mar 2025 20:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND] mtd: cfi_cmdset_0001: Fix exception handling in
 cfi_intelext_setup()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
Content-Language: en-GB
In-Reply-To: <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
X-Provags-ID: V03:K1:qKFVHeZFM8z5ZXsxO57qi6A5GLqriqNvol5/pp2fC4KpApqiHG1
 JjUKwLrZAmwzXRM5ufs7amW+9qBBkD9yaLqmHKD8kkpwnPbN3gkC4y4NhG4sgBQSKVOSecT
 4PQYkNBXjfG+6QnCVZwruHG9o6ZwvJhk5dwQql7N6A+YbNOar8t2XaQhNzJOkpi9VWhjW4i
 3SkCydtmLEmhP4fG/46zg==
UI-OutboundReport: notjunk:1;M01:P0:7XhKd8N636g=;17LWSq/5A434rFvDzWDT7dvIXld
 67ohFCtij2fYZibsznLRTKx3adqcpAeJos1pj2NqbmitXewkIUxZrE84wL7fQkp2HqQgFULKG
 ED4aqqTgQyTICT3Un2pIbMx4+r403h16ErubFPZ7bAJgdrmWJKUzEw6ypD9KxZuk8LhwGhJz4
 g9MFzPBSCuQUACLvaFGSIJrNE1BEZrZxROkkluMV+YwAmmYABU5Vk41mI7ZzOAK+E9owC6hj3
 a1HLMuTImfMKcsiZOA8C8pnIhzyy68kmJomSP6zgGn5SAOTrwdHwYuHb0F0RXnEKjp6WwXIzT
 v2lJN7Q9xyEgjrwgpU8iqjLOaVsxWbsmj6iVT24JLytlb5iCPzEeI7g4psektbejP9wkVtN90
 h66aMzIVqLFgj3SxnbEDKAm6CkTa7+3bvj6UDcUdqgvQzInIPURcy0KBd9uXUbmaMTu789f+t
 RRG17WIP+3K+Dhb/CW7PsYF4M1zMdu3/xLWFfn/6R/5giK6pXD0TiM5LzEn64WTETY2nmVShF
 5tU76uLwnNehzLOPg9iuYWzAkimO4jRITTxuNnQkWH4Rhwpjsz8v6hXBRDk/xmHANgAUv5REY
 TgEvBXxIqKi0N2eeP3F1zmdMfK14qFvQMSpVpgzSZUGTtNs17j/MOKlx00bzIu7cWvRNJRJm8
 YYz3cfrzZXxCTTCG+KfdFbXIJRsk4Lz14McTi3X7FlLvDyJQBQcQHf4xEfTQiv5v8OyufYXtw
 nwl51afKB3/+0zjoiwqJ5Cx7x3g05XE/08zuEcJ4Apmi4g0wIENjXaZmk+nvnTWO7pWZcjGug
 RPJT5oWwKzPB6OK7at/sceNmtAxwF5vCLJ06gFAJq1gQTGqccHZ2Cew0arYbRfF6I6kobIt9m
 6BdcT9RC6upuAd7/4sv8lmIn24yEWyUqH4UecKfgTC84vJeG6gdt65tWTZomdDaXyMFg6etQb
 As2CCP08OzyrtfFlfGyKTw3Y9Vfuu7Hb0FVf5+PJAi8IydpmySTAVULT0q8p546JX0IqEndo+
 1Bgk0+0Fr1oWFFNFwxUrSxz0xemK3dT4nuw01F0krrhLXnhNUD0LSzi+TRUorxJXGXzEkmuGi
 t3IF0yWJnOR4fF+SaxhOfHmZ07vxON95iA94gguhdmqUlHeoclxgoOFO6fNV+nHSjS6GT4fkP
 mOnXHJNe6+htnbJvB9RvPIh6W4RuxEsL4gdhF4934ohzyQyl6F/Li0z4mY6Fe/idzLVYeY5nY
 6PpdQP1Aa/nxp9KJxQ/we6A2pAUSav6cbtc+1ngAf8Ty9RftHZ+eynvFm3iEuq6VTHOXsxrdr
 qFvi3N481CAQyQ+dxFFC/f/Fh4y88y9bh/Y4MJpqOfnN7cNjuqDx0gON0XyK62NLQZiR2oNC4
 BF98kTmJ4xPEGfyXGM2//Gmtj3GvAUuNh2CTdZJWaZ5X27uyvHgy9tax3GhmfzruX8TYnVrQP
 Gk/GHoqXkje3IjrImP6HOOtpU3Xw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_112213_468752_285F8CA1 
X-CRM114-Status: GOOD (  11.14  )
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

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUdWUsIDIxIE1hciAyMDIzIDIwOjEzOjUxICswMTAwCgpUaGUgbGFiZWwg4oCcc2V0dXBfZXJy
4oCdIHdhcyB1c2VkIHRvIGp1bXAgdG8gYW5vdGhlciBwb2ludGVyIGNoZWNrIGRlc3BpdGUgb2YK
dGhlIGRldGFpbCBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIGZ1bmN0aW9uIOKAnGNmaV9p
bnRlbGV4dF9zZXR1cOKAnQp0aGF0IGl0IHdhcyBkZXRlcm1pbmVkIGFscmVhZHkgdGhhdCBhIGNv
cnJlc3BvbmRpbmcgdmFyaWFibGUgY29udGFpbmVkCmEgbnVsbCBwb2ludGVyIGJlY2F1c2Ugb2Yg
YSBmYWlsZWQgbWVtb3J5IGFsbG9jYXRpb24uCgoqIFRodXMgdXNlIG1vcmUgYXBwcm9wcmlhdGUg
bGFiZWxzIGluc3RlYWQuCgoqIERlbGV0ZSBhIHJlZHVuZGFudCBjaGVjay4KCgpUaGlzIGlzc3Vl
IHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KCkZpeGVzOiAx
ZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikKU2lnbmVkLW9mZi1ieTogTWFya3VzIEVs
ZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgotLS0KIGRyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMS5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAxLmMKaW5kZXggNTRmOTJkMDlkOWNmLi5hMDYzMThjZDVlYTQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jCisrKyBiL2RyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMS5jCkBAIC02MTQsNyArNjE0LDcgQEAgc3RhdGljIHN0cnVjdCBt
dGRfaW5mbyAqY2ZpX2ludGVsZXh0X3NldHVwKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQkJCSAg
ICBzaXplb2Yoc3RydWN0IG10ZF9lcmFzZV9yZWdpb25faW5mbyksCiAJCQkJICAgIEdGUF9LRVJO
RUwpOwogCWlmICghbXRkLT5lcmFzZXJlZ2lvbnMpCi0JCWdvdG8gc2V0dXBfZXJyOworCQlnb3Rv
IGZyZWVfbXRkOwoKIAlmb3IgKGk9MDsgaTxjZmktPmNmaXEtPk51bUVyYXNlUmVnaW9uczsgaSsr
KSB7CiAJCXVuc2lnbmVkIGxvbmcgZXJudW0sIGVyc2l6ZTsKQEAgLTYzMCw3ICs2MzAsNyBAQCBz
dGF0aWMgc3RydWN0IG10ZF9pbmZvICpjZmlfaW50ZWxleHRfc2V0dXAoc3RydWN0IG10ZF9pbmZv
ICptdGQpCiAJCQltdGQtPmVyYXNlcmVnaW9uc1soaipjZmktPmNmaXEtPk51bUVyYXNlUmVnaW9u
cykraV0ubnVtYmxvY2tzID0gZXJudW07CiAJCQltdGQtPmVyYXNlcmVnaW9uc1soaipjZmktPmNm
aXEtPk51bUVyYXNlUmVnaW9ucykraV0ubG9ja21hcCA9IGttYWxsb2MoZXJudW0gLyA4ICsgMSwg
R0ZQX0tFUk5FTCk7CiAJCQlpZiAoIW10ZC0+ZXJhc2VyZWdpb25zWyhqKmNmaS0+Y2ZpcS0+TnVt
RXJhc2VSZWdpb25zKStpXS5sb2NrbWFwKQotCQkJCWdvdG8gc2V0dXBfZXJyOworCQkJCWdvdG8g
cmVsZWFzZV9sb29wOwogCQl9CiAJCW9mZnNldCArPSAoZXJzaXplICogZXJudW0pOwogCX0KQEAg
LTYzOCw3ICs2MzgsNyBAQCBzdGF0aWMgc3RydWN0IG10ZF9pbmZvICpjZmlfaW50ZWxleHRfc2V0
dXAoc3RydWN0IG10ZF9pbmZvICptdGQpCiAJaWYgKG9mZnNldCAhPSBkZXZzaXplKSB7CiAJCS8q
IEFyZ2ggKi8KIAkJcHJpbnRrKEtFUk5fV0FSTklORyAiU3VtIG9mIHJlZ2lvbnMgKCVseCkgIT0g
dG90YWwgc2l6ZSBvZiBzZXQgb2YgaW50ZXJsZWF2ZWQgY2hpcHMgKCVseClcbiIsIG9mZnNldCwg
ZGV2c2l6ZSk7Ci0JCWdvdG8gc2V0dXBfZXJyOworCQlnb3RvIHJlbGVhc2VfbG9vcDsKIAl9Cgog
CWZvciAoaT0wOyBpPG10ZC0+bnVtZXJhc2VyZWdpb25zO2krKyl7CkBAIC02NjAsMTggKzY2MCwx
OCBAQCBzdGF0aWMgc3RydWN0IG10ZF9pbmZvICpjZmlfaW50ZWxleHRfc2V0dXAoc3RydWN0IG10
ZF9pbmZvICptdGQpCiAJLyogVGhpcyBmdW5jdGlvbiBoYXMgdGhlIHBvdGVudGlhbCB0byBkaXN0
b3J0IHRoZSByZWFsaXR5CiAJICAgYSBiaXQgYW5kIHRoZXJlZm9yZSBzaG91bGQgYmUgY2FsbGVk
IGxhc3QuICovCiAJaWYgKGNmaV9pbnRlbGV4dF9wYXJ0aXRpb25fZml4dXAobXRkLCAmY2ZpKSAh
PSAwKQotCQlnb3RvIHNldHVwX2VycjsKKwkJZ290byByZWxlYXNlX2xvb3A7CgogCV9fbW9kdWxl
X2dldChUSElTX01PRFVMRSk7CiAJcmVnaXN0ZXJfcmVib290X25vdGlmaWVyKCZtdGQtPnJlYm9v
dF9ub3RpZmllcik7CiAJcmV0dXJuIG10ZDsKCi0gc2V0dXBfZXJyOgotCWlmIChtdGQtPmVyYXNl
cmVnaW9ucykKLQkJZm9yIChpPTA7IGk8Y2ZpLT5jZmlxLT5OdW1FcmFzZVJlZ2lvbnM7IGkrKykK
LQkJCWZvciAoaj0wOyBqPGNmaS0+bnVtY2hpcHM7IGorKykKLQkJCQlrZnJlZShtdGQtPmVyYXNl
cmVnaW9uc1soaipjZmktPmNmaXEtPk51bUVyYXNlUmVnaW9ucykraV0ubG9ja21hcCk7CityZWxl
YXNlX2xvb3A6CisJZm9yIChpPTA7IGk8Y2ZpLT5jZmlxLT5OdW1FcmFzZVJlZ2lvbnM7IGkrKykK
KwkJZm9yIChqPTA7IGo8Y2ZpLT5udW1jaGlwczsgaisrKQorCQkJa2ZyZWUobXRkLT5lcmFzZXJl
Z2lvbnNbKGoqY2ZpLT5jZmlxLT5OdW1FcmFzZVJlZ2lvbnMpK2ldLmxvY2ttYXApOwogCWtmcmVl
KG10ZC0+ZXJhc2VyZWdpb25zKTsKK2ZyZWVfbXRkOgogCWtmcmVlKG10ZCk7CiAJa2ZyZWUoY2Zp
LT5jbWRzZXRfcHJpdik7CiAJcmV0dXJuIE5VTEw7Ci0tCjIuNDAuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
