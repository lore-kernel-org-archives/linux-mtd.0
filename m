Return-Path: <SRS0=z7rv=V6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1E2C32750
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2019 16:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD9220449
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2019 16:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T27BRs0a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tjceON3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD9220449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrUJwt240S78pVkIk3o6CsWOusZGvo0HxXeNQojm+Wk=; b=T27BRs0aXwTYAK
	d/t0NOdWXDvhkanlWMbwz06ertRCNw6jm70gEiQfR2Lh6ghCDtzvLrtdzi1FG8tGLNhp+C2sgiUmn
	uFwyDafw+k1aw17ZnwxOniAqK5YPx+GoIb4YSp7ZpVoImTWmc7ZcljOdN2HT8++TOX3zRW6RG5OMb
	IxAoxXdvgR2k9XzxY03Z8wYvAh0650bU47aiH3JrvY4RMzMHActBt34BoWPbEseZ2QfcIEf3ZXA5P
	OPcFmgmZttwN5JllCZde43/3jefdK2zO+Xh/N267bTvdaDAEhR2grH9HcKjSEZrE+ebIH2qCgq+c4
	+JVIwkadFbEXoIK4qSSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htaD1-0001YC-9a; Fri, 02 Aug 2019 16:15:11 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htaCy-0001Ee-Bt
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2019 16:15:09 +0000
Received: by mail-lj1-x241.google.com with SMTP id y17so48827003ljk.10
 for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2019 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9GlZ30mVYJacTeb3O+3rFrM/EIjSay3k70MKr0AYksM=;
 b=tjceON3ll70W5d0Rf4KoIwMcBMB7bISd2CzXpEv/YlilFXRVN2NH2tHBcObWZoWq0m
 zmhDPw6crXfkkuwC9ftUvEs7w9GQERlv+nhjcLYYL/e+dczSYBmc7IHnmTr4Ld/6SWRF
 AI31X4SP5a9yh0haDxyZ03Oop74KHEdURXLpuj94j1bolbDBwUl6mNgHn7nRqxEq3nCT
 +fDPOkDninwjQhRH/l8vaWYk/BWy/Ft6zcU0pOchrVNV+4rTRhKW9F7dV/0x/WW2AMQe
 mfbqWxlOBHz32oYBOF4ZcwyB6VHLlCa5RBjPOZFoIzbe0dWXU9s3Snxy6rqI1QWgiybQ
 D7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9GlZ30mVYJacTeb3O+3rFrM/EIjSay3k70MKr0AYksM=;
 b=SgO6Dd7eToQWgWHrtDmpHVuoINPeJQCHm8T4ltAZuDOrOGQ4ZhcdXoeEF7UUvAKdht
 quMKfHrS2rSoIYbjrpQmu5h6nW6LAHaH9D8PAKQJsMr9Z5VtuKBmc9XvHzaGb9Bu1Mja
 cIcT/MTjo/VPK0I/u3SciZPYwKbguJE2ne4XcFfLhltXPPV4H3sOrzPYeFnS+6++AORB
 dqcpGLytgqwpNaRJ8+dl2JB6ke0ksslx7auaapjY/r09FU4DXEliyO/aBlQ0DwD9xbsE
 Gre6qg5xtjfO+egSDhwur8/NwnP/xEQGpwpiT6rL5eTDK6gKX1H9FgGVjS0QvohMkcVw
 SP/g==
X-Gm-Message-State: APjAAAXIAgCaGfoUtmsYuXn2+SZ1wuxjp2qjeqKAIxjXAUHposO/xUVl
 Y5wfm1vJTdfBbiqZSMF2qF6zE2PtSn6LQevtNOg=
X-Google-Smtp-Source: APXvYqxJh10FqymspDK7kuw3Z1YOL50yOieKeDygsJI6CVdmBLbnrjItkq3PLxK2E3i30mWuvELiYxUFKESalAtmm/o=
X-Received: by 2002:a2e:9b57:: with SMTP id o23mr1012596ljj.67.1564762506135; 
 Fri, 02 Aug 2019 09:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMxq0fNSWrUFMmmTs8Ri9gFOvS+KQJvZN3-_KuiqXi9bbmCB0Q@mail.gmail.com>
 <CAFLxGvz92UR2M7KJ_dMMW-F47_pLLxSTOrGwdQ5Cc0kuSiTA8Q@mail.gmail.com>
In-Reply-To: <CAFLxGvz92UR2M7KJ_dMMW-F47_pLLxSTOrGwdQ5Cc0kuSiTA8Q@mail.gmail.com>
From: Sergeant Peppercorn <speppercorn109@gmail.com>
Date: Fri, 2 Aug 2019 09:14:55 -0700
Message-ID: <CAMxq0fO=0P8972FKvscmNxCBxq0m8_f2DST-Oa9HtNeUA-FKsA@mail.gmail.com>
Subject: Re: UBIFS ECC errors
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_091508_433777_D262240C 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, many thanks for the reply.

I have seen posts on bitflips in empty space issues before, but don't
remember seeing any fixes. Does this mean the kernel UBI drivers must
be patched? Can you elaborate on what fixes or where to find patches,
etc, or what to do about this, then? All I care about is getting this
to work, and hopefully without needing to reformat the root file
system on 50,000 units in the field.

Kind regards

On Thu, Aug 1, 2019 at 1:04 AM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Wed, Jul 31, 2019 at 6:24 PM Sergeant Peppercorn
> <speppercorn109@gmail.com> wrote:
> > UBIFS error (pid 1): ubifs_recover_leb: corrupt empty space LEB
> > 7:2048, corruption starts at 2241
>
> This is a good hint. Can it be that your empty space shows bitflips?
> In the last years many drivers needed fixes to deal with btiflips in empty space
> since ECC cannot fix these.
>
> --
> Thanks,
> //richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
