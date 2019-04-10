Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF50FC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 17:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D5D2063F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 17:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qu5Nr2vN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="g46iFH89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D5D2063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVvnive7G6/Q8mDZZXCfpBEqD0T8yA+LWrQb64toKmM=; b=Qu5Nr2vNrXMbBF
	osEFdYfjtleJHVMeW6aBW1AqWVYeNdNm6jJv1CV9p/duTY0sKHY33QNIPCuoZNUh6Q5YZjF0QN+fM
	a850h4O4EO8h2+wxJ1JKEnHtXrxF2NCmh3b77Rx0RZRCoi3yOsKCXmHD2aeIB5OtcpM9Xu9ELMpyh
	pEMfmeroHt5veDNjvfvCRSi+ksofTd3ZMT+Ppo0r9M3QSxD73AuOHE4BUorFq1FSsW7It2Fxu+HH/
	gy1Fg5MgfoS9T4JaU10VdBBfCgpTfn84aWOkjYXkotIg8Tyk4iiXWOzhWVkfaXmvmK/d0/zmtoUfF
	OP38TT4W79fAs8inv+WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEHRM-00042z-1d; Wed, 10 Apr 2019 17:55:16 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEHRI-000425-B7; Wed, 10 Apr 2019 17:55:14 +0000
Received: by mail-ot1-x341.google.com with SMTP id m10so2767992otp.2;
 Wed, 10 Apr 2019 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=za2E/pLJgKbwiV1dsXtjcDsjWlrh7jaWMTWufoDKu5o=;
 b=g46iFH89Et3jdAxwN3daHsdlaI1+zHIcOv5/gHFIApHJYqE8yvgRmyHw0Xm9H9cHCg
 IbwNLoYGu7QZ4nov9UfQpYh0y3WNWrStUed2N8aEI+IfeQqjVQKRMuMPbD6nUYfKDe3l
 hHVmaeD7BTnuqlv5g4BM7uFKJGPu9DQxFhsqVExKE2tN2OqMZv/GmMpPer7lq7oV7lLM
 nwAa07MYGs45q9tdLFFzNTJQtSy9jlmVb5G3smCrW7uPw+YMSiqI87FIc9B9Lus+KptW
 N0al/hgirxv4udjxdPowSfRRu0zMzs0t3MGfWPPnRdKgE9/PNVfW3MNBiBi3OQS1bH6Y
 7CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=za2E/pLJgKbwiV1dsXtjcDsjWlrh7jaWMTWufoDKu5o=;
 b=JKtLHhJEAOSRrl/gpHa92mYUjm/ZTwZmjsdhH+NLCux7fsbkiVlRy3XmzJT86bGkax
 6XMBvQ8MXIFm6dr7DohiCOkqu67XVvsCH41IbWfO5z0xADHuOtpwlRtka9eGBaVcwnRV
 TGVfRpyXM4aJ4iuaTAWujc5mO7k+tNben5dIB2U5fPwGnemUmIQgCLP5Lraj319gFn+R
 mFFc+stzpfwhFUwgkZT/PMtwCXXAKqBE7PxoEVOdXLYRNvBm7V56p+bkQl8cXEzx0w1e
 2ZSyFXs21q6vnI1hyII46ONhGDi5Clq7QOt07/JHw7w8joWlf7+tu3VsOe+2YdynbLRV
 aJrw==
X-Gm-Message-State: APjAAAXwoRJ0+6mrXoCQBjeSdO0mCy/Pq+sHOYxWHua3c0t2u2/ADwxz
 5ibl7Vb7SX4TsCx8Iz23lNf5hufp8tzN1kCMMgo=
X-Google-Smtp-Source: APXvYqxJCvj+hExhPZ1nr7IT/D4Y0kcPlZk34EZsNBEpynW+ggppXtmmAwRzG91Zbd7EtMxeZ2qI4kfNxCokVL3UhpI=
X-Received: by 2002:a9d:6e88:: with SMTP id a8mr2804549otr.117.1554918910311; 
 Wed, 10 Apr 2019 10:55:10 -0700 (PDT)
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
In-Reply-To: <8cb108ff-7a72-6db4-660d-33880fcee08a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 Apr 2019 19:54:59 +0200
Message-ID: <CAFBinCD4cRGbC=cFYEGVAHOtBSvrgNbCSfDWe3To0KCE5+ceVw@mail.gmail.com>
Subject: Re: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_105512_647344_A5E32A1A 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: mhocko@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

On Wed, Apr 10, 2019 at 1:08 PM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hi Martin,
>
> On 2019/4/5 12:30, Martin Blumenstingl wrote:
> > Hi Liang,
> >
> > On Fri, Mar 29, 2019 at 8:44 AM Liang Yang <liang.yang@amlogic.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On 2019/3/29 2:03, Martin Blumenstingl wrote:
> >>> Hi Liang,
> >> [......]
> >>>> I don't think it is caused by a different NAND type, but i have followed
> >>>> the some test on my GXL platform. we can see the result from the
> >>>> attachment. By the way, i don't find any information about this on meson
> >>>> NFC datasheet, so i will ask our VLSI.
> >>>> Martin, May you reproduce it with the new patch on meson8b platform ? I
> >>>> need a more clear and easier compared log like gxl.txt. Thanks.
> >>> your gxl.txt is great, finally I can also compare my own results with
> >>> something that works for you!
> >>> in my results (see attachment) the "DATA_IN  [256 B, force 8-bit]"
> >>> instructions result in a different info buffer output.
> >>> does this make any sense to you?
> >>>
> >> I have asked our VLSI designer for explanation or simulation result by
> >> an e-mail. Thanks.
> > do you have any update on this?
> Sorry. I haven't got reply from VLSI designer yet. We tried to improve
> priority yesterday, but i still can't estimate the time. There is no
> document or change list showing the difference between m8/b and gxl/axg
> serial chips. Now it seems that we can't use command NFC_CMD_N2M on nand
> initialization for m8/b chips and use *read byte from NFC fifo register*
> instead.
thank you for the status update!

I am trying to understand your suggestion not to use NFC_CMD_N2M:
the documentation (public S922X datasheet from Hardkernel: [0]) states
that P_NAND_BUF (NFC_REG_BUF in the meson_nand driver) can hold up to
four bytes of data. is this the "read byte from NFC FIFO register" you
mentioned?

Before I spend time changing the code to use the FIFO register I would
like to wait for an answer from your VLSI designer.
Setting the "correct" info buffer length for NFC_CMD_N2M on the 32-bit
SoCs seems like an easier solution compared to switching to the FIFO
register. Keeping NFC_CMD_N2M on the 32-bit SoCs also allows us to
have only one code-path for 32 and 64 bit SoCs, meaning we don't have
to maintain two separate code-paths for basically the same
functionality (assuming that NFC_CMD_N2M is not completely broken on
the 32-bit SoCs, we just don't know how to use it yet).


Regards
Martin


[0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
