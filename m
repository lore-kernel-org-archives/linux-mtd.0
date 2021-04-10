Return-Path: <SRS0=+XBZ=JH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78E3C433ED
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Apr 2021 18:01:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44FC7610A4
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Apr 2021 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44FC7610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H4wKiVy+sFAPT5yDQnxuVzr+UpUOP2RIORGBNEuMlMI=; b=ptjugBcQDJArHFG1+5wcQNihL
	utGWfgDYse432aX4g7Mj0jVsIgYgCB4Ye5mK2AaC6NNC9YT3Zl1LSEj5HRhw+d47rBDyKk5xkV0EZ
	ae2IDof9flyWHOax7tet5d1Ft7svw63zIEpEaZruOxSVJXbhMBg190IwPCo5a5kea6KiFuhShF2PJ
	sfn3SvkF9zVORz61XYyNRxbCxn9zBl3Tihqj8ONyhZngl/S3eBg7WZ9m9Y/3HmzwYMbR8hzTzIDTc
	dXArFoPJGmw44Pi5rYE6Qmp4lTChXhK9suZw3ScZbwaID6CX0ERS6t1kbeDovKWyZSZu/6nh/hhOz
	YyNhSENKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVHuE-003E5m-FX; Sat, 10 Apr 2021 18:00:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVHu6-003E5a-JG
 for linux-mtd@desiato.infradead.org; Sat, 10 Apr 2021 18:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hIiOdg7nNs+J2rKDJaRQDPMiKhpx3QV+QbhoM+oW0vA=; b=XsicEAyLvpqc6ZX2jzIIBYOmSz
 FGqnRU47+OScvG3Dha5IXE6uBmCAyV1I5PtqQ941LtHSTAvi4xH8b8as59FFKTvskasoAu6b8ZX5G
 FhMuY7avayfk/b55UYSRUJJSJOMLjlEBaH2F5XdnNm1tkpXHAuar6/R8v51+66nGEfGjS+kd5nqD7
 +E2CL3JjZ8WrIMAabKB6LN57ITkwAUm+hqBZqELq+T/jnemOR4O96nQiyksz6jLkl41AnOPb/Q3Z5
 zbWcJAEJ+dqmPwVMA7BLpa979feFPqe318x4ISD1M463zgcX7ADqvbtrZDCFUAyMz6wgSB0CkbAZc
 SIQOSGzg==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVHu2-005Cec-S4
 for linux-mtd@lists.infradead.org; Sat, 10 Apr 2021 18:00:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id s15so10192301edd.4
 for <linux-mtd@lists.infradead.org>; Sat, 10 Apr 2021 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=hIiOdg7nNs+J2rKDJaRQDPMiKhpx3QV+QbhoM+oW0vA=;
 b=Z9X6Je1dF+wK/BkEun8YXo4eHIW2tfXteXzN6XqHU1rdtTi7ilN5LkGI8HuqI3T0S2
 TnohwA+eZiXBp8EDn+s+DvUQh+qZmzSfS8pdfjjK9Hff//5ckGNUjPLMyYqWG4lLqe62
 W1aM4xHs49N/Dim0BQjdKog9BlSW86+FP4X6QldE/bAfBVrU1WfIfLV49k/AJiX3UuWK
 jaS3eEcvrPoB03mpRKPU57gvZuA+P4X++RNt35kMi7el5ylo+OJBu5IcGEBADpp9y6kd
 h21Bu1nNmhmsPmSEbhNvo4vzskl678b7Nt7+xKnZzGXpowkU12/YvOU125ObuCspnUUf
 zUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=hIiOdg7nNs+J2rKDJaRQDPMiKhpx3QV+QbhoM+oW0vA=;
 b=E5cZGxqvZWrKfpzYCIMKtymNTAuOMOnLyHFlJzOYFJkup5dOT/dJb0Q7gCp/wpB0rK
 ZMcgYYx3DN2NzzOE1rD8lBVa2+F815sPkZqVTqYh0Tz1Wp0P0elmxSfvOBKl124L9V8z
 P/UsTRDl0qQc7R5IyvOJS2mBgVOCotYiYREmss+76iR61/YuRAYq5Gu8cBcRdl0ueOVf
 VEgHUYEooQ85GRoPez8bi4FCI3GabZtX8pVEpreIjtYJRw87I1vIuxNkGBRerTx0O8g3
 ioslO3aakFTCspO9DqOgyWCglT7tNTr/gQBNN/yo/NZCpLQsN3IzhdqDw7vdjoWaGcxG
 9k1g==
