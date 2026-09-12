Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB387C88E50
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2026 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNzdXAWmaLSq4JjA1dDdmQr9yFaJU8KgpqnF6IbaSr4=; b=yMNE0R2r1RqpF+
	IVvMljXnb1B/XR+xbHz/SyTphnBy2wCBXpcPL95mg/NGhBxCBUWAHUk5gyCMiBmHlrxxY4uMnCWxO
	4qhRvoRFgqwzas3XkMy6HLQcvHuNFlTPWb2rAaWAxwCZK85dXdGQKE4ymWSzHPiNHnjGUCuh960pg
	/nQpVr/DfGzDqbXwgXYOj2M2sumYFbqfAoxyXdzhOaST/KsOInQY2Tg7L2A1KoIX7b8FIRyNAlV14
	Lve4hn47PSlFTSUTzhq4KsTjhFMyZIge35MdkDvnQo85DG2pVemkzMS4fShWqUfpO1Lo8neSgfeuf
	ze/rQKshHVbZip03GOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BFe-00000000Ps7-2Iil;
	Sat, 12 Sep 2026 00:05:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BFc-00000000Pro-3zzg
	for linux-mtd@bombadil.infradead.org;
	Sat, 12 Sep 2026 00:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bEuJl6tbZwwTV8fGbs7IcdzniD+J04Zd/HtTkYcb35c=; b=PTgsInFQUsnCLnvYOWaHIG1eVU
	qOxtCjMTk6+BCAPRKm4H5hiHgXzXjZlozknQZVww82L67yBeQvqtvZiXW+yzB7HnWRf3o0D8bPkLt
	8DISZ6Ha+VYqUaPJfYaEtZ2F5QZ8eTagOBkdtdc45Vsmr86RMcseIwkp0frMm+06IPStRLT2/oCdX
	3+ULK012MYcliMQsQyR0jmH3MKLu3TJk5a7+dOOzM7pLfBpuP/E1IAriC85bxC0Y/QmmCzzcUWPzb
	420158IRPLjdgX0rAjdoDFWY4BekRALUykLgdMX87MpGoiIOlV6pXOzRb5BPvPYWqWPx0jYOnjGwl
	fyDpdQeA==;
Received: from sendmail.purelymail.com ([34.202.193.197])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x5BFZ-000000046vr-2UOp
	for linux-mtd@lists.infradead.org;
	Sat, 12 Sep 2026 00:05:47 +0000
DKIM-Signature: a=rsa-sha256; b=pSUHe7qL9M6cTkt/HKYb3eo5nQep5aPmRqx+xKIfyKoactwZMtXDM3J4Xw0wEZTUMKhYI04+TaEOCJ+QTyvJMKFpWHwR90M78mn9AqqPDuztPky73kW/d53ETqIcvhLkGop/vd+hTESAY68KmWXNFLDOLLa0tbDHfw4CKZrsi22PToL2Oii9w+OqReEUAmUODD716e9xd6pXHeoZPYHO5p7M5rCTjGlnGRU6FPFuTQVHg4zC50jJk7wZkVIBNWGoBPo9ghEvKFIN4EsUtLtvgBFZE6VS9tnnHFK2vaHLohZJJ+201F8aZ+MZqr3QS1YOivBjxFJ7e+uPLZbo5V+tPQ==; s=purelymail1; d=c127.dev; v=1; bh=bEuJl6tbZwwTV8fGbs7IcdzniD+J04Zd/HtTkYcb35c=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=JPTE+ygzkg1E+W5yILE+IuWPVnn595+I5i8x/RVe/uXOaInPVKPdTfA+woNA0mMC7UxyuMnBUGMZaCs+IW/L3cDHfAp/hPhiTjeO6IABDyXEJCE87OefZcfuW/X/GqBWyXS6YLCdxGSc50QmEoL0AMnvdE9idrCDej3d6o5m7vgaMHqkKqr6Vd6f7RfxK94504OZHMOMbesjsqbmOH9W9K74FjUrDqcCj+f3aOkSEd04ajkq0WZb5/XSW60gMOqJ78e+uqLEzwzv9kcJt+VYTjzAgYBdk01SX1etbutbOraJtgKQLJOmRAu24QPuUj42za3XkH+LKaZ8gwrYcuukgQ==; s=purelymail1; d=purelymail.com; v=1; bh=bEuJl6tbZwwTV8fGbs7IcdzniD+J04Zd/HtTkYcb35c=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-mtd@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -621174798;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 12 Sep 2026 00:05:21 +0000 (UTC)
From: Johan Alvarado <contact@c127.dev>
To: broonie@kernel.org,
	md.alam@oss.qualcomm.com
