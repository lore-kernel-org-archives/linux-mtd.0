Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2ADE94116
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4vqEXyIJWMN9TwvEcTa4ivXr+alhkTQARVxYgINMurE=; b=K+fx+82GHM7h9q
	Orwhku7wKuSicxY7yj9jmWhGevbd+MMFJibxjRrA/hasIZkSlF7ecMrL5I9OdRkb49BUTflf9pzzO
	52kOT8/A6X5h2DamZY6TZ9vKTryaXBadXA46yasQtOv0xxjEJ6h2ZrrRS/CBFpTEn/rY5LC3AMCZ8
	TzAj20nDU4LZsjGMLVxinRFw4AM/xdf8ESsswp2ZNhJ9hUy3GGlJsb/LBqw8XXTXblKZyZBmPBdhp
	Z/GEzK/qGZzJgpI6EYDqbgXJssqtj66zHZ44l93iXso30KlzkJJ2Uzxz5A/LsZPNFIY7Ggv4a1G6H
	d4UK48b/Gy7UieRzPFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qorGZ-006RKt-1Y;
	Fri, 06 Oct 2023 20:17:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qorGW-006RJI-1B
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 20:17:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-690bc3f82a7so2264486b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2023 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623456; x=1697228256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVW48+aAw5RrT5lkfRy3SJYTnhGkwarT0QT62F6zY44=;
        b=fbirWDDSv3AQRquo2pb7mHFcoB2OdsG5MP0OiScd3ONYMNzYlSU2MBU8tk9LqZte3u
         +NcCqCyntpBejWbPyKEMTrBro0RxfilvwSVOHNTvPjOEdwlLa0CGp71mdht79qBpWgwY
         fNhcvzsHlhL6iMhCqokARKQeagd6QbBCuFoDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623456; x=1697228256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVW48+aAw5RrT5lkfRy3SJYTnhGkwarT0QT62F6zY44=;
        b=Wsb2xTgasz37NXCUXns0gUTRYbhcFTe1TwLAym1Kk0cEGYpK3fcU5HXaFW95BwoPt9
         +ODzJm8SMU44WJrqY8zLyd2/PXQaxd47DmPGSgJGo3vqMVA0DQrIR3d6XaTG6p7JQRf7
         BjW0BXPfJeha1VGkOnBWuFEOfIem2D5/KZWP71/UzDC+SM33dXgIP09XbJAjFlXS/08e
         FOcFwhmYEM9xBtdcq2XDwjdmKDFT4xCKzM4PNjMkBu2D4XyPLDiyxguSOwy8PyZWyzkD
         //B6VqRo9Ew7oS20bX5eXOSpInpeJrFxPFJxPmJ3Nv3RtqK3TY+/ylk/1DKl9qnbyyLn
         oXuw==
X-Gm-Message-State: AOJu0YyAdfnJNh7hJS+ucjxv45F3FsmLBJRphIrGu4YxKheno1TGeerO
	MnWyueN7wOekTU08OMCLqrjB+Q==
X-Google-Smtp-Source: AGHT+IGgULuRMAk+2xAiqAngtQMYH/45dfkfgIQakgeEwSnSB9Ck2fpTw3sOiYnEFueq2+Zw0HIj5g==
X-Received: by 2002:a05:6a00:1d89:b0:68f:c6f8:144a with SMTP id z9-20020a056a001d8900b0068fc6f8144amr8344041pfw.22.1696623456614;
        Fri, 06 Oct 2023 13:17:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g29-20020a63375d000000b0056c2de1f32esm3761746pgn.78.2023.10.06.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Roger Quadros <rogerq@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Valentin Korenblit <vkorenblit@sequans.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: rawnand: cadence: Annotate struct cdns_nand_chip with __counted_by
