Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B8C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 02:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8K3n8F8FOvFhNdCpM6OWiyFr8JNqvp435SlLfWs9fw=; b=vlyUJOjqlHyUXw
	yobW4QbkUwlkCo7LLdmSk85uOzWZtTcFJZNMhxiQKJ1kZQmZQiVMhMgoa9RvSp9q8oKbGiVnTgpUg
	+IMJszUOfT3HfUckeFJaJm3wor+KNYn3kwvYKtuOAjf67g7pCRHnHvGlyVS3ctNm4KeWCZoSoA6gp
	vxXucYGUCwxTyKNN6Z1FawuuTtdGPliweYjA28iLbXxuiw/iinM+HE9lcGghhIN5aFaHm58nCQ8vr
	ANeyVx1niwx6xMCZkSNBtWxcQQfQgzWWo4Dy6mdP2OqpHrYx4I6YiQPL6LrLdQiia8p3E+Zz520L+
	D57rOoUJlzEUroPnotbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7iB-005tsB-0I;
	Tue, 25 Jul 2023 02:23:43 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7i5-005tqt-1l
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 02:23:40 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b9f47214a3so4719897a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690251816; x=1690856616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH5fCvhDCpjG0CobTB17vbLDsHtpAVwYi60FmbCPgWo=;
        b=kqVbzU+U2i+YwX+pjrJ49x7+xz/BWnU8/zBH5IjFq2DeTZduOgrRP/e2ht7I2nQ/Pn
         g+rwCIyn85yrvGv04+xLNjnoBKDYYUm02ZqNvtkLgTzj5s+M+a6v7ueKzXivR9Lt4E0i
         kz9uhNuSUdUOnckQUSfF3GmuyKVZ4RlfnNUvaS/j/XRb6UOy/YSNndVtHde8UwhwIo5t
         GsoJGq7mxJdcOQl4cfbtt+77nKhuiA+osW+jB4IUDM1UYlpfM5WboYtbIvKwCA0WN5fM
         6U/q3vIwxEOvGj0gImpiQcY6A4aE0Msi8OyQDrgvugp3ftpCkkr45JmUwOsW7Ws2LvAi
         Q/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690251816; x=1690856616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JH5fCvhDCpjG0CobTB17vbLDsHtpAVwYi60FmbCPgWo=;
        b=YXRB1BqO3JSEId3XOlV7LVt0SQZBn6A57+vKluFW53w3irAOgcFTTKnoHtIruNe9Cp
         b2EzIpMnJsjurx/0ViCY1y7NjwekFS3xKteGe+1pmXHf2S5rJ7eeIZJfZa3eT7MqZyNX
         ayy44zeyi/QXDyT7n2CZb2prUqczUGwA5Ys0qVzc+d3dPi4ixuWjD//YpDsoOV7IHzx0
         X+pOYDQZUcgBp3DV90/ahLQQaakPsFe3wpvdtpAX1kb3vnasARxDrDXevUZM7VEeZW5f
         Sp1b4Ed4j7Oyb3pE8GJdYTgprtEHIxOhAwpA1m9TLuNdEtqBV0A1X6L2idNBBYRmAs0K
         s8/A==
X-Gm-Message-State: ABy/qLYjdAxt6j3Zyf9MBRZjj06H5bJ6oG+NHE7uRbt4CAYcVYIoRfdc
	xIa6jZ+2gBbVRZ/8uOH4C4I=
X-Google-Smtp-Source: APBJJlGjWqE8+6fLyEjAXBNASKw777DhHaaltg03pweQLXI443lhNcvVprLCOJsSDmAFS1koItJYcA==
X-Received: by 2002:a05:6870:5493:b0:1ba:d044:8a4 with SMTP id f19-20020a056870549300b001bad04408a4mr12645615oan.18.1690251816117;
        Mon, 24 Jul 2023 19:23:36 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id u6-20020a62ed06000000b0067a50223e3bsm8393103pfh.111.2023.07.24.19.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 19:23:35 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 8084A80BB5;
	Tue, 25 Jul 2023 10:22:40 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 2/2] mtd: spi-nor: add support for Macronix Octal flash
Date: Tue, 25 Jul 2023 10:23:02 +0800
Message-Id: <20230725022302.210275-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_192337_582842_7F58C40F 
X-CRM114-Status: GOOD (  11.09  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

Adding Macronix Octal flash for Octal DTR support.

The octaflash series can be divided into the following types:

MX25 series : Serial NOR Flash.
MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
LW/UW series : Support simultaneous Read-while-Write operation in multiple
               bank architecture. Read-while-write feature which means read
               data one bank while another bank is programing or erasing.

MX25LM : 3.0V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

MX25UM : 1.8V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf

MX66LM : 3.0V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

MX66UM : 1.8V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

MX25LW : 3.0V Octal I/O with Read-while-Write
MX25UW : 1.8V Octal I/O with Read-while-Write
MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

MX25UM51245G : 512Mb flash, with Word mode data output format when Octal DTR read
MX25UM51345G : 512Mb flash, with Byte mode data output format when Octal DTR read

Macronix Octal flash with two types, "byte mode" and "word mode".
Because of word mode flash with byte swap issue when Octal DTR read,
adding byte mode flash in this patchset only.

About LW/UW series, please contact us freely if you have any
questions. For adding Octal NOR Flash IDs, we have validated
each Flash on plateform zynq-picozed.

As below are the SFDP table dump.

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2943c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx66uw2g345gx0
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66uw2g345gx0
zynq> hexdump mx66uw2g345gx0
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 7fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7987 0001 1284 e200 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 001f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2843c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx66uw2g345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66uw2g345g
zynq> hexdump mx66uw2g345g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 7fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7987 0001 1284 e200 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 001f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2843a
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25uw51345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw51345g
zynq> hexdump mx25uw51345g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 1fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 798b 0001 128f e200 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 000f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28339
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25um25345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25um25345g
zynq> hexdump mx25um25345g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 0fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 6987 0001 1282 d200 02cc 3867
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0904 0000
0000130 4514 8098 0643 000f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28439
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25uw25345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw25345g
zynq> hexdump mx25uw25345g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 0fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7987 0001 1284 d200 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 000f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28438
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25uw12345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw12345g
zynq> hexdump mx25uw12345g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 07ff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 798b 0001 128f c900 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 000f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28437
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25uw6345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw6345g
zynq> hexdump mx25uw6345g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 03ff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 798b 0001 128f c400 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 000f dc21 ffff ffff ffff
0000140 ffff ffff ffff ffff ffff ffff ffff ffff

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/spi-nor/macronix.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9010b81e098f..657f320e414a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -179,6 +179,33 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx66uw2g345gx0", INFO(0xc2943c, 0, 64 * 1024, 4096)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51345g", INFO(0xc2843a, 0, 16 * 1024, 4096)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25um25345g", INFO(0xc28339, 0, 8 * 1024, 4096)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw25345g", INFO(0xc28439, 0, 8 * 1024, 4096)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw12345g", INFO(0xc28438, 0, 4 * 1024, 4096)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw6345g", INFO(0xc28437, 0, 2 * 1024, 4096)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
