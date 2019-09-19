Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4292EC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1342221929
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X230p+x2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="gDRsNW/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1342221929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaAXUlNOsFr5bH8RQZdUoQxIpCV8l2hTKyln3MPSZEI=; b=X230p+x26BNpJ5
	qwMiPnvxdr966e1CHvSRxR8SU0csLwJhiFmHefgm9i/y1T2igr1t9R7NsbzJPPW3iviidIIcP0xNI
	mWKadUpjzsDq3dk2FeXKFdGy2eGffVnhcK3VWL3aauKCCxIlbYH7FxhtOcMXOu3+C09Y8QBx52HCZ
	KBujLLnm2rVfmpeCxnaXcdeszFQo2nhZ/f6VLUvi+gsLV1yLl3x7wxQJco9zqkGQwJXdW1e6sL6jH
	ZWBC5OJVUKJ5iKS3DiT/BXDqIKOYlPTeQr2NrP9OH7ADPDUwVtM9587SqrhCrx+HV3gDXVZtEn7pN
	LIoD+/iyNZ3knHitCQaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAvBY-0001gm-4z; Thu, 19 Sep 2019 12:05:20 +0000
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAvBU-0001g9-FA
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 12:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1568894681;
 bh=XqLwPBm6k/DOpsT2zClkkvly20Eiqu43FoeN6TCgwUc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=gDRsNW/uEXN/4DlsHCf+oMM2eyLNzD/TsD2qbWZet6tjPrbMu3/AoR3sxxoUMVbej
 5Vfc9LBamlGV7LZhoSCo+ifVPFVx2tna8nXDY5FmnDgGnF9cNv3AeiVIvsNWsZ/UMx
 BZy1QLL9tos5DfuUqXNqdjXRdPutBYzfNKDMeY7k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.191.36]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MTdS4-1ibDT71Io4-00QOy2; Thu, 19
 Sep 2019 14:04:41 +0200
Subject: [PATCH v2] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in
 stfsm_probe()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Allison Randal <allison@lohutok.net>, Armijn Hemel <armijn@tjaldur.nl>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <eec0774d-135b-2b19-2595-7a126341c77c@web.de>
Date: Thu, 19 Sep 2019 14:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190919111014.6c569cf3@xps13>
Content-Language: en-US
X-Provags-ID: V03:K1:8McC+dHy4ZYmY1ktDGalc03+f442zOOtOaZUsfXrlCEwuCNDLtg
 X+8nunAIjpv6B/X1Xs+gmYT3Y+S1eS3t84HPDdzivx6nC27PBHEGzaomV6AWeA1Oop0M8V8
 8+hF7jJLRuJ0VKnjKti59q1Q9xLI5cwhkvk6N5vcVVX7lBEN0GquOx/FuprF3BY1sspgWXS
 U1+2DK0CFOyNvnD3v4ClQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q/ZJdiLLJ/I=:qDgNi9Xsqi6lvpzTK1J4NX
 /Xw29BNwG+IQv58y/VSSP+EFNCWRej0KVce/KwLELjHIzaL0vkyFmnyrPYjHjcibkrpPwpGyD
 RC3U3K8EgKw67ABgkgRD28Nh0arjVtciS5LpEBgYMYe7ZX1ig3QJtNhsaxBqnu6nZUpejTOib
 WQsljvWM+zjeS95UQvOlGG320ufpZ0YXO4CNPjpex9EHg5tOObPEV72QoB184Jg8hYVVETt4a
 CUkDWFbu/YQB9KrGCMLD3yVrksPNPuOM3yeV/Eklk45y4X2stLHEmyN7ipQm6/o7Bo/O/J9Mg
 DOyx1ncfk6vy1P+2TwC2mHnV6/HmYjcnf6iKZlcbrORI7EDqsnMF3pEqwG7fnbV7V3vYoINt6
 b4srWcmfbiyCQz/0+rmAwfjEWCzHq1dwe31fllOIukds8HkJslwNhlMnsymcWQdKd2tS4yy+D
 ABQ2q4b7HehX5sP8RNUGK8kAvKc7iPlv9ly2z2ylZsyhimiengfdcxaEsFs4m9+feZOdj52Yl
 7ByQz1zwxyEoJ+YnKl0ZORK4CiHuhgTvlQpqr8nnc4J3wge/SyV8c9C7Vpi/zi+YBgXp+7OTN
 yf68XF6ysKwwga5XXDvoXfe5VgF0Ldvq+zGutbT16K9ovtl6igCyeEiqJUkb11N3ZfzeOHyDp
 oHwcxmn5pmn3Z+qA+erLIEf8SQz2us+0PfWKU9THoHluWUgPJJYQOdUnHZhy6n07ATf7j3EWT
 YgZvKapJ+SVIMpNkzL0RFQmRBPY6WSi2J0QDNn8LrLugtF/5ze9BspOK2TA1RZ0jarghmERV2
 CqRQJ8XWfNjYveOVIjNgJZrx2UvBSTqiyP5IwqM6JzPRFc3mHFSbTDsVudEi73SgfGkrZlBR+
 K584HoA/VTvIMAihq2Ijuq4q5MfJ2ndK08hFjMHwpI0e+kaq5D/jGnH2M/lOnIxYart5jAaLX
 oOtqViuFXcBhhRGOVcJjkaTAF3BJAKt+6GbB5n1ZwHMpGEIUEV74Bzz13sSYW8zdNWYAzlseu
 61310DFBVoFD2Tz3aUymi9PsSH9vsKhtCfNxSTtDMV9ISrk18NfqBeLuCTWrBkvg7jDOkh1kf
 qiVErU6A1ntJ0XOAG+0gNmpVo4gaUIsPCfQRBi+dz+WOCTOyG9OUoCAE6p+koqv+MjKDxABvo
 5jpgRostS0t4nldr7ULMcnT6Xee2SmN9erNb40QCXqvslxIF3JjkP5PDrNzaQNlb7yAZMVO05
 3mYaJZFj2bIbb5vPqJOBm2qliI+ENSjIFk/vZWSRoaUKREBipDR+Wp9Q0ZIo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_050516_841990_20DA08C9 
