Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4681ACCA473
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jun 2022 01:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHg3f9xbnLLmfSEcDRLSuptHTp+gO9EqzHWni9PWrzA=; b=bOF23mpINI1G/B
	hUR4gEKeZk2rR1+k++nuqonw3glQd4z+K40DeN55ur8Zk+JidX1LUX/Yegpai672xuNdSMlJuKyOs
	zIyQSjQhmE4r/Jude5vg0V9AHzJUoe6wZwYopeEA18G3PySWD2dpPJpLtryC4TZ8W5lYZajjCZPo5
	37BlwYQUmXmZ26K27/IsGkjsssd25O0q/hA1TNFAmGAw194FFrxnrxznSlYhiIBs6UnpSc8Omlhzs
	kO54wfMQjTA+/x4f5d/HDKWP/Jah3UfQITxyVfp7X2krs9iTbLRFE0rdv8WA9JGEnVUccaArvIb82
	WUVeg21s963/MNCpQDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3oth-007ww1-1P; Wed, 22 Jun 2022 01:11:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3otb-007wsh-Pm
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2022 01:11:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id k22so14766264wrd.6
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jun 2022 18:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K6qKElTJRH1xqsuMI22agJPVydPpDeCDPF+3KJh55+w=;
        b=AXviIowkwnwirSoG8qaa9h+NDYTQ9tN16Nn3dLJ8JdzE2ao2zmkrL4JUz27+qnsRgb
         yLdqaqX6RCty27iZJUdPlTqnWPdmtlS2jPxk6aoA9jcbsKfe97425ioKLF7GGB29HVyg
         nqNUnSbaXdXFB/Ps5UkUA6Nysug8Mr5Pqb1UdvsVrJCi+vHl69WfRjHfTmfx6AsfPfei
         oy/oWx7zIUXWiQrjGovYUp7Jz/OevNQktwxw4RPAQQqW6CaeYo+4by9dD2aG1QVqBL9p
         LbFHkupeQ0Sh07KCOAFAaYdBtkbvhSULg9tPGgP5h5Y0lj0Ap5WumkWS8D1Trk0BGHuB
         Bx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K6qKElTJRH1xqsuMI22agJPVydPpDeCDPF+3KJh55+w=;
        b=bbxSRl6ByoDxw0AWsxc24m4mKwKd0T1JN6RQ3mTyfxOezU+hqx7SyYSvbWIcDVUFuf
         likfJmtsvpgU5pEDjh96J4uQR8VMgfNO+A1vsG5jOT6LEwIfPlsTB8hyo3kLShwr1sSn
         51t1mrqqHdCaSysgKIpMK1lLRoJ755ardzJlrPZYEF2GeE862OzFYhbcipLfyS1mPjev
         riydENLcCdLN3mZ8AkhBi4rRnKOBUEKsmOvj30vhKElzOZTi0244NhKugLL0kY8rR9AJ
         Hwncc1usdwry5E3QLNkKYhzpyzrKL5Ju0vdJ8J4j9ggM5OP/8hKZeS+rreofWJ+5hEEJ
         9Q1g==
X-Gm-Message-State: AJIora9rPo3uyT2vG+OrfdiN/KkyEBtT7uetD5UjJnvyzqpAOu8jwp4I
	ni7oSmDeQFmsIgBqYiU+Uxs=
X-Google-Smtp-Source: AGRyM1tPWwN6F6KomkQo6rqcXzv6P/7t0b4jDz7Bg0/MyPftF12VjIvqZBCSTVVjBbxBkxss/OtHYg==
X-Received: by 2002:a5d:6d09:0:b0:21a:1321:55b6 with SMTP id e9-20020a5d6d09000000b0021a132155b6mr640978wrq.117.1655860261401;
        Tue, 21 Jun 2022 18:11:01 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id x13-20020adfdd8d000000b0021b81855c1csm16560086wrl.27.2022.06.21.18.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 18:11:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mtd: partitions: support label/name only partition
Date: Wed, 22 Jun 2022 03:06:26 +0200
Message-Id: <20220622010628.30414-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622010628.30414-1-ansuelsmth@gmail.com>
References: <20220622010628.30414-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_181103_874141_D0A92769 
X-CRM114-Status: GOOD (  16.09  )
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

