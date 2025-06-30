Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC789C83000
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 03:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r2YTSW7tg/QVv7+J1/6wmJMm73oj9hyEvGlaZOQR8IM=; b=N+8uqKCsauHfp7
	4izXx/I4zc28fj6h8GCzy75HtCh8pCt1y5iTaAdEWAx0jy8gNq83yNxmF//FLYV1PALXihKX45tvQ
	Xro5xC/Nv89k0iwX8GFhtw/MgOlSu79M9KD4Ct9BFsycMHLx5y2TwF9AusUequV6/MKEwtrJ5muw3
	cwoK4xZviw9nyf/SxLoczcIGKT+xX+293xH476l7ltQ+Y7n58h+vqWzum0EddeISKB5uP6Ywlils7
	Mgjxl02WCwtfTZogHci0WllVUdpqupnG3xvrryl0T8H8kd+Q9s2Sc/JYZANd+Fgq4+eq6WRoEX/zB
	6KwFB+LxT2PI1Q+5hb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5X5-000000019Pd-2Rfh;
	Mon, 30 Jun 2025 03:50:15 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5X2-000000019OX-26l6
	for linux-mtd@lists.infradead.org;
	Mon, 30 Jun 2025 03:50:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4180687b3a.3
        for <linux-mtd@lists.infradead.org>; Sun, 29 Jun 2025 20:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751255411; x=1751860211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS3uMD6coTyQ6ld95dZSw/chmAO1ya8AiyTyXgg1NkA=;
        b=Ak552Ke1R3AIazUTqRQo8KJpvI7QPuUB6/16xixz1meFPbYyI1F+lzgBmkgXZwmcjf
         K+OY8qZg+Nyg89PO2Bga0xPyx97E5nH0nFVJdGSJ+p+PoO/V+j7V0D0FhV7R7isE/Ab7
         MGzfZwFy9BGJkLxEtZuPEUNuSWG42mzyUaDCrDjePD+37aigzJ4aksrBbC/qNbmmE60k
         G+ylXe3uRB4THFvn8LCfU1pi4dH4OCMRS8+iyB6NTVjzQU1t9WoYwiG9ss5p+Wahp5i9
         xh+GvjyeoohGEtdmGSalbsC12CTZRETbwzNWdVg7AfcdNI92EDGA9DH7NqbVabzq8ege
         vdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255411; x=1751860211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS3uMD6coTyQ6ld95dZSw/chmAO1ya8AiyTyXgg1NkA=;
        b=KXx2I8YTfspA+aEHyoD590PxFeWP/PuCszv9AMDK41HLhGvoSmgbetYotFHsUo87ab
         7uelvZnBPm9iaYXSLno3euvhbP8JUcSScvBeofnISr0DquEscoRAf2W4pCDcduRb/3H9
         RcjQRrwHrFKnbYyGfPHFt6VlLt1FqTOGLVFDEj+5p8Q/l9ysnnmXFlixp7kwNJevK/AE
         PgIASXY/nSeXI+E4KhmMk+p4EBFskWr0GvfmGsxGK4zdxLZ7WTkRon4RcxO8F2/gUYc5
         mswsq1E2nsLejHcEK7YDk5oQGi5mMZQssSpgWGdKbtVUUPz82R+EbMcPxr/XStHMsMpX
         DokQ==
X-Gm-Message-State: AOJu0YzI2z+a93jJ945nDoxrumdiHAQouUJojsLFyho4WvFsgoAIc6Bm
	zTh/BMuqxjdMj6j4UAUb5WmpEmp+iPC66+XtLbM3XiBYWnE0wTsRRhab
