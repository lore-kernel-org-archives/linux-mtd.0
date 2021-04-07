Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220C4C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 22:12:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8BE6121E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 22:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB8BE6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hiT34ZlFboHZtTgP5nQYM/SRqPCRLWBwQ87FUwl8uhs=; b=ZvMy1ZN9yJV2S1fgNUW65Lx5w
	OwKwnoWlgf5QDKQtvP3uuzqCMOTRg8b8UcZPC/+9EaHueOIBmfeg040MhM2oUNSrKknl37FWK0nkx
	72kgUuglsAMGXLqqEfJYyPmc0LBDMnxTFLmPYETSNrfpjGI+gGkcO1mCgkvV2K/cAC2QeJQsMbmUh
	xQBbBvMNaoD53ImLhD502NthYUsM/JmuMk9D1u8OTzTKkBlcNDMTjolyHPqBDIubzsD2ovAY3n+UD
	RlN1ninzicwpqsFELX8TwMCv+T+yMBsdZ1tD5JEy85ZZkNKhm5Ibjp16RDe5ER1CfVIguQDao09nH
	mFOAk5djg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUGOe-0069YE-1y; Wed, 07 Apr 2021 22:11:36 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUGOZ-0069Xp-QN
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 22:11:33 +0000
Received: by mail-qt1-x82b.google.com with SMTP id f12so10417963qtf.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Apr 2021 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=amAuSjaH75GbFNszV8kNPKmiZ9+ARLzooMkxZXBGL4c=;
 b=Q8bUVhUxi4if9bKkZaClN0vDG8Zqwvx/YTkTZjDFMQGm+J80O+6zT5JzPrwgh13HwR
 sZvKNz1EIgUUVwwBu74zih3eU37J3Y2BpKH++a/1JufPT3FDw2k0pL/VfkATVkQfwKwu
 +szXKkmHxDY+HSA063eeY3uJeTc6AwgBI85CH0BK9WAJMNVmujmEBJPNyZGlCBtgu9Gk
 aICCgKb8a7sKH7V6bnIJnVdNQps/CNVOz6UZVcFiSpluTrRUJ2Pp9BFEuAHHDIxGWzsY
 pMMlKT4K2Fcg4l1iGQpPuvBYtPOKQMLJLXwKECylxNTHuhw/SyAF4oaW3iZJNBP7qUa3
 X4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amAuSjaH75GbFNszV8kNPKmiZ9+ARLzooMkxZXBGL4c=;
 b=uMcqL3iuz21J8N0ps+7lpEMZJPspXrMiYC3oK7B5ImK0+lVLS6TO5bVQ4qXlO7YBHJ
 04BYHPjZI72iczKOJQkxPMKdvKax4HtHfRbmSyvO1AWVl3pnV5Sdgyn11U8zm6K0WllG
 LdgHIj+uoG8NxX49CYJ5r3mLLCgqeVKlifLemXTnQNGX4gR9NiZGMTLxUbaJfqdxNVgJ
 0jcwz1yOS0MaffVnYWXqxdw07Dk/n4xGjhVHELL+OQPhjtbhuaW0uySXN5i8fDr5aYyg
 hm7YgQE1aCXIKG6vKxePqhSNpufRJPdtU/pU7FBIYD/TlfpXpo935A54tlQEQJ2rhBsN
 NGBg==
X-Gm-Message-State: AOAM533HLbo5nLtLUSJSYav4iy64tdxAEBAnCNbMsFn8qT/gGT4mQQMX
 1ueDRU2YLjZbjxEgMjmscR0+qrpCGyPsS+Wng9I=
X-Google-Smtp-Source: ABdhPJy9uzxI0rQ+Z4C4+JpW5tL/YK+9PabpkQyOtmeoKQV8IH3MlM7Azd/8wZxPx9/B6fqdWSebJuvstroAIDQCBdg=
X-Received: by 2002:ac8:6d2b:: with SMTP id r11mr4635895qtu.245.1617833490836; 
 Wed, 07 Apr 2021 15:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210331062723.2090-1-wangfangpeng1@huawei.com>
In-Reply-To: <20210331062723.2090-1-wangfangpeng1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 8 Apr 2021 00:11:19 +0200
Message-ID: <CAFLxGvwer-w7ngekB_4rtBLWrr0KrwqLjavJd3ZTR8Xh5f_Y3A@mail.gmail.com>
Subject: Re: [PATCH] ubifs: fix read fail but return ok
To: wangfangpeng <wangfangpeng1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, 
 Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-mtd@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, Xiaoming Ni <nixiaoming@huawei.com>, 
 zengweilin@huawei.com, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_231132_002426_FEB7F747 
X-CRM114-Status: UNSURE (   9.18  )
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

On Wed, Mar 31, 2021 at 8:29 AM wangfangpeng <wangfangpeng1@huawei.com> wrote:
> do_readpage() may return err, but ubifs_readpage() always return ok.
> The vfs will ignore the err happen in ubifs.

Are you sure about that?
In case of an error UBIFS sets the error flag of the page and does not
mark it as uptodate,
so vfs will emit -EIO. At least this is the theory. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
