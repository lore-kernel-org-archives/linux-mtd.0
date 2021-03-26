Return-Path: <SRS0=+z9G=IY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9077DC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Mar 2021 14:10:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FC861A02
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Mar 2021 14:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17FC861A02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oATUQwx2Qp0er46E6X7Vs5L5gRF4SXIkZyP/a00ko5Q=; b=YuwO4YkKcSE4fsZ1zHs/gbbmY
	VkGTQhAyOr+RiRdgLSp1EsMd4EY9pDvkD4gwsfLHEO0bgLFF104kP/9cCuMj61y9J65LxyRBoH64b
	LSYPBOGF9Kyt40PwwCMmcyKj7/hRFiaponFD9YfhNkohQKG4xuuqG3Imy5Juk6uwJbN8toncFQulT
	N2Y8m9E8MgPPxk9z4sTCHBUlDjzAptMCqioCsnwZWIt1wtbX7dL757LpYBNn1VmFF/Gh8cuNQgoBf
	AzOyY6jHjFkmDZmalLjMAbvYxARinTB8RC4RjackeBje1cuBQwMgjZhQDIRZeI0MisUTb6MNRNNKA
	5afHYY0hQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPn9o-003jvd-I0; Fri, 26 Mar 2021 14:09:48 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPn9h-003jul-Db
 for linux-mtd@lists.infradead.org; Fri, 26 Mar 2021 14:09:44 +0000
Received: by mail-qk1-x731.google.com with SMTP id o5so5342598qkb.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Mar 2021 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzjZseiEUmTZfFHAmjQMrOVkpZ6x0+tzMj08xpQ6yq0=;
 b=KVheVgeJgZecx/FFd5VWNdrlusRUfZqjFCSCFNU+yEWLfZDDkzrUQw4D5mfROjl+cJ
 VAtacQfxoWUP4cQIHd4CH8zpMIlRrg0p/ciswCFtEFfHL3Ftcp5vad+NiXJ/dWBLJU0k
 9DVjbh+S2Oa/rBKWybpZ2Ec+hCvJ9U2M46q/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzjZseiEUmTZfFHAmjQMrOVkpZ6x0+tzMj08xpQ6yq0=;
 b=TksiBEq8l6ZFwPlWPtdy9HEZ0pDo2LEBwwBVkvvf0YaP7nXZjtjarKxRD67RkjqHJC
 abFomdkrf0BTeA3sclCZvI9RG0lzSn9iB6ADYvDx+UAG+Vcai87sYh/h4GPKmMtwjz5z
 SrxVTCTj/ZU7zgNOkdvgRW/l7QHmV80GTfdSZCUGuQ5ft1jw9zGnKZgmJWSAe8/cZhtH
 m5X4Hmk6Fo4hP8BMhtES+F9KhbrwRZcXAa0e0oc7peFFARa+m/tIDFcZtvhJu/yFGbQQ
 MKhaZLu6Q7LY7KLMeFb3dwuYD8b+CCEAF5OL5WVxVPsHjXcTqipgdlUdQX3t/XMtZdzz
 teRA==
X-Gm-Message-State: AOAM530qaUrpsGAVlXRk/HmP/BTFdpFdcxlsL/yz1JvRV/mfcjQNyZxP
 SSXpFooL8Z2+Fg86Jv5/MoIrfidiioMDvJXduUVwZg==
X-Google-Smtp-Source: ABdhPJwaf4OTlnKY7d9JSvR8Dg8uARN8GSBpSDdvSTiGtYqRE3barT8RBbOhXjke/03Ligvu08fyH3kHIc4T84rqaZI=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr13328039qkg.468.1616767779533; 
 Fri, 26 Mar 2021 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
 <20210323113233.3523d66b@xps13>
 <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
 <20210323150603.6b942a60@xps13>
In-Reply-To: <20210323150603.6b942a60@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 26 Mar 2021 23:09:28 +0900
Message-ID: <CAFr9PXntCmdrmg+i3BB1j-aY4VbE=2iqyLcoSr9cX2090jGiGQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_140941_832245_1DB5AB7B 
X-CRM114-Status: GOOD (  15.62  )
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

Sorry for the constant pestering on this..

On Tue, 23 Mar 2021 at 23:06, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > # nandbiterrs -i /dev/mtd1
> > incremental biterrors test
> > Successfully corrected 0 bit errors per subpage
> > Inserted biterror @ 0/5
> > Read reported 4 corrected bit errors
> > ECC failure, invalid data despite read success
>
> This is not a valid behavior. There is something wrong with the way ECC
> status is read/retrieved. The read should indeed report 4 corrected bit
> errors, but then the data should be valid. Here it means that the
> introduced error appears corrected but in fact is not.
> We need to understand what status are available and write the
> appropriate vendor code.

I looked at the datasheet again and the encoding for ecc status seems
a bit funky.
The chip seems to have only two bits for ECC status with this encoding:
0 - Read success with 0-3 flipped bits.
1 - Read success with 4 flipped bits.
2 - Uncorrectable.
3 - Reserved.

This looks almost the same as the Winbond chips with 0 and 1 being successes
but with no totally error free status.

Anyhow, if 4 bits were corrected is returned for 1 then nandbiterrs
reports "ECC failure, invalid data despite read success".
If I return 3 bit errors for 0 and -EBADMSG for anything else
nandbiterrs doesn't complain anymore but is this right?:

# nandbiterrs -i /dev/mtd1
incremental biterrors test
Read reported 3 corrected bit errors
Successfully corrected 0 bit errors per subpage
biterror @ 0/5
Failed to recover 1 bitflips
Read error after 1 bit errors per page

When running nandbiterrs the status is always 0 before injecting the
error and then sometimes 1 and sometimes 2 after the error is
injected.

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
