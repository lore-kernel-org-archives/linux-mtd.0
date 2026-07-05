Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290AFC43458
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jul 2026 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EJAkOkNSKfGOyZiGPsGTkHKyY2KCPiyhkCQu5t3uWM=; b=0M8yE1xE5tQJLy
	viX8bU3+u9+/TtC55qADoH0jzRtq1r2QZLaVkAMuHKQ67QJ+6NN/YLSyb1Mj5HaiBHGIw8xMDb7e7
	KLb9jwwoMOkr85YrPJZCDnHVsecMkMdK1VjHG7EcNRtOhM/0z8hfKctY+SZ7Ex+5Vn/veW9GUmdNB
	MzB07LreOdPMyx/nOlVSA+E0Hs38BtjxvEBY299vtEuvkpolYU1ayNMBPKDFjPwEMcnSweQe6Gp60
	N5LiP2yyd3nx9J4hWdXzuRnw2abB+F1xV4VvTokuEfvheLi8W7skzj9ilpdWTJi+Rge5PEn2d0Byg
	wBHGv4HahT4ZtOiA+m0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTQJ-00000009hWn-4Bni;
	Sun, 05 Jul 2026 20:26:44 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTQH-00000009hWI-3AcY
	for linux-mtd@lists.infradead.org;
	Sun, 05 Jul 2026 20:26:43 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso1818843a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 05 Jul 2026 13:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783283200; x=1783888000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GsgfJZ0NjzP8ZPKGtPWCLANSMMngsdofAxBSh+8zVRQ=;
        b=q6we0jF/9+rdFGTvPid35bihM2OPTNxPE8DLSaIrUX+y1ooKYhyAOhWWG1YyPc5JX9
         w+Ry91qHns5Uopvm3p66oD2r6qeW9FJhApxfky6e2z8FmMHDrJ+rl2dSPkLoXEFJwBCL
         /PUGKN4R+NXN49J0yfBKJNgY5VNlJzzqtmelpYq6XCuxnvZs0Y5MBpkJWJD2n4VNDeCf
         HkejssUVJFWpQI5Vprwrau0nKFiLvJEDdEAEcOfB5lwlWbIG4OwdKASc3RZ9hofkqWpG
         lG5TpzJS+y7sKeuGDY6oQWWm0Ob97P0pROF+1UQIducxKRdQ+aRH8YujEy6RG0nNBq82
         kp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783283200; x=1783888000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsgfJZ0NjzP8ZPKGtPWCLANSMMngsdofAxBSh+8zVRQ=;
        b=Q1i3Z8dknGkkiTczrDUUHJytBMsYsEu3WddME/FwSEeZ7uboFm8mVIcJ60gqum+COd
         1zyr8+jegijSYaeudn8u3NqUKC7N4loBFlzsDianh2olIPIMX4PS6Tx8a0PZl9dc7zl2
         3TL3aCLb+vljqLdxkxx5XBeXVVBtaRDc0hl/7DVcRWJibm713Iy9Xp+nSQtsiy2NYG1O
         zVkh7LFkU6M2uz4twq6Q+jG4WxbGIKx/E47kOc6iuq0o+tfvPpgmcQjsAXKcenwLMfeF
         1X5vB5mUCvjjrQ/48Uxxm6EGrgjeCB3YtQklCaQB7T2X+jthXPUUSRF6Rv4tICJ62S30
         QcaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+jxdEWO02uSRF1/zKoQkIltGlI3NpuL0ZKiYCQ1zbDVJ5nf/VoPjjrjz4tuGV+nKmn0FSfO33u6A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Iw1wxME6hzXYBDx9ge4z2JDW9eZdu4xiB93oW5G+BC6a0r2L
	2yn22PfElwsV8a2cvuzQ/TCiKqdALQ2wP7LHZnzEXFhG+gyQi7y6pV4q
X-Gm-Gg: AfdE7cnI7FTGe2HafXibmPoNmzvp69dP3/nDNHTtgHlGb4rYI6lCdUg7t26Ozt5CEj4
	hGZd9vb+ZqVBkyBzpbIujIcrtPJSN66PByhnN4P32DI5HUNTLW78Hou2EYWvkQjGHBYMNf76l1E
	nexgP008qtMSa71af5ZQnZuyRZKubsmjZUJxDYQzlYu3KQLtpTdZytsNMnu1YUha1DIFm2XUb7v
	DchWHVRTOr2x43trlRuaEJIjRklFjARad1s7+R/fHxIVJH9tRlgYDeB5fcZvLo3tHiRxgsC7BdN
	zTTJK52aPsS5JDSzq+9/An5P22dWh1dNuliH6kvoOqSY/6Iinkq6AZjL6dk8VQTgs8/rr6qwb6/
	S4SiRNG3j9XBWCmWGaAFtZvFcGSqV5r/8MgVE0UDabcuK7jUD5hqZ2lppDVieMnukjx9nthoP9A
	sCheFmgRYd2a/k2XxPLbK20yCyGSqzFimEDWU2AZQLC/7p1MORU5lLCw==
X-Received: by 2002:a17:90b:1c81:b0:37f:9cdf:f03a with SMTP id 98e67ed59e1d1-3829f4e8836mr6779812a91.29.1783283200446;
        Sun, 05 Jul 2026 13:26:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:480e:1643:32ae:124b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm29592829eec.24.2026.07.05.13.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 13:26:39 -0700 (PDT)
Date: Sun, 5 Jul 2026 13:26:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Adrian McMenamin <adrianmcmenamin@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Florian Fuchs <fuchsfl@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 25/26] Input: maplecontrol - fix style issues
Message-ID: <akq9m7oDV0y_sWzx@google.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
 <20260703-b4-maple-cleanup-v1-25-41e424964da5@gmail.com>
 <CACwZE5RfhwhOoVSPqibM9+XaPJCf-TdnJxi_UT7Dgv71OJPsFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACwZE5RfhwhOoVSPqibM9+XaPJCf-TdnJxi_UT7Dgv71OJPsFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_132641_829176_0F466F22 
X-CRM114-Status: GOOD (  16.13  )
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

On Sun, Jul 05, 2026 at 08:28:39PM +0100, Adrian McMenamin wrote:
> On Sat, 4 Jul 2026 at 06:58, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Fix coding style and formatting issues reported by checkpatch.pl and
> > switch to using BIT(). When reporting D-PAD events avoid conditionals.
> >
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/joystick/maplecontrol.c | 25 ++++++++++++-------------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
> > index 3ef6652d40cb..457a73d91239 100644
> > --- a/drivers/input/joystick/maplecontrol.c
> > +++ b/drivers/input/joystick/maplecontrol.c
> > @@ -35,22 +35,22 @@ static void dc_pad_callback(struct mapleq *mq)
> >         buttons = ~le16_to_cpup((__le16 *)(res + 8));
> >
> >         input_report_abs(dev, ABS_HAT0Y,
> > -               (buttons & 0x0010 ? -1 : 0) + (buttons & 0x0020 ? 1 : 0));
> > +                        !!(buttons & BIT(5)) - !!(buttons & BIT(4)));
> >         input_report_abs(dev, ABS_HAT0X,
> > -               (buttons & 0x0040 ? -1 : 0) + (buttons & 0x0080 ? 1 : 0));
> > +                        !!(buttons & BIT(7)) - !!(buttons & BIT(6)));
> 
> 
> Maybe I have missed something but what is this !! operator?

Double negation to coerce the value to [0, 1] range avoiding
conditional/branching?

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
