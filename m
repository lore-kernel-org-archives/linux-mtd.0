Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF5AC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGiw3NJLxoC0JyCeJz3lp6Qi58BEW8j7tcgqhgmJSUI=; b=gGO5C3+qhQaCb+
	SjjS0DrElF4pftZxW51t0EqvSG9vOnD2asdkcHlGP2Voam62V9UJEjAQivte+mIS/0XOnHMLQ9a4O
	a/iImtjcENvsRry5cIasJqgVYkq2HvJNdN66I6qjxQ/rR6A8hM3mGox4ly3J5rIkMVR9BPpi5eZCJ
	ckTOJOtbpMB2EZVDVZy5+frXDEot9jy7e8MCoSQK0mnLkjb02T+xJurTwR2VHInMLW5pOCNYOTOLM
	nAhdjMZAovXa+0fH/uT6nv+uMekyz5CoDloLttzjCXV4yvk4nKGsN3oKNAPlLYLHQmYEfqS5wbCUY
	/paTiZEE4gV3oPiS4Opg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odDHj-00BjtK-OD; Tue, 27 Sep 2022 16:18:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odDHh-00Bjsj-FP
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 16:18:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id h3so11534058lja.1
        for <linux-mtd@lists.infradead.org>; Tue, 27 Sep 2022 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9d0P3gSou96GnwmKkR4zetGWNGL+trTBFAEOC3X3dLE=;
        b=XQeTKfUMrTykouMOeIljMSULDrf/SRn866zz1RlHOb3dTopO0B74PvKyKyoLRrHAiy
         bNfabG8XVe60Zc3I1iJLHroPNN4Wg7idVC2cKJvF43rV6gaIT3ysycDIxT35COlHp2gB
         6STxYXIRDaO0LIGPQ6fC3DSeaD1WjZp5ZdspRhiMn1Gj1sHIAqTm5rNoE1TnL18WHYB1
         jszNSerB0v1orqfEJyKEe60mggtur5MAYwj68E8u0PHq4EHw4HtkzbtWOwOqbfBnAdvb
         8RodFBwqqs3GGo/cyMi/L5l0eo3nu1T1BI1SCCfKF+xbNfxCg3qWNI6oUIncvmfOVmrn
         uxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9d0P3gSou96GnwmKkR4zetGWNGL+trTBFAEOC3X3dLE=;
        b=OecvcbVi+5sCVSZhGnp7agWxc+qUkyNDocTzJu/VLqeohk5kp81UwqzpS3GE7AkfGh
         Rit8vRVrcbMcfMn6UQIxIAzeqev2XDNM1e8URwB9iPpgtguUnz6Vl3jqB5wFwwKq1osD
         4dNafeMDlc0yqJyd2um9djpzPu4sD9YvvMwg8uFzCtQeIz2q3LW8DRzojHcsT4M2JN38
         OF/gQoqMfTOxSk+z6FF4O03XRefPkx6Jdgfveqom1pME3AUJB/1KbPFpIX2VMrkgkKve
         6WgTQUXb693F5MRi7mJAt8HXKUhwFPMIlR2k4KDVXi8kJo1qjuddqImaiVO35p32ALDF
         6IHA==
X-Gm-Message-State: ACrzQf2oRhXIHB15JaXbDZMAd2OyVko+kNpTLqcUxAHGrBnq5eQNm88u
	VpC6Oi0mNzYjcTZX09M0CUndaU+hNhU2/L3aTMrTXu76
X-Google-Smtp-Source: AMsMyM7CuCxaKrX7PGbovGaBfLxBtDTlfWKAfyPRS3sxxyvuyhSapFFv5WFgIKvQtrUaW7+M/zeY8MRBln2EnEOP1Bw=
X-Received: by 2002:a05:651c:555:b0:26c:6a30:770 with SMTP id
 q21-20020a05651c055500b0026c6a300770mr10407332ljp.376.1664295490543; Tue, 27
 Sep 2022 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220922031440.422193-1-alexhenrie24@gmail.com> <5e85eafb-bc6b-a005-fb12-db6940118481@sigma-star.at>
In-Reply-To: <5e85eafb-bc6b-a005-fb12-db6940118481@sigma-star.at>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 27 Sep 2022 10:17:59 -0600
Message-ID: <CAMMLpeQnmicqAi+3ZSp+Ep9Tiqm2dD_AdKYJFhi8iTdicTmr4A@mail.gmail.com>
Subject: Re: [PATCH] mkfs.jffs2: fix spelling of --compression-mode parameter
 in help text
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_091813_569214_363EDF01 
X-CRM114-Status: UNSURE (   7.61  )
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

On Tue, Sep 27, 2022 at 12:34 AM David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
>
> Applied to mtd-utils.git master.

Thank you!

-Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