RG9jdW1lbnQgbmV3IHBhcnRpdGlvbiBub2RlcyB0aGF0IGRlY2xhcmUgb25seSB0aGUgbGFiZWwv
bmFtZSBpbnN0ZWFkCm9mIHRoZSByZWcgdXNlZCB0byBwcm92aWRlIGFuIE9GIG5vZGUgZm9yIHBh
cnRpdGlvbiByZWdpc3RyZWQgYXQgcnVudGltZQpieSBwYXJzZXJzLiBUaGlzIGlzIHJlcXVpcmVk
IGZvciBudm1lbSBzeXN0ZW0gdG8gZGVjbGFyZSBhbmQgZGV0ZWN0Cm52bWVtLWNlbGxzLgoKV2l0
aCB0aGVzZSBzcGVjaWFsIHBhcnRpdGlvbnMsIHRoZSByZWcgLyBvZmZzZXQgaXMgbm90IHJlcXVp
cmVkIGFuZCBhCidwYXJ0aXRpb24tJyBwcmVmaXggaXMgbmVlZGVkLgpUaGUgbm9kZSBuYW1lIHdp
dGggdGhlICdwYXJ0aXRpb24tJyBwcmVmaXggc3RyaXBwZWQsIGlzIHVzZWQgdG8gbWF0Y2gKdGhl
IHBhcnRpdGlvbiBhbGxvY2F0ZWQgYnkgdGhlIHBhcnNlciBhdCBydW50aW1lIGFuZCB0aGUgcGFy
c2VyIHdpbGwKcHJvdmlkZSByZWcgYW5kIG9mZnNldCBvZiB0aGUgbXRkLgpJZiB0aGUgcGFydGl0
aW9uIHRvIG1hdGNoIGNvbnRhaW5zIGludmFsaWQgY2hhciBmb3IgYSBub2RlIG5hbWUsIHRoZQps
YWJlbCBiaW5kaW5nIGNhbiBiZSB1c2VkIHRvIGRlY2xhcmUgdGhlIHBhcnRpdGlvbiBuYW1lLgoK
TlZNRU0gd2lsbCB1c2UgdGhlIGRhdGEgZnJvbSB0aGUgcGFyc2VyIGFuZCBwcm92aWRlIHRoZSBO
Vk1FTSBjZWxscwpkZWNsYXJlZCBpbiB0aGUgRFRTLCAiY29ubmVjdGluZyIgdGhlIGR5bmFtaWMg
cGFydGl0aW9uIHdpdGggYQpzdGF0aWMgZGVjbGFyYXRpb24gb2YgY2VsbHMgaW4gdGhlbS4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KLS0t
CiAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgfCAyMCArKysr
KysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKaW5kZXggZTFhYzA4MDY0NDI1
Li5mMWEwMmQ4NDBiMTIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKQEAgLTExLDYg
KzExLDE3IEBAIGRlc2NyaXB0aW9uOiB8CiAgIHJlbGF0aXZlIG9mZnNldCBhbmQgc2l6ZSBzcGVj
aWZpZWQuIERlcGVuZGluZyBvbiBwYXJ0aXRpb24gZnVuY3Rpb24gZXh0cmEKICAgcHJvcGVydGll
cyBjYW4gYmUgdXNlZC4KIAorICBBIHBhcnRpdGlvbiBtYXkgYmUgZHluYW1pY2FsbHkgYWxsb2Nh
dGVkIGJ5IGEgc3BlY2lmaWMgcGFyc2VyIGF0IHJ1bnRpbWUuCisgIEluIHRoaXMgc3BlY2lmaWMg
Y2FzZSwgYSBzcGVjaWZpYyBzdWZmaXggaXMgcmVxdWlyZWQgdG8gdGhlIG5vZGUgbmFtZS4KKyAg
RXZlcnl0aGluZyBhZnRlciAncGFydGl0aW9uLScgd2lsbCBiZSB1c2VkIGFzIHRoZSBwYXJ0aXRp
b24gbmFtZSB0byBjb21wYXJlCisgIHdpdGggdGhlIG9uZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQg
YnkgdGhlIHNwZWNpZmljIHBhcnNlci4KKyAgSWYgdGhlIHBhcnRpdGlvbiBjb250YWlucyBpbnZh
bGlkIGNoYXIgYSBsYWJlbCBjYW4gYmUgcHJvdmlkZWQgdGhhdCB3aWxsCisgIGJlIHVzZWQgaW5z
dGVhZCBvZiB0aGUgbm9kZSBuYW1lIHRvIG1ha2UgdGhlIGNvbXBhcmlzb24uCisgIFRoaXMgaXMg
dXNlZCB0byBhc3NpZ24gYW4gT0Ygbm9kZSB0byB0aGUgZHluYW1pY2NhbGx5IGFsbG9jYXRlZCBw
YXJ0aXRpb24KKyAgc28gdGhhdCBzdWJzeXN0ZW0gbGlrZSBOVk1FTSBjYW4gcHJvdmlkZSBhbiBP
RiBub2RlIGFuZCBkZWNsYXJlIE5WTUVNIGNlbGxzLgorICBUaGUgT0Ygbm9kZSB3aWxsIGJlIGFz
c2lnbmVkIG9ubHkgaWYgdGhlIHBhcnRpdGlvbiBsYWJlbCBkZWNsYXJlZCBtYXRjaCB0aGUKKyAg
b25lIGFzc2lnbmVkIGJ5IHRoZSBwYXJzZXIgYXQgcnVudGltZS4KKwogbWFpbnRhaW5lcnM6CiAg
IC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgogCkBAIC00MSw3ICs1MiwxMiBA
QCBwcm9wZXJ0aWVzOgogICAgICAgaW1tdW5lIHRvIHBhaXJlZC1wYWdlcyBjb3JydXB0aW9ucwog
ICAgIHR5cGU6IGJvb2xlYW4KIAotcmVxdWlyZWQ6Ci0gIC0gcmVnCitpZjoKKyAgbm90OgorICAg
IHJlcXVpcmVkOiBbIHJlZyBdCit0aGVuOgorICBwcm9wZXJ0aWVzOgorICAgICRub2RlbmFtZToK
KyAgICAgIHBhdHRlcm46ICdecGFydGl0aW9uLS4qJCcKIAogYWRkaXRpb25hbFByb3BlcnRpZXM6
IHRydWUKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
