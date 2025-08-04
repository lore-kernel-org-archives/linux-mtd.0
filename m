Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108B6C87FCB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyS4xVzb2cCTDBuAMrZHmJgDdk1gRprR6CPXj036Gi8=; b=la/kGF3KnNBL9t
	LIpsV2t303Bps/SZMoq9ZosEMAbFVSnGakGIRae7mw4SN5j6tx/qZVRbUtepYdBq6QChN8zaI6Xl/
	EuJIZfZeSEGufU4VWWIQwbyhcohz8NZ0V3//f8N0eFp6S29FWs645CRDmtxxL/mTrhZ31O7WLyUaJ
	Ei86s/Z09fgG2tB8EimLnt9VZwT+JIuKxOsnvKcygKgCaRQB3CFrri8VOPrD4Zb/qndOXOne222ir
	HXlUMnrUICg9Napl8KnMLSNlSOHtFS1fp5Sg/UcGcDNEW6WIY+J/ACdv8yN1KUIKPjqIxNvl4jZq7
	e+QLsa0nx+C6zYKfecCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixcG-0000000AwT4-21m3;
	Mon, 04 Aug 2025 16:00:48 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixVH-0000000AtHl-2biY
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 15:53:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6155e75a9acso6560372a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754322814; x=1754927614; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=53ZxmaIyOyXo50yeIoixLxXlGHgmuo1HB/v9/NJo6qU=;
        b=d2bQ3/RpAgKVUYSnVIYnTL5+qhVQnLAc6wsoCmlo5Owyy3SW+1gzbpccmk9T0bCGRw
         aU53260FgUh+CNjodXUyq8u/0Zmu5M8R3pXO6648cOsgM34XEGk87oLP7vnA2gjWUE+E
         v0aBwW3izKgnz60n9E4utKhWa0J1rAmzsO7Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322814; x=1754927614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53ZxmaIyOyXo50yeIoixLxXlGHgmuo1HB/v9/NJo6qU=;
        b=JChxEyUit+drRqZikdEkBRXDCpsg4vpgqO6oy6XQ86XwgxuD1SsJCp5XhcGvXBYvAG
         j0pp1V05e3PrPyq937+D55IqpgmZFB6PytXLPYiF6uUaOroD7eoppEpFZZwneh0+1oM8
         R6gCJ93eEPWpJ0pwZAzAgTKmhAnjNsM9BIP2h6o8UYPvuDieKUpoLnHlzv8sDPZUPEv8
         TZon+qekeIEGUrfwiEyACwmmlEe3m5xfNxioJp2dvObn/jdCjg0SdDLM84oX0+7QfPg0
         JwZkMRGL0tB/kN7v1ukJyCW/+20df0ZTzCUuZ1ehUX0uaiy81Aw9mYcbDB6dYU5gwTtg
         9nhg==
X-Forwarded-Encrypted: i=1; AJvYcCWR0oEfEnuwZhVc01EMSejRaOjj2YqHdDAli3Si/5RYIWKO0hyFvP5GyJ0vSI+idauWXPqgqe3YEBA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqgFDsqH1Xoq2tVlPOkC6iT83QMXdvNpcJZzj3/1RIOyRf5oKk
	Y0FFshfyL9j6oHGrtYtoT4ZfHOqiR/3K/XGeDxbGcqPsOSh4fKZ0lkbETQif3k1GGxO0evwhFKc
	aGk+kS+Y=
X-Gm-Gg: ASbGncsEWe5fUJnc6UmOcIVVUqD5kRnamLY6mFDWVIJuU+Zh5GO7jZAaOrA7kNZKDTo
	IrbNP+yhmm2y8hDMnSdT1VJlttZi9gGCjbhsgmKHu0QWGJ8JFOL8CVl/uEFQRbXkqlVkHjxSo2Q
	jPbFq6P23nUeD9cESch3BXM0AAiOkZM6qktynXK22TU9zpI/CYQ4aBCB71DvKby9c8AKI4IgLgg
	hv9El8Xs4tCX8GphJC/CmX/SYVp31TSeI7fl6B0eTRLYUcLmHEBvchefehiUORfuASsZKY8BM6D
	lbONlrpS4S8Gjv46gK/WhUGKFgzLbZkFzlj1hQEHREuk40JNf3T5fD0JLfsWeNqvhxzFj2X+8bB
	MF2TB9QCzOLQXvwqzne0HxkTwmvfyTqFzhSqE3yBsvGLglkocwszoV+wjNM+cNYglZDQT0cj1
