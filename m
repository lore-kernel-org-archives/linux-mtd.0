Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F21C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:43:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B35C360F43
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B35C360F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaBeYXDk966dY/qky0OSxj/RN3IR81JYLzpPPocNGWU=; b=PEx1cKvgNNhzT0
	i+qI0EAVjCUYTgEyPv1sPxN9VwDHspdwqQzrt3DoGdsSODPkx8W9TFLLnJzsA8dUn5UhLw6zNMObY
	fxpZfCkG1rj1CNT4GrVdBMwhWaibsV59B+GBVj2mUvKV4skLsN6ajSbuI5Pram4qeIoE05tQx0IJD
	h++44K6w7nra6w9fYrvz7Zx14cmneqEsxIiFuljw95oSfU+4siEHVJuOU1Ele7tROuqBrIR3PYD2y
	IQA9rYSGiRa8mwhwZcF0WmeHi/ZoUsTSD+p7I3C7xDx/87qEXOu0U0gZGmYn6DoAvG/DlEPw6oy0G
	/ukPLc7HjNXLEUGcQ/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIdn-001cYw-2q; Mon, 20 Sep 2021 12:43:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIcd-001cDN-B7
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 12:42:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b20so8605492lfv.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TgkRR7jceSG3sISw9EtlaxuO+Ca79VKVwo29bAvP5fI=;
 b=s4hLOdYrkJWqU9QfUxcZKehIh/nJu0e950CTAaaT16xIiWxBQdXpw1nrOo5VF4EClz
 08QmuTWf6QlU9WYteW5sm3nc6X49dKimoHADfogLU7n5dlP6BZmGrOZjEkrA4qj8PSZo
 W5zWuO7pqTNTXfj9RTc8jdEfSHWEVnEYRt97xnNUQuseq8Y/t+wh6CR8S5i+zSblV9WQ
 Lh+5isxoSGLrosnXmPBmUvRcn5LqIdcP8rVUJaUZmOWjwX3+BNFRwWwe/pskgO9HTjOw
 Ptc0HA7CY5lpRXeNu8FiiT0w5XI/d2I9kzst6o/DCD77Wx2gVRIek2zlzo4dYCbTxe+E
 1fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TgkRR7jceSG3sISw9EtlaxuO+Ca79VKVwo29bAvP5fI=;
 b=OH+tDxzg0RWvzObuhQC/MMtVwPiI7K9JIu+2zB6Tp1eowIDPGg/aIU5QQymJO+3jQi
 gXVUIgZfiQgnWO/OVsSG222XZEYn4CsljsZBPviihQdNoUwi760EE3qisKbpngRdoYku
 XAlDndDiif9mIxfXYL+kmWCP9AyTqtx3JCR0ZT44Dfoial8pD7PVyhqSH7mDTuhP/M5g
 EYcBt5G3Vj7JP0v5Zd6pp9oie7v6OnHbiq4Q9TeZ3F3XbQ/eFH8tI0JPum+kT42cuIZ9
 jX4KMMJ6lHBR/et50IwgrDZxSbC2YLTFFgDpuZghxGdCR5L9KFk8cYPHlzwWj4CYAkeI
 NDvw==
X-Gm-Message-State: AOAM531HLKOK3m7g/RwXzz+U0zbGe3HAbHHM7kFdR1Do7VxQZ4L4I+Ou
 uuYZk1zIF4y9G9usf741BYvPrA==
X-Google-Smtp-Source: ABdhPJwSJoLAEAHr8QbQNcp0H34mI/ghiqdYS6h5Nj2nmS8GtTJaaHhL0HdRSzUvFKGHyuLUNnM7fw==
X-Received: by 2002:ac2:4318:: with SMTP id l24mr18814386lfh.145.1632141729202; 
 Mon, 20 Sep 2021 05:42:09 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:42:08 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH 2/3] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Mon, 20 Sep 2021 14:41:40 +0200
