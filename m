Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155D3C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BEF61052
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1BEF61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpjx+xV5Tkve2+rvg9OvhGs6DZByhnMjRwa3eDpuw7o=; b=HopMQblGhpaAMi
	ndLoRbeQkKOqnLGYrQ1XmCGnNE4ucbFahgFnNlie60NGR2kSwnSPRSbLWTcJ+lKsesztV/4a81ySd
	0EdQZNRDdpoh0xVZ3wUTCaH1Chk0McoNg4JC1JuJ1HW6NE/Bb+xZcvcGG9nbUKsF8nsLHJRguMOpX
	3mZMKViqW3hAwU+y9zEZaY2t+ZQhllVT9p7gReYaPsM770NLoGR8717aQBUHbRGKVsNRF3Kt3CmaA
	fBh5ZtSQWQ8JAGB5A16k9Aswqmzbq3B6Ic29l0N1EYAZ9Gn2pp403QvxiWi0PITMWS9Nizm1+2ubK
	2c2uxLpWbn/PZY26Whig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfgGq-004Zlk-HU; Wed, 27 Oct 2021 10:35:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfgG5-004ZXz-R6
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 10:34:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id d13so3263938wrf.11
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEuhmJt1EbG7eS8Znq+HuEo/CA/NDTjfu/Nxazhdm9Y=;
 b=NX/oGmqLbSpHqAFabpzBNDb+3zZB8GnHTluimoJTA3PqE433VoDhBvG1adUZR52HNG
 Qr82xQeUTuPueOdhoR0YT0mnZUhXycM4MF4NSEbNzH5xCywXvmBPaMTjhH3DmmtFO+Fq
 qiRALv1gekguTlQ3oBsE+8jn5ANn+h49MofYlQX/U7by5dFKv98Tv14aBLdpbsypc/PH
 ahqtpbi8/GFt/Ib+3whIymw7tRG7HmuvHxRjoeSEUd/aowlX79xdy0XRUUgRBLw5+uMD
 Txc0yKF7HctqKC5R2JcKR2dfaVZKykie75ZRP3yt/+G8XZZE44eVX8WdU3A3raGoLzNU
 BiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEuhmJt1EbG7eS8Znq+HuEo/CA/NDTjfu/Nxazhdm9Y=;
 b=gK9TMJ/3f9V+LDMyj6+b8Yz7GvsQWHp371+4atjcK9Paj5/Q7igsWNnRdrUYdN4XIn
 kNTNyrIP3wbn1LQifWFjQRCF/QJBnZ+v3+BxvxVbEYNFqffbTQIB+hxtSpTPmk/LSWY/
 xTRqSVIbguU5/fapeP2ivLD/U5VdbD0Mw0PR0xRSVPdQZs875K6dY6D1DfnFW5fut7/v
 bVUCM3DyK1NWWMt8Eu9S65cxo+NS6keZw7rAmc9puowrGAyQ1aDsAk+EnUKFzuIPJK58
 EDmcsgjIg/wLVmfAoiJzzPQkpSppFWJan1JoCP49JMozbRNAGEecIJj40dwRlnNwvS7t
 mA/w==
X-Gm-Message-State: AOAM533YFHQB4yJJQibxB9hxZCCq443NCOo4KQCYc3d5StU53Q8OSRnA
 GGkiGt3YftSCJvwAdq6wePo=
X-Google-Smtp-Source: ABdhPJzWPYfxHa1mpBqlglKHre7xfLAvWd+B/Cwy12NPxDJWKvtN2EajYm8K39U6M7nlGu41QZWWkg==
X-Received: by 2002:adf:a486:: with SMTP id g6mr38845485wrb.130.1635330852262; 
 Wed, 27 Oct 2021 03:34:12 -0700 (PDT)
Received: from authentaworks.lxd (ip5f5be9ad.dynamic.kabel-deutschland.de.
 [95.91.233.173])
 by smtp.gmail.com with ESMTPSA id j10sm7140198wrx.94.2021.10.27.03.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 03:34:11 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Subject: [PATCH 3/4] mtd: add advanced protection and security ioctls
Date: Wed, 27 Oct 2021 10:33:51 +0000
Message-Id: <20211027103352.8879-4-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211027103352.8879-1-sshivamurthy@micron.com>
References: <20211027103352.8879-1-sshivamurthy@micron.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_033413_960462_075CA30C 
X-CRM114-Status: GOOD (  13.25  )
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

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Added new ioctls for advanced protection and security features.
These features are currently supported by new Micron SPI NOR flashes.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/mtdchar.c      | 145 +++++++++++++++++++++++++++++++++++++
 include/uapi/mtd/mtd-abi.h |  11 +++
 2 files changed, 156 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 155e991d9d75..97b97b80276d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -654,6 +654,16 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 	case MTDFILEMODE:
 	case BLKPG:
 	case BLKRRPART:
