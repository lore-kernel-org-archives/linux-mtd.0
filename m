Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA2C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 06:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afo4aWnWekLRQ2tC/qhixMIREBDP1Fk4Rck6S9ngRx8=; b=prDF2BQLUgSfF3
	Zo5JbJHS0sy78+p+NqCI8e2dume/d2KIN4Z9wxK/fHCmTDwkrvx4v0ufyfK96a9SCS5QK16p6ovkU
	CyeNOB7NnjcTr5c7EbbebOEtGzYvMe5gq9mSvd9gshwX8aXFTOYW9lxqde/fLda0HDQNWHP8DCkLt
	9/kc2NBU/ZSF0aAtvICKYKxjd/nI10tee9WbPwg4/MJFLnhWqnhElYFIK6XNawhfXfh9kl9+hZBiF
	fcs91U5qWR47NNtE7NkttpLPW+vz20/ofv8xk9JIrqILYnMBFTfq5RLPOjSaXh93D6DNHbHodTP2V
	4hYnwleSWlRMsMcwGoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfuK-0000000HJ5V-17e6;
	Wed, 21 Feb 2024 06:16:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfuH-0000000HJ3o-0fR5
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 06:16:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a3ea7616097so21372666b.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 22:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708496195; x=1709100995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBpDJD/8UR0M4A+lAq/lEBCPZtNQVXe2AMZez47aZ5k=;
        b=ExUuMkBlouIBckhcnSgGUxNPoSHxilCPrEDGTdRcLx8SfMGh4Ahodf75RhMQ5jCVOe
         yI5B+e6N9ybG8HTBjJc3xFyr4xv/dl7ZsOVcrH8ziMPM51+rtO/VJRaVAN0k/lsI04xn
         HgWHXCMec3ESzZWVPWFlui+ZA5CGxnxBsrTFYnsC+ZgV/ge1hn1+yxbnumQMLina6bF/
         flgnB0t98lELneIHVxck8sPYn7JXat6LD8mgfkGNU1WPbdBYA/D5/zP7U7QNVtMLnDy7
         DmdmYPVaV9WxKJ48+GICd60Z2EMGA8b0Gcwcdbs7vhbbIOC/ZJZKHF5p5XtBRXvXzHiA
         LOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708496195; x=1709100995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBpDJD/8UR0M4A+lAq/lEBCPZtNQVXe2AMZez47aZ5k=;
        b=rnc4ZWde+GzDxndKn67ZECuTOdnDKF49nOn7KGKDNyE6XfuYEM+7aP/36wz7rmXadv
         rIo054CFku8rKP2IM9Xu12ik4nDW1XpHWTHwcgeNE05w0QlO50yhFuo84lkwzVMkhOu3
         I0okOivxUPxXFq+sK0iB6Jr6mr95fqawqdA/6brN7Smd2B5qVMPDBG+xrAHUljVtcWs6
         kZOGxKJowSjn9t3ETik4fzDvlsJzRdw7PvPRdMDjufsWrOT5Kvmh46HJGIjZJpr79HGT
         5uuWZuchTgPd1jVnggwnJYrFTeA8Hqf/08+U+lEgL+CCeIyRlyXXsbL28EDhlU69cgxO
         oIew==
X-Forwarded-Encrypted: i=1; AJvYcCWbrqbfHre69SYX4YOb9J+9CKAhYBAuG7vn3rlViy7QILLiNZJLC6IGhUdwEu5Pdb86DuKCl6xs6qA4At1LqgzhyV4RtXMEWTAzem0Zvg==
X-Gm-Message-State: AOJu0YyVuVd2OMIkG/PKAG2ZR5gcJnA69v0VKRv2ccT6JK6S1vetIFeO
	cBErL3vbLRivYzfQPb7FFF6WChgO7HQqHzl768uw4Ly6xVqKvUJkWUL9QrpgLjc=
X-Google-Smtp-Source: AGHT+IGSjRq7w4HlZKHtJgf/CLxLIPbnicGK4G0VfEkYa35QHuhw5fYTdppYKXMoYhBKVY732t8qKQ==
X-Received: by 2002:a17:906:abcf:b0:a3f:2ffd:c683 with SMTP id kq15-20020a170906abcf00b00a3f2ffdc683mr736205ejb.62.1708496195279;
        Tue, 20 Feb 2024 22:16:35 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hw12-20020a170907a0cc00b00a3d11908bbcsm4534876ejc.203.2024.02.20.22.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 22:16:34 -0800 (PST)
Date: Wed, 21 Feb 2024 09:16:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	f.fainelli@gmail.com, kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
	kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, David Regan <dregan@broadcom.com>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v5 11/12] mtd: rawnand: brcmnand: exec_op helper
 functions return type fixes
Message-ID: <f6e61482-b51a-4970-9257-8db7975148fa@moroto.mountain>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-12-william.zhang@broadcom.com>
 <20240220110240.1ad5b995@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220110240.1ad5b995@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_221637_230066_8B0786A0 
X-CRM114-Status: GOOD (  15.02  )
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

On Tue, Feb 20, 2024 at 11:02:40AM +0100, Miquel Raynal wrote:
> 
> william.zhang@broadcom.com wrote on Wed,  7 Feb 2024 12:22:56 -0800:
> 
> > From: David Regan <dregan@broadcom.com>
> > 
> > fix return type for exec_op reset and status detect helper functions
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
> > Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> > Signed-off-by: David Regan <dregan@broadcom.com>
> > Signed-off-by: William Zhang <william.zhang@broadcom.com>
> > Reviewed-by: William Zhang <william.zhang@broadcom.com>
> 
> By the way, a Cc: stable tag might be useful as otherwise you may leak
> an error code in a status value (which is a bug). And move this patch
> first in your series so we're sure it does not conflict with any of the
> other patches and can be backported more easily.

The original commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op
implementation") is not in stable so we should be okay on this.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