X-CRM114-Status: GOOD (  12.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Himanshu Jha <himanshujha199640@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUaHUsIDE5IFNlcCAyMDE5IDEzOjMwOjUxICswMjAwCgpTaW1wbGlmeSB0aGlzIGZ1bmN0aW9u
IGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBmdW5jdGlvbi4KKiBUaHVz
IHJlZHVjZSBhbHNvIGEgYml0IG9mIGV4Y2VwdGlvbiBoYW5kbGluZyBjb2RlLgoqIERlbGV0ZSB0
aGUgbG9jYWwgdmFyaWFibGUg4oCccmVz4oCdLgoKVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkg
dXNpbmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxm
cmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Ci0tLQoKdjI6CkZ1cnRoZXIgY2hh
bmdlcyB3ZXJlIHJlcXVlc3RlZCBieSBNaXF1ZWwgUmF5bmFsLgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMTkwOTE5MTExMDE0LjZjNTY5Y2YzQHhwczEzLwoKKiBBbiBlcnJvciBtZXNzYWdl
IHdhcyBhZGp1c3RlZCBhbm90aGVyIGJpdC4KKiBBIHZhcmlhYmxlIHdhcyByZW1vdmVkLgoKCiBk
cml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyB8IDEzICsrLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9z
dF9zcGlfZnNtLmMKaW5kZXggZjRkMTY2N2RhYWY5Li5jZTE4MTk4MzAxZDUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCisrKyBiL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvc3Rfc3BpX2ZzbS5jCkBAIC0yMDE3LDcgKzIwMTcsNiBAQCBzdGF0aWMgaW50IHN0ZnNtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRldmljZV9ub2Rl
ICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwogCXN0cnVjdCBmbGFzaF9pbmZvICppbmZvOwotCXN0
cnVjdCByZXNvdXJjZSAqcmVzOwogCXN0cnVjdCBzdGZzbSAqZnNtOwogCWludCByZXQ7CgpAQCAt
MjAzMywxNyArMjAzMiw5IEBAIHN0YXRpYyBpbnQgc3Rmc21fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlmc20tPmRldiA9ICZwZGV2LT5kZXY7CgogCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsIGZzbSk7Ci0KLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwg
SU9SRVNPVVJDRV9NRU0sIDApOwotCWlmICghcmVzKSB7Ci0JCWRldl9lcnIoJnBkZXYtPmRldiwg
IlJlc291cmNlIG5vdCBmb3VuZFxuIik7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KLQotCWZzbS0+
YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOworCWZzbS0+YmFz
ZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJS
KGZzbS0+YmFzZSkpIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJIkZhaWxlZCB0byByZXNl
cnZlIG1lbW9yeSByZWdpb24gJXBSXG4iLCByZXMpOworCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJG
YWlsZWQgdG8gcmVzZXJ2ZSBtZW1vcnkgcmVnaW9uXG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoZnNt
LT5iYXNlKTsKIAl9CgotLQoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
