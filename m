Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26D9C282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 20:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16B7206ED
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 20:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q59Wv4t9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KMWtE7+Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16B7206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snQgaFMxocyd68mcrpZK7r2M1nIfhxpYasAVo0o3Or8=; b=q59Wv4t9t29VEy
	xak3EPEz1DAeGqjfSKw/c9e+QR5Qi4uLDlRXljGeT4Bfv4CQJnGtDUA+/CqANTgUhT11aXVKZeBeX
	/gRg1LCTcPjezUc7bhdYSwq9dXUba3f5O6yiPK1E1efGMKTcGnowuhq++0Mf0NP+WBvC1pzp8aT9s
	tMu8L58vpPaaWRM5jhMiADm7b6F6JVv/CCCcQwLbtH7u0PUCxcmHS4RRBTs1UFtWCsWH9o4jZFDv+
	fjcovhBTkH02wCK1CxhHydeOnXle0cmlOAOIbxI47903Mbf02IVF/9PNGdELID5WjSOd2X2h8fBAS
	uDYiO7IinbYFAUfuM5nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq13c-0007PT-8f; Fri, 10 Jan 2020 20:39:00 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq13Z-0007OV-Bz
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 20:38:58 +0000
Received: by mail-lj1-x242.google.com with SMTP id j26so3430571ljc.12
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 12:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nwolBsIgDGCVUkuSZAXRmkjdEmEEA4cQUilISYO+J6g=;
 b=KMWtE7+YPwle9SL0j+y71fRurG4RTvYhGihBiblvXCB/Ffgesfl67Jf9uO2iN6Zowv
 V+httb+uJNwFOpVTmASjdnvw4XkNlnc15na/eSuYdTWfmU/csZGjKyNqoozQGm/sOVkq
 DI9KVcBBLukvUyMHO9zoVyU0CY//JZepI+q/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nwolBsIgDGCVUkuSZAXRmkjdEmEEA4cQUilISYO+J6g=;
 b=NpcZQekNhgAfDoGaNbHO983NY0suwFdka2K2Tf1dU9iAmJmRWDz2xlIDWWmhsETo+Q
 jMrstAA7txjYKE4kUvbAaKwsNXIoWQbqxl6kX+osmZa1He2qCFutu/Gmm661R8DGrZsr
 7C6n7bb8bFWW9UjapVwWUFyuf3J8aRqOyXPCMYt0THJP+3dp6RidD9bF3mVXkYv6sMrU
 gxkneeRqGJVAgJTh4JoxYM6vsYb8BKf3s5pPRxnaihFaMH9cou6MklUXLt2Pj+/jvSwv
 +/pmyVFYioPfkkENbzvUORhfw6IrmAEFRdxfY+vOaJmJxgU+DN1NVdEOOWP5tugSUeq4
 rj6w==
X-Gm-Message-State: APjAAAXnrqC76jFKdF5SJcB9mvVmhmi+kDmpOb0fmtoJDZO4Xhy65Bj1
 sAHuRwk2o6ySnvCDM8F8dPV0+VvYlaI=
X-Google-Smtp-Source: APXvYqwcvQDUzB2GM7/yiMjTK96o1XRFVXeKdDJdK6Quf30ciaqijgipvV1v0M0ZZqJvI59M6Jm1dg==
X-Received: by 2002:a2e:9942:: with SMTP id r2mr3796471ljj.182.1578688734985; 
 Fri, 10 Jan 2020 12:38:54 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id n23sm1603109lfa.41.2020.01.10.12.38.53
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 12:38:54 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id h23so3452375ljc.8
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 12:38:53 -0800 (PST)
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr3902573ljh.50.1578688733508; 
 Fri, 10 Jan 2020 12:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20200110154218.0b28309f@xps13>
 <CAHk-=wg=8=nTeOYGoAbJ=VjS47Nh4-_OFK9zKsK3mK4nAi2dNA@mail.gmail.com>
In-Reply-To: <CAHk-=wg=8=nTeOYGoAbJ=VjS47Nh4-_OFK9zKsK3mK4nAi2dNA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jan 2020 12:38:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=whdsFSX0gTOiNkTANONgHHVY+8jUd1DmY2SJpdNOq5xJw@mail.gmail.com>
Message-ID: <CAHk-=whdsFSX0gTOiNkTANONgHHVY+8jUd1DmY2SJpdNOq5xJw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for v5.5-rc6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_123857_431689_9D6BBAFC 
X-CRM114-Status: UNSURE (   8.04  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 12:31 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Konstantin, can you see what's wrong?

It's not just Miquel's. The sound, thermal, and power management fixes
pulls seem to also be lacking pr-tracker-bot responses.

But Jens got one for block - but that went to the block mailing list,
not lkml. So maybe it's specific to lkml itself.

Maybe things are just slow, and I have gotten used to the
almost-instant responses when I do a "git push" to publish my pulls.

               Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
