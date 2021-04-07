Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8BBC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 20:25:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273C961184
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 20:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 273C961184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OCOFxquHAdfH1DOTreQSMpOIAEkyx3vNnkEN7fryxiQ=; b=Mq0HZm4O30eaeuHBAJbc9eBl4
	RTxxbPfvM2MtdShtbgvrXDmMWihOUAAxpqFShN/ycAwLEY4ThUqKi0FvDCsb7jyWWnmcukgMIe00c
	LnQNKNBwHo1Ts7GBElCQgSnpNha0i/4j6T/tBHcjT/jKi3Y7V1WRRmESvhB2DLwrrf4FpgBpy6bZk
	Jp1j7I+IFcO15+/dmcuVnT731XWd2listmVLgqFEeJBkuz8JeY6Zpp15r7N35KKu5X5OZNyHrYZHE
	HOfGLVwzqcVg/Zhsf6+Oi4L+Z5SAkQWQXcthdXMeHWf/x/VpWXfw81lx8vwQT95xJ18D1byJGrira
	LpW/wJQHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEig-005w8i-2D; Wed, 07 Apr 2021 20:24:10 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEia-005w7S-UO
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 20:24:07 +0000
Received: by mail-qk1-x72a.google.com with SMTP id i9so20186557qka.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Apr 2021 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E0wSeHZSQBhpuihXiudgZD7Plu1K1NSw3C4np40YpM0=;
 b=RrDy9ishi8rqz0bNYU+bxDmoDV3cA8r44IwL07dayB5eSLEgBIXN0S/mom5AivKofk
 C4yFl0tOSCOtW+rlQDohUlEYWXXcYYA8Dwl9JqVcUlxyWVVxJ7BKssCm5R5jU2ZauhBg
 VOVRZiVFv2SnOv/NLvFBHONzIaV5QDJMAZm85bkx1jroEXskS5FpkTjjDUZIt6VW+CZM
 VfP35KhdTBdVHxj44bRpOF4fhZSvnb4RcEM3gJEs9N0xcE5DRp+ZABXM3dxFEX0dzuLG
 h/TKrGiED6iDlDY/3zLPo2dJZs6YsJ9xnH3i2A6r1emF4Lo4bupDHJn4UDaTgrQ/hW28
 O53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E0wSeHZSQBhpuihXiudgZD7Plu1K1NSw3C4np40YpM0=;
 b=ZMtn8gi8rcyjs/wADJhPcxLgV/UyrO/iXPdigXNj0F6j1LKPpdm7pGk6xah3DD9s7a
 kx/GzqqITiLw8lnXkHsqddN460fkwaBznGrXHumqnAke7YRLAyZ1RVZpYHPRBobip/Y7
 6oSn0SyJ4JlDtzTBkewJyUtdJeGJbTESgr+kM6WIhXMh1PoGJpKQDkBo6VTEqbg1MfYy
 VEUvSorQ1RlRJ5lQr1NtKvcdQouWUrVzT9evOBbE5MsRWaXCBNTXdD0UA/DfBBYGkezA
 EATfpabI1qqMKP+XKZRN2nR6KS89/smB8Yzh4a2rNE3viiNwksE2qq7XBV9b/Q/qAW+N
 43HQ==
X-Gm-Message-State: AOAM533Em+rYmDPETl57zZwKNrPaNLSx/hAH97ciGhW3qlIAp6VCUrAi
 Ls6/nigfyPaIFgeUP4LQRe4OJHS4DLU=
X-Google-Smtp-Source: ABdhPJyySnen8Z1lXSpXciPPeLqx/wBAjBoK8hXduPjK1VnNUvfjErMWaODlM7NfrLQeUiy71G4c3Q==
X-Received: by 2002:a37:bc43:: with SMTP id m64mr5088884qkf.186.1617827038494; 
 Wed, 07 Apr 2021 13:23:58 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id d2sm16480417qte.84.2021.04.07.13.23.57
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 13:23:58 -0700 (PDT)
Date: Wed, 7 Apr 2021 16:23:56 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: UBI issues with linux-stable 5.11.11
Message-ID: <20210407202356.GA31407@localhost>
References: <20210407190302.GA12280@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407190302.GA12280@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_212405_149265_BAA1356B 
X-CRM114-Status: UNSURE (   6.60  )
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

I forgot to note that my filesystem/flash/UBI works perfectly fine with
linux-stable kernels 5.0.19 to 5.10.27. The problem only shows up, suddenly,
when trying to use 5.11.11 (everything else being the same).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
