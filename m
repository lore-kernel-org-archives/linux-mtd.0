Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958DEC3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 21:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D2821D56
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 21:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2Q9/CC+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozImC7qe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D2821D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RU4BjyfFV0bOMMwsA0ntzPxGAe9wVfvkxndylVKVWJM=; b=Z2Q9/CC+W2Lvc0
	6FKbDao5saHiuqWsNR3YkpAisa0VUrkojZhnloa7yyf1sfhzudmBBDnrceDuOtiqGwWpatZBlbaAG
	mpAXTnwlTPAFwb1X2WOsgc+znUZIkvqVTrSQYV3m84DSSxjkbxDJnFK5udrVPXelcIbiqW7zZz29o
	F1OvCLc5lTsSrxn6Q44+J5Yn7OlsGdT0snuN6oV63kWgfSzNnG1E/KfJNxGxuntqp+YRPr7sV4G/L
	t9Y7wMVCV0et/RD6VlrasNBDYiRIR9LXpztBWA/GNYNVsU05iMtswzkF1OfXEFKvuxky8AYapIW1E
	j9FRd0pmE07bWukM9iuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8sCs-0003HH-U3; Mon, 02 Mar 2020 21:02:30 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8sCn-0003Gc-4g
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 21:02:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id q8so1625776wrm.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2020 13:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etR7B6/LVGbq9xnf6N2mVXJJVm+bSXOe+vbGZPNqyxg=;
 b=ozImC7qeZ/SHR2Xvbp2AnuvHJRmGyzQCRoYf3dbh1ZOcs3ksy0APTpcrEOxiELugp8
 QtZnwMEo/GcyJp0AF4rJ2nh8qZIj+7FBIohCbgej3tDDgfImrH9RoiTSu+fb8PAjAPVi
 IQdinUoPB5YgClaLi3KhX5IV1Uhmr/WCU9UZCyxZbta7Dj/CS+8JG+2qSyunDR4CbJNi
 Xmp0pEwt1Enc310vE6gxDIna9h40CmEJotM5f0D7lnA+f7tfqfC1QkQDnq4U6NpDxQC+
 tGcxOkMJZ7wwEN/rLz5ICam9yu4QBqsIV0W9dLmDfyVjr9yr7c3l04MDBUnLcxgt//kj
 gMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etR7B6/LVGbq9xnf6N2mVXJJVm+bSXOe+vbGZPNqyxg=;
 b=TxGlyTWXjaBn+3q/Mm/NlaEKywkHOx1NDk9buLs1+p2tAbDys7qGHJvN/69KvwDG9A
 sSXyfZSP14WFgFCkh2TPN+CFSto8x1ULfLLdVnpmBF82sz2qsk0z40G0T2fMuRl0Co/s
 X0uppEuJUOXxx+ahitjrBZYNTEbc0z1dv0nqesHyQ8GIT+PCyykNOdQQVsf79YKdqR03
 2MIB61GcsAxsa/ZYRW9ezlAZ2Sla4N3+MgS9r/VVtzLRHsoxN6eSmotL0A+v9KMF3KF+
 mjARk7z1KUNf8HVhHnEJEZEFtu2UtQ0ZKCK6A/t4J93JohpOeUeYWyaWQ5qLWWQnYJUA
 Z86A==
X-Gm-Message-State: ANhLgQ11n/hIIKnaITL10ZAvZn+BfTzlG2uqLCouo+elEMttU9pljBLe
 Ty0B/VmyqCsgJfrp9V891JGLSe26jt3QCVlTQ58=
X-Google-Smtp-Source: ADFU+vvy6qYaRosdG2yjRLfaZoCmexlQFw1JXN0+weqVKlTvJTPrEd6llAjWl6VT/Qgpwnap0xcSY92EsRF5/u0ojPg=
X-Received: by 2002:a5d:4885:: with SMTP id g5mr1310002wrq.93.1583182942729;
 Mon, 02 Mar 2020 13:02:22 -0800 (PST)
MIME-Version: 1.0
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAFLxGvztqWq-oi1weZcFJOcnngbNdGwmEpJMEMsrfqfJb4Dt2Q@mail.gmail.com>
 <a91e1123-44fe-f788-54b8-541433b4ab84@exertus.fi>
In-Reply-To: <a91e1123-44fe-f788-54b8-541433b4ab84@exertus.fi>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 2 Mar 2020 22:02:11 +0100
Message-ID: <CAFLxGvzH+Pq9LCLgAvr_LO0bEpvzbXQiY_67M2vxMuvtSTeA5w@mail.gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
To: Timo Ketola <Timo.Ketola@exertus.fi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_130225_207492_C304F4F1 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Mar 2, 2020 at 1:57 PM Timo Ketola <Timo.Ketola@exertus.fi> wrote:
>
> On 1.3.2020 23.28, Richard Weinberger wrote:
> > If you can share the image with me I can have a look and with some luck we
> > find traces.
>
> Thank you. I'll send the link separately.
>
> > Is this a mainline kernel?
> > Wonky drivers can lead to all kind of "interesting" results. :->
>
> It is boundary-imx-o8.0.0_1.0.0-ga-pass2 from
>
> https://github.com/boundarydevices/linux-imx6.git
>
> branched at a51fcd6bd17c with our board support and patched with
> v.4.9.88-rt66 from

Hmm, vendor tree....
I strongly suggest giving mainline a try.
Did you also double check your NAND settings, especially timings?

--
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
