Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50376CA5FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tONCfJPn2L7iDbBrS1L9zjTEKy8hVFub72SQJHT4EIY=; b=sEO5oq20h8pGtG
	vpyCHfdXI8DW3V+7MFk6AgPj1BhvQhRKbv6TSoxjU+unqByKHXulW84EBkSuDehQxIohBowJbgIHX
	p+eotOSvUENJWIibMcEeHkf/C3DRbvewfI2qaNpgwy5aecXKp8paXt3uWSJAuZzuUNECM4lcpErfH
	ZV9Ou1/Ie7LGukrcf/7NbdVE8/L+7nRHXcGsp3ljyfXLmVx6G6FrknbjryxYPGsLeizJ8/tmP8z/a
	MzgJRTfz9Ux+ytPwD+hhugFYiS1iznOMahwPXaXLwkBgCtNDc1VhUZLMeKs9nTajjMFdVfJjdZQtv
	b5GmKBkn6wUVv/oBZcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmLM-0000000GuRa-3YDk;
	Mon, 05 Oct 2026 17:19:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmLK-0000000GuRG-3MVD
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 17:19:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso12377835e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2026 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220752; x=1791825552; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KhIVGVi7iDg6wZeRjmVwM4ZVMIecRYFD2p/QE27Jwwc=;
        b=YcdOoxI0mPd7Dv+3PHrWrlcCjwqJeoh8rsYoBXbdd3Gn07Nbov5KqTf5zjqDTyUrUj
         Hs9anGBZBHhBne2Ikb7Nl8UCncAypyPmHDfv/8IiYzsAsCv3MWfrh+1ZWvi81WHGgj7A
         ZqWddZNTDpxO61dOAZehwwdPQSkOqQW6AiN/lqxSs8PjYFOzg8571dOY8cVA6JS/aPn/
         kkdPYdH2wLe7gax9iNRrAMdmxLCkwm8BfVGIX/Qg2ofkcELLTjOZVWCmQiPKLhg0oraM
         NCRl5gje2DR33ZhrD8RSkOwx6pdovPgx+0aqcXvivmHhsPLvi2bnMApqGTb7YITE5Bom
         48mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220752; x=1791825552;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KhIVGVi7iDg6wZeRjmVwM4ZVMIecRYFD2p/QE27Jwwc=;
        b=k0sJqmTlYyRJloN90eyoyDBhmYLRTw32AH6osBxht12/bI88hx3+vKeIkps70MifQQ
         FkF6o1wfaj3S52IZKzt8X2fxR24LTy48kNaXUEMz3liRfMojC4RpIik0DJtAchrZEm3k
         TrFG4O1oWo8VQWl5SioiBM4l34XHmRNUzU86O5/DCD6SrFd3PlT69P1buph/DYZAaLQc
         1Q86Iaq+X0N3pDL6Hi1GPeJK2HbYL+xZChbL7iS6rOzPZsZLWxqxHvd3LijtcBuldifZ
         u0h6AAzAJYFHujWOEvCLheQCjsfUvUe1PcDiORscSf921zHdDL0SuM9h9jrP+1TyVaea
         MK1g==
X-Forwarded-Encrypted: i=1; AKwUvByKZUhlD7d3xTLbAueHC0IDLbjcjH74exh6xGJkJPCMTlbcX6qK4Ux6oTasIiXAOFL3wsNWsLlzjQ4=@lists.infradead.org
X-Gm-Message-State: AFuF++k5ZckDjuPIkKGjKuSMNMFXxaMnJrvvLc5tWZevjY9CDfMpx843
	r2hN0ujEbUCbsrvoBcZjSjlXRhaBmW52mBb9aQ1xH5W+l+rlHouLF64S
