Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61F5C021A0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0be4GxwYWJnn5i/kI8syeSB9l+3j2a6ZCmzh7AMbK4=; b=4vdbA8tIX+XTAw
	9qFNEMo0xY/xpJG3nTkjQuYdZTJbsNrBcLpc59LLodT5yaXFzPX5N27wfGJ30e5mLpNLut8zFE2Hs
	syxncXm/0fGVzkdcHwuHYIp3XC+kVSKfvEh7lVgyFCL5g+o2vJ3NtTb0Wf7FnOuXO59i9xPLxOad9
	UDi5Z192slUP9iKngpaT9s2VgSb3VoQz2NDzrwbWY67spmkneCzfSBJ61zQOBc+tW96tjXrEe1gkS
	ye7+ASRuShCOe3vILUnyrZ9RCjJwvMPXFMcS+lk6km5HD8Bh7CY0XyORPzGZgFG6ACcr5VVWnuxjs
	sgmrcxOuPLOQw+l0zXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVrn-0000000AXdR-3y4e;
	Thu, 13 Feb 2025 09:50:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVrj-0000000AXcX-3W01
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 09:50:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5de849a0b6cso1166034a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2025 01:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739440238; x=1740045038; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JrN3jWt/iMl7xOekttn23BjVvISPZTC20qUehWRCp20=;
        b=sBB+7SZG4ue/EOVUrF4zpDYQ2LeFR0fMNofoaRmos0KNEeI6CBQk5cCm11z6bqNJiu
         KmB8o7RL6xTdbQTKt6WBmujLI9OJ2pdNM0IyJzxBcLf7sD31QMc5/sV8pflnneTDCn6F
         gXs/aYSiIcntQvBggsureLYqJ9g02YPYwEp5VljKWs9W1VQCnBIHFrTvroErWwUeERuW
         alI6LLLdld0mi8vUVO4XNE0PuYYQ9pXtIRmJwzOqmEUpRCJQcJJ0YfWT6O357cnrwitP
         t9m0L5MfEQb64kDD8JF2Qhre0GlZmYEGAt1vsyXu3jCyW4bnYtH1ZedHLNr7mr9XjeEC
         a+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440238; x=1740045038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrN3jWt/iMl7xOekttn23BjVvISPZTC20qUehWRCp20=;
        b=ouNcnJzp+8R8BCmgwSYg/J/l8YwAuhJMSt0jwAn7E1kHheGjDyx4OwUM0zOfN9qyN1
         wTblDIdacrEI7xoLJIwYpeDKUqGyqctAxvXhOZpCr121DlwGZsmkKwQkVbDBulsyn0Fy
         CA4+qiSPZnK9+gOdym7Yf8308Zavzl2HeXi+rpix3OQeNqyCd4Lk+2Ve91EbPf0naBtd
         ExLZgzSbVIckjE/EClXhiJ3k26No+2qKThujIO9XK5MeWfJG7sxjbwbTPIWbhpjbXefv
         EJaVZKK+rB0KdAZFn/JPvaJ4hnc6tU5bCn0rpvcr1Z9thwgNr8AHMPolGHZT0eIJB/E5
         hCwg==
X-Gm-Message-State: AOJu0Ywa183HCTTRAgx+NzRApOIYn7VxZlrIkCGqx/GsyugAVDvfMoYp
	wewXV/laE+WPekB6YwsqNCkul4CUSjukABpsCgsFyJozh43wgzcN15CidaVKbEo=
X-Gm-Gg: ASbGncvVD49VNcNVKnj0vBI6dH5Ek+3bLpBi4EBD/rRlPYwAdRPdf6ZewR9roHXq7Jc
	yCrJKRD+KPrpqZgumllkrHPPMp8+aQ90kJcBbtL1K7IAiJlYdd1EKLAm/wWT2bH9Q6w3dcCn9PG
	vQLiVGfgWD3+tALsqj19jkZgiA6bv9pqAsirn4pwS+hmXT3v1taq6m2OgFKByO6dfzL0wEuFNEe
	xbKo8XhaGlBciBKhh+8y0/Cw2ZPkMEKNN04ROIqXkDSMjGSXz7J6qlvlccW2GfEi9KOkE/V1drm
	AFoUxyj9vpzKsaG5NWRb
X-Google-Smtp-Source: AGHT+IG2U0VVC4NFjdoZutFiwqgKrTC6jrVCiPdjHtRQc0oSGhnaJi0br140dPxDdEtZPPI73HpfDQ==
X-Received: by 2002:a05:6402:3818:b0:5de:39fd:b2ff with SMTP id 4fb4d7f45d1cf-5dec9b73e13mr2214997a12.0.1739440237842;
        Thu, 13 Feb 2025 01:50:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece270a7fsm880001a12.58.2025.02.13.01.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:50:37 -0800 (PST)
Date: Thu, 13 Feb 2025 12:50:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [bug report] mtd: rawnand: cadence: use dma_map_resource for
 sdma address
Message-ID: <e25c59ea-341a-464f-976f-885be234ce12@stanley.mountain>
References: <e448a22c-bada-448d-9167-7af71305130d@stanley.mountain>
 <BL3PR11MB65325337C3F6BBAD406F6E36A2FF2@BL3PR11MB6532.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL3PR11MB65325337C3F6BBAD406F6E36A2FF2@BL3PR11MB6532.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_015039_879151_04769294 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, Feb 13, 2025 at 07:33:49AM +0000, Rabara, Niravkumar L wrote:
> 
> I missed this.
> I will add a NULL check before the dma_unmap_resource()
> 
> if (cdns_ctrl->dmac)
> 	dma_unmap_resource(cdns_ctrl->dmac->device->dev, cdns_ctrl->io.iova_dma,
> 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
> 
> Shall I submit a new version of this patch?
> Do I need to include any additional tag or info? 

I don't really know how it's handled in mtd.

Generally, I would send a patch just to fix the bug.  You would want to
have a Fixes tag and a Reported-by tag.  Some subsystems fold fixes into
the original commit before sending and some don't.  Either way, the
maintainer can figure it out.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
