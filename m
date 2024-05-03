Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FC8C4345F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2024 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVfDC4AJwam53qQ5xj+M89YZKhx7FnN4DGWx/FtZYgw=; b=TayzoFkMkPKcgr
	+MwHkO19bShjI9AI8LGRMCakoP6GUqBJuI62eonwwUZWQroRUc91QDo+uS3BVuP1AWIx9GHkbxgWH
	eYBpgHsph4a8WKbdEAbxq/0zO3n8rhzbk8k4eQJ1EHXHDFtFLYCrnlVm5qPgZSBt8zLrGI7ku17Fl
	fsQL7JSgxGUlT8wC/IigfG1ScQU4Wkz9Sd1OTst6oFSc2fLqz8EUqPPMZ2LMOMCtEosyyV69d9l0i
	xQIwYK8T0lEfrkLz9L78XO4gb7vTFgHkh5tCr8nlu8HRDYWSMaMUOhX/xT1P/pRoYyNO5iD8cIIey
	YTAJJZ+Wrn6xEzEzVkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2n2F-0000000FPNS-3XAe;
	Fri, 03 May 2024 07:08:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2n2B-0000000FPMc-1RBS
	for linux-mtd@lists.infradead.org;
	Fri, 03 May 2024 07:08:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-34ddc9fe497so1401567f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 May 2024 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720120; x=1715324920; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vbbf7SbWBB1jVqIsUo1QlocgDpm6pym6REQIs8oGG/Q=;
        b=ddKq9xdSikIiHAGyCMf16Sf1FRMQueexH6N5W4/WECS25/jtvW7IUp0RINOKRk4RyZ
         RCA/hHiq796ndVpUwSQaUiY9Z/4nP2RDUad1lkzrhF5Q4lgFTtJ5MoHgaWh4joBRPTdM
         nZscQSTHZrGCN6y67gZVSPd1ZZ1LT5L48J1nBxe8afNCCNlKhz5lNfyY2Q4dLCEF5p3O
         qtPq934ZCaPYoUdtqC9rwV+99LsdmgrodoGICrwOIcCTHcAEA2V+5H8JiMDy98ziNx1l
         SPelBbR3+xaFDopnYkoHsryE4FAXpKqIbAwIugFuENu+WRb7SbZpp5rzzHf2N0VNRPDy
         4txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720120; x=1715324920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbbf7SbWBB1jVqIsUo1QlocgDpm6pym6REQIs8oGG/Q=;
        b=VC0grjHOnBsl95yJvov0zNdRRz3XbPmhy+1cH8MRHp6Tq86ijqref4Ykplq1PmRmsc
         xbsCg5zlfyX7h6NcoklYwRNz6pP4+i+QWlrF3Gc4rmOm/026HByeY7+AHIDb9+O6rKY/
         symlnyH/EWCMvYnYYacz2aIeLVeduf2s5zZ7cvxjIKrOmxMQK1W84lwgbMXXBcJ2IBs6
         F064usaKWspx1SSy4zaPHAuERe1E7PKPBTG6maC8vzdIsqqhOyt2vsG9SV8pNDwW2/jN
         dFd2sLArqZM0uMZp2cFWR21hp8/EA4czZVuEJRepffLWLKnBOdhrTSOnzEouQNQCj28P
         qbTA==
X-Forwarded-Encrypted: i=1; AJvYcCUP/rXRiL9P+BqeTgQq74Zq3xfwF8AkdJEWEW++0LMEn7rWJmzEiMA6PTApKk2Yd8Md6RbdMIp7KHjN33eE+1RLjDcGfInKRX6HW4pYbg==
X-Gm-Message-State: AOJu0Yyihq067VRKWnHJcweiZW7urGnD43QZ5OgolMGhCGnGBCVpkUWc
	PO6p4sGiPPylNx4qu6in/JCB1FcwdsWG/ci4FUfd/nNeb41PZUUg+bgDBueoziU=
X-Google-Smtp-Source: AGHT+IHIDWc4z27PjexsY9CO33jvLJBig3vshfxodFwrYJNZufsFMOkyCNoP0eqg+oYwYwf+L3yGxw==
X-Received: by 2002:a5d:4a43:0:b0:34c:59:fad2 with SMTP id v3-20020a5d4a43000000b0034c0059fad2mr1461121wrs.17.1714720119864;
        Fri, 03 May 2024 00:08:39 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
        by smtp.gmail.com with ESMTPSA id n12-20020adfe34c000000b00343d6c7240fsm3016934wrj.35.2024.05.03.00.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 00:08:38 -0700 (PDT)
Message-ID: <f2f2b2ef-05e0-4d7b-bf40-43fc17416e43@linaro.org>
Date: Fri, 3 May 2024 08:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.10
To: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Michael Walle <mwalle@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <mafs0msp89vx5.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0msp89vx5.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_000843_464786_4F84C081 
X-CRM114-Status: UNSURE (   4.16  )
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



Looks good, thanks Pratyush!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
