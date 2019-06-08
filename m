Return-Path: <SRS0=FMIu=UH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBF8C28CC5
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 20:00:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E23208E3
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 20:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STPsBo0h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iCm+4VqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76E23208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a201t301+Orf9+DAgA9SQSAbfMWdNF7PvjnjkzVeBaM=; b=STPsBo0h3cBCkI
	Z9sCNhwoH5YPvczJnBFY4atzg4Qi3V+wAt9yrubhzcHFUmxVB1ASU3x9GFji0/OU9wHMNK8ygrXwU
	B5H7OjbYSc8JK1G6Yz0f9xwQobnEKRXPKHnQmR1YBhmMHdEbMOSoOsmE4a2Vck+uNDJS294zN+XX9
	67G3ZXN58KWxbKf0jRZw2zWZwbyTu+TyeP3jN+tbbBsGLO0TrI58klO/CAM+ZxBPYTQbhi7BatKvS
	6O8Rxd7IbyyPokbqP4Bi2RGI1HmRLzIiA8qzJFg7Ur6/8KcKUNEIUiVO/kiy6zs+PMAf19uG+AH2b
	WkBc+iT/M+ELmjl0QE9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZhWB-00042K-Q5; Sat, 08 Jun 2019 20:00:47 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZhW7-000418-Vb; Sat, 08 Jun 2019 20:00:46 +0000
Received: by mail-ot1-x342.google.com with SMTP id j19so4961713otq.2;
 Sat, 08 Jun 2019 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvkpFaao1bpKQ1FWayC3EusodSIMGE6w694SSNfMEPA=;
 b=iCm+4VqZSt6kP2oAqKNK9ttO+n1BscayXijHYPF97LlKXKRTy/SQJZN8g6ptnB37GY
 2qpvcyeM4ipaUGv65IBoJk02Qm02N2zjp1eUXMCq+AN4trMiVdYmCSqfFUNnpqCeLs73
 Hp2SAEt7Mvr8wKtGNmb72g6Av+lQZbvcgd3MLPNKA40YmEdhRMR+1oBXTPPWTEwvlJzj
 tt/CdN305EsiUJ9JuqpVD3D7V7QibejrzDVzpZwMPG3HBT3xKfgfibme2CBG/1ZgwDvL
 bvRP90LTWNSXGucxuU1L5uvWJLtOO0uXdC4As8XsFXZ4rsoY6xw7ij12LQADBI9QEXzN
 hF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvkpFaao1bpKQ1FWayC3EusodSIMGE6w694SSNfMEPA=;
 b=Ene88g3k0uhWv4bjLjeeDlI4KscG6JVUZR/MR4SMZ3i2+2Za4F3PHwzrU9YvVoFn8B
 MnLZbG9xb3MX6KDwXWDeZ6PM1buMmmZDA0t1ubSdT2bGRxvgeWMoK19KnlRR/OSFmypw
 7U7cfvIJjepxyZLKAWjrI9Sch5MoNxFN9tC9dK1YBC6qSQXMpqXcDeSv3fpvWPdb3P9h
 2Nuz0QU2gU3RBcDNOteyqE1Jelch2bO2SupKPWYX/iqjtl/4w+NebzTGqd1S3ZIJzjaY
 ypS5ESWmCV/0lakrXOjg3JWV63Wr69q5R8Ayz0JcFOX5zC0ti21Na19e6h0w4pofAGUs
 jhpQ==
X-Gm-Message-State: APjAAAWsWeLo1uG6D95QvRwr+Lz9N9qI8dHdf43fho8j7dGLVCcYN2Kk
 R7Ry8FCyFKcSNqvomySW5kXe3UxySph0BktFrRw=