X-Gm-Gg: ASbGncuE1Olbd18tgbq3e8NvAWBYJz1mapWTND1xKNCNArX5Ss4ATa1k963mLlmck5M
	N77+4TlRbWF27WO/C4nCCtngYLmycvnOOwyVEqXUg0aAixF7qYSb7afrAwNe/MVpFpIq0MNvawa
	Bpv+UizwSrgAkAzHp9E6wub+gPUXNEQ233JP4/+u+qJoFqaXaj/FyQJqRGRrnmgx0weQbkTWSKE
	2HQWp4nmOYLgSo9EFiS9Iys5h7wfukXY1uxe8DT1hpDNtXzExFHjB1UoReJOQfYcPOaV8FodU42
	lVkTfHcvlqb+aRP2MC/JYThcbmq70uCkBoPV9LfqhwNBBSTxvuygriNd185b8WeSGvOMKRdnC6O
	yoSS2vboXdgT783NtKHESRwXFr3+lPk7fSkBnJhshtew=
X-Google-Smtp-Source: AGHT+IGm+3mueaY7vn0ufRWgnmJ1q3u/xndByjPzeluFETrUS5APHTdn4iIBDyvRfiCgViEMNUWXRw==
X-Received: by 2002:a05:6a20:d486:b0:201:2834:6c62 with SMTP id adf61e73a8af0-220a16b359bmr17862154637.25.1751255411268;
        Sun, 29 Jun 2025 20:50:11 -0700 (PDT)
