Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D8EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LSrDcgj4SwML8iVB5Q7MooHbIPmzaiteYnbU3BmHh6Y=; b=X20dXST2rIPLmF
	waP79d4WP0y6GGHBBREei7AlNlstJwneTuqP9OiVpE5b71K332EeB2MXqZloP/2r+K/B8p1B140mM
	qYqHHAE74UEhiZoYnXYoqJzOI+JflRmsYq3+E5GLWi5ImhVcNx1g6B/TIvgHBIQNe55WLEEa5nTWa
	9FnvJiVpXgV3nrjYO53U7yXVMhvjozhn9LQ4C9CmgqhdT9ViNzTg5kl0djo0GMC/spWMKZL76y2Wk
	RmRUxkPaq9C+lnGryRmctrPgRJUvoNttd/BGL6cl2syG1KEl2z/88JyDkzVle/ivXG0SDV+b7JIEe
	9RTcHKN5K/JDUqxPx1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIoF-003KO7-2O;
	Mon, 17 Jul 2023 07:38:19 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIoC-003KNY-1A
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 07:38:17 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b73564e98dso60990381fa.3
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689579494; x=1692171494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ei9PAgLF+gH/rWpUDdaC7nRx8ntTxidFGjThX5NUyY8=;
        b=lDB1bwVejTBv2S1b6SrQOfdcOEUTLm/p8zp82RR6berC24b2zFtT5nDAJwJwMycE4o
         tRbRB4JQgZippwTdsdoHoh/g/mmHuqi/fCEfyXvKgmF3qyqHXKBqEH4sqR/ae6hdmVQ7
         E0zy0jVNxqg7jJUjVccY70f5Nu7u7hOXJZajdNxroh0+6bf6aFUzSvCpyQOMga5Ts6sv
         hUi5I8Kc9CcMYhXbia8cZcpkXVhu4jb7k9XdZJXlD37rCqdBCMNN+3Moz8p1X5VnFISX
         LVStKsv2cB4Y4pl/d3KRLFCCEWykNGu/sUGTbpJzVMoXhgD/P5Zj0yQ+5cUf1ahbxRQE
         Gdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579494; x=1692171494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei9PAgLF+gH/rWpUDdaC7nRx8ntTxidFGjThX5NUyY8=;
        b=OB/JEBL8nB0MkC55765emU9Gd88f4+QGrdnYf0ws33/o7j6EACSPKePASW6igrPFXE
         ujL+yQfko+LJ7f3GRKTbEeF+xg15p9WsY7hYRoLSUZD+QD/tMKwAM6EVoAMBb62/+kFP
         cJP/CwSBHKVu/2U+f3hBeJdWAjIDxeR9IAgcwhMu+Nj21Y/pLbeKTO9yYBvrJLrWhGoB
         xdk+JccAgkciI90qhzGFX2gUNf9Ec22pcOMYF35/BGOf57H33A4yyXXRnecbUSk0fW3e
         H4Rjh2Q9OgYGivl1ESeO3gVsJOPEYyZrL67nqhk88Ktt5z2LFyPCiowKnLrcNbij7nuj
         F9og==
X-Gm-Message-State: ABy/qLY4/vz9yt6TnPvOc8xllOY0VElrDynLkwuOk5ok53Ih8SFhcsfb
	bfW30T9Qaw+pJ1+5+wB5z8G0SQ==
X-Google-Smtp-Source: APBJJlHp1E/GiDcbkYrbwYpcbZedYqVw0ZnnYwjgPt0RrqxkQABVL+HxGoOo6pAB/JTIJUJ4uBjLzQ==
X-Received: by 2002:a05:651c:1038:b0:2b6:de52:357 with SMTP id w24-20020a05651c103800b002b6de520357mr7347189ljm.40.1689579494460;
        Mon, 17 Jul 2023 00:38:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bce11000000b003fc07e17d4esm7284556wmc.2.2023.07.17.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 00:38:13 -0700 (PDT)
Date: Mon, 17 Jul 2023 10:38:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: quic_mdalam@quicinc.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: qcom: Implement exec_op()
Message-ID: <c0702ca3-71dd-49a0-8afa-bbac5c718dcc@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_003816_408899_4D0D8603 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Md Sadre Alam,

The patch 5c6a9518447e: "mtd: rawnand: qcom: Implement exec_op()"
from Jul 10, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/mtd/nand/raw/qcom_nandc.c:2725 qcom_read_status_exec()
	warn: inconsistent indenting

drivers/mtd/nand/raw/qcom_nandc.c
    2678 static int qcom_read_status_exec(struct nand_chip *chip,
    2679                                  const struct nand_subop *subop)
    2680 {
    2681         struct qcom_nand_host *host = to_qcom_nand_host(chip);
    2682         struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
    2683         struct nand_ecc_ctrl *ecc = &chip->ecc;
    2684         struct qcom_op q_op;
    2685         const struct nand_op_instr *instr = NULL;
    2686         unsigned int op_id = 0;
    2687         unsigned int len = 0;
    2688         int ret = 0, num_cw, i;
    2689         u32 flash_status;
    2690 
    2691         host->status = NAND_STATUS_READY | NAND_STATUS_WP;
    2692 
    2693         qcom_parse_instructions(chip, subop, &q_op);
    2694 
    2695         num_cw = nandc->exec_opwrite ? ecc->steps : 1;
    2696         nandc->exec_opwrite = false;
    2697 
    2698         nandc->buf_count = 0;
    2699         nandc->buf_start = 0;
    2700         host->use_ecc = false;
    2701 
    2702         clear_read_regs(nandc);
    2703         clear_bam_transaction(nandc);
    2704 
    2705         nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
    2706         nandc_set_reg(chip, NAND_EXEC_CMD, 1);
    2707 
    2708         write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
    2709         write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
    2710         read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
    2711 
    2712         ret = submit_descs(nandc);
    2713         if (ret) {
    2714                 dev_err(nandc->dev, "failure in submitting status descriptor\n");
    2715                 free_descs(nandc);
    2716                 goto err_out;
    2717         }
    2718         free_descs(nandc);
    2719 
    2720         nandc_read_buffer_sync(nandc, true);
    2721 
    2722         for (i = 0; i < num_cw; i++) {
    2723                 flash_status = le32_to_cpu(nandc->reg_read_buf[i]);
    2724 
--> 2725         if (flash_status & FS_MPU_ERR)
    2726                 host->status &= ~NAND_STATUS_WP;

Still part of the for loop.  Needs to be indented another tab.

    2727 
    2728         if (flash_status & FS_OP_ERR ||
    2729          (i == (num_cw - 1) && (flash_status & FS_DEVICE_STS_ERR)))
    2730                 host->status |= NAND_STATUS_FAIL;

Same.

    2731         }
    2732 
    2733         flash_status = host->status;
    2734         instr = q_op.data_instr;
    2735         op_id = q_op.data_instr_idx;
    2736         len = nand_subop_get_data_len(subop, op_id);
    2737         memcpy(instr->ctx.data.buf.in, &flash_status, len);
    2738 
    2739 err_out:
    2740         return ret;
    2741 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
