Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBE1C87FD3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBp1B+7Q0zruwuHgjofr/IDxWuLlZEpYMGp3upeYORA=; b=Kf/3NWv+eie4XS
	x1b5LnL3gii0WUiOBYZrbLgRv9eKd0tmoESFCQxtSsH7vkePANdfQ5QRrn49ukxFrlkav9rsoKF4v
	IqKGkiib4JhWJx8yhMyIF/4yilJ8KmabZkvxjR2/Q+hINq0WLYSD9AxizTne2bzAUaAnulHY24U9n
	uAJ3vkq2JhVCeSg3l2thPXCLiwjK0Jq+OpXmIqcUfM78t93uHVslYNgPLCSI9Q8V8GCnXu6IJhTPY
	hw5gSrf1WK3AQJ4686p6fUYYk7LE4wCa4zK3fzPOl5dCinqgsVj+ifRcpxjIojDlSAPRy+NmjnoO0
	Pj9FDqmS6KJhC92zUqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVgA-000000041Ax-3HAq;
	Thu, 31 Jul 2025 15:58:50 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVg8-0000000419y-2VHD
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 15:58:50 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so376966137.2
        for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2025 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977527; x=1754582327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awhIJS7cdjgUxEct8Phfjco6UcYl0OeJVp0tQ8Q8jkM=;
        b=FsEBs62vHwJEOic49IX10K6rpm/x1Ot+cZWdy4odmLIw7adxjlx4AaOjRpdycbOFH6
         A91cErwkhkjaO8wC3TLQBrwnpYJHiSnie/kYEqBfMCu86xTWy9kHhQ443Zozt2rWW4iu
         JBnodFJg/1Q6oRqgKkvr1oyrEqei2BgIvwXpMsFM9WzktrDfw54MRta/m52KlBZXs2QP
         gPRzBfUZKExavjWklGaRgIRKCxQXRG/kOqQfZnicX6tIWBYpNbQOclwt0j3V8ze85Msa
         byuvAcw151Quz60+Cx8wpQLSdlKtKIP+72KJ+0ECLHNJysKKP4pZEyf/dqapLuLpy+P5
         fLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977527; x=1754582327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awhIJS7cdjgUxEct8Phfjco6UcYl0OeJVp0tQ8Q8jkM=;
        b=QbwW3zauhm+xeST7JYdqcnZNbwQLqHQpjUWr1/rIPyb67b2YYS84DcXawhGfIm/vmH
         AoZmv2EDQsDbCceLB4DunBXKOcAqns+uRIqz3i1tpo+GjiYT2P/e4PS7DJmXyh1If+M6
         Fex13fmflz0OwSyKRGMvL6Hgbj9vQRY7K+UKL4iWRpDmapNz2CgZq05vdZrxKIHDr40m
         hk88CYbn1dvHAmEH7XoC4GyrIPFoC9Em19bdtS1CXKB8P02d1JGFMdAibdFU2vjlifNx
         V1HrJuTNw9cSOET5slVc6FqPXtiizck+nZFnRG0wHN2YMIjEQPllYg/LPsQAFkojDNMX
         VMDg==
X-Forwarded-Encrypted: i=1; AJvYcCVZVydytcx7FDZWoYMJz4TsoeLqyS+KphSQUyY1Xc59xmovpsQhMlomRBWqd3VO2eYIic1BEvGpaJg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIyMPEKAWskyO8IDmuCOqFQy3zGQ/1qc+Ph3NNU/GFomzgMQHI
	9pRCoILT2HTVbLSaVM+o4MaHRUxLxVxQg6vTpDfbM7Dq4xEN0QeWPk9lykL5ZMWfA1c=
X-Gm-Gg: ASbGncvYHiqfP4630ozGhgj3PssGY0N/gWy+JIWUDABXYOxRN1KB2UZgctn/d0fgZiv
	owdz7pUNWR5+HMUEN6jkrNGnXtfzB9nXU3xl/gbQAuyPPQj9SEa2qlqqoZVpmeBiLGDE9kWfykv
	Ahya7lo6bcr0logiW/Fo0CrcooM+NBc6HSrfRJYPZuG1vtMLh8zHGHLR6L1fqC6vD+aoLEWun4S
	KYAqBQvLjTGMaaSrSF52ZN8OvQNmrvDuo9NwxcAggCm160seEE9peQPP2NyEkuuj/lpHsi9RuJ1
	lAcUgR5RR07rCX9ZqNiakU7qqIQQSd7SBDmGnekxRtft1+UC8a69MAp2B5lXwbtpUd4ujI/F3fD
	5ErAa+jZbA1Q8bIMIeqox+C2HrFni0D5Tx8jTwg==
X-Google-Smtp-Source: AGHT+IFaTZ7Nhu+be4TDEAEfweuDLzckzke57mSUiLDaG292YOCBw+NN54Llzx5T9jpZDMDjLrT77w==
X-Received: by 2002:a05:6102:b13:b0:4e6:fb90:1e21 with SMTP id ada2fe7eead31-4fbe7f1af52mr5076369137.2.1753977526996;
        Thu, 31 Jul 2025 08:58:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d1c4b98sm376631137.3.2025.07.31.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:58:45 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:58:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: lpddr: Remove space before newline
Message-ID: <d7f12483-4710-4c6d-bd9f-1abcdecc9b36@suswa.mountain>
References: <20250731095247.2165158-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250731095247.2165158-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_085848_633993_E9E023C0 
X-CRM114-Status: UNSURE (   9.50  )
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

On Thu, Jul 31, 2025 at 10:52:47AM +0100, Colin Ian King wrote:
> @@ -321,7 +321,7 @@ static int chip_ready(struct map_info *map, struct flchip *chip, int mode)
>  			/* Resume and pretend we weren't here.  */
>  			put_chip(map, chip);
>  			printk(KERN_ERR "%s: suspend operation failed."
> -					"State may be wrong \n", map->name);
> +					"State may be wrong\n", map->name);

Not related to your patch, but ideally there would be a space after
the period.

regards,
dan carpenter

>  			return -EIO;
>  		}
>  		chip->erase_suspended = 1;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
