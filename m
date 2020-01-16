Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9312EC33CAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D0A2072B
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeaRLDMu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="recIu9To"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D0A2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d55FSNbFsivFag9OMomj5pgdHCqCs+BrjJNSQYO6QXU=; b=oeaRLDMucTEV84
	voI9HMDJKh1zFGIoTxPzwxbkkRR/+olzuf7H2nRmbVOn+yUgg3ZC1tpxaiGyPTxoDvFmPmN7BVaoC
	WV2YYi9b6avtMR3Q5Glo5iiEXjPCmz+AOSXxu1G+49odZN4ivI5jO6/ialKYIozF+sYGugqJLFQ9c
	NIWA4z7ZCjy6umeZ+BHG80polx4Dhnd2RVKwIer72XPunFIvoQWwygSn2fBJS3IceoNs2IzcytS3K
	IpT8iOAlzyKElEU5Vepr8njoxiEY3PNl/bzaC/rvDRc77p9kbxazzsSWFM1sqsXxQHAgW6FZA4cqt
	vHkg/ykV6ZfNwLAhKrgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isE9L-0005X9-SS; Thu, 16 Jan 2020 23:02:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isE9F-0005Wc-TZ
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 23:02:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id y11so20859123wrt.6
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jsg0v+9vaI9HBUowERHtMlt6sVDoqtH4YYifAIjJ90E=;
 b=recIu9Tov++Ep4ZfiaYJcBTf40+S/ygIzq3dRHIZNz+tSO9dvYnMKjqnhzd5P7kbnV
 hwYLetzNQZzr8lNZc2/mu5rOeL2EBpAS7Sx684GEbu473/eMrA+0HtTqMez5OTgPqEat
 DaTWUKfTJ4ABLWEh2AlUlKopoc+01UytXpZmsXXEEJjIg1fMpQMXAtInkmqxfdE+ay1i
 VyKa8O739QwI6qpK29/u3Jrsb5wbzpLx6BrPo83Q9Hb18jw/npcyAHYxRFWxDVHycQBS
 wmMgZXYLZYF/xd2RG634bCZJFV13SchW0L3/yBwno55JWdKpGeeGqDKvFyjljIbk0Pqc
 QC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jsg0v+9vaI9HBUowERHtMlt6sVDoqtH4YYifAIjJ90E=;
 b=C80EIpjjp4UOflyy/Az68ngpUhQ7KJA51qklGaQ711yqw4l5SiFxSWiCqBGuOqxpaG
 mUitaLxF9yCA/JBG4N3K7r3moMmHofoNafpbwdsFR9g5B1Wm/iWdR+4+Zq5P2Fc5Rf0A
 eIY+zVrk1mqAhx6WYN74fEqiA7O+I2YxdjzpJaNUVx4LOEWh+F0zHpgqF1FWngNg31Tn
 krH2HG6+vQD/XcBAbAGzj2iFvJeBvjWRWaIHzDUgu0FfFu5InAu7OGYOOk8OuVdlKJIb
 HU3WbrcRn2wMYXNtS5dapjpxKZA4upBaQJpXNDcfFMMkOSDmJ+6nAjUgsOH+w+kaoyvJ
 ATJQ==
X-Gm-Message-State: APjAAAVtsz+2U1pDiXDUAUEDJic3n9FNlqGNp8oxsp1uQPNBh/QjWIRg
 wNxDCsUpE4nM8a95dfMBj5SI18y36c4kHovMaE35QA==
X-Google-Smtp-Source: APXvYqzFVruEkmU98fYZyXXwAPbjjan/LztUJ42xje/+ggAM1hH5KRuF4GhOGFDKCq8mX/PFI6pj8+sHVNl8vO90m64=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr5679104wrs.184.1579215716352; 
 Thu, 16 Jan 2020 15:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20191130094825.141589-1-houtao1@huawei.com>
 <d36a491a-0bfa-e95a-c60c-914b50b74c77@huawei.com>
In-Reply-To: <d36a491a-0bfa-e95a-c60c-914b50b74c77@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 Jan 2020 00:01:45 +0100
Message-ID: <CAFLxGvyMJ9BL0ErLQkoLVzCSdr36a4DkU5UBF3e=Q2bviLw_Tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ubi: free the normal volumes in error paths of
 ubi_attach_mtd_dev()
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_150157_974111_A51B475C 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2019 at 10:14 AM Hou Tao <houtao1@huawei.com> wrote:
>
> ping ?

Applied. Thank you, Hou Tao.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