Message-Id: <20210920124141.1166544-3-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_054211_431721_9B55C5A8 
X-CRM114-Status: GOOD (  15.75  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBBcnJpYSAxMCBTb0Mg
RlBHQS4KClNpZ25lZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJvemVrQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFyaXVzeiBHbGVib2NraSA8bWdsZWJvY2tpQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogVG9tYXN6IEdvcm9jaG93aWsgPHRnb3JvY2hvd2lrQGFudG1pY3JvLmNvbT4KU2ln
bmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEgPG1taWt1bmRhQGFudG1pY3JvLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4u
L2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMgIHwgMTI3ICsrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5k
dHMKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL01ha2VmaWxlCmluZGV4IDdlMDkzNDE4MDcyNC4uMGE3ODA5ZWIzNzk1IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9N
YWtlZmlsZQpAQCAtMTA3OCw2ICsxMDc4LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfSU5URUxfU09D
RlBHQSkgKz0gXAogCXNvY2ZwZ2FfYXJyaWExMF9zb2Nka19uYW5kLmR0YiBcCiAJc29jZnBnYV9h
cnJpYTEwX3NvY2RrX3FzcGkuZHRiIFwKIAlzb2NmcGdhX2FycmlhMTBfc29jZGtfc2RtbWMuZHRi
IFwKKwlzb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRiIFwKIAlzb2NmcGdhX2N5Y2xvbmU1
X2NoYW1lbGVvbjk2LmR0YiBcCiAJc29jZnBnYV9jeWNsb25lNV9tY3ZldmsuZHRiIFwKIAlzb2Nm
cGdhX2N5Y2xvbmU1X3NvY2RrLmR0YiBcCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
b2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc29jZnBn
YV9hcnJpYTEwX21lcmN1cnlfYWExLmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLmMxM2YxNmFmYTcyZgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMKQEAgLTAsMCArMSwxMjcgQEAKKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvZHRzLXYxLzsKKworI2luY2x1ZGUg
InNvY2ZwZ2FfYXJyaWExMC5kdHNpIgorCisvIHsKKworCW1vZGVsID0gIkVuY2x1c3RyYSBNZXJj
dXJ5IEFBMSI7CisJY29tcGF0aWJsZSA9ICJhbHRyLHNvY2ZwZ2EtYXJyaWExMCIsICJhbHRyLHNv
Y2ZwZ2EiOworCisJYWxpYXNlcyB7CisJCWV0aGVybmV0MCA9ICZnbWFjMDsKKwkJc2VyaWFsMSA9
ICZ1YXJ0MTsKKwl9OworCisJbWVtb3J5IHsKKwkJbmFtZSA9ICJtZW1vcnkiOworCQlkZXZpY2Vf
dHlwZSA9ICJtZW1vcnkiOworCQlyZWcgPSA8MHgwIDB4ODAwMDAwMDA+OyAvKiAyR0IgKi8KKwl9
OworCisJY2hvc2VuIHsKKwkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMToxMTUyMDBuOCI7CisJfTsK
K307CisKKyZvc2MxIHsKKwljbG9jay1mcmVxdWVuY3kgPSA8MzMzMzAwMDA+OworfTsKKworJnVz
YjAgeworCXN0YXR1cyA9ICJva2F5IjsKKwlkcl9tb2RlID0gImhvc3QiOworfTsKKworLyogRm9s
bG93aW5nIG1hcHBpbmdzIGFyZSB0YWtlbiBmcm9tIGFycmlhMTAgc29jZGsgZHRzICovCismbW1j
IHsKKwlzdGF0dXMgPSAib2theSI7CisJY2FwLXNkLWhpZ2hzcGVlZDsKKwlicm9rZW4tY2Q7CisJ
YnVzLXdpZHRoID0gPDQ+OworfTsKKworJmVjY21nciB7CisJc2RtbWNhLWVjY0BmZjhjMmMwMCB7
CisJCWNvbXBhdGlibGUgPSAiYWx0cixzb2NmcGdhLXNkbW1jLWVjYyI7CisJCXJlZyA9IDwweGZm
OGMyYzAwIDB4NDAwPjsKKwkJYWx0cixlY2MtcGFyZW50ID0gPCZtbWM+OworCQlpbnRlcnJ1cHRz
ID0gPDE1IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8NDcgSVJRX1RZUEVfTEVWRUxf
SElHSD4sCisJCQkgICAgIDwxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAgICAgPDQ4IElS
UV9UWVBFX0xFVkVMX0hJR0g+OworCX07Cit9OworCismZ21hYzAgeworCXBoeS1tb2RlID0gInJn
bWlpIjsKKwlwaHktYWRkciA9IDwweGZmZmZmZmZmPjsgLyogcHJvYmUgZm9yIHBoeSBhZGRyICov
CisKKwltYXgtZnJhbWUtc2l6ZSA9IDwzODAwPjsKKwlzdGF0dXMgPSAib2theSI7CisKKwlwaHkt
aGFuZGxlID0gPCZwaHkzPjsKKworCW1kaW8wIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJ
CSNzaXplLWNlbGxzID0gPDA+OworCQljb21wYXRpYmxlID0gInNucHMsZHdtYWMtbWRpbyI7CisJ
CXBoeTM6IGV0aGVybmV0LXBoeUAzIHsKKwkJCXR4ZDAtc2tldy1wcyA9IDwwPjsgLyogLTQyMHBz
ICovCisJCQl0eGQxLXNrZXctcHMgPSA8MD47IC8qIC00MjBwcyAqLworCQkJdHhkMi1za2V3LXBz
ID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXR4ZDMtc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICov
CisJCQlyeGQwLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQlyeGQxLXNrZXctcHMgPSA8
NDIwPjsgLyogMHBzICovCisJCQlyeGQyLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQly
eGQzLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQl0eGVuLXNrZXctcHMgPSA8MD47IC8q
IC00MjBwcyAqLworCQkJdHhjLXNrZXctcHMgPSA8MTg2MD47IC8qIDk2MHBzICovCisJCQlyeGR2
LXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQlyeGMtc2tldy1wcyA9IDwxNjgwPjsgLyog
NzgwcHMgKi8KKwkJCXJlZyA9IDwzPjsKKwkJfTsKKwl9OworfTsKKworJmkyYzEgeworCXN0YXR1
cyA9ICJva2F5IjsKKwlpc2wxMjAyMjogaXNsMTIwMjJANmYgeworCQlzdGF0dXMgPSAib2theSI7
CisJCWNvbXBhdGlibGUgPSAiaXNpbCxpc2wxMjAyMiI7CisJCXJlZyA9IDwweDZmPjsKKwl9Owor
fTsKKworJnVhcnQxIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismcXNwaSB7CisJc3RhdHVz
ID0gImRpc2FibGVkIjsKKworCWZsYXNoMDogbjI1cTAwQDAgeworCQkjYWRkcmVzcy1jZWxscyA9
IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MT47CisJCWNvbXBhdGlibGUgPSAibjI1cTAwIjsKKwkJ
cmVnID0gPDA+OworCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCWNkbnMscGFn
ZS1zaXplID0gPDI1Nj47CisJCWNkbnMsYmxvY2stc2l6ZSA9IDwxNj47CisJCW0yNXAsZmFzdC1y
ZWFkOworCQljZG5zLHJlYWQtZGVsYXkgPSA8ND47CisJCWNkbnMsdHNoc2wtbnMgPSA8MjAwPjsK
KwkJY2Rucyx0c2QyZC1ucyA9IDwyNTU+OworCQljZG5zLHRjaHNoLW5zID0gPDIwPjsKKwkJY2Ru
cyx0c2xjaC1ucyA9IDwyMD47CisKKwkJcGFydDA6IHFzcGktYm9vdEAwIHsKKwkJCWxhYmVsID0g
IkZsYXNoIDAgUmF3IERhdGEiOworCQkJcmVnID0gPDB4MCAweDAxMzQwMDAwPjsKKwkJfTsKKwkJ
cGFydDE6IHFzcGktcm9vdGZzQDEzMjAwMDAgeworCQkJbGFiZWwgPSAiRmxhc2ggMSBqZmZzMiBG
aWxlc3lzdGVtIjsKKwkJCXJlZyA9IDwweDAxMzQwMDAwIDB4MmNjMDAwMD47CisJCX07CisJfTsK
K307Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
