Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6A2C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 15:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1289624688
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 15:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UCLeCt1h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X035kqzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1289624688
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ftotz5nKBKyNRZN2LW1MhIkVYOghyBhVm6nqFHOqeE8=; b=UCLeCt1hSqhHgM
	dnZ3vDHidSnDvYWmLay14VlgiVMH05WIUcg6bMb1GckYeusWgBze9COu8AV8GXqXpmbPSZc49fGKD
	EtQnm21+qXxj7WApRb8HVfOC0FwgQZi7yZ1rg/aErn2Jb9lFoUKqjD4mAvQo2M7Xxw8cL1PJ2XxDS
	XenFacOj7SmGCgHpTQl/UPJKjlGmbSHPbH+3qYsfBRt8AMjuae0USN5qwekwJJlOjw5egze6SmHrs
	cenqnLwxqXb2TszgfzJrEUTiO/hLiqYAsva1l7TrJYL+GcoqXN92YjXcPGOQfeeV5iobL+PSZ4pAD
	+ePJlHz2tMoN17EsVFgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7KuH-0003M4-Uk; Thu, 27 Feb 2020 15:16:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7KuD-0003KX-Fr
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 15:16:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z5so2333890lfd.12
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 07:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0m9jD03HOJFMY+o2s++JPipekccaeBCx/UPUlryNRc=;
 b=X035kqzzR8RmX8a/xggRPJVOWrausMmvsIogS/pK1NDVIxrK/OcIBRpEa5AS9iFQqf
 C2rxnMOX7sTbtm3kzpTyTtuwrKPL0SqCkxDRqHa0yLGNaFEnqRvjze5J+clhI4B6KrON
 9RWfQkIFi2o0YZfB41+U1f1ldIzwqOKF9EogTHqpxH0gu+ps/b3e1b6kWJuQHzNoUArr
 IjLTRsU0XR6lg23mDh7M6EadgXwq5gKq1eHtU97Bxj3isxLnJyRF4yiOXPthsaImI1DJ
 8iZahJW3pXb6LAuG/vKCU3gBPDvPvuaLUWdiucu//CHSi6LLxRorEtdJsBI+gXnOkzxJ
 4RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0m9jD03HOJFMY+o2s++JPipekccaeBCx/UPUlryNRc=;
 b=KhnO8l8tZxIlqnusMobMoHwSJTIoQ8BFbh8s4nYIV5IUpShpGjVOq8PT1LAarkSZLE
 ATt4Bep58Dxryu+9y9i4D9yFlTl/Yijzg3X+JD2ThVmkxAx5iwcihgTNMtvMVq0PxLlv
 YbT8A7xKmXI+olWHV5XJVLsiwVBNxBr/nu75sq7mTJagGKhcWyl6FY3CyUMDsVmW/7hh
 5Z35xRm9hfrNCpJIFmVFKTxRKMWULKTvNzkmBL4jHMhlCpvPT7BZ09TJwTXn9xNsg0bv
 DTIjl/VFnOKG0XzwJ7EpqUR43ca7YrkRuNxXJk1fWE4am4XQzZ2mFVfqXpkUTVUDor72
 7LnQ==
X-Gm-Message-State: ANhLgQ3ojVgj6QFBmgWSlTOd7rKgssCZaOjeAHN4R8eIrjoBFsDVhFEr
 /apFVF/cC8I23cSQfEFlh0jQPsZqzOeIOeFHcN577Q==
X-Google-Smtp-Source: ADFU+vtiIpHfJA3OOHh/06Q0zoSn0wNdcP3J4Et3ao4jU8B24GaUVB/AtR3/vVbP1ROnNIDlH4eADnLqLgWx4Ft2/a4=
X-Received: by 2002:a19:488c:: with SMTP id v134mr69386lfa.66.1582816611142;
 Thu, 27 Feb 2020 07:16:51 -0800 (PST)
MIME-Version: 1.0
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAOMZO5BHW7r8aMT_7g91LpGem+WpP+PRKwnsfu9v7yn278pErQ@mail.gmail.com>
 <49a83666-2e08-833e-dc63-0fb820b5c6f3@exertus.fi>
In-Reply-To: <49a83666-2e08-833e-dc63-0fb820b5c6f3@exertus.fi>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Feb 2020 12:16:48 -0300
Message-ID: <CAOMZO5A0wCz6EUB_Qc+oS1UDLrBSLgAKEE0g8SYTDFq8AGLsVw@mail.gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
To: Timo Ketola <Timo.Ketola@exertus.fi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_071653_543558_739EC942 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Timo,

On Thu, Feb 27, 2020 at 10:42 AM Timo Ketola <Timo.Ketola@exertus.fi> wrote:

> That might take considerable effort. Would you think, there should be
> fixes for this? Would it be on recovery side or preventing the issue
> happening in the first place?

It is hard to tell. 4.9.88 is an old version, so better try with mainline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
