Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C304CCA46C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/agpW/lKntsXKX1/zVrk9YLmgZmGvMD3/pexV1vbLA=; b=t+cRsQM2xYknrg
	FLhgFQFMipynXLgqU4M+K7dih8ArCMwqXVSfKbeqk4agVaOSBoeuK+69vOeDHGkNff8V1yEUwK+Qy
	C4xepdcO2V4smc0Q7s3zuyVZlCA2aHK6k+EythS+ZW6mcljA3zy/tFK6dJUlq3cE8PyKqQK/Ndbaz
	2dmp7Qj6GEmq/OMgOS3JlZevTWwEkZGUXiCDw+QdOw4LnPOs8edyjTfZF8o2mFtKWcbZ6bNWiXrMm
	XgJJ0xhNAczYqz737HfLWEoFf98gXAeE7fVKqG+m8IwLp57QsQ/EP/5/e41N83JxbANqhy0oxIbE2
	UiDC0AD774mG77DAhwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtS-00000001t2r-0evh;
	Fri, 16 Oct 2026 03:46:06 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtF-00000001sdN-1BVg
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:55 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-838aaf42b2fso7428a34.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122352; x=1792727152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=TDuoh/z45boEMS0NNdkRXShxscS1Nm3tNAsSXTIIy09d5hftE3DpdM6pC+bbLdbp+E
         lx9Fg9Fug4qgIm18iztRJB+/slfsDvxUWp2DqOEzsUxxdULW7tSiVM73P8MjqvdOfwi8
         Phi7qdAmaXwAs9trkw3fNS089/dZKeg+Pv3+b6MZT9GY6voxdrusnVs9hD+Nsp4CQNvM
         2AKIGGMnwIJPAuAz27Xt+um0v0RquLrZaXpvDEnD5Y3jqnO6o2X+V8Jh1nCYTDfXJOKe
         LB+YZBQl3jtdDmjU4TRxMc9DnxtKPSpVGZgfVuagjRHm9tfY4nVySSrqww9/H2MMF71d
         3PJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122352; x=1792727152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=SXNGQjILVS/UglPrzKuIrIulSKhjrSpxmXOaHWycIKzS/CC5Rai9JzJSY5jf7u8ZHj
         J/nqL4yKNFA9MP/LOCyh+6ug11KeTjYBVoEO/596OOR+D8hIv/pDtuvV+Tc4B52BMuF+
         9MXUYmCi3Ss4vipu0hTD3VLX3rNBEO/tKDRmsjQZv/WefVqykX+lMeVbrAS73VL0WjJ8
         wvp+BwPErjN21m+MhVEX0QCa6A6ZwXayqg+F+1qRF0/J918pKUpiZzi2mM67fAviSYWK
         uB5zCzXRWOo2JjZ34OIaJXcp9PpefGQ5Ct9WLqkyJj4c2qD3ilJMTKcopD5ffotzjG6Z
         xTfw==
X-Forwarded-Encrypted: i=1; AKwUvBykUixVftqOSP7WP8LSxcqBDB+I3gojJDCv8km3JQ1IU9ZAEZTre0IRfYgUJk5WXSNRH+UPH58Gjjg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLBpZd16cXLXdIQJzIwS5EwUQS8kMbl77L/i33E6wN7IOcWdSNv
	f1imRMiEQwdtPZVMsBsmw0Cr+0WOE4KJsUYwY3I54EEmeodI5hohvwmT
X-Gm-Gg: AYBFou1jzrOj8OsmHcArQBMIdGTiEAJchnrfpg7WGxfu1FV4uAg9abQwQfnD1dqqEWd
	CDcIBQgfY1LeRygdIvUPYfiSwFz4/KmWCg8h0Ktvcs6CyqWX11zXsnAwk/R8ysU7xu2SpMKrkID
	/ZYJ9flxw1tmZq4HjqtodfUEzZDdi0W0cqWFDt9mLORkA/SnD8UvCO6IffZ/ZZDwFjSv6f9kztn
	W4wwj+oehQLnRRS0L48cFuVz4+0IS/k6DrhRR2uhkJ+3zBUq2A/Tw3HwtKgl6d0LFpfKFGEJ8Cx
	vbBFeDPPNq5MoPHhMcHz8dtZNkF96194kdfzxrY7B/C4tYD7ybOdjMz0pZllTZLAI142Hha40Yv
	0u3mGUn5mwoGk3kQWoK+16s7iQH/t/pG4gHlCoteMtiR4bZTI9Njr/JH52nx7UxaXaYqqI9LHKj
	jrZMIDwVFh4WMATavKqNcsunCcNDeMC3Y7lIPLMqH+uZWGLCSV11ff7IhCRADXWAN6OvqPGoHA/
	W0jLpoZDoHL5zlLDIp0xq/rNM5qzmnD666ciDzpWDSFxYB/9AmzB3VmdKXb8jY+Y/VRU5q1wayq
	BPIQJY1R62Np9LgeG2NC993MebBux/+p/4Sltt9BC7Kt50LOE4Ywg+RF/UyalytLMxhj8vits+q
	Nj12kKlFd6oiRl0FsdZmFPw==
X-Received: by 2002:a9d:6241:0:b0:843:39a0:7a8e with SMTP id 46e09a7af769-84339a08521mr158641a34.21.1792122352163;
        Thu, 15 Oct 2026 20:45:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:29 -0600
Subject: [PATCH v8 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-14-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204554_197246_381BABB6 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index dfb2a64c6b50..2a9fe89b1ba5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1650,8 +1650,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1677,8 +1675,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1704,8 +1700,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1734,8 +1728,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1759,8 +1751,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1804,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
