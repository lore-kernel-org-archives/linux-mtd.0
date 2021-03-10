Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB0DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 07:43:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE74264FDD
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 07:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE74264FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6qwQlnk4tM2mIH53HYku/EQZcNUIZmztg+HRDw4kzk4=; b=g/6LVInkHAOUwGjVhzwkn8Mq3
	OxxJ5HeySUBFG3xxO0aEhGAKEDgo8fj/nwvPAraCidmDR6I7tPB1pmPxYWL0yy/jsMlU3YgtGAIWL
	c5WJGxl1rlw1B3DGVVeRDXwrcQth6d7aFu527kMVIpk34JEXAShDZO4e2tkZJciGnKeceIjNzXV19
	GBTKmfNINsyGVWiDeKSNGbZmWaZeoUgiwcMId3oqqba1Ny212p7oKTWhvyZ2i8QzDLtKJQ6kFHDP4
	tSVZpPrr1ppn9WiDb6M77YqMTXLuSjnDqCQXPLuVEcjzp9j+xT6q0VLJqI/H7fP86q/Hj+ePkWmuH
	NnHA1aucw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJtUK-006Eoj-ES; Wed, 10 Mar 2021 07:42:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJtTF-006Emz-4r
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 07:41:39 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ha17so360944pjb.2
 for <linux-mtd@lists.infradead.org>; Tue, 09 Mar 2021 23:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mLEswWXF9e5cJBbnF4NgfIXy/FQCAzZo66T28mkJ1ZM=;
 b=ZTKqh0VYekPHNtYDKvJDvxJcLiz2LjSlHalFZktsvi3e8/Ky31ZW/luEUN2Lu75aui
 NYHMWB6zxNZxqo+bta8Pn6cA3WEEvasBmeq47P1/qpMRquEfK4yRDmdo2n+F65WacG46
 qNlE70y3XyI1AgO9OfJH2Lozj5UcyJOUtfHXwapHrZj9bTR7Wj+ONrOn03oiafrGwlOV
 Yu9hb/djFo4xDyFZI7e5k13YQ1PlUK/nDoPDPicpS0QgTrvRWqjG5srGyxvWHy3ZKTwY
 D7UvNSlj1Zt6MyYKV52LOZr3/3vqe0nWX/qmlbVe/kWLkZFdJwD6gRFGVKanRx7PoJZA
 UwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mLEswWXF9e5cJBbnF4NgfIXy/FQCAzZo66T28mkJ1ZM=;
 b=E1gILSCV7ljrFfvDYbOx/gtYOUgEKgmPYmFj17xWsqsStmVnCbUQ9Hl6d5QdLhlRWf
 ZjNDxfYA8+jGYhByO/NdrjGQMuDzgj0qIjhPRFxepKXQWAi82s9ozwAahlxQ39KLGfXy
 6EpBbd7jlWobe/rgAZTtccYBn4u4RhOGoV+98ubwiIpbUoM9Ixmx00/EyBaw9kmh7/3n
 ztx34EEDFuRB1XwG//OCTHTnHMSQ3/40TZ290Bt1G9IuVy4qHoCoxfrWGcwOV/1suDK3
 jgTYNKeLwrsiCzQ5gWQqWwGUPOACiq88/d1R9Qik/hc+1sRJG3rcAHm65oNN2/f9o2dm
 1Aow==
X-Gm-Message-State: AOAM531sNs0C253uz0+FkQIfWoUBPWSJLR8/WNNQ+IDb3OiJPaWxn3vT
 KyCMcMI0tD1mLeDKffDkkCw=
X-Google-Smtp-Source: ABdhPJxUO/OVMIerEM9MCLsyFy3YZLgDrKcNR/Z7AMdMfVcUnhgH1R9lCI9ZJqahJq/UuyQEeGBx6w==
X-Received: by 2002:a17:90a:4604:: with SMTP id
 w4mr2256891pjg.56.1615362086760; 
 Tue, 09 Mar 2021 23:41:26 -0800 (PST)
Received: from an990131127 (42-72-241-154.emome-ip.hinet.net. [42.72.241.154])
 by smtp.gmail.com with ESMTPSA id
 u12sm4195539pfn.123.2021.03.09.23.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 23:41:26 -0800 (PST)
Date: Wed, 10 Mar 2021 15:41:23 +0800
From: Shuhao Mai <shuhao.mai.1990@gmail.com>
To: Tudor.Ambarus@microchip.com
Cc: mail@david-bauer.net, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Message-ID: <20210310074120.GA63@an990131127.quanta.corp>
References: <20210213151047.11700-1-mail@david-bauer.net>
 <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
 <e9626369-dc44-8f64-606b-88098157bc7a@david-bauer.net>
 <8833cce1-a843-9b56-53ed-e9a2fd42d990@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8833cce1-a843-9b56-53ed-e9a2fd42d990@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_074137_182661_2D3CC3D4 
X-CRM114-Status: GOOD (  22.36  )
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

On Tue, Mar 09, 2021 at 07:53:59AM +0000, Tudor.Ambarus@microchip.com wrote:
> On 3/8/21 8:03 PM, David Bauer wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Tudor,
> > 
> > On 3/8/21 6:50 AM, Tudor.Ambarus@microchip.com wrote:
> >> On 2/13/21 5:10 PM, David Bauer wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
> >>> sectors as well as block protection and Dual-/Quad-read.
> >>>
> >>> Tested on: Ubiquiti UniFi 6 LR
> >>>
> >>> Signed-off-by: David Bauer <mail@david-bauer.net>
> >>
> >> David, I'll take Shuhao's patch because he sent it first:
> >> https://patchwork.ozlabs.org/project/linux-mtd/patch/20210208075303.4200-1-shuhao.mai.1990@gmail.com/
> > 
> > Fine with me, I have not found this patch :)
> > 
> >>
> >> Would you make an incremental patch on top op Shuhao's, to add the
> >> locking support?
> > 
> > Sure, It's necessary for the board (UniFi 6 LR), as the bootloader locks the flash on boot.
> 
> Is it necessary to unlock the flash at boot time?
> You can unlock the flash from user-space, using mtd-utils.
> 
> Have you tried to lock/unlock portions of the flash using mtd-utils,
> and check if what was locked corresponds to what the datasheet indicates?
> 
> > 
> > I'll send a new patch for the lock support.
> > 
> Great, thanks!
> ta

Hi Tudor and David,


I made a quick test on flash_lock with kernel 5.8.18 and mtd-utils
v2.1.2. It returns "could not lock device: /dev/mtd0" and "error 22
(Invalid argument)".

Could be the error caused by my test environment, if it's functional on
UniFi 6 LR.


Sincerely
Shuhao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