Date: Fri,  6 Oct 2023 13:17:34 -0700
Message-Id: <20231006201734.work.060-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=keescook@chromium.org;
 h=from:subject:message-id; bh=v/mBW37FRWiHDbQSeKGRt7jHSIbBK2m2caz2GN2pAMs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlIGtehhtNs4fsQLlK/idmpyBfIyy3VLPUCxgiM
 uN0LPqd+ImJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZSBrXgAKCRCJcvTf3G3A
 JkStEACSGTbTsp8zz1atoDGJhIXcLq7dkczKkpuqx43dYR8vq3nM6javyZ6DU7cAg2OhRoAplw0
 mA8jHnMFQixkl5LkbmCfoRytUqgJCK+dMCySAAPwBp9IItFtaqczmNI/I6/d/gDJvtqQQep0jSk
 PW0HSCeEDsFzX/CdW0t6C1dRPVu7gddhQI2dT1KUMTLPghKqCKjqgUrKfruh+yarpwMIKUmhV3X
 rklM4b718lqThCqUPASeb/zZeCoN3g+MQAmL5MM3Vf9Vtx780jFE4SHxFwk+do0CrYsWhTxO9a4
 8FNOJNfUrv8dasPXCafK9pQxYkzRE4lKjDlKWPbrzSfelocXGryBNFQPiOTkAkRMf3RqiNh2GCR
 z8QM/L+lmF4dv//gnu3oXL3ds1MRzA8FY5nKjYoduHvOOsVDQTEx+B+4XPa6vTmDxWk68HDhoOV
 CKOyMtZUCdXdo7dGXx+OhYtsFT/beclrvneNK+WXJJ8DAXpxRJYlmCGfmAV1/okr5oEOrE8U8ru
 cshkana+HpzpbJuzw28HhcouY+hWSF2Clzt6FUws6hL+evFTv6yEopyovGmCakC3k2VR5UMumZ7
 MvA//yU5JMxP7SDbF30UVevcNuhKSu2LoEBaAp4CJ4xAJzaBrUaKqgdOogIP6IIGac0nANokUqs
 9OfVz+T lNbq/PRA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_131740_403681_8B10DC96 
X-CRM114-Status: GOOD (  12.71  )
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

UHJlcGFyZSBmb3IgdGhlIGNvbWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9m
IHRoZSBfX2NvdW50ZWRfYnkKYXR0cmlidXRlLiBGbGV4aWJsZSBhcnJheSBtZW1iZXJzIGFubm90
YXRlZCB3aXRoIF9fY291bnRlZF9ieSBjYW4gaGF2ZQp0aGVpciBhY2Nlc3NlcyBib3VuZHMtY2hl
Y2tlZCBhdCBydW4tdGltZSB2aWEgQ09ORklHX1VCU0FOX0JPVU5EUyAoZm9yCmFycmF5IGluZGV4
aW5nKSBhbmQgQ09ORklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNweS1mYW1pbHkK
ZnVuY3Rpb25zKS4KCkFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9fY291bnRlZF9i
eSBmb3Igc3RydWN0IGNkbnNfbmFuZF9jaGlwLgoKQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CkNjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
PgpDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgpDYzogIkd1c3Rhdm8g
QS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+CkNjOiBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpDYzogTmljb2xhcyBGZXJy
ZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgpDYzogUm9nZXIgUXVhZHJvcyA8cm9nZXJx
QGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpDYzog
WWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4KQ2M6ICJVd2UgS2xlaW5l
LUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6IFZhbGVudGluIEtv
cmVuYmxpdCA8dmtvcmVuYmxpdEBzZXF1YW5zLmNvbT4KQ2M6IHllIHhpbmdjaGVuIDx5ZS54aW5n
Y2hlbkB6dGUuY29tLmNuPgpDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxp
bnV4LWhhcmRlbmluZ0B2Z2VyLmtlcm5lbC5vcmcKTGluazogaHR0cHM6Ly9naXRodWIuY29tL2tl
ZXMva2VybmVsLXRvb2xzL2Jsb2IvdHJ1bmsvY29jY2luZWxsZS9leGFtcGxlcy9jb3VudGVkX2J5
LmNvY2NpIFsxXQpTaWduZWQtb2ZmLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9y
Zz4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKaW5kZXggMDM0
ZWM1NjRjMmVkLi43ZDVlZjdmZmUwZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2Fk
ZW5jZS1uYW5kLWNvbnRyb2xsZXIuYwpAQCAtNTI2LDcgKzUyNiw3IEBAIHN0cnVjdCBjZG5zX25h
bmRfY2hpcCB7CiAJLyogRUNDIHN0cmVuZ3RoIGluZGV4LiAqLwogCXU4IGNvcnJfc3RyX2lkeDsK
IAotCXU4IGNzW107CisJdTggY3NbXSBfX2NvdW50ZWRfYnkobnNlbHMpOwogfTsKIAogc3RydWN0
IGVjY19pbmZvIHsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
