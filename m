Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCDEC8302F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uun7/BOJ+x+w97oFSVanq0PRvzh5NFQwj+0eGYNWNBw=; b=G2eo5MqkvCLX3eqcyHt/he6xTy
	YoD/6dYrvXtEa8LSW4MMy8AlHs92/6ckY7opK+rmZUhXmMOHPjFj1NxqRkwsA9UAHv7k+WQV95XcX
	RsvyiEYyVltl/QJNgHv9HHRW5TZ+1oEaddJTqxMTMFoxAdq96OKrEd4J3VfLbJWWtPJKQaPpGmGMy
	YbDwTTOXt9Zrhwl5MP2VvYpq/CJw+9DFMiIzYwMXylVIS/gIhQcm+0ziwWTm5PZyVcwcZYX5ZxRYr
	cjXfZpod8JgUrbn4QtOCXNzSd9tYJAariAL8a84oNGbPnw3Gi5HzKws5IjQQfSuxkITWhSKz1n0jm
	sYlrWGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXrf-00000004gSo-0b1Z;
	Tue, 01 Jul 2025 10:05:23 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXpo-00000004g2j-15d2
	for linux-mtd@lists.infradead.org;
	Tue, 01 Jul 2025 10:03:29 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e812fc35985so4136388276.0
        for <linux-mtd@lists.infradead.org>; Tue, 01 Jul 2025 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364207; x=1751969007; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AnkkRH/j4DqHfbJbBUtADuCSzfFi54cjI3nCR73CTcs=;
        b=g/vB6H/QDk05DLps7zmZpAyg97RYQFolcCEU12RpWtWhyLJ70KSMIHgpPxWYdC3Umd
         x0RmYQbPjRn5Ohdjp0/VgdnX4i8lFH+z0xH5dY4TOLsRFIW4JhAo+crm3MPYdpfetYTK
         Zsk8lbIgOQUpI0vJIIJ/rnLuHckO15yYghAWxcSGcsjVD15ktgxV5CfBej42LdZttFNj
         rz4lzxfsCJErjFDsU95i28+V9dZ/PgGI/nycwoGBfehNGixDNamzhfywl7DADeKOdtk7
         4Z/qJlF1O9eOueCci5jcA8F9Cf/+RvQ5+Sbi2H+3SZmpCYFVk1yCTJ9lkQbsGC9xZagb
         EkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364207; x=1751969007;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnkkRH/j4DqHfbJbBUtADuCSzfFi54cjI3nCR73CTcs=;
        b=wJpmGISyZTqSoEmfeHtbQMP/iyVEqWI28X57OEF0AJ64Q+fTnvBqidwR4OUNE0LwKF
         joGJbE5GNqjd1DtVJ42lvqozVnAuMnnD00xQDEzDOKThwfDV5cfBj7bLQwZoLNu/azTq
         SmBFKJEatD9Qi5FibbLMTnzunFkQEjsl+7R/9AOAqQ03B2o3XRRoYn3blKG7gNBAujDV
         TIwfbVIamtZJBKDvsQ1CyzImKTuVnZmwLKSLWR3ZtvlehWTof21qQzUfKanWnXWjqypo
         akoonMOXngz+++P4xotrDpuqyND6GdnFnZwQ/ru5Vqxmqb/Wj/bi67p/RZKCbnUPMKxj
         J60A==
X-Gm-Message-State: AOJu0Ywl4KQtW6zKqpszpPMv0KfrG+QeOUhq+l4+XjedYq0yyyJehN/M
	DPb5x81TsTBxpsBrmbozCqqMR4yOlT/6eo87CajFvbwnFSUN+lsvi9/HbB+k+PoZsEqBn3Woi7P
	juYU+pWTfSVHp32BL1KZrmkCgCTT/eS9B2BJ/
X-Gm-Gg: ASbGncuCSlT+89OgzclNec2xak8EpPwNhwD6TUAYntXfHvSTrQG6Wme715Tj+yOw+7e
	rbnaRhxqOzx07D11BP8Viaub/HStVpd+hwu9Epba82mLZJjHtgwhK3I6eu6qMCBcr/beuLbWYY0
	RutLwAxi5+Uel3HDytWInNcRWKs8qfUaMqn/vdPn7l1AY=
X-Google-Smtp-Source: AGHT+IGW8P/cNDeCm4GoxaDS0iPnLdis2313kcxhuwQM/dbVn5BoL0Y6NC3HvM9VRBpQFE7Ll211a71NpP7PGXKBUw0=
X-Received: by 2002:a05:6902:630e:b0:e7f:733e:5cc5 with SMTP id
 3f1490d57ef6-e87a7b6bacdmr15428164276.25.1751364207073; Tue, 01 Jul 2025
 03:03:27 -0700 (PDT)