X-Gm-Message-State: AOAM5336ioS6oPAem/x66pPtBv0x2XnBAT8W9X/pL6dm0k6MWaAgFnz0
 mHdRcjpSSAyrO9KQ+TsAvE0=
X-Google-Smtp-Source: ABdhPJy92DhlnvniLwdyTlLTyUDv+RmIu1KX1x9C6/hDAjUBR8hxxIxU+bjEhuzNIQmEz3x2LIH8+w==
X-Received: by 2002:a05:6402:22f9:: with SMTP id
 dn25mr8109096edb.171.1618077612769; 
 Sat, 10 Apr 2021 11:00:12 -0700 (PDT)
Received: from [192.168.1.70] (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
 by smtp.gmail.com with ESMTPSA id lk12sm2977061ejb.14.2021.04.10.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 11:00:12 -0700 (PDT)
Message-ID: <508a60edab64db925d042581add513704c3b677e.camel@gmail.com>
Subject: Re: mtdblock is slow compared to mtd device
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd@lists.infradead.org, Edgar Lakis <ela@phaseone.com>, Martin
 Egholm <meg@phaseone.com>
Date: Sat, 10 Apr 2021 20:00:11 +0200
In-Reply-To: <CAFLxGvzRWYTMsh0-476k_zBnkeTHDUJox2u82+qfdUpO9-fBZw@mail.gmail.com>
References: <34544eb22f7661f6fb64af3ed99b1c2092b99a31.camel@gmail.com>
 <CAFLxGvzRWYTMsh0-476k_zBnkeTHDUJox2u82+qfdUpO9-fBZw@mail.gmail.com>
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_110014_930963_EEEDDB5B 
X-CRM114-Status: GOOD (  27.12  )
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

On Thu, 2021-04-08 at 09:26 +0200, Richard Weinberger wrote:
> Claus,
> 
> On Tue, Apr 6, 2021 at 2:12 PM Claus Stovgaard
> <claus.stovgaard@gmail.com> wrote:
> > The 512 bytes sector size is for me kind of oldschool where all
> > filesystems where working on this. Has there been any work in
> > making a
> > translation layer for filesystems block sizes in the 128k or 1024k
> > range, like I would create the squashfs?
> 
> In MTD we more or less gave up on FTLs, they are toxic (patents).

Nice information. This means that it is not with FTLs one need to work.
Just FYI, my coworker Edgar did a quick test of mtdblock with changing
the 512 block size to page size of 4k (above the page size it did not
work) resulting in an improvement from around 4.2 MB/s to 33.2 MB/s for
our flash

> 
> > Alternative as I already using UBI for parts of the flash, I am
> > wondering about using this together with ubiblock. The question is
> > though if it is faster, and for the second part how it handle
> > locked
> > flash?
> 
> ubiblock will read up to LEB size'ed chunks. So, it should be faster.
> If not, I'm all open for improvements. :-)
> 
> > ...
> 
> UBI can operate in read-only mode when the MTD is write protected.
> See MTD_WRITEABLE flag.
> 
> > ....
> 
> I'd start with ubiblock plus squashfs or erofs.
> There is surly room for improvement, but it should be doable.
> 

Thanks for all your help. I did a test with ubiblock together with a
squashfs. This improved the performance significant. A quick dd on the
ubiblock device resulted in around 70 to 80 MB/s for 1Mb blocksize
depending on the amount of data.
I will look into the MTD_WRITABLE flag later. As I am currently forced
to use an older kernel in the form of version 4.19, I will wait and
hope that I can get it upgraded to 5.10 later this year. Therefrom it
would be easier if I could get time to improve the performance in the
code, so it is more upstream friendly. At least I can always hope that
I can have the time for it.

Thanks again Richard.

/Claus




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