+	case SECURE_PACKET_READ:
+	case SECURE_PACKET_WRITE:
+	case RD_VLOCK_BITS:
+	case WR_VLOCK_BITS:
+	case RD_NVLOCK_BITS:
+	case WR_NVLOCK_BITS:
+	case ER_NVLOCK_BITS:
+	case RD_GLOBAL_FREEZE_BITS:
+	case WR_GLOBAL_FREEZE_BITS:
+	case RD_PASSWORD:
 		break;
 
 	/* "dangerous" commands */
@@ -1017,6 +1027,141 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		ret = 0;
 		break;
 	}
+	case SECURE_PACKET_READ:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = kmalloc(buf.length, GFP_KERNEL);
+		ret = master->_secure_packet_read(master, buf.length, oobbuf);
+		if (copy_to_user(buf.ptr, oobbuf, buf.length))
+			ret = -EFAULT;
+		break;
+	}
+
+	case SECURE_PACKET_WRITE:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = memdup_user(buf.ptr, buf.length);
+		ret = master->_secure_packet_write(master, buf.length, oobbuf);
+		break;
+	}
+
+	case RD_VLOCK_BITS:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = kmalloc(buf.length, GFP_KERNEL);
+		ret = master->_read_vlock_bits(master, buf.start, buf.length,
+					       oobbuf);
+		if (copy_to_user(buf.ptr, oobbuf, buf.length))
+			ret = -EFAULT;
+		break;
+	}
+
+	case WR_VLOCK_BITS:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = memdup_user(buf.ptr, buf.length);
+		ret = master->_write_vlock_bits(master, buf. start, buf.length,
+						oobbuf);
+		break;
+	}
+
+	case RD_NVLOCK_BITS:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = kmalloc(buf.length, GFP_KERNEL);
+		ret = master->_read_nvlock_bits(master, buf.start, buf.length,
+						oobbuf);
+		if (copy_to_user(buf.ptr, oobbuf, buf.length))
+			ret = -EFAULT;
+		break;
+	}
+
+	case WR_NVLOCK_BITS:
+	{
+		struct mtd_oob_buf buf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		ret = master->_write_nvlock_bits(master, buf.start);
+		break;
+	}
+
+	case ER_NVLOCK_BITS:
+	{
+		ret = master->_erase_nvlock_bits(master);
+		break;
+	}
+
+	case RD_GLOBAL_FREEZE_BITS:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = kmalloc(buf.length, GFP_KERNEL);
+		ret = master->_read_global_freeze_bits(master, buf.length,
+						       oobbuf);
+		if (copy_to_user(buf.ptr, oobbuf, buf.length))
+			ret = -EFAULT;
+		break;
+	}
+
+	case WR_GLOBAL_FREEZE_BITS:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = memdup_user(buf.ptr, buf.length);
+		ret = master->_write_global_freeze_bits(master, buf.length,
+							oobbuf);
+		break;
+	}
+
+	case RD_PASSWORD:
+	{
+		struct mtd_oob_buf buf;
+		u8 *oobbuf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+
+		oobbuf = kmalloc(buf.length, GFP_KERNEL);
+		ret = master->_read_password(master, buf.length, oobbuf);
+		if (copy_to_user(buf.ptr, oobbuf, buf.length))
+			ret = -EFAULT;
+		break;
+	}
 	}
 
 	return ret;
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index b869990c2db2..dbd7bf60d484 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -208,6 +208,17 @@ struct otp_info {
 /* Erase a given range of user data (must be in mode %MTD_FILE_MODE_OTP_USER) */
 #define OTPERASE		_IOW('M', 25, struct otp_info)
 
+#define SECURE_PACKET_READ	_IOWR('M', 26, struct mtd_oob_buf)
+#define SECURE_PACKET_WRITE	_IOWR('M', 27, struct mtd_oob_buf)
+#define RD_VLOCK_BITS		_IOWR('M', 28, struct mtd_oob_buf)
+#define WR_VLOCK_BITS		_IOWR('M', 29, struct mtd_oob_buf)
+#define RD_NVLOCK_BITS		_IOWR('M', 30, struct mtd_oob_buf)
+#define WR_NVLOCK_BITS		_IOWR('M', 31, struct mtd_oob_buf)
+#define ER_NVLOCK_BITS		_IO('M', 32)
+#define RD_GLOBAL_FREEZE_BITS	_IOWR('M', 33, struct mtd_oob_buf)
+#define WR_GLOBAL_FREEZE_BITS	_IOWR('M', 34, struct mtd_oob_buf)
+#define RD_PASSWORD		_IOWR('M', 35, struct mtd_oob_buf)
+
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