X-Google-Smtp-Source: AGHT+IE34yfwGZBQYx2hTO2+frz43yGHZqLvR1/olofWgi00TZ0f+78JZSC7naQaxnyiV1742AZK8Q==
X-Received: by 2002:a17:907:7f16:b0:af8:501b:a412 with SMTP id a640c23a62f3a-af940078c9emr1038652166b.26.1754322813759;
        Mon, 04 Aug 2025 08:53:33 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a243644sm758114066b.139.2025.08.04.08.53.32
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 08:53:32 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso6304772a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 08:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIlzT7a9EJcc0SpkrIVUZ8ffIV/lwoxulpH+rlAXE2VAgBeEbk4BdNrnYJqaO0f2zkQ5yh7xbdR8I=@lists.infradead.org
X-Received: by 2002:a05:6402:274e:b0:615:6482:7498 with SMTP id
 4fb4d7f45d1cf-615e7172cebmr8766719a12.31.1754322812282; Mon, 04 Aug 2025
 08:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <87o6t08fen.fsf@bootlin.com> <mafs0v7n7cd5a.fsf@kernel.org>
 <87cy9f5bmj.fsf@bootlin.com> <mafs0qzxrcfq2.fsf@kernel.org>
In-Reply-To: <mafs0qzxrcfq2.fsf@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 4 Aug 2025 08:53:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjxPV1NGZokCyg2su=y1nmJFXTb4asrosw_W+yyqNaq_w@mail.gmail.com>
X-Gm-Features: Ac12FXzS4xGr1jRo2orlbn_KfzsiIRPA8hfgC33-QZ1fzST8g7Pk0sY_hR10m4A
Message-ID: <CAHk-=wjxPV1NGZokCyg2su=y1nmJFXTb4asrosw_W+yyqNaq_w@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for 6.17
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085336_017559_11A0026A 
X-CRM114-Status: GOOD (  24.03  )
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

On Mon, 4 Aug 2025 at 07:40, Pratyush Yadav <pratyush@kernel.org> wrote:
>
> >
> > I'm fine either ways, but I assumed until now that the preferred form
> > was plain text descriptions.
>
> Okay, fair enough. I can do plain text next time around.

I'm actually fine either way - what I care about is that it's a
human-readable explanation of what is going on, and what I get when I
pull.

It should also strive to not only be relevant to me when I pull, but
also hopefully be relevant to others if they end up having to look at
the resulting merge - perhaps due to bugs that got introduced.

So in a perfect world, think about how to explain to me what I'm
getting in the pull, but also explaining to somebody who is in the
middle of a bisect, and notices that the problem they are trying to
figure out was introduced by merging that tree/

Or maybe the bisect is down to two or three merges, and the person
bisecting - who does *NOT* necessarily know anything about those
subsystems - is trying to judge what is the most likely culprit to
speed up bisection. A good merge message - from the pull request -
gives outsiders a feel for what hs going on and whether that merge is
likely to be relevant to them.

(And yes, I often find myself to be that person: I bisect some issue
pretty much every single merge window, and while I usually have a good
idea of what is going on, and just trust "git bisect" to do the right
thing, I *do* end up looking back at merges to see where I am in the
bisection process)

It can be bullet points when that makes sense, or it can be more of a
plain text explanation of the background to a change.

What I don't want is some cryptic "this is just the shortlog". I can
see that in git. The difference between a shortlog and a commit
message is that the commit message should *explain* what is going on.

Sometimes the two can be the same. Sometimes things are just so
obvious that they don't need further explanation than a one-liner. If
a commit fixes a NULL pointer dereference due to a missing check, it's
not like you need to say more than that.

Also note that sometimes the explanation can be *shorter* than the
shortlog. If there are a hundred small independent details that got
fixed, listing them one by one doesn't make it human-readable.

So being human-readable can mean expanding on *why* something
happened. But it can also be about giving a top-level view of lots of
individually irrelevant details.

             Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
