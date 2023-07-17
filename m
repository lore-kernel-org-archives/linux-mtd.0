Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89987C001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U6sGjti60Ut62SCzC23JZc48jHQ4or+qfGO+/UxQid4=; b=ms8b+EOwlpguV/
	7IllrSOVURIsDqiGTIxn3pU4f0Tv2HdfKUVtS3KIJ2hFCnpSRX53I2xRx/ahlhp4Yly7Si/IESEjp
	iY5xz0b56QHkEc+Ofxwoclr66AmBIIJkPB1BJ4yvPnqRcmphF4A6clkum62uSStXdyWgWP8ZEqfei
	9ZAKDNo7RB5/2Sh/PLFvCuRkmNPQ+n1Ew7f1uANeNJCC2nm7S76NWXKNchnspjApJwiFeYVWgAymf
	4WMlb5UI11aMi0VwctX0vHHH6pjHJqQrh5cAbG87H0D8sojqVJy6Q5R4G2hLeiIe+lI7Z2c27+7zK
	u5iA6Vo/7HGjkgGdq31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIqC-003KaB-2k;
	Mon, 17 Jul 2023 07:40:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIq8-003KZR-1v
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 07:40:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3144098df56so4617283f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689579613; x=1692171613;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWgD75Jj89RVkizFunKgZROlPoTv56mQ7yeCYLr2/UA=;
        b=FmDxu7La0t8lf79A3tdEtJmHEDGUIxc6F7hzEZo+lVfP9HfV6BO723WlKcVYGhRFnb
         RUyeZ1rHCmMgtrPWYN6DARqNGxyx8jx1XaRSCWNej6OzZad+aygIDFwZOVqdanB/Nvwt
         QqbZxmXcbldMK8apBgOMbNoaoeMnEmF9kPY+gBNbPly0zrghZFAJlU55hq+f0BlkDRU0
         t1oTIN2d0Q4gVFRPsKrOkydDu7QOBAt6j9J796sY7bzO96EvswDAUx8qP3ca/6+Iu1TE
         kn23QIVBUYjFaY2Pmmz6HoIwDv348gKIlDrTt/NL1+LGcGLpaqeRxqI1G1Dkqva5J6pl
         hwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579613; x=1692171613;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWgD75Jj89RVkizFunKgZROlPoTv56mQ7yeCYLr2/UA=;
        b=SdX19OxiVcIdGn/fAr43uavdYfx8nB2fPsugKkiZvt2XSa9OaNmRleFvRdMbYJUFKO
         nFhw5DJ3kqdUmrVIQC4EjEhkLwj0m41Kc3T4g3SJiM42a98ilAiP77/u63Ia7Wo8QXk9
         PN4rT2VL3yJ0dPtLMy/q+Yk3Wpq6F4gqPR66sEvOsfrG821ZkZocc0uL2psHkM6VjYiO
         fhn1COTp8+WHM/xGurGsgiCSqJ7L5HRBG4lEBFtnlJQtd5MDX3ZBuYfBsd0nS2caLoQ1
         Qhyl8w2DTpLnEG/cwna5OtD8tF3hWLIGH5dFG3Z53oPPH8xOx32VDpuN0/tldp4U4vzE
         hidQ==
X-Gm-Message-State: ABy/qLa7gEo9MpI0BPMFZfB+fCaWHkJYO2NywFdDGkwJc75sr46VhKBp
	UM4bM8KYuq+oUmamxW9khmDUKVcliw8iTWUQCTU=
X-Google-Smtp-Source: APBJJlHjoMtycvXzY7jBUBRBRcMs/Hd4B8Z9SrkQ5Llf3zY9/wuSagecl/lfxIuaKh+6QN42+RcK0Q==
X-Received: by 2002:adf:f9ca:0:b0:313:ee73:cc9a with SMTP id w10-20020adff9ca000000b00313ee73cc9amr9167033wrr.70.1689579613008;
        Mon, 17 Jul 2023 00:40:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d9-20020adff2c9000000b00313e4d02be8sm18388362wrp.55.2023.07.17.00.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 00:40:11 -0700 (PDT)
Date: Mon, 17 Jul 2023 10:40:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: quic_mdalam@quicinc.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: qcom: Implement exec_op()
Message-ID: <87389c1d-01e6-4c7f-a416-6f630c8df77f@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004016_812030_529A7C98 
X-CRM114-Status: UNSURE (   6.10  )
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

	drivers/mtd/nand/raw/qcom_nandc.c:3018 qcom_check_op()
	warn: was && intended here instead of ||?

drivers/mtd/nand/raw/qcom_nandc.c
    3007 static int qcom_check_op(struct nand_chip *chip,
    3008                          const struct nand_operation *op)
    3009 {
    3010         const struct nand_op_instr *instr;
    3011         int op_id;
    3012 
    3013         for (op_id = 0; op_id < op->ninstrs; op_id++) {
    3014                 instr = &op->instrs[op_id];
    3015 
    3016                 switch (instr->type) {
    3017                 case NAND_OP_CMD_INSTR:
--> 3018                         if (instr->ctx.cmd.opcode != NAND_CMD_RESET ||
    3019                             instr->ctx.cmd.opcode != NAND_CMD_READID ||
    3020                             instr->ctx.cmd.opcode != NAND_CMD_PARAM ||
    3021                             instr->ctx.cmd.opcode != NAND_CMD_ERASE1 ||
    3022                             instr->ctx.cmd.opcode != NAND_CMD_ERASE2 ||
    3023                             instr->ctx.cmd.opcode != NAND_CMD_STATUS ||
    3024                             instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
    3025                                 return -ENOTSUPP;

All the || should be &&.  It suggests that this patch needs more
testing.

    3026                         break;
    3027                 default:
    3028                         break;
    3029                 }
    3030         }
    3031 
    3032         return 0;
    3033 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
