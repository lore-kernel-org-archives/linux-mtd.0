Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE34C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 08:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AFDA24655
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 08:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XkKdfDzT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfezVDVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AFDA24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K4YpIHKh+3LI0MXbnYyVOYi1iVmToUbsk0kbB0DkjZM=; b=XkKdfDzT2+PPsKLNPehLqgtxZ
	WFBXR2thQA9zk5uGKKE2ExLHYzbPxxGmCSWH4mLF+QY3RsLuMiyEYa3/LzxGbFMdAr/oHhC0PBXzi
	WONFqr2pbFQMMjnPr8JhaiUXPXHMw8P9s8BhY5MCbak36bInJQZQCROtksqybKVnNij2ZQbjDM9SU
	FuetmsaLco6SXj1QGF1qjErREjtgu8mdLdRWO8UZs13GcUkPMEF8sL1nk1v5hMek6k1vXs4vpR9je
	yyJYq46rjxduKOHVxth8SMqLOW0rkX+M93WLic0I3uZTC7fvi1q587/7OWPRfzDiule+FSmeDmBA4
	ucS0eOTXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewa5-0001wu-Sr; Tue, 17 Nov 2020 08:43:17 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewa3-0001wE-CL
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 08:43:16 +0000
Received: by mail-qt1-x844.google.com with SMTP id g17so15080928qts.5
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vhcWJPRmwnyAktqJFg6VjCws4F5oNwFTI81s3btZ1OM=;
 b=DfezVDVfhb84xp/Km9GkegWy54khhoc9y0IusLI+wzxmpnqmxAzHU218ZXgkLkMIz5
 BsnRERpjSRFKAy+AtZdnde2f52C6HpAj2+ukXwAgDqLY+8OmX3pXpJboUKYiyzz5o5vs
 jPCkPbfIjqdT2oXOMJ5QPhD+y9pgSOBE5ELSP46UmNlKFNlxNKW1PAtqHjRmPpjb1pwJ
 d3e3y6QvymzJeMzAkN7xVEJhmxRRpHf8kCM9y4U370w3UR3BwRc4ObKe+LwaO02mTSPf
 2Op/zrs0dRmJPI3P6fozyP9tK4UR+AQujuwHiP5XvCA7Yc/MR6AQwJrmmSccG3wcvcun
 rH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vhcWJPRmwnyAktqJFg6VjCws4F5oNwFTI81s3btZ1OM=;
 b=jHM8xq1t4Ccjl/X9lH+cuVQCJTO19lwlr49ZWm9UpBcxMLkG+W8hZaC7rOLOyYvCRz
 QFj+nJ+eYIhDvjTVF0qgJZYzTFotfIPCpYIcvG2W7PjiOi3Acsac1wIilmG56KYxxYbT
 0+6Tgt9S9qb7DrwVuxcG/f9XGbPa4c6ZQztW2GY5d2asbnpZ5qSYRf9NfRWvNTJl5zJK
 ugI4KUNcPRucqdAiSxrcxqRKzwwoLMpCtNA1cRtKYeI/y0ux/G4uYxIMu/9n6zJ8jwLl
 O7/DEUgrO5fwnyTpy+86ga6FUHiO78+S0HgBSTtV1Cc6OQ9GxN7EJHMdLLachQpszsYz
 K50g==
X-Gm-Message-State: AOAM532IZen9wEvQOK39KjCDrw7c/2NVPdemw9p6CrmGbalNg8HufW/D
 +LHGBNWeF9j2t/niv8wmwsq20B8bY5K+E0jLRyw=
X-Google-Smtp-Source: ABdhPJw21O9B1kvB74uYZQfaYMrQy566SAPOOyjE9UAiA9CMYhny4t8wfaCwDgDaCWhs4tg9Rv1oPIJc77zehB643vU=
X-Received: by 2002:aed:2843:: with SMTP id r61mr18312246qtd.166.1605602592483; 
 Tue, 17 Nov 2020 00:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20201116210530.26230-1-richard@nod.at>
 <bfea268f-b5c2-5467-7b17-5eef7b0269ce@huawei.com>
In-Reply-To: <bfea268f-b5c2-5467-7b17-5eef7b0269ce@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 17 Nov 2020 09:43:01 +0100
Message-ID: <CAFLxGvy4_H0rn085j9=o2kW2X0rHcRJVMSAbp8OyYVVFhTcXpg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: wbuf: Don't leak kernel memory to flash
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_034315_467983_E614035D 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 2:28 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

Thanks for reviewing, highly appreciated!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
