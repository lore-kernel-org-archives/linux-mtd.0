Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E977C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRRYuU85BNCOETf3kSSCcaUAQXcxHo03IqWth4DCcdg=; b=kS5sqtNuDvq1q8
	W9G/POokWSdPAgwWUAvfkyFbzlGr06r7I9oyOIerhs2bW5j6TztWIDw9lCCHWV5t8R+Mx+yhdJOZk
	9p7Ym7PwUEBeuykrKuVKBWBUL63+rRBNzcSSFzoBUcp3UayhkE1JBu5+Myueccs1Nr4v2qIjkeqfW
	bCxp1ga5lL4yn/K7Iy+4AchSwnddvIEqWSLosBdYEHJQVO1CP+M6z9M4VlGcRKI8a1612rOhxwVkL
	1Gl8GMZgEB1ZMM/fGHNkVKApHN3VKsb4/Dfa4GD0xUK/nwvErKM7EvOnxIVjIY9deucdj0ZwUQ9RU
	ICcHzU/Wje1QSOzwvT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9zh-004wPN-0T; Mon, 23 May 2022 15:29:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9zG-004w7Z-Qf
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 15:28:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id q21so9398895ejm.1
 for <linux-mtd@lists.infradead.org>; Mon, 23 May 2022 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XPtsde4gyVo6IJJ2lowRrIJoC9Wl+ngKLvBmCGRosYU=;
 b=he+tcNDA7ndcB7CTw1/DbteaPV0BHHiyChBmUWVYsesTwE4FheIylI/Ktcls1XAOlf
 c3S5t0KEqwBQX9JX4xwIfmleuXXuktbt4EvMIBFVITv7lFRQo4UOVcfh4sYWfMSwx9Pi
 U2Dez6pyB/M7lY0SPdYD6E202dPvVrynR4EtREr2cRXWjYjShDZHRqFQwkQ451aIjm1g
 Yj5vbsF95Iiz1OewX+nUFxpPzlIUW6/66w8OnTPgzJ5PEuG+8FETwydWbBNjSzQ3FzWM
 QBmel4mAnWj99UCYFVXz3muSbptC2IMAtsA0FLB+90gYv5Oqsq65HubkW3/YlLk27+Tn
 Wvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XPtsde4gyVo6IJJ2lowRrIJoC9Wl+ngKLvBmCGRosYU=;
 b=OeSoI0vqBVjEqIcOxLCrW0xw8dNHgnmaDvvmvnXSy8iSAI/TYJeGMqlrdYM/DErLow
 HbP8oPwXTFCdVcEPtLrOjDqXkX+fg1p5T/fjQxaOJ56su1BSebsVtpd4tlYTxU65bAAP
 aMXIxnr1ct8MQg5HFrvgO01yt352ehc0jhx/VPC9XVBt6w60H2ZPxeWQD8L/k2KRUu7c
 IJ3d6nSpRi2IwH0lTTVFQEGFqfYatDWyUnbsfxg4lG9OLTdKpUi16nuLLet7X/aPcSc4
 UMYE9hVWn8wANFrxFJrXwMjUY7KvmIGkgs7cwW0hw5W32Npmm2Sbt+pcTVMs+sVtRmxg
 +sRA==
X-Gm-Message-State: AOAM532ISIFodH99z0W/cTfdLArcHAk7jJxI4gV3WXeOeHTPnWxGCwOS
 yVMKPnjyF9YWjDxh7vV4Oj3ZsQ==
X-Google-Smtp-Source: ABdhPJwrxiEWnwMCc46nqTyw8Rb4U7FGGn9Q/ughz/Boi6eJRPID9+ui33r690dogZXwncyyksQf1g==
X-Received: by 2002:a17:907:6d97:b0:6fe:f9e0:c03f with SMTP id
 sb23-20020a1709076d9700b006fef9e0c03fmr1908505ejc.219.1653319728245; 
 Mon, 23 May 2022 08:28:48 -0700 (PDT)
Received: from ntb.petris.klfree.czf
 ([2a02:8070:d483:ed00:4bcc:154f:5c11:5870])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a056402139200b0042ab87ea713sm8285753edv.22.2022.05.23.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 08:28:47 -0700 (PDT)
Date: Mon, 23 May 2022 17:27:48 +0200
From: Petr Malat <oss@malat.biz>
To: David Laight <David.Laight@aculab.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Joern Engel <joern@lazybastard.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: phram: Map RAM using memremap instead of ioremap
Message-ID: <Youn9AmqY6/EExDw@ntb.petris.klfree.czf>
References: <20220523142825.3144904-1-oss@malat.biz>
 <3cab9a7f4ed34ca0b742a62c2bdc3bce@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cab9a7f4ed34ca0b742a62c2bdc3bce@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_082850_919538_1A7B0779 
X-CRM114-Status: GOOD (  12.45  )
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

Hi!

On Mon, May 23, 2022 at 02:51:41PM +0000, David Laight wrote:
> From: Petr Malat
> > Sent: 23 May 2022 15:28
> > 
> > One can't use memcpy on memory obtained by ioremap, because IO memory
> > may have different alignment and size access restriction than the system
> > memory. Use memremap as phram driver operates on RAM.
> 
> Does that actually help?
> The memcpy() is still likely to issue unaligned accesses
> that the hardware can't handle.

Yes, it solves the issue. Memcpy can cause unaligned access only on
platforms, which can handle it. And on ARM64 it's handled only for
RAM and not for a device memory (__pgprot(PROT_DEVICE_*)).
  Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
