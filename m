Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F28C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 07:30:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F57D61261
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 07:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F57D61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOz0I0qFspjLtEHCIs0M6eVk4papzJi5AXE6EPFLD3k=; b=y/MCuaeeJpGHCr
	DGA+1VAR4+IWxiSGTKft8AoD1JBET7f5vGDKBAzMOf/niXDhm4QLni+tO+8ljtSmz4PeQAu45QYUG
	P0kBMoazNDX17gmjxclW/hHbwfopqOVqTdIOOgw6e75UF4n96rNBiyRpqVBtfFWs5te8Wc/EXIlZc
	3pOxswPv5wfL2ZTXq4kbudGqHOtGFzIcK+NS2yYX0gERzEx5pDBO4RZ9VeooEx69VuAJCTTZBxezL
	mi2NqbEIUIvdy9GHsBpz5zv+/yMQavCXvXaXCtoYstV8p0azM12AP8oRXmP9qGBZ3S5a8APoG6XLu
	ze8BA/rUurrdhXJ0aGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqVd-00DCDb-Sy; Thu, 30 Sep 2021 07:29:37 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqVa-00DCCn-ET
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 07:29:35 +0000
Received: by mail-qt1-x82e.google.com with SMTP id a13so4809989qtw.10
 for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2021 00:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RCqB9AewLTCiMfliIBXKqff9UTBJYCe/GxavdVysZ04=;
 b=ZfvyV6s77FJ2+ZMcERyrG1Byw9yTwt80spm+H6NnS5FO2MBxJW0VOgr3JutXzOfEa5
 b3ns0zKmlvEmoJTm9Bp63Nxds3mnGPwIjXuiH8vwwh2K6cOkf22t3cjry0fH/uHjhhyy
 bj1nVjX45F9jpU1QTdb38LcEpfNzpKqzzfMZUrtM832p4d9ZqXqCqOECSPISpygFkd8g
 pdObC7sgxrqM8KNhRI5dDVe1QPrad8bUX8A4pv9SMWU+jxVvwTCwGHLT2cf/iPiYfP3z
 b4qY9CADptLDklpFi/13l1YMrbavzjCrKAohG5hiGe+KQCUF9kQUmDXdXzXcQgiT1q7o
 Au2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RCqB9AewLTCiMfliIBXKqff9UTBJYCe/GxavdVysZ04=;
 b=scX/GrDxCiszS/AR0uJTy7vU0lv5eT9vVVqXZBnYNY4S62wLaB7cXMBDm1HfNyFCom
 n4zzjmhfEWQjNxlp4opHNMT+xYSiewILbrNPAJppCzK3+Am6Q+iBvP6S6GoqIG8aHiwN
 L/YO2myFd/VIBL0Y7fk1vN+Xjm+tc7h40qOgObViqApoV7Jpt222XGSKZkX010oSkQxt
 eOsfuKDmtHtW+Ez0ZQn95Nc5X7dewZt9EVg/B/LBd2d4Z+uHB3lxuzVJfKT1X21DVU1i
 vzbN1JU+6o/FpjoLvVzcplFUOUJnndBb1mvpmcSIdE1kdVIs5uLKexNHwSEIzg4KCg8g
 Kc8w==
X-Gm-Message-State: AOAM532Isi02Qaui90chnEjMoZ36Wn8DwGoDNZSjQ9Z/V3+CLZpcz3Ae
 nB+5oU3daU4m5zI63ORJv6qSspW8ZtXPHpcVdjo=
X-Google-Smtp-Source: ABdhPJwt9ReGeezlU5YynDY+p9nCzcY9o00eK3YlLoX8fzJQOBCCPVCaJMIh3XwRPuRYarGv7jYE8Ee0jqsIfXKdMNA=
X-Received: by 2002:a05:622a:1712:: with SMTP id
 h18mr4725113qtk.389.1632986972577; 
 Thu, 30 Sep 2021 00:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <YPkj9NUxNLGG5tjL@emlix.com>
 <2125418384.6749.1626942814175.JavaMail.zimbra@nod.at>
 <3b009a01-1f13-e029-0341-9728d4dc16ea@emlix.com>
 <CAFLxGvwPCvtVKf9zCcU5DaTah3jeuiCX7-S-CPNkK0Zdd92nXQ@mail.gmail.com>
 <4178a54d-3574-1650-6fa6-55cf2981a46c@emlix.com>
In-Reply-To: <4178a54d-3574-1650-6fa6-55cf2981a46c@emlix.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 30 Sep 2021 09:29:21 +0200
Message-ID: <CAFLxGvyh99cEbxVvH0RwSWZ9o-V1K8s-UgfxOTyNiX=JkNOiMA@mail.gmail.com>
Subject: Re: ubifs: corrupted dirent (ENOENT), problably related to O_TMPFILE
 and linkat
To: Sebastian Gross <sebastian.gross@emlix.com>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 chengzhihao1 <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_002934_529644_562043C6 
X-CRM114-Status: GOOD (  16.35  )
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

Sebastian,

On Thu, Aug 12, 2021 at 2:01 PM Sebastian Gross
<sebastian.gross@emlix.com> wrote:
> > If you enable /sys/kernel/debug/ubifs/chk_fs, it will do a full scan
> > upon mount time.
>  > This can detect such problems. But not fix them.
>
> Much appreciated, thanks. This did in fact discover the missing inode though the dirent was there (ls did work, ls -l not).
>
> (On a related note the local ubifs_debug_info has also an entry for chk_fs but it will never be used :\)
>
>
> With the method above I was able to "poor-man's" bisect the minor kernel versions.
>
> The replay was fixed in v5.3. From there I bisected down to ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e.
> This one might be a candidate to integrate into the LTS branches.

Ohh. Right. In the past I assumed that a Fixes-Tag qualifies a patch
for stable trees, which did not work
always. :-(

> For 4.19.202 I had to pull in 988bec41318f3fa897e2f8af271bd456936d6caf also.

Be careful. This commit caused other problems that needed fixes. See
"Fixes:" tags.
I'm looking right now into rewriting ee1438 for 4.19.x such that it
can work without 988bec.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
