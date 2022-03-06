Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBFCC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Mar 2022 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4hjTMSEyaPgqZ0WGU0PBGpSbai5BW7EHnYcRZNVLJY=; b=y+UWHwHdXRQeKF
	fnM7B4btZoGmUWaOG5IjnB6/3LLnOhctF25buV3xZw18Ic2ewwcJ33h4O7+qlO3WUyhL12iVSSvA0
	MqI+J3dx9LbM6VzJMG3NOrGgEFssEomyJiy/s/ARdAYSybkmRTKvGE39qVl9G+msbthvZfnnO00Z7
	GQlFe7YIRjFaggiEKk76RgaOeup/wClrBhF9P0NWjRhxegFVnmWZEFKPEfPKjLXUhBYAJhYXF+RM8
	nKOIhwxcHBlsR3PN7xiMChy+1azblW4Ryj3Mx5KePcwjZj8EfxFNFcdK1yl7iMklOMQAFM0vhQkRH
	kZu3vhiXLEQJOJLZQZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQxB7-00FHE1-Us; Sun, 06 Mar 2022 20:08:30 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQxB5-00FHDZ-1o
 for linux-mtd@lists.infradead.org; Sun, 06 Mar 2022 20:08:28 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b11so22925420lfb.12
 for <linux-mtd@lists.infradead.org>; Sun, 06 Mar 2022 12:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AIpfskYDgcFODfiuHy5xsQZFuiq8ouv2UTmXjx3iVTQ=;
 b=IZUn9UPSuFjmh/kMEpILS4YBGvZgmc4IZsdhTS547kJGgafsBn5bdbMRhm/hrQcK8b
 sER+YpjVbkFNFkGvqxYnq0/pLCcWENbAgitSz9D7qDy3nlhORnSZMnUa8qQlfUpvTQOP
 2uTf16Egx4bYob+VrMdJjShbE7Jc3pkEN99y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AIpfskYDgcFODfiuHy5xsQZFuiq8ouv2UTmXjx3iVTQ=;
 b=JqJVN0SgvXQ7m1Vma4slN000o1qrdeFwyKJ0YVPn2Mk/zOd/SdAMWft9gkAyvmM+Od
 2/1df8ly2FQHi/yFRyMw7NbX3VFYGLl/UAPGhtXov7V9HX7lmOZlLqjet9wom3i1huNE
 m2LLr1WBY+sPB7h8kTOc8myZZ8ibR5eYh3WT7jM55FWxhZBzF7Cv9cL/j+sNWHhqX+I/
 39Vfrf6FgZrPqv3zCuZMOeYuL4rooix6buo58YpzjBwAbVpVCrciXlL9dry5J3T7zG7Q
 DatQf7PvtAY1ZrU1jM1aSjIk853oVD8wvT0x1mC2tlBi7dtOkQ3+CVvHnt7PJUVphMvY
 pDQA==
X-Gm-Message-State: AOAM532i46WuFhQT5fdmQWXunXnQXWhFm1yq/yCtKFuojLr+7cccrNWf
 4jr5Oy6WI5SqrfhRfPSHXtJfYZhLt8uHG/DRmd4=
X-Google-Smtp-Source: ABdhPJx20JIYInv3NBOcDaDgP2PNLvldDPlZ7G+TdTXD4SEsHogbHgsSKZZZ1AgZgLc0hbDZBId9/w==
X-Received: by 2002:a05:6512:66:b0:443:7db5:e776 with SMTP id
 i6-20020a056512006600b004437db5e776mr5801764lfo.8.1646597302653; 
 Sun, 06 Mar 2022 12:08:22 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 u25-20020a2e2e19000000b00247d9c0626fsm1278102lju.55.2022.03.06.12.08.21
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 12:08:21 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 3so4314372lfr.7
 for <linux-mtd@lists.infradead.org>; Sun, 06 Mar 2022 12:08:21 -0800 (PST)
X-Received: by 2002:a19:e048:0:b0:448:2caa:7ed2 with SMTP id
 g8-20020a19e048000000b004482caa7ed2mr2578038lfj.449.1646597300996; Sun, 06
 Mar 2022 12:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20220218153617.016a905a@xps13>
In-Reply-To: <20220218153617.016a905a@xps13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Mar 2022 12:08:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjweAonv54h4rxFPVReKS5qZkVCGfB80GUDPNKbo-uEqQ@mail.gmail.com>
Message-ID: <CAHk-=wjweAonv54h4rxFPVReKS5qZkVCGfB80GUDPNKbo-uEqQ@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for v5.17-rc5
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, 
 Pratyush Yadav <p.yadav@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_120827_123312_58C0F7E0 
X-CRM114-Status: UNSURE (   7.80  )
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

I'm about to release rc7, and I still don't have the build fix for MTD
that has been pending in the mtd tree since Feb 19.

I'm talking about commit 7cf1de957a98 ("mtd: rawnand: omap2: Actually
prevent invalid configuration and build error"). The lack of which
still causes build errors on at least sparc64, and has since rc4.

This is getting quite frustrating. These are basic errors that fail
some very basic issues, have fixes, and the fixes for some
inexplicable reason aren't actually propagated up.

Why?

                Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
