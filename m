Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE66C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 11:52:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9459C61920
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 11:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9459C61920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9GMsZBKqh2UeVN3eqVmBCVqyQcy/uytgglUk4uLeoAg=; b=RdqzelKa0bYXqR6BVX/NthFdX
	G8sm3l36IKLct42iNoj0gBVmB9nFNFyooAPZEdhz7Xq+zhf2RU+ScfJS755bbWijDOBTB6kiUPF52
	PTcYh2IomGrCy7qBfGWAHxzeS/NJc6/xEJLaq/ckUHAcjo5OKI2AGLBYnav+lbOfoDmWadiSwj5I2
	dfh8IDYnkgXA54Kk1EzZlN8H7imFdV1n4kca+rnr75dfA4f7I7GrZvh3q2Oypi0PuJPGtbvo2vo4s
	IIm84eP9Z+/QuirCDG2SmG7Y3pW03GvYmjlGumBEzdz0ODlHHW9E/+rbt3opF99JbyKYn845+Zlfm
	JY113MS3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfYl-00Eopu-5g; Tue, 23 Mar 2021 11:50:55 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfVL-00Emrc-F2
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 11:47:26 +0000
Received: by mail-qt1-x82b.google.com with SMTP id u7so14608790qtq.12
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F419BnJhxixFSvZMAKXs4tvDppivStl9M/Uz5fVRylI=;
 b=Wy1rSrxIYeID7CuQYaMS0MZRvHoWezSWSA2aD+o8OrBl8/dVc6qlnLFUuRe+cIiWVt
 lCwdLHNDmrodLM92ArNQMJP9p+EhZSMga5iNEhfXsMUM0LYG1drnVmbUt7ZH/qDHVyRT
 9uh8/1gAsQSryCHTjufM8BCuLbB8XjfhmVwG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F419BnJhxixFSvZMAKXs4tvDppivStl9M/Uz5fVRylI=;
 b=g/kpyiW+3YFzxbQ7DMCY4JLSqEbYZAtMdduS3f7/CoBiypEkTmpfuuheCyd8u0MHBh
 PgjdShM+v2uvPUv89Qcqf8iF4oCrPatLpYwx1ude6tAkIjWQHmOr11cYXs70SyExZhRg
 aGTsG623J01hsmXshTHgpcLZdVqKx1nx/ShsUiTUTJhLCAOfChBIpbtexl/U2tStLDPK
 RiYtbr6cT9g0kaOV1tGQ9YMTVrLU29w5BMyVKojSwK96Ug1XXNkgoToqz1aWmSGVkQ4X
 9KeSKzKup4dK24ngLUaYgR+zUen+2Y5SHLACIoLgtv2yl6MNvuQm/ZtKbiVB2yZIo15v
 Ms8Q==
X-Gm-Message-State: AOAM530Rz/4EWcxxFPTU679KyaIahuH4N2GexAnpNgs1bkiAMUrjMj97
 BImMCG7LjWdbYx6bhQxhtLNa/5FSKFgd2P2a8E97bg==
X-Google-Smtp-Source: ABdhPJxb4rk2yYkFLAj4LkiXAJ0uAXqAM0jCN+3GxM5jbVeWvshwoR4hcoZ9d+U2rKSvsZlRIakjbREIeEeJIVUVbJM=
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr3907305qtk.249.1616500041105; 
 Tue, 23 Mar 2021 04:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
 <20210323113233.3523d66b@xps13>
In-Reply-To: <20210323113233.3523d66b@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 23 Mar 2021 20:47:10 +0900
Message-ID: <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_114724_165400_923BE7FB 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

Hi Miquel,

On Tue, 23 Mar 2021 at 19:32, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> You can run nandbiterrs -i /dev/mtdX
>
> You'll see if there is ECC correction or not (and its level).

These are results I get for both of the nandbiterrs tests.

# nandbiterrs -i /dev/mtd1
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 4 corrected bit errors
ECC failure, invalid data despite read success

# nandbiterrs -o /dev/mtd1
overwrite biterrors test
Read reported 4 corrected bit errors
Failed to recover 1 bitflips
Bit error histogram (883 operations total):
Page reads with   0 corrected bit errors: 845
Page reads with   1 corrected bit errors: 0
Page reads with   2 corrected bit errors: 0
Page reads with   3 corrected bit errors: 0

I guess this means ECC is there and it's working.

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
