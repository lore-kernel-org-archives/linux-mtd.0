Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ACAC352A4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 23:11:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93DF020733
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 23:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="klX47clh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="esB/56n6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93DF020733
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IepwW9b87EUzjFj/HKmPqr0+XxaO/cyhlrrM+GHR1oY=; b=klX47clh6a/TYR
	S7bewFraAPc9stbQ0o9ixRZTdL6PfJFR+XN5hP+ic2XWPJYKunqdgHwelDXwRvZnIzfV/80glEgRk
	tqjmJyW8hXYxzfUUE9U73n0CdfsjkLr4ZaBHu0H6yc0/YsGHqhxdk9alqq4+ITdyZItlkVJW6NSvW
	R66fIr+yUC60qXs673sIb2w43s18waVvZZfHP7fpVX3qDj2zxFPCv7AraaWlVNwvWrAuaBLcfy4D2
	yzB6b5ssOJDWe+vx4frs3qZElhVdcafELv8R1LNMa92Q/5f2Q/xLjOTQ3nhxzhnm6BbAjXVOPowWp
	YepA9AbTP3yCIkgcYq4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1IDH-0004vf-RZ; Mon, 10 Feb 2020 23:11:35 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1IDD-0004uH-Dv
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 23:11:32 +0000
Received: by mail-lf1-x142.google.com with SMTP id v201so5547393lfa.11
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2020 15:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHnULLRvzcnTmrApgk0J6kXZO0qLfuB4AVQHnM4cmAE=;
 b=esB/56n6Q/Msdc20g+jexMovttxt6hCUBxvlvmdqGEumLlcmF5aj3v38oGR21nFNxo
 cOk4ekYVR6FdU2NjqUfNrI3LKVvMII6sqM7sSRTkqviALl/XYnv7z0n+5b5yYI3Lni/Z
 pHlhrG3K7Bp+8RWOpjWHLKMsY1f7PTIEy4J/RPb301AvTHMZeUbf9QaVy+/1sChmohPn
 5sq+e6/X6b3sYiGh+ziR8racoEm4OmMe/es+FRFQCba4zTFopBh8xK7owBMwffjbGKty
 kt8xNXlsArGuuruRAvzftXBAFrERmdhUUoEdMwiUrXKqtFq9YOe+1lKW7UiPQs4r9v/n
 YlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHnULLRvzcnTmrApgk0J6kXZO0qLfuB4AVQHnM4cmAE=;
 b=q4siD3z+HNTTGqyly89gMDcH0IEIYRk1j0d35aUsK6OVwslF1Fu4UJHYiaTn5R5228
 KWlbLo2fFoQ0yawiIBejs+bbLlZveetpnSHHRBUxqqrWsq9Op/XU26g+zEJzd5ZXZbRg
 kM1zMLmUbjTjUCLP8MBkPwY9cfVZ3ToxMPoaL0sGGG6QqO3SjOBqjOMAdwe6mhqrxtTe
 1AM9Nhk/kimWRALiUIToN5yHEHCJGtmMPHwKACG/agZLRqpRoABLMev5xScLrDepNvb+
 1I+OcBYZVDeVa/wGu0Pa7+ZosMgMzoZdhtR17j3uVJ4CdzKfoOOVJC7B7v0s+LVrS63h
 HmZQ==
X-Gm-Message-State: APjAAAXB2frQD+gNwvs3Zz2B0YBrXbkTvl3xEY4Y0jPKQ8eDVNTkVeKT
 SZwE4ZMpwNAfKiFzWnIMZm3Tl2JxIbTMQJHvV8wcbA==
X-Google-Smtp-Source: APXvYqxiERXVniVJSVLKbVx/xqUKUzq4lPf5gqhBdctRYV5+IUwsgO7mOTwXnfu4yRdcGlrvRlDwJrZV+Drqhe6D0W8=
X-Received: by 2002:a05:6512:2035:: with SMTP id
 s21mr1781905lfs.99.1581376284825; 
 Mon, 10 Feb 2020 15:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
In-Reply-To: <20200208021216.GE23230@ZenIV.linux.org.uk>
From: Daniel Rosenberg <drosen@google.com>
Date: Mon, 10 Feb 2020 15:11:13 -0800
Message-ID: <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] fs: Add standard casefolding support
To: Al Viro <viro@zeniv.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_151131_471434_88C85A96 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
>
>
> Again, is that safe in case when the contents of the string str points to
> keeps changing under you?

I'm not sure what you mean. I thought it was safe to use the str and
len passed into d_compare. Even if it gets changed under RCU
conditions I thought there was some code to ensure that the name/len
pair passed in is consistent, and any other inconsistencies would get
caught by d_seq later. Are there unsafe code paths that can follow?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
