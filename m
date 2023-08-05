Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D85C00528
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRi3IRRYNvUqcwbC1lq2jQK8WgAikEVm0eWhPb7jFDk=; b=LQfkQlQyfL4sla
	6tAXL/oQp+86Y4cuDB4pDCuQDUj6Pe/HaIQhzJhaEPIMRdUXgcysDkTWAeTK3VkFOyCaZPz8RlOUO
	FLF42surj+MwAPvEvZG4yrjbkfplHfJB52Y0dhPlWO3EJZSsmvYvt+5PnvxVH6WTpshMlRpm1V8tg
	kHMLtAGcjc9m1xXAd6eUDIBNKqxJStkNstrL0tX8sSK8+tEKLysmZ1JiQYlAXeE942sJJswd9EH+P
	YrB1nCbs+WljVgS1Eo14VcRdLvW7YQrrlVcNjoEZt+eWM4VH9MnQFLfKlvXR/4MNm2V2LG+sreKbC
	AY8jIlB4SW6f870XFbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLI0-00EOsz-0r;
	Sat, 05 Aug 2023 17:42:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLHx-00EOsg-23
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so2186165b3a.0
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257324; x=1691862124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2LjEphxbAcNmk9OuIlZ94EZVoNAFsXVDLzgtQBZgFFQ=;
        b=iM/QsUsabggE7YohYddy8BZqv8PLiVjz/B2omd5Oi/syBuKENzIZccFSX8Mjnidn70
         1enPhOhCh/CojRhMib5LOMGvwq5NLU/p9hDixVbtNizzVTt2Of69z9JMzgw/f2mXbHzA
         nE5m8eCYtYMvNvoBzjaNapuAXqRl47upLJuLpJR5g/Yfro+yoYd54xnitlMMyLuyY2ww
         0gDGKgkBck2LwllXc4rdBCsp8i7uEpHKTVIu557vPIWnnBCS/bH5HL0HsnkeFpiT/R+L
         sel1yLhqlX53djhwSIoLADLg7HQbRjYN9kjq8wNgY1Z6nfwv8KWklyuhECC/x049WJuO
         jo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257324; x=1691862124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LjEphxbAcNmk9OuIlZ94EZVoNAFsXVDLzgtQBZgFFQ=;
        b=fiIcMme/4SUMDqBWAzmkPrApE3rdYcntSCi00pcBw1dRsD/e+31kFBFLy/tQF6apgk
         cxZo3pKoLOlhTAjKj5XEbB44W2knvZZJze/jP1yz1IJRwlq1+fG/T00KvO8+qy014bDv
         zNnrb3MqlR1xcWlwC3Z4UP6Dg3TN18o57OPFXNMnLWeVnge1j3wqPrKIQ3OByKvH8+Hu
         q2ApeioXtANOWh1Rtpl+7aBYJDQo9xgOzBFdFoavam0f4zX1Otp0d7qHCoC1/nvXncgT
         3da4ljOd8hMtZKcWuMhTjr0zDuX0FjLFVydlIu6H+C7nf7yxxPiiQZtQf0t/5evGCmtO
         w8eA==
X-Gm-Message-State: AOJu0Yyne4fzBYbewuUvBexuhVzowhDreN1Q+r+VIcQiyqcmXowaLteq
	D0g3fggkEVZn/U+yPuQiYXmF
X-Google-Smtp-Source: AGHT+IFJfhm/Y/G4uZNTHP5zy/WL24vliQ/xJ5ECsmWh2A3VOvzdhfvM/1qcfzd0Ndh8NGCNvJHvAw==
X-Received: by 2002:a05:6a00:1743:b0:66a:365c:a0e6 with SMTP id j3-20020a056a00174300b0066a365ca0e6mr4617174pfc.13.1691257323649;
        Sat, 05 Aug 2023 10:42:03 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:03 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/10] mtd: rawnand: qcom: Bunch of fixes and cleanups
Date: Sat,  5 Aug 2023 23:11:36 +0530
Message-Id: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104205_737723_EF19B018 
X-CRM114-Status: UNSURE (   7.73  )
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

Hi Miquel,

This series has fixes for the smatch warnings reported by Kbuild bot [1]
and also several cleanup patches based on my code observation.

I've only compile tested this series. So let's wait for Sadre/Sricharan to
give a tested-by tag to make sure I didn't mess up anything.

- Mani

[1] https://lore.kernel.org/all/202308040141.gUjtZ32J-lkp@intel.com/

Manivannan Sadhasivam (10):
  mtd: rawnand: qcom: Remove superfluous initialization of "ret"
  mtd: rawnand: qcom: Rename variables in qcom_op_cmd_mapping()
  mtd: rawnand: qcom: Handle unsupported opcode in qcom_op_cmd_mapping()
  mtd: rawnand: qcom: Fix the opcode check in qcom_check_op()
  mtd: rawnand: qcom: Use EOPNOTSUPP instead of ENOTSUPP
  mtd: rawnand: qcom: Wrap qcom_nand_exec_op() to 80 columns
  mtd: rawnand: qcom: Unmap sg_list and free desc within submic_descs()
  mtd: rawnand: qcom: Simplify the call to nand_prog_page_end_op()
  mtd: rawnand: qcom: Do not override the error no of submit_descs()
  mtd: rawnand: qcom: Sort includes alphabetically

 drivers/mtd/nand/raw/qcom_nandc.c | 192 ++++++++++++++----------------
 1 file changed, 91 insertions(+), 101 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