Cc: Johan Alvarado <contact@c127.dev>,
	sashiko-reviews@lists.linux.dev,
	j4g8y7@gmail.com,
	konradybcio@kernel.org,
	pengpeng@iscas.ac.cn,
	miquel.raynal@bootlin.com,
	quic_varada@quicinc.com,
	quic_srichara@quicinc.com,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] spi: spi-qpic-snand: drop the redundant ECC context handling
Date: Fri, 11 Sep 2026 19:05:13 -0500
Message-ID: <20260912000516.653989-1-contact@c127.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911191010.990EE1F000FF@smtp.kernel.org>
References: <20260911184416.109790-1-contact@c127.dev> <20260911184416.109790-3-contact@c127.dev> <20260911191010.990EE1F000FF@smtp.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_010546_009809_C3916847 
X-CRM114-Status: GOOD (  12.37  )
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

On Fri, Sep 11, 2026 at 07:10:10PM +0000, sashiko-bot@kernel.org wrote:
> Is this assumption accurate for all configurations?
> If the device tree specifies ON-DIE or software ECC (nand,ecc-engine =
> "on-die"), or if a non-NAND SPI memory device (like spi-nor) is attached to
> this controller, won't the host's init_ctx be bypassed?

The engine is selected by the nand-ecc-engine phandle, or by
nand-no-ecc-engine and nand-use-soft-ecc-engine; the core does not read a
nand,ecc-engine = "on-die" property. A chip node that phandles itself, or
that omits the property and takes the SPI-NAND default, does land on the
on-die engine, and qcom_spi_ecc_init_ctx_pipelined() is then never called.

That configuration has never worked. The page helpers are gated on
qspi->page_rw and qspi->oob_rw, which only
qcom_spi_ecc_prepare_io_req_pipelined() sets, so qcom_spi_read_page()
returns 0 with the buffer untouched while spi_mem_no_dirmap_read() reports
the full length as read. Removing the phandle on an IPQ5018 board confirms
it: the chip probes, then UBI reports "no valid UBI magic found inside
mtd15" and "failed to attach mtd13, error -22". A block erase there took
cfg0_raw and cfg1_raw from the zeroed scratch struct, which is a wrong
erase configuration rather than a working one. So this patch changes no
configuration that works today, and the three in-tree boards using this
controller all set nand-ecc-engine = <&qpic_nand>.

For spi-nor, the binding documents a spi-nand child only, and
qcom_spi_cmd_mapping() returns -EOPNOTSUPP for opcodes outside the
SPI-NAND set, RDSR 0x05 and SFDP 0x5A among them, so such a probe fails
before an mtd is registered.

A mismatched device tree should still not panic, and the silent read is
the worse half of it. Refusing page access and block erase in
qcom_spi_exec_op() while the context is NULL covers both. I have that
patch ready and will send it on top once this series is applied, so it
does not hold anything here up. It cannot go in qcom_spi_supports_op():
spinand_select_op_variant() uses that callback to choose the cache op
templates during detection, long before any ECC context exists, so
rejecting page operations there leaves no variant supported and the chip
fails to probe with "unknown raw ID".

Best regards,
Johan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