Received: from wuteng-VMware-Virtual-Platform.localdomain ([113.84.10.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31bea17sm6912262a12.46.2025.06.29.20.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:50:10 -0700 (PDT)
From: gigadevice2025@gmail.com
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Teng Wu <gigadevice2025@gmail.com>
Subject: [PATCH] mtd:spinand:gigadevice:Add support for GD5F1GM9 chips
Date: Mon, 30 Jun 2025 11:49:31 +0800
Message-ID: <20250630034931.7962-1-gigadevice2025@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_205012_548287_6E6910C6 
X-CRM114-Status: UNSURE (   8.54  )
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

RnJvbTogVGVuZyBXdSA8Z2lnYWRldmljZTIwMjVAZ21haWwuY29tPgoKLSBHRDVGMUdNOVVFeHhH
IChJRDpjODkxMDEgMy4zVikKLSBHRDVGMUdNOVJFeHhHIChJRDpjODgxMDEgMS44VikKCkJvdGgg
ZGV2aWNlIGZlYXR1cmU6CiAgLSAxR2IgZGVuc2l0eSAoMTAyNCBibG9ja3MpCiAgLSAyMDQ4LWJ5
dGUgcGFnZSBzaXplIHdpdGggMTI4LWJ5dGUgT09CCiAgLSA4LWJpdCBFQ0MgcmVxdWlyZW1lbnQg
cGVyIDUxMiBieXRlcwogIC0gUXVhZCBJL08gUmVhZCBzdXBwb3J0IChvcGNvZGUgRUJIKQogIC0g
dFBST0cg4omkIDMwMHVzIHR5cGljYWwgcGFnZSBwcm9ncmFtIHRpbWUKClRlc3RpbmcgZW52aXJv
bm1lbnQ6CiAgLSBQbGF0Zm9ybTogUmFzcGJlcnJ5IFBJLTUgKExpbnV4IHJhc3BiZXJyeSA2LjE1
LjAtcmM2LXY4KQogIC0gT3BlcmF0aW9ucyB2ZXJpZmllZDoKICAgICogRnVsbCBkZXZpY2UgcmVh
ZC93cml0ZS9lcmFzZSBjeWNsZXMgb24gYWxsIGJsb2NrcwogICAgKiBOYW5kc3BlZWQ6CiAgICAg
IH4gR0Q1RjFHTTlVRTogMi43NU1CL3MgcmVhZCwgMS45OU1CL3Mgd3JpdGUsIDQxLjI2TUIvcyBl
cmFzZQogICAgICB+IEdENUYxR005UkU6IDEuODRNQi9zIHJlYWQsIDEuNDVNQi9zIHdyaXRlLCA0
MS4wNE1TL3MgZXJhc2UKICAgICogTmFuZGJpdGVycnM6IEJvdGggY29ycmVkdGVkIDgtYml0IGVy
cm9ycyBwZXIgNTEyIGJ5dGVzCiAgICAqIFN0cmVzc3Rlc3Q6IEJvdGggMTQ0ayBjeWNsZXMgMCBi
YWQgYmxvY2sgZ3Jvd3RoCgpGdWxsIHRlc3QgbG9nOgogLVU6IGh0dHBzOi8vZ2lzdC5naXRodWIu
Y29tL1dULTg4Ni9iMGY0MWZiNTBkZGFjM2FkYzAwMjAyMjJjMWY4OWI2MQogLVI6IGh0dHBzOi8v
Z2lzdC5naXRodWIuY29tL1dULTg4Ni84Nzg0ZTcyZjQ2MzJkNTE5ODE0OTI4ZmY0OTIyNTk2MwoK
RGF0YXNoZWV0OgogLWh0dHBzOi8vZ2l0aHViLmNvbS9XVC04ODYvREFUQVNIRUVUL2Jsb2IvbWFp
bi9HRDVGMUdNOS12MS4wLnBkZgoKU2lnbmVkLW9mZi1ieTogVGVuZyBXdSA8Z2lnYWRldmljZTIw
MjVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYyB8IDIw
ICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYwppbmRleCBkNjIwYmIwMmEuLmY3ODFkMDM2OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRldmljZS5jCisrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYwpAQCAtNTMzLDYgKzUzMywyNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBnaWdhZGV2aWNlX3NwaW5hbmRfdGFibGVbXSA9IHsKIAkJ
ICAgICBTUElOQU5EX0hBU19RRV9CSVQsCiAJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZnZDVmeGdx
eF92YXJpYW50Ml9vb2JsYXlvdXQsCiAJCQkJICAgICBnZDVmeGdxNHVleHhnX2VjY19nZXRfc3Rh
dHVzKSksCisJU1BJTkFORF9JTkZPKCJHRDVGMUdNOVVFeHhHIiwKKwkJICAgICBTUElOQU5EX0lE
KFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4OTEsIDB4MDEpLAorCQkgICAg
IE5BTkRfTUVNT1JHKDEsIDIwNDgsIDEyOCwgNjQsIDEwMjQsIDIwLCAxLCAxLCAxKSwKKwkJICAg
ICBOQU5EX0VDQ1JFUSg4LCA1MTIpLAorCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygm
cmVhZF9jYWNoZV92YXJpYW50c18xZ3E1LAorCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFu
dHMsCisJCQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAorCQkgICAgIFNQSU5BTkRf
SEFTX1FFX0JJVCwKKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJmdkNWZ4Z3F4X3ZhcmlhbnQyX29v
YmxheW91dCwKKwkJCQkgICAgIGdkNWZ4Z3E0dWV4eGdfZWNjX2dldF9zdGF0dXMpKSwKKwlTUElO
QU5EX0lORk8oIkdENUYxR005UkV4eEciLAorCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFE
SURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg4MSwgMHgwMSksCisJCSAgICAgTkFORF9NRU1PUkco
MSwgMjA0OCwgMTI4LCA2NCwgMTAyNCwgMjAsIDEsIDEsIDEpLAorCQkgICAgIE5BTkRfRUNDUkVR
KDgsIDUxMiksCisJCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3Zh
cmlhbnRzXzFncTUsCisJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKKwkJCQkJICAg
ICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCisJCSAgICAgU1BJTkFORF9IQVNfUUVfQklULAor
CQkgICAgIFNQSU5BTkRfRUNDSU5GTygmZ2Q1ZnhncXhfdmFyaWFudDJfb29ibGF5b3V0LAorCQkJ
CSAgICAgZ2Q1ZnhncTR1ZXh4Z19lY2NfZ2V0X3N0YXR1cykpLAogfTsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlcl9vcHMgZ2lnYWRldmljZV9zcGluYW5kX21hbnVm
X29wcyA9IHsKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
