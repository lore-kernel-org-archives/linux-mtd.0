Return-Path: <SRS0=HSOd=TJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14011C04AB4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 11:28:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AED20989
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 11:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGiF63Og";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U9HTSn87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AED20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ngZ/vsreEQcdOOaHAlSEwi7kgFHgdaKf6to0ardpLY=; b=QGiF63Ogkdj5JU
	G/NTeeTAH3/rThc8J6d/Wok+z1Y2NdoHhTXHb8wiQMH36fT1eny6mBYTiq48HVAZbjwOY3Nox1ulH
	1nfVCwLjorVRicEzS05Iia/MIcHFttFntclw/iVeLMBB9mSB0FFvBI804OqkO/0v0MASKEZqSyhnV
	jjbnD5XpzL/ONbUJI5XobnC7muE+3Kre/XJD7lNymrMqP9ZFDDLbAFzt1hG51z3J67mCkVUVUtaoE
	Z4Gw3qK1hPrt4JqoXajACtljRSfcvlJSr6EkAcg4FS+dE3y/rm0YQlLiYe8RY87z1FMlN5BffDK9p
	jpqRTaKvJ2ffmlL/mncQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOhDe-0007Gm-Tl; Thu, 09 May 2019 11:28:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOhDe-0007Fc-48
 for linux-mtd@bombadil.infradead.org; Thu, 09 May 2019 11:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2GNapSTWdZW+nfvnOZyYJdFFg0+Mfj5JFMwWRI5ntto=; b=U9HTSn87rJ0/55n2peDawOhR3
 vpWgdkV9n7kbPdhgOFWE6PTHv6B0Gdh6qWchYqSi9dTZQY8Un8AocXM1Nf9dyzw0eC42VGi/ISPdR
 Id6PwIHCzvgCvwFr2UX3OLU/KEi8RzlcBPjY1CXEq7Egkkr0YvGHECPTXwJt2eRN90mtuoZ2LUp+K
 6nIretwfwStTfjbABilbdj6tm6X1zILWB2SeyltZkmPq5nW2giitdu66mucMx2dO4ZMVJsUfsTqcu
 aXC45joJx/1mK8/g2LXeOPt1G5rMiFO8lOx2I1tUUWh+7zWqCXGdsf4pFxLAzsSitaSABB92k4ywR
 eeRNHQOQw==;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOgyx-0003zg-AS
 for linux-mtd@lists.infradead.org; Thu, 09 May 2019 11:13:01 +0000
Received: by mail-ua1-f67.google.com with SMTP id 49so652183uas.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 May 2019 04:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2GNapSTWdZW+nfvnOZyYJdFFg0+Mfj5JFMwWRI5ntto=;
 b=W1onJQA0ulK/GCHsaMzlV9hudRcK4kUzIGVsJoQ6u3eV6xlJZ4EfXPQm3iPHKVz9rT
 yF2qTAcKYCpwGdgDp0SYEEObT0I6I0k5Y8wSGo1aKCQMK8krPbeHMoia9foIVG/i55Ll
 fmxc6WBJpPB30yWPXCLtPcGDAMU790uRey3wak4Uqb+Iwlfvmd+Osy2SWDFx8+RMI6My
 S08Su3fRwNci1CxKojnhY/4/a9eJu5nIFqZTMbyIM2YYfAhJMDRtx7d/+tD5MpwV7BTv
 MFk55Kraj2rtC48rSCENvto3StFtPQdBwk3EyH9+B7QJtRIf8GepS6gARj/gu77g+2XX
 nI7g==
X-Gm-Message-State: APjAAAUsKezGrz8jbJx5uteL3a9QW62DIofo1Tr2CrEOHVmAzpDgGPvM
 SVzolSM8y58EFAaGJZLM9CI0Hu1T6U2aSNNorHc=
X-Google-Smtp-Source: APXvYqxs2BwR9KFho9QUZKAjVXGcEUPzucDa+2TRN5gs5hlRMDoHX8XsbZGI721UhcE8ELyDaqsmWC70YA55q4LtxZc=
X-Received: by 2002:a9f:352a:: with SMTP id o39mr1537803uao.78.1557400377371; 
 Thu, 09 May 2019 04:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
 <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
 <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
 <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
In-Reply-To: <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 May 2019 13:12:43 +0200
Message-ID: <CAMuHMdVPrR=58_+P+D9Gos89n4Yv7wYzLORXmY=JKxZZ2ydKPg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_121259_364635_C874EA59 
X-CRM114-Status: GOOD (  23.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Thu, May 9, 2019 at 12:31 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/09/2019 12:11 PM, Geert Uytterhoeven wrote:
> > On Thu, May 9, 2019 at 8:56 AM <Tudor.Ambarus@microchip.com> wrote:
> >> When the configuration register QUAD bit CR[1] is 1, only the WRR command format
> >> with 16 data bits may be used, WRR with 8 bits is not recognized and hence the
> >> FFs. You probably set quad bit in u-boot, while others don't. We can verify this
> >> assumption with the patch form below. Can you try it?
> >
> > And /dev/mtd0 reading works fine.
> > Thanks!
> >
>
> I'm glad that it worked, thanks for the help. I'll do a patch to fix this case,
> but probably it will qualify for -next. Is -next ok for you?

Given the issue is present only in -next, fixing it in -next is fine for me.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
