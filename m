Return-Path: <SRS0=DDRD=FR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEF4C4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Dec 2020 21:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D8F207D0
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Dec 2020 21:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D8F207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hgNuCJANZc9WvE83UOfSYUZgr+P5Tf1Yorg1d8dNAO0=; b=3ZeEmFETmHABSNZN90dE70wQW
	/xFV/hL2RjWNSA1iJ92TquJEBjzdKWrbr/DnRGJkXg5p8bdTdYVxhspYgisKn3xxC1rSP+xqwlHDu
	fbnN2Hvb5RGnjkpBubc2MZ15zKRhKqDcaBp/iE0jmEzh8OdrvwTx1uC45Y2YXjbZvMJuHpmADDBEK
	hQoLDvrLD6rK4gkek67HCqeBg0dsFwNJCeh09cUj1pMWUcvbwxKmN11P7sfWHzk/MuDpAqCWjf9GR
	Np7LP5wUgPDo7uan/qJzO1lg8UtYz6686iBCtt1t9LjGFRABJFEQWSWrWrFGgdxgkEzP9Knr4wbGZ
	4iR4tjiOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koYlr-00046N-R7; Sun, 13 Dec 2020 21:19:11 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koYll-00045e-84
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2020 21:19:06 +0000
Received: by mail-qk1-x741.google.com with SMTP id p14so4785245qke.6
 for <linux-mtd@lists.infradead.org>; Sun, 13 Dec 2020 13:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uEj5TwH+jF3Bmynj+wEm1bjYaLOAOMFYl4ta4y496EM=;
 b=AfGIlZvbJ2BFofpWgW6kU93wCMfNU4k4SB99E62zljL/B0LAUzE0g+1bIrPJrdv2ay
 ODytx+h70L6YPCip+7JHK4cHM7eVlOqxXajS2w0K40HR8ks9UMQOtDWdkIhkFwAkAHK7
 eztMnMpNqSy7Pq5zY58EaE6IH0KLGv7iGY5bVmU+LTrbFye98s+YNQVlgv7/7iCTfOt1
 FP4263xVw/6NCg4p6yC7HnmxM3m9gXwuB6GQYi43+GAOj3lq/NXu4WQ5u9TOO4dp5zx0
 Lx9/TvRRelj/x44UqK4gmauisSvamt2/ehKTHa2w7ukqqfOPDhfY+1XXzSAq+mkoU3qC
 FIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uEj5TwH+jF3Bmynj+wEm1bjYaLOAOMFYl4ta4y496EM=;
 b=kiQbfbqakxs6GhcmdcVeMb7xkw+oXYcICi7DdKK2BGViwMUmnucjJS1eekIgnqtGSr
 w15IkZWRl+T8ydA+0sd3s3IcRJpSx96M0yyPVWkjHBZDKItgJcjm+7Y66IsARp+HVmnL
 se3nVJkishmc9bRDgdkybIeb+W/QHSE0Zy8Prr9guhFHyEFID6cT46/9x5npdcMbkdlr
 q72QZph51OLNFIza6YP4jHUbBoLT1FrPQ1KFlQu3lrdOMmer8T+/SWLyct/r31LEqUZ5
 ONhVsFB06Ia0E/MIs4ty04bQr73llRU24lzexws0JjwpH+V8X8vD3mNlodH546Rs9k0q
 VVSw==
X-Gm-Message-State: AOAM530Up3g3l+63VyrcyIMCmDVsapf3zqlyD+dzv6Dqs52oNrHridej
 xf0c+30aDolgidjBTqk4gtqlojBtL5u5ipd8skUkOwWy
X-Google-Smtp-Source: ABdhPJzWsh4b/EyC3iBQvX8YGTuTc5ndVFQvGeALAJcrEDUTs9CsI+SfrWbGguyBK96TkTMJTZ0/+ntZxFGu3rD8MLE=
X-Received: by 2002:a05:620a:22ab:: with SMTP id
 p11mr29522537qkh.237.1607894342930; 
 Sun, 13 Dec 2020 13:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20201103115645.684-1-kechengsong@huawei.com>
 <20201211033139.15172-1-kechengsong@huawei.com>
In-Reply-To: <20201211033139.15172-1-kechengsong@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Dec 2020 22:18:51 +0100
Message-ID: <CAFLxGvyjibfBHZi8Z1whxoLLJ7uQjKasKX1kzBwvVzvXoCXXaw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd:ubi: Remove useless code in bytes_str_to_int
To: Chengsong Ke <kechengsong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_161905_372336_BBC3E1D0 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Dec 11, 2020 at 4:38 AM Chengsong Ke <kechengsong@huawei.com> wrote:
> > I just send the v1 with the wrong module name 'ubifs'.
> > [PATCH] ubifs: Remove useless code in bytes_str_to_int
> >  :-)
> > Thanks,
> > //Chengsong Ke
> ping

Both patches are in my next tree and should appear soon on linux-next.
Thanks for your patience.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
