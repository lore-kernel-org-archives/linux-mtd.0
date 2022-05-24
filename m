Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1748FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THdCpPOFgxvstw6/f3MKbyF60diYggt1D6RFoTh3K14=; b=l+VtExLLtgdGFG
	sfLoh43wTjHPSqKXeWG0IjR0IA6eVMl003mLsAIlHXupARySUwS1OJFnN7XKA0A3kcZl8abtX58Dy
	ey42QVfesQRlyYOM1+vtSd6pG8w3oHChHb/SWVxtvTYe64rD76Pv3JOACTjZDibw2Sh72kxPRDN5S
	dOnveWxC3WxOcuZfDXIabnpR7gaHR9YbsYGmdSL08PkaPyYhnnznnmkAD3okupZyzY503IVwLJD4a
	OVDlC96LydFm3aTe88VmuppQWeI0ct8hK0bmrM+tSessfNTe0tyCAUBOxL/eAeutMOQqo1pa64Wym
	ZFdg8pTBPKDFUeGuMAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOvA-0074Jq-DU; Tue, 24 May 2022 07:25:36 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOuz-0074HL-0K
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 07:25:26 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id t26so29384108ybt.3
 for <linux-mtd@lists.infradead.org>; Tue, 24 May 2022 00:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZCIrkeqp0UwfkI67/iqYr1O2x3qcCrd77cFyqemvpY=;
 b=wPGM+6wvYQzYXBkWVp8pdxQXBtD/ig4S7bFkR4MsUl8/n209nSMc2p6HwXgKOnXj+D
 ThJnMq7NlzkZjYSoPm6Ifd0zBwYm8MEKfW8EggZbOhp/7M2n537sCmgt+NBdXyiSh7ac
 nVg+WInShACQygT+fCQYlmxe/blylLO/9gZkSURSBULrET0L0I264rZ6jQPVnWjZ7qcO
 eRXcqloMgDKLgCMsSFWqaHyHnh9iQp4hf0fPLWEysE6pkKLR/Wc2h5Tsphxth3s7H32/
 8d7upo29RQfEk3Li2JWGMDUFPK/nuTrqZ4VKQBEVOoxqIxlekxO6gkYTUy4+7n0tGoQi
 H9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZCIrkeqp0UwfkI67/iqYr1O2x3qcCrd77cFyqemvpY=;
 b=Zm2x4n5xdH4mHmR6x4zuM9zqkDr1NS+MqcFbwdmXdTm5afkMxJTrhCEO6TTtaN02dc
 xHzEXsEq0BwW7ormS1pSHYxLY51LNPZmR2uEs1sH6u6rvQ0z52mCf5n/wscz0JzLFF+4
 fEMWHo9rf95CFGybniIgOg5dJZrqUYiEC+g36GRKEvrCMV8qvD42oVIlVk0qrRq0mptP
 p91hSfOVvzA25AVYkHH6oUyz/qlktS5HuUQHelMiM3tafUcucdrCc6VALrJKiexoCcnI
 XYUMJ0tkPzSNLHe3arxwPHEimwshfqTXDUmAMr69m4i1Ps/UyIz96heAqOAzaWk1S4D+
 GAHw==
X-Gm-Message-State: AOAM531Ik0SPJwb5ecoyC24Nth+N+l238E/u/90nTy6I1Rqi4IQE06mu
 DrN80JoHaNzvw1IEQzu3/G5bLzTMbftN6ZrlrT/qOA==
X-Google-Smtp-Source: ABdhPJwFN5Fdjz70SrDy11N5VCDZyj5xhzGfdjsLgg+5DDgCd8lOElEQAznjGeYKxpSKIfJZw74EpUQ29Ud03jgE/Gc=
X-Received: by 2002:a5b:691:0:b0:64d:ab44:f12e with SMTP id
 j17-20020a5b0691000000b0064dab44f12emr24771949ybq.533.1653377123012; Tue, 24
 May 2022 00:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220523140205.48625-1-linmq006@gmail.com>
In-Reply-To: <20220523140205.48625-1-linmq006@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 May 2022 09:25:11 +0200
Message-ID: <CACRpkda=YCUCVzHLn9YHANsNk48PHEBUmP2gvPhh-S+4rCikbw@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: Fix refcount leak in of_flash_probe_versatile
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_002525_110647_3013FF68 
X-CRM114-Status: GOOD (  10.27  )
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

On Mon, May 23, 2022 at 4:02 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_find_matching_node_and_match() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
