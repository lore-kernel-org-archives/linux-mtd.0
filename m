Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF054C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Nov 2022 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BhSQCvNTFFzBlaB6OzMRJpEPsNgSF5vjBLCOcacfxsQ=; b=00s4b1sfKhBJ9j
	P1NrABO7RvcIG9hPzDCbryjzevMiv3bnv3JH4FehJ/qT3Kqy4fOpPdXF3q3CSKZ0MFM9d8jb/Sg1S
	5tkUQF3GZTeUk8NN1kgeQHwJ0WcoST6/jlQ9+jnql3OfKD60x+bmC9OUb9+Ek/869KaAidNZCyxvZ
	Ju9HlevCxNNIXAM8mMI5Pj82CakMBbB+2mfRGgjBdXuMsA43ZOapNx1/UGknUMCiQ+VWqmtrCqsR1
	rbuYiX1gmqp/fGOsrXlUMxLchI4SEZtbLzJAs7/fEZ3yy3aEouhAOPQFy0l7illVQIsfN3I3Sqtcg
	QzcpPVD2trigBhGpdN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opu8z-005zO5-Ii; Tue, 01 Nov 2022 16:29:41 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opu8u-005zNH-6R
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2022 16:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667320155; bh=hpyKnFMfRY+QUzSkXdnEo0r31KZTp9ZrAIAHMs9/vko=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=TwfpfvlcbX/NGrufGPnMVzdfHxCc1ipIT76/hDpprpXXZYGOD8DRJDcGHzf6IzCjC
	 UEN7w9VTDPRWpdLqlGQMPI6tYbZvdXRszABwyRSAYVbd3GD0AeaZe9ahLmbJd13c57
	 QMiQwv17Z6gkpaJv2CrbOs+Lvt9zgJDEv0bPywpZOxpRtKRKD6ZtCOrYhRzZEdORKh
	 alrsvtOOpxPmlP+nTyx7V+g1YYpg+/LRirMIWSTHqFRJVa/c3ovBVLW5GOp4MyptJx
	 jmx8s6Y5KaEOiq3qk5eWSARdN1lBcrrOoxyPfJmddKW5gD0oQei2Dm38W/XMPYrvbi
	 2F2D7m/B8AR4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.126.36]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzyP-1pSoOC1LgN-00dYwf; Tue, 01
 Nov 2022 17:29:15 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: Fix formatting in spi_nor_read_raw() kerneldoc comment
Date: Tue,  1 Nov 2022 17:29:06 +0100
Message-Id: <20221101162906.990125-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:im/36SfJT8JE/0h9h9COAAR5cpMlNHDMDFoI5ouejQkwysdwYAU
 C+WEMsKg7YileVZYKf5oFqCSIt2A8JS0Nr61SQRkFCWV4iulXNgvN2E16Xw/VO+v0VVvZjI
 Y4+xCStrtF0MitTvIx71VD+bwK/25D70k5QRibPgoTxtdcMSj1gImcOVhquKcKFVZGlsJaE
 WfU/u/9ehekV+2ij3keIg==
UI-OutboundReport: notjunk:1;M01:P0:XKGDViQ55uY=;dNARUL20UtjzgjPPFkB79uGecoi
 qY92ZpKzo31oPHwJrOwRqYOC7CknyRZu9OP+Fa6bzaxofyParDofUaGr8IANzJYN8I2jUVGAe
 FEr+BQJiScLVfrqO2++laIMwndkkBJ3UI0/uHmIV/kT8hwnm+L6D8VsyPOlZm7nLC2xuTrgpT
 8/EmuFOfG37FSaaxtXQiCufrjoz4JSMLtHzHqIO29sEZuP8K8Et3lS7R/FMz1hVPhy9jEbCo7
 ScwbNaZ4fNpSRwimOGJlEFHznrQd/L5erUstbta/rHxa0ZAmj9GOwv/w3aiw184/ePR2bodZP
 HB/qmdwhpUIW+o/wlh0Q4p29s922AR6KBxLxN579HURBE68gzUZbWnG+wWO4xIyOm5xLgo/tc
 2p86WLGyxnpIhXbCqS/MILbqWdJ0FAhRqj3dN2fmDmmlg1wufHP0U3cPDYiNHKD9avcxnYlIB
 dnUBxpVK9qXdJ4evbLtdmHIwHUDKLgROz6MIz0vKWtP9ncnUPahUpEpCkei/jnCl1i9kWIGUY
 SniIvd78rCugTe1znKAyx6I9mnBiAPN1UoDn2Neao3xmlQPtQuvjJ3akERmhoBHsS4rpVBbII
 7+qfHQwjZsjBCVDRgLPpPaeztfdUWmWBwWIEoUl3S27Eo4w/gP/YnVZTfWlAYUY4asrJPHqJo
 YVlJjDXxOY/M5IaUF1WSb0sOkRo5TCXh7vpJfd8luz83gASOoBJOuKPVuMdgtURIdptQiH3Iv
 HcgdQ+uPv2+4wycNwmk7KKKvN/Xrt/f2C0v9ZNIs3UePsyudXVKHXEQ6KJUM8SzCGwcXOujJ7
 y0wgJdHt/g/9TZe9mA2naAPlkw4QzIdfu5Mfq7f6Iuk2/TukcKaMgBwc4fXb3QUD7J8XRxmOB
 tvIL+MS1g/Ay+y1UKaHgU9dLlVjz0KAFoMtefAb0xnur68cGVT1Xy96isbt2IH8VsEG3rKkOP
 IF6Fvg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_092936_538575_5546E623 
X-CRM114-Status: GOOD (  10.65  )
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

SXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIHB1dCAic2V0IiBvbiBpdHMgb3duIGxpbmUgbGlrZSB0
aGF0LgoKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJA
Z214Lm5ldD4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvc3BpLW5vci9zZmRwLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwppbmRl
eCAyMjU3ZjFiNGMyZTJkLi4zZTBiYjM4M2FiOGUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL3NmZHAuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwpAQCAtMTM1LDgg
KzEzNSw3IEBAIHN0cnVjdCBzZmRwXzRiYWl0IHsKIC8qKgogICogc3BpX25vcl9yZWFkX3Jhdygp
IC0gcmF3IHJlYWQgb2Ygc2VyaWFsIGZsYXNoIG1lbW9yeS4gcmVhZF9vcGNvZGUsCiAgKgkJCWFk
ZHJfbmJ5dGVzIGFuZCByZWFkX2R1bW15IG1lbWJlcnMgb2YgdGhlIHN0cnVjdCBzcGlfbm9yCi0g
KgkJCXNob3VsZCBiZSBwcmV2aW91c2x5Ci0gKiBzZXQuCisgKgkJCXNob3VsZCBiZSBwcmV2aW91
c2x5IHNldC4KICAqIEBub3I6CXBvaW50ZXIgdG8gYSAnc3RydWN0IHNwaV9ub3InCiAgKiBAYWRk
cjoJb2Zmc2V0IGluIHRoZSBzZXJpYWwgZmxhc2ggbWVtb3J5CiAgKiBAbGVuOgludW1iZXIgb2Yg
Ynl0ZXMgdG8gcmVhZAotLQoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