MIME-Version: 1.0
From: Rafal Vonau <rafal.vonau@gmail.com>
Date: Tue, 1 Jul 2025 12:03:15 +0200
X-Gm-Features: Ac12FXxmIP5JcWZ5wOY11KHqPPnY__6XdG0AJLWpBsDRgm8er78I7JzVP46eifE
Message-ID: <CABj3Bj8-KVS2cvern77tPZGY9qHPnmwELkiMjAVYuB_X8zk0Wg@mail.gmail.com>
Subject: [PATCH] mtd: rawnand: pl35x: Fix BBT write operations by adding pure
 data out pattern
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006f92ae0638db41b1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_030328_298445_B5CB6316 
X-CRM114-Status: GOOD (  11.49  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--0000000000006f92ae0638db41b1
Content-Type: text/plain; charset="UTF-8"

The PL35x NAND controller driver was failing to write Bad Block Tables
due to missing support for pure data out operations. When the NAND subsystem
attempted to write BBT data using just DATA_OUT commands without preceding
address cycles or commands, the operation parser failed to match any pattern.

This patch:

Adds a dedicated execution function for pure data out operations

Includes a new pattern in the op parser for DATA_OUT only operation

The fix maintains proper separation of concerns where:

Command sequences are handled by nand_prog_page_begin_op/end_op

Data writing is handled by the controller's data out operation

BBT writes now complete successfully

Tested on Xilinx Zynq with Micron MT29F2G08ABBEAH4 NAND flash.

Signed-off-by: Rafal Vonau <rafal.vonau@gmail.com>

--0000000000006f92ae0638db41b1
Content-Type: text/x-patch; charset="US-ASCII"; name="zynq-pl35x-bbt-patch.patch"
Content-Disposition: attachment; filename="zynq-pl35x-bbt-patch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mckd0sdn0>
X-Attachment-Id: f_mckd0sdn0

ZGlmZiAtLWdpdCBhL2xpbnV4L2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJv
bGxlci5jIGIvbGludXgvZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVy
LmMKaW5kZXggMWQzZjAyNjFhNy4uYTJlOGJhOWRjNCAxMDA2NDQKLS0tIGEvbGludXgvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMKKysrIGIvbGludXgvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMKQEAgLTc1NSw2ICs3NTUsMzMg
QEAgc3RhdGljIGludCBwbDM1eF9uYW5kX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
IAlyZXR1cm4gMDsKIH0KIAorCitzdGF0aWMgaW50IHBsMzV4X25hbmRfZXhlY19kYXRhX291dF9v
cChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAorCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX3N1
Ym9wICpzdWJvcCkKK3sKKwlzdHJ1Y3QgcGwzNXhfbmFuZGMgKm5mYyA9IHRvX3BsMzV4X25hbmRj
KGNoaXAtPmNvbnRyb2xsZXIpOworCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0cjsK
Kwl1bnNpZ25lZCBpbnQgbGVuLCBvZmZzZXQ7CisKKwlpZiAoc3Vib3AtPm5pbnN0cnMgIT0gMSB8
fCBzdWJvcC0+aW5zdHJzWzBdLnR5cGUgIT0gTkFORF9PUF9EQVRBX09VVF9JTlNUUikgeworCQlk
ZXZfZXJyKG5mYy0+ZGV2LCAiSW52YWxpZCBkYXRhIG91dCBvcGVyYXRpb25cbiIpOworCQlyZXR1
cm4gLUVJTlZBTDsKKwl9CisKKwlpbnN0ciA9ICZzdWJvcC0+aW5zdHJzWzBdOworCW9mZnNldCA9
IG5hbmRfc3Vib3BfZ2V0X2RhdGFfc3RhcnRfb2ZmKHN1Ym9wLCAwKTsKKwlsZW4gPSBuYW5kX3N1
Ym9wX2dldF9kYXRhX2xlbihzdWJvcCwgMCk7CisKKwlkZXZfZGJnKG5mYy0+ZGV2LCAiRXhlY3V0
aW5nIGRhdGEgb3V0IG9wOiBsZW49JXUsIG9mZnNldD0ldVxuIiwgbGVuLCBvZmZzZXQpOworCisJ
cGwzNXhfbmFuZF93cml0ZV9kYXRhX29wKGNoaXAsIGluc3RyLT5jdHguZGF0YS5idWYub3V0ICsg
b2Zmc2V0LAorCQkJCSBsZW4sIGluc3RyLT5jdHguZGF0YS5mb3JjZV84Yml0LAorCQkJCSAwLCBQ
TDM1WF9TTUNfREFUQV9QSEFTRV9DTEVBUl9DUyk7CisKKwlyZXR1cm4gMDsKK30KKworCiBzdGF0
aWMgY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyIHBsMzV4X25hbmRjX29wX3BhcnNlciA9IE5B
TkRfT1BfUEFSU0VSKAogCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4ocGwzNXhfbmFuZF9leGVjX29w
LAogCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BBVF9DTURfRUxFTSh0cnVlKSwKQEAgLTc3NCw2
ICs4MDEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyIHBsMzV4X25hbmRj
X29wX3BhcnNlciA9IE5BTkRfT1BfUEFSU0VSKAogCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BB
VF9EQVRBX09VVF9FTEVNKGZhbHNlLCAyMTEyKSwKIAkJCSAgICAgICBOQU5EX09QX1BBUlNFUl9Q
QVRfQ01EX0VMRU0odHJ1ZSksCiAJCQkgICAgICAgTkFORF9PUF9QQVJTRVJfUEFUX1dBSVRSRFlf
RUxFTSh0cnVlKSksCisJLyogUHVyZSBkYXRhIG91dCBvcGVyYXRpb24gKGZvciBCQlQgd3JpdGVz
KSAqLworCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4ocGwzNXhfbmFuZF9leGVjX2RhdGFfb3V0X29w
LAorCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX09VVF9FTEVNKGZhbHNlLCAyMTEy
KSksCiAJKTsKIAo=
--0000000000006f92ae0638db41b1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--0000000000006f92ae0638db41b1--

