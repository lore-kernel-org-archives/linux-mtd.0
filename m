Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86871D132A2
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CFwrXSAgfbJhhAtaoC0FXbsv4XE3lNXoAVV+OkFl4HI=; b=z516OPHsQI+7+3
	1d4fsG93uBOop1lhJHf6yLN9CoAtcNkaYpyQPwXgJpIwjPhiT408bBls2nXqj8i7y6FKO9T5pulqD
	cOtI5QzHmo6gJEz0/9tZbIT4kiPJSk208Pa6E4q8uX+cVhyGkIyVMGpGp4c+DIwCYyrq8FtlMC3rf
	DPcR79kibdnB90Sn4Xv/6jiMqS7FcXy18hbi9TMCdwaVxhqY0SUDdLCyV6uLAPbFZdbFhmOuJBRxL
	R6ZxgxHcN+2764TVYxFVA8UC19GrdFzHYAPy2WC+MrrLHnI+dL8AVpF/c7YhUhFadcfejAFjUv21e
	FAl1qMVkzbpEiy1NfPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u6n-0000000DHe6-0n40;
	Mon, 04 Nov 2024 10:14:53 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tyN-0000000DFro-2mG5
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 10:06:14 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-7ea8de14848so2204766a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2024 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730714770; x=1731319570; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=i9O4YLVSSldgZrkQj55F454l9MnoQ47zAMjCD3ols7VUlZcRoyFyQsMGyLJ+xFP+nE
         v2QxsCz1lOXaSV+H9lB/bAIZBu+7DOJBrtlislB+aGK8NVIZ+dtsMJt8cIomEpNgWWZ+
         ht39pSaWCNg2gHgsJBzCaCG5iOGv/rHvOcEuboONGCYKhfBGmBz2T27GIf7zF7haerkj
         i1Ea/iCCdglEVoVPqN67mq6EWbBilOTwOPciVhwnouOGCR9Ypq//kaUF4/XUI9z1nb77
         sPAkS7FyxfCzW9gyN0y1dbkAcUHNS9NsQS2/RcOlgk0uN3E6HBG7XTBHrsxFjrPPAnTd
         cd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714770; x=1731319570;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=uOiv1gDoPnXnjxoiAfnMy0CKZirdyF0+BYSzSE7+TwEmx34rdZxPwcNvxUd99xeU4+
         xuavdMGEVrVb98wMitrTDDzOZNyANEIDWaDVG36nUINtFQggGltD8RFD4jzmKn3keuh0
         FSDJZxvpCXa+RR0msvvFgsJlNSnYi8t+VO/04HeGgmFaRJouxjneCRgVL3yPayn5Vszz
         1+sDxPsxg8d3tGSOPr4OKhrwQSHuJzzMRLruaIsFu7tCq7h3N/vq3qQOMfq5OZ9mvtAo
         E1PEuB+FkmNiNforOeBJjQGy4WdrvFzQpO8R2b0Mv3Uiif/UlNMNlpyfGccoRpZOfo5P
         sYYQ==
X-Gm-Message-State: AOJu0YwhwD8RZM5kFaZz+j6Hit8+l6VRkA38lyALYvqV04FUOCQSaKKy
	zkP6xUKnbnPhwZlzKVpGLpAW3aQ9ScTadBOppt+Sa5sfVq4K2VkJYJ6Zpe7I
X-Google-Smtp-Source: AGHT+IFk7yZZus5FZIZvFoL0eB/h5dWB6ITtkIdRuB9LM2r9C7OG9PMlWJ7/QuuTycj7RcwbuwEghA==
X-Received: by 2002:a17:90b:164d:b0:2e2:ca12:6bc7 with SMTP id 98e67ed59e1d1-2e93c2fd83emr22510468a91.33.1730714770301;
        Mon, 04 Nov 2024 02:06:10 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8ae2sm57446955ad.274.2024.11.04.02.06.09
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:06:09 -0800 (PST)
From: Debbie Magoffin <anupsarkar20136@gmail.com>
X-Google-Original-From: Debbie Magoffin <dmagoffin@outlook.com>
Message-ID: <a6230dbf5dae2a67bf46975806f258db3e07f982762d2f394247dee7d95f7d02@mx.google.com>
To: linux-mtd@lists.infradead.org
Subject: Yamaha Piano !!
Date: Mon, 04 Nov 2024 05:06:00 -0500
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020611_725159_1901CD94 
X-CRM114-Status: UNSURE (   3.31  )
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
Reply-To: dmagoffin@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I am offering my late husband?s Yamaha piano to anyone who would truly appreciate it. If you or someone you know would be interested in receiving this instrument for free, please do not hesitate to contact me.

Warm regards,
Debbie

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