X-Google-Smtp-Source: APXvYqzE1S4at/LKVQiJdPOZ7qR8leNmGzSuvzyjOZztdFT72UxQXxBOmWKetA1I5Vc/iv6tZY4wzFoHoG2nI91n1qA=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr23458026otp.6.1560024042878; 
 Sat, 08 Jun 2019 13:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
 <20190321214401.GC19508@bombadil.infradead.org>
 <CAFBinCA6oK5UhDAt9kva5qRisxr2gxMF26AMK8vC4b1DN5RXrw@mail.gmail.com>
 <5cad2529-8776-687e-58d0-4fb9e2ec59b1@amlogic.com>
 <CAFBinCA=0XSSVmzfTgb4eSiVFr=XRHqLOVFGyK0++XRty6VjnQ@mail.gmail.com>
 <32799846-b8f0-758f-32eb-a9ce435e0b79@amlogic.com>
 <CAFBinCDHmuNZxuDf3pe2ij6m8aX2fho7L+B9ZMaMOo28tPZ62Q@mail.gmail.com>
 <79b81748-8508-414f-c08a-c99cb4ae4b2a@amlogic.com>
 <CAFBinCCSkVGp_iWKf=o=7UGuDUWxyLPGdrqGy_P-HPuEJiU1zQ@mail.gmail.com>
 <8cb108ff-7a72-6db4-660d-33880fcee08a@amlogic.com>
 <CAFBinCD4cRGbC=cFYEGVAHOtBSvrgNbCSfDWe3To0KCE5+ceVw@mail.gmail.com>
 <45ce172c-5c76-bb69-31c8-af91e8ffdd68@amlogic.com>
In-Reply-To: <45ce172c-5c76-bb69-31c8-af91e8ffdd68@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Jun 2019 22:00:31 +0200
Message-ID: <CAFBinCDWaDoRbbG+5B=27MNRTcekbooEdgAZv5kyS+Xu6M7Bzg@mail.gmail.com>
Subject: Re: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_130044_011635_1D3DA5EF 
X-CRM114-Status: GOOD (  23.82  )
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
Cc: mhocko@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

On Thu, Apr 11, 2019 at 5:00 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hi Martin,
> On 2019/4/11 1:54, Martin Blumenstingl wrote:
> > Hi Liang,
> >
> > On Wed, Apr 10, 2019 at 1:08 PM Liang Yang <liang.yang@amlogic.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On 2019/4/5 12:30, Martin Blumenstingl wrote:
> >>> Hi Liang,
> >>>
> >>> On Fri, Mar 29, 2019 at 8:44 AM Liang Yang <liang.yang@amlogic.com> wrote:
> >>>>
> >>>> Hi Martin,
> >>>>
> >>>> On 2019/3/29 2:03, Martin Blumenstingl wrote:
> >>>>> Hi Liang,
> >>>> [......]
> >>>>>> I don't think it is caused by a different NAND type, but i have followed
> >>>>>> the some test on my GXL platform. we can see the result from the
> >>>>>> attachment. By the way, i don't find any information about this on meson
> >>>>>> NFC datasheet, so i will ask our VLSI.
> >>>>>> Martin, May you reproduce it with the new patch on meson8b platform ? I
> >>>>>> need a more clear and easier compared log like gxl.txt. Thanks.
> >>>>> your gxl.txt is great, finally I can also compare my own results with
> >>>>> something that works for you!
> >>>>> in my results (see attachment) the "DATA_IN  [256 B, force 8-bit]"
> >>>>> instructions result in a different info buffer output.
> >>>>> does this make any sense to you?
> >>>>>
> >>>> I have asked our VLSI designer for explanation or simulation result by
> >>>> an e-mail. Thanks.
> >>> do you have any update on this?
> >> Sorry. I haven't got reply from VLSI designer yet. We tried to improve
> >> priority yesterday, but i still can't estimate the time. There is no
> >> document or change list showing the difference between m8/b and gxl/axg
> >> serial chips. Now it seems that we can't use command NFC_CMD_N2M on nand
> >> initialization for m8/b chips and use *read byte from NFC fifo register*
> >> instead.
> > thank you for the status update!
> >
> > I am trying to understand your suggestion not to use NFC_CMD_N2M:
> > the documentation (public S922X datasheet from Hardkernel: [0]) states
> > that P_NAND_BUF (NFC_REG_BUF in the meson_nand driver) can hold up to
> > four bytes of data. is this the "read byte from NFC FIFO register" you
> > mentioned?
> >
> You are right.take the early meson NFC driver V2 on previous mail as a
> reference.
>
> > Before I spend time changing the code to use the FIFO register I would
> > like to wait for an answer from your VLSI designer.
> > Setting the "correct" info buffer length for NFC_CMD_N2M on the 32-bit
> > SoCs seems like an easier solution compared to switching to the FIFO
> > register. Keeping NFC_CMD_N2M on the 32-bit SoCs also allows us to
> > have only one code-path for 32 and 64 bit SoCs, meaning we don't have
> > to maintain two separate code-paths for basically the same
> > functionality (assuming that NFC_CMD_N2M is not completely broken on
> > the 32-bit SoCs, we just don't know how to use it yet).
> >
> All right. I am also waiting for the answer.
do you have any update on this?


Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
