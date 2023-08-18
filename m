Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A00C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45DjlCLJ+66XKdn3qWCULVOGKFt3VzFb+nhsAlxRTVg=; b=dhVWHmBhCy4ZUV
	jqa3DvkUEkbxVrf++Wj49nsWJQScX6jXA9AHPKoOEKysK2QS0H6uBsfokY7FMKA+8DHvVV9KKg5Nt
	AvqpGJJViPzKO3kTu7CUvHf9OrJoFl2jCdpPbeWL4ckv0ERb47IeCcHSKvonHwdfOuuXPREoeDTqi
	jcEjnl03PXtq/QTGox51fG5vILJEbeHCNMRBEf0C8gSGif0OdzW5wQPI67vZ75aefntC4VSyyy15j
	CWp9ADldyUMt8b+Vfkuq09lhVUkCQcVAPb7LAki1GlmtVgMYndI3j3Wj63+gqQOSa534Iz/6suTu+
	G4WlDa1ci9nYo5M51emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fk-009W1o-0E;
	Fri, 18 Aug 2023 14:41:56 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fb-009Vtw-0U
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0342E1BF20B;
	Fri, 18 Aug 2023 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QTvLZbMsGHxuwSW5o3DQhI+aymS0RLjYYjz49XEkms=;
	b=e6EHFd5NenKZLOm/7CrIZR6/ZleVoHK3Y1o8UKl4KrGBli3EXikGzukq/ZBY1j5/VOKvIr
	YGsxj3pLD5Ci/cDgwnr8l9fvF7OgYoOzL5bUlDizwMi/gHHV9WLQhWf246b0VS8K4eelt6
	YSG2luMkLxwqZn0115l3f9cuskKUHpEGBEI6OAfZBBjgYypVqC8v1+/BAau0k+w9+IRUVg
	8Q22PDO6Ge8rDaInLvbGDX2HO44Zxtx+j85AgpCbRw5BWZCKK+CiOiwhfkmP8k5vyEVvyL
	wWokiWnfZk28jNxXmHa3ex/EerdlEywFhegKWxiwf/DglevoUGjaX+CT83M/Rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 01/10] mtd: rawnand: qcom: Remove superfluous initialization of "ret"
Date: Fri, 18 Aug 2023 16:41:44 +0200
Message-Id: <20230818144144.146143-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-2-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'847178fe4ccdf7f70beddd91eb15481afee0a224'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074147_396130_47C1C81E 
X-CRM114-Status: UNSURE (   5.55  )
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

On Sat, 2023-08-05 at 17:41:37 UTC, Manivannan Sadhasivam wrote:
> In all the cases, "ret" variable is assigned a value before returning it.
> So there is no need to explicitly initialize it with 0.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
