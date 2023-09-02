Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C613C71153
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Sep 2023 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJ4PSVhPykBs+9f57Zpn7Q7+X03lsMlDVtYQprb8HwI=; b=ws15HG5/nQM/yh
	fX6Y9DFU89TvYMb2MKKULoR4ogk4brTthRX2RWTHUHLvfE0q4ToNCJsiIIlQh7FWhifC0X1pUI5Pc
	AUwq+CgnQLLwDW+9o9CTJU2MHWqfBzPDSSqFwZpc/7jKb3LxadlhYC2YR/6iJeghx3FEN18WiZfPh
	MX1UBBlUWrxBD6vxMMeX9C8QwSrUswJOj4cqsEVhn2OxvdXcNwCVXNfX1on6d+o+Ne4N6hp1Px8a1
	sjNteLymgr1FluRoADh9rgKw6Zll2TaoU5aW1+Mq4HDcIz0h0R9y26rZDLGelKPTQ+5ZEmT7dujrj
	lyZXoedDjeKLiTol52tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcVr3-001hjO-2v;
	Sat, 02 Sep 2023 19:00:21 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcVr0-001hiG-3C
	for linux-mtd@lists.infradead.org;
	Sat, 02 Sep 2023 19:00:20 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so2235886a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 02 Sep 2023 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693681214; x=1694286014; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJG2v/tBrKXJAeh8f1wAGpImo/b6UiTOWlNfcbJr5Tk=;
        b=Lbqk0gDveKeOK02YqMcpL3cf0JyikcKgt320GeRznYHAUhtJLhNUzK6EHH39fVQAse
         9VfXnBnquxZKhessPubaq0vaaJho3kjCg6YH5Zt8DoIldnlDSRAnUl8k73yV7xizOowA
         6v73bDrz5wZs6qPmNxZ1WR984hOIp7Spj1oDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693681214; x=1694286014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJG2v/tBrKXJAeh8f1wAGpImo/b6UiTOWlNfcbJr5Tk=;
        b=XI+oi7vcPUV9Re2/r8LpEqtQ0WDC3pKvyHXmbDaGyyOwamea6Ca0quL0e/do8Vo1Y6
         MhF1Fp7XMFd9vvr6HKox+9OMrzpUodZhbAr5zrt5xYADNA1v5zrxO3ILZTokszLOjy5w
         4FDtnj7ZN2KNmPCNCQCCQJ7jt8c5DfUEikgYP/Za/4/++tJpnRdlCwZxFsrarZglGSru
         mBU6hpbwpVQNMsJb0qoXWBdrAW9Urr4lYCZm8h6X+ZjNTsA4dzazye4+Jc2sdsk2Jk2Y
         0wJ/sMf9k7uKNI0/AmiwDYOnbsSlpSqyOURkz1QNobmCchxzIBzW+n8P7i+RtTs/S87R
         pxSA==
X-Gm-Message-State: AOJu0YwdCBe0W4anrvbBPRlZ/HhPFD5HnzyUk8oZFlrksgIII5jd1Twm
	aQDCZfT/Z48zZHTxSvqVlFae4SihpPgJApbvTLtIK3Vu
X-Google-Smtp-Source: AGHT+IGUyrFU1Ot48VmXU/MIuGJrkRmYnwvM8t19ovltJiiitAyrlCxL/5IpwOrdOK3GwHlgWZVPkg==
X-Received: by 2002:a17:907:1c86:b0:9a5:b2d8:e925 with SMTP id nb6-20020a1709071c8600b009a5b2d8e925mr10765476ejc.33.1693681213718;
        Sat, 02 Sep 2023 12:00:13 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id n18-20020a170906119200b009a219ecbaf1sm3717040eja.85.2023.09.02.12.00.12
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 12:00:13 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4c0so343071a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 02 Sep 2023 12:00:12 -0700 (PDT)
X-Received: by 2002:a05:6402:34d0:b0:51d:b184:efd with SMTP id
 w16-20020a05640234d000b0051db1840efdmr10020929edc.20.1693681212581; Sat, 02
 Sep 2023 12:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230901184136.73b2833e@xps-13>
In-Reply-To: <20230901184136.73b2833e@xps-13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 2 Sep 2023 11:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgUntc0u-6WQ9U3OmNHTqB=cZQoWcTOXaipB+gixV5NPA@mail.gmail.com>
Message-ID: <CAHk-=wgUntc0u-6WQ9U3OmNHTqB=cZQoWcTOXaipB+gixV5NPA@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for v6.6-rc1
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_120019_040780_DD340E7D 
X-CRM114-Status: GOOD (  19.43  )
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

On Fri, 1 Sept 2023 at 09:42, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Core MTD changes:
> * Use refcount to prevent corruption
> * Call external _get and _put in right order
> * Fix use-after-free in mtd release
> * Explicitly include correct DT includes
> * Clean refcounting with MTD_PARTITIONED_MASTER
> * mtdblock: make warning messages ratelimited
> * dt-bindings: Add SEAMA partition bindings

Ok, so the above list isa fairly reasonable, but then:

> MTD device driver changes:
> * spear_smi: Use helper function devm_clk_get_enabled()
> * maps: fix -Wvoid-pointer-to-enum-cast warning
> * docg3: Remove unnecessary (void*) conversions
> * physmap-core, spear_smi, st_spi_fsm, lpddr2_nvm, lantiq-flash, plat-ram:
>   - Use devm_platform_get_and_ioremap_resource()
[...]

This is not a "summary of changes". The above is basically just a
re-organized shortlog.

What I want a merge message to be is to be an _overview_ of what the
merge brings in, and it's why I ask peopel to summarize what they have
worked on in the pull request.

But when the "summary" is just a list of every single detail, it's no
longer a summary. It doesn't give an overview of what has changed.
It's not useful to an outsider as a way to see "this is what the merge
brings in".

End result: I might as well just use "git shortlog", and it would
probably be about as readable as this is. In fact, I get the strong
feeling that this was auto-generated from something very much akin to
"git shortlog", just edited to combine multiple commits that just did
the same thing to several drivers.

Please - this is meant for *humans*. If it is just another form of
"git shortlog", then the automated version is *better*, because I can
use "git shortlog" to look at one particular driver (or a particular
set of drivers), so having a static version of "git shortlog" that has
been slightly munged to another format is actually _inferior_.

No, what the merge message should be is a general overview of "this is
the big picture". Not just a list of every single change, just by
sub-area.

For example, you list "Use devm_platform_get_and_ioremap_resource" not
just for individual drivers (nobody cares!), you do it *twice*,
because you've split up MTD drivers from raw NAND controller drivers.

And then you separately list "Use helper function
devm_clk_get_optional_enabled" from that list too, _and_ you then list
"Use devm_platform_ioremap_resource_byname()" for the brcm nand
driver.

Not to mention individually lising "Fix alignment with open
parenthesis" and "Fix the spacing" and "Fix wrong indentation" and
"Fix a typo" for the Qcom driver.

See why I'm frustrated? This has been going on for some time, but it's
gett9ing *worse*. This is absolutely ridiculous. I could try to make a
summary of it all, but honestly, now it feels like just complete
wasted time.

So I pulled this, looked at the "summary" in the fag, and decided that
it's just not worth it, and unpulled it.

Please give me a *summary* of what has changed. A list of *important&
things. Not a list of pointless typo fixes.

               Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
