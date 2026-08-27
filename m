Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6267C61DB9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzmx7ikX/DksnR10DoBn+hJpH4MioV2hN3lZJA8WeW8=; b=dgyG9qDn9Rleyv
	TtYtSmFo+wl0lv/zzsF6MqfMDC9auU7osN1zfRYRmu0Z/PTl3INZFRLaNasOsWeV+QM+w4T1Vzv+p
	+YGa2w1GBS42gYSUBMnK7MEOdKaSAe+Oy0P5toyppxINYZATSP3VQ5IEhNlk4gaM2JllMQQ4fLSjU
	PxuzB6yk4YekXwwjU372vVdupr6MbE1YBO8cnRsJaWJIMYm4hUcuZm574PNp132ksV1XtA0VNanx6
	FxSSZWxNzZGLHP0J135ryDJ21/UfeJwqjJWtetjPeLYtL3Vy6m3ThLxW57C+gWKQtdvm8pGzSRGMR
	9ALyKT6FMkZK2zDsVjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgT9-00000004kkO-3UTm;
	Thu, 27 Aug 2026 20:13:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgT7-00000004kjp-37wH
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 20:13:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so203692f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2026 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861579; x=1788466379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JV8PwEkVgcwtGcmvYs34H219LkJz9Yy3tmlEZDpmzmo=;
        b=JouLd4PITguJdId/Z1S1QGnuzwOJbDR+5rRA6lpr/hPW/YLcg6g+004dMMvyDHMVuh
         4BQyyYGAtLTqUDf+BpIxZMZFVXrAfXQU/lS1zHdIcRlY8bdbFeMrd4s+hSGJBJ/p/rPv
         gVMybv3Uy2pHTcOLm03TDjijp5mKkd8r+dkeCzXqtxDTsQ3/yCCiHpAc0eQgjMW5XPED
         jMRWSr201YlbRio1XA325Xvqa1oe1IIm929tDKrYRQIybr4PZLspNmMiKrSwXgGYxcFY
         hlVYv06dOmYwUehx5aAIXV1lURrxvEYYiVhaXuwbYkBlW08Cp677K5xa970hO4neIfpi
         ZSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861579; x=1788466379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JV8PwEkVgcwtGcmvYs34H219LkJz9Yy3tmlEZDpmzmo=;
        b=kQAp0lF5KnDAwOl/Pnc5m/7U0CzG3J3v1cR28CvuN7yZ4/c98zyp+VWDJdj5BJyRT0
         Bm8RcklHgbRgs7i4C1vic11+8MUzKyFfDGZWebG0oqpKtbCeWaqSJmshudjqpc4iDsm6
         8F7GxDEIgIAfBAsKR+rUBt/63PTqqpwoNGwXIO5vuIE4zlE3DqKpTgeu4DWBJOktEdbi
         iQF+0vv1Ci/kGUoBD9P9Lb4T//Z26xmayhsluWqVUmdDpHOkTaqVWjmQ51lclBdJJnND
         zbVychpl0GxW1IDr7Zu/SIFLMHH0yC4QeAB6ZAjRHW3eOfZsm8oicFZwhFZ7uhcDohWs
         SkZQ==
X-Gm-Message-State: AFuF++ksB4AkcdfvjqCTDKTykHtT/9ZxHHAhH07SbwbI0BBkZ86vM0xk
	6VaCIfexYSdKybrrc1eeE1oB9ymf2/Exs9e907k3WoCCYc05OFWJhksj
X-Gm-Gg: AR+sD13WqvnzxP+TFbzY2fSn85EML/HB38kEnNs85+o4LfI1e+cWZ27gMnCUHepWEia
	CGqICB9pnfkPWMnyNODEABgVuXnd7GUlS+pZ27Pm/xwdaN/lxlearbY4ZFKWMT/6izNntPRdRkS
	m08ezudhlV1S6/DNoPI9IK6sh2gan8Ej7s7ShpT/qSXvGq+Kyc3bwSkJSPfvwxyodv/ptiX4ihv
	Jxk9NEgNDgNozNXC0dtCuwjGglQlahpZNzQJfyPxHEEdWoE4Jc5Ad85WQ0vTm28BdVXPMPz7ma9
	Mm9tAqmBV4qtAFNsNHh+1Usnr+3YO9d7ODxY3BBNhUIL6bjpU7wiTpyVuveIaxyWl5QDbchQxSZ
	hljZ5T5/UDtSqn66PoYbDZ5Zb7MssMz3eRlGcRl407AfTnpAGtnSY7kWx9+GwgbxF6pTmwPDfFf
	obfBDqmbqoUCMWxFOf4f3sM5SqOeXFGiw3uBdRupppv5SecXXyQBset3B+GCFikzHfXA==
X-Received: by 2002:a05:6000:2310:b0:47f:8183:e9b8 with SMTP id ffacd0b85a97d-482f79e1e9cmr1339475f8f.22.1787861579111;
        Thu, 27 Aug 2026 13:12:59 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e899dsm11495763f8f.28.2026.08.27.13.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:12:58 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Thu, 27 Aug 2026 22:12:57 +0200
Message-ID: <20260827201257.3647133-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87mruail2c.fsf@bootlin.com>
References: <87mruail2c.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_131301_805786_D084A7E1 
X-CRM114-Status: GOOD (  19.43  )
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

On 25/08/2026 at 11:52, Miquel Raynal wrote:

> It fixes the problem, but honestly modifying the memorg is not
> correct. Broadcom and mpc5121 controller drivers do it, but that's
> likely wrong.
>
> What you report here is a U-Boot issue. The chips has more than 64 OOB
> bytes, U-boot clamps that value, Linux does not. U-boot is wrong. But I
> guess it's now too late and you'll tell me many devices in the field
> already use this broken layout?

Yes, unfortunately. These modules have been shipping since around 2016
with U-Boot and pre-a7ab085d7c16 kernels, both writing the 64-byte
layout, so the bad block tables and every UBI byte on the devices in
the field sit at those offsets. Changing the on-flash layout now would
brick them on the next kernel update.

> In this case, maybe you should just change the layout, instead of
> forcing an obviously incorrect memory layout. In this driver the large
> page generic OOB layout (which puts the ECC bytes at the end) is used. I
> guess a better approach could be to make your own 64-byte clamped OOB
> layout for backward compatibility. You should drop the oobsize
> modification as well.

Agreed, that is cleaner. For v2 I will drop the memorg/oobsize
modification entirely and add driver-specific mtd_ooblayout_ops that
place the ECC bytes inside the first 64 OOB bytes, at the same offsets
as before, regardless of the chip's real OOB size. The controller
setup keeps transferring 64 spare bytes as it always has, so the
on-flash format stays compatible with U-Boot and the old kernels.

> There is at least one legitimate Sashiko warning on this patch, can you
> please also check it?

Yes - the dev_info() uses %d for the u32 oobsize; that message goes
away together with the clamp in v2. While checking the report I also
found two pre-existing issues it flagged: write_page() never copies
chip->oob_poi into the controller SRAM, and vf610_nfc_done() does not
reinit_completion() after a timeout. Both look real and independent of
this fix, so I would send them as separate patches on top.

Thanks,
Mehmet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