X-Gm-Gg: AYBFou2pPgIKqLO+0odXI7SYWq4ooeAoySkTNaElFL4WyKjyTff3wQwHjeWYbvy0tOm
	la/EzSyYi85hFDj4Ie38QJ3c+6/sOGu+OsldbyqOqz/9hEF3PiPU5MBP7I0vOAP4E5nVgcBD6Jg
	pqEXFvayc61xIsv4QXCce2foaLnsaobLsDAjI7icp04A6/tfS0fDo+SzW1adE9pQA/JiKW9E5r6
	Faar4uglVLm2lKtIU4GI7K1YMW2H/B+bfBog7BamGHkDBJjurN7eAB0+jB5b7y++kLBL57EG8EL
	WZLuKRwgh7Qx7a0FLEwuthuILtjJmam1dT8WTACB9x6k3P4jERVkRrcmUYuKrVHZLyitILDaWHs
	E6WXRaEHC7TltW3LPrJpW2BUpJYxBcFKRWChr1S8s6R0G5JvXPWvrAn8io+yj3/+R+q+hFVKHup
	jZe7m6FJnbZ3iGy/77ul4atxORchTFL5poDmn3xQnMjA7ILb5pjWniDDAK1NQjLQQDv5LlfI63N
	h0J7VRDrmfduw+6Rq+NCIkVok4=
X-Received: by 2002:a05:600c:4f06:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a1680b469dmr168127675e9.4.1791220751970;
        Mon, 05 Oct 2026 10:19:11 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178a17ac9sm5787465e9.1.2026.10.05.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:19:11 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 05 Oct 2026 19:18:50 +0200
Subject: [PATCH] spi: spi-qpic-snand: skip BBM copy on regular raw reads
MIME-Version: 1.0
Message-Id: <20261005-qpic-snand-skip-bbm-copy-v1-1-04f6aeda4044@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQoaKuEi1SpxoiMweiiO6et
 HyL/x8QSkwCXfFAopOF95ChywLcMoaZkH02GGVqrVSFR2SHEsbgUVaOaO2Gbo83TsZXThndUkO
 Q85ho4utf98P7frm+BPhqAAAA
X-Change-ID: 20261005-qpic-snand-skip-bbm-copy-f2d5c0219e7e
To: Mark Brown <broonie@kernel.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_101914_871436_FD6B1746 
X-CRM114-Status: GOOD (  19.35  )
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

Trying to read the raw flash contents with nanddump, the second byte
of the OOB area contains 0xff instead of the real data in the flash.
This happens because the qcom_spi_read_last_cw() function unconditionally
copies the bad block marker into the second byte of the output buffer.

Add a new flag to the controller's private data structure, and set it
when only the first two bytes of the OOB area being read in raw mode.
Also change the bad block copying code to run only when the flag is set.

This ensures that the SPI NAND framework still can read the BBM bytes,
but on regular raw read, the output does not contain the duplicated
marker byte.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 001e4bd8bb4b..c90c2001ee8d 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -115,6 +115,7 @@ struct qpic_spi_nand {
 	__le32 addr2;
 	__le32 cmd;
 	u32 num_cw;
+	bool bbm_read;
 	bool oob_rw;
 	bool page_rw;
 	bool raw_rw;
@@ -457,6 +458,16 @@ static int qcom_spi_ecc_prepare_io_req_pipelined(struct nand_device *nand,
 	if (req->mode == MTD_OPS_RAW)
 		snandc->qspi->raw_rw = true;
 
+	/*
+	 * Try to detect when the SPI NAND framework reads the first
+	 * two bytes of the OOB area searching for bad block marker
+	 * bytes.
+	 */
+	snandc->qspi->bbm_read = req->mode == MTD_OPS_RAW &&
+				 req->type == NAND_PAGE_READ &&
+				 req->dataoffs == 0 && req->datalen == 0 &&
+				 req->ooboffs == 0 && req->ooblen == 2;
+
 	return 0;
 }
 
@@ -666,7 +677,8 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 	 * This can be removed once single-byte bad block marker support
 	 * gets implemented in the SPINAND code.
 	 */
-	snandc->data_buffer[bbpos + 1] = snandc->data_buffer[bbpos];
+	if (snandc->qspi->bbm_read)
+		snandc->data_buffer[bbpos + 1] = snandc->data_buffer[bbpos];
 
 	memcpy(op->data.buf.in, snandc->data_buffer + bbpos, op->data.nbytes);
 

---
base-commit: 65766f75dce38103e5cbfa40eefffdc285645084
change-id: 20261005-qpic-snand-skip-bbm-copy-f2d5c0219e7e

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
