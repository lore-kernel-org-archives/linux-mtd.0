Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BB8FA372A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 20:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA392089C
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 20:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kznSc1/9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIonjKO0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA392089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yepMKJCo9AhDpx/a/Nsu5ZteTiUtV9x2F0QtgwsC77Q=; b=kznSc1/9DWAhMG
	WZyp9CfXksrHuS67gRqGTjN19reaRn+5LfPnaibqo8upEPFctE31Wtc68VSh4kU8NezBI8bZcqaot
	IsGqOFaaXPLP9Gk/KT3nq1JvuTyrRjwMoTBAm4HZVZUn3AxHV5iqglNqwSBFAdblkoLgp2oa/YNoX
	x1g4QUVuwyBUi+3Iz+e44Ei6AD1Lm7JLk8sobYC59jseKHd7uZIsLk8xvrqJ/LTqqd2NnuqmFTOI7
	WeUiZt154Ki1FKhUN19dAElKDnQ0hf07Zs2sJZlMVpGlfjxJt8sB0i090kqv7pymXX/oRZX/VPOxz
	VXTub79sTgSNUKGu2hDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLCdG-0002sh-Pz; Thu, 17 Oct 2019 20:44:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLCdD-0002qs-UB
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2019 20:44:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id b24so3911705wmj.5
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2019 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MLmPi9TA9LqHplx/d1dmPQS5YxUYwakujQwG6vojPNY=;
 b=RIonjKO0ixH0K7/HJE2viaL4l9wAC4droTP+fgq7R8azzUgef88UigtTnQ0ejwvWSn
 aeVTxKjGM/TeuxyMHeMfZlea+qpPa45KKlZtTvJGGGmlgR8oFL0q+rUka2ZRMK7TPaVp
 A63tCVpEg+KJdArjo7b2/I8d/3wJ6wzhcooLmeZ1ZKYM9ZqetuRDdBG6SugyK15G4A3l
 Nh+5r9NhmdHp6yahSFzZI+8NZH0785d6lp/mkI7tKBGzBcyat9fI6CJY/Czgp49HOJh1
 uEJQY4vWaulpFZk5GIjROmh+0IGJC7RdlCUyu1H2mTZ0k7+5dYLI0+f0YI+s/BUcKUO/
 j1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MLmPi9TA9LqHplx/d1dmPQS5YxUYwakujQwG6vojPNY=;
 b=fN4qJWcPjMZiy330tnp5PC2Ob9T46/jAC7SsvmDtDVWIxypVie5HJ8W62QJPpM8aH3
 H47CFAMD9wo0K8M+QvmcOkJPG6Wr5VkoSbvr3r5sh/aBAjDEuMHhVGV8ckuteL/Uq+E7
 2XfZOWtvrWVMOoHhvI/CGPSycBUBkeCDKXInwqGOf9j2yE5UpRMMY/hJz3x0Qx3Z+Fgw
 9FyEUWjrSiKwiGIJRXG3o/zsmA39f2W4384PVNoT0Y8cYytQXx131isI5GzqhsFzGGsy
 TJ9QIQcEy7fngfKn0c9JS1u1gV9hpMWpjqUhsFxJoQ2fLmhVoOiga0BX1XN3ojZmxn04
 eDtg==
X-Gm-Message-State: APjAAAWAFLc7KIDOqRRrdhgP18yivAobbxtYgtbAnn52qC3IhUyFS1Cs
 PYjolUpQNnsDiUGawsWPZwcsFXowvYByJ56QwE8=
X-Google-Smtp-Source: APXvYqyr8/bn77wPPyQNuViYJqQOsdM3vYmVZbD9KIgYNdNZwRRFRSCMMfGFo+p7E3UyBfUyA2J2tAU8OPGzmSLfN4o=
X-Received: by 2002:a1c:9990:: with SMTP id b138mr4599353wme.176.1571345061972; 
 Thu, 17 Oct 2019 13:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR11MB2566C2E89585B6F7AD7F083DC56D0@BYAPR11MB2566.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2566C2E89585B6F7AD7F083DC56D0@BYAPR11MB2566.namprd11.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 17 Oct 2019 22:44:10 +0200
Message-ID: <CAFLxGvy70C2MXG3+ctJtmYjSGpWPsdvOJ1ttdc6j8Y8QGEnyvQ@mail.gmail.com>
Subject: Re: Seeing ubifs unmap LEB error with linux 2.6.35 kernel
To: "Kiran Bangalore Sathyanarayana (kibangal)" <kibangal@cisco.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_134423_973729_CAA9E766 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Sriranjan Bose \(srbose\)" <srbose@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 7:38 PM Kiran Bangalore Sathyanarayana
(kibangal) <kibangal@cisco.com> wrote:
>
> Hi,
> We are seeing the below ubifs errors with linux 2.6.35 Kernel:
>
> 3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24831): ubifs_leb_unmap: unmap LEB -1 failed, error -22
> 4:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<4>UBIFS warning (pid 24831): ubifs_ro_mode: switched to read-only mode, error -22
> 3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24831): make_reservation: cannot reserve 4144 bytes in jhead 2, error -22
> 3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24831): do_writepage: cannot write page 98 of inode 67, error -22
> 3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24581): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
> 3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24581): do_writepage: cannot write page 99 of inode 67, error -30
> 3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>Buffer I/O error on device loop2, logical block 1
>
> The system has a NAND flash with ubifs filesystem installed. The above errors happened randomly at runtime and ubifs switched to read-only mode.
> The NAND flash itself is fine and there are no badblocks detected.
> "ubinfo -a" output is as below:
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:63
> Present UBI devices:            ubi0
>
> ubi0:
> Volumes count:                           1
> Logical eraseblock size:                 126976
> Total amount of logical eraseblocks:     1024 (130023424 bytes, 124.0 MiB)
> Amount of available logical eraseblocks: 0 (0 bytes)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       0
> Count of reserved physical eraseblocks:  10
> Current maximum erase counter value:     536
> Minimum input/output unit size:          2048 bytes
> Character device major/minor:            235:0
> Cisco UBI Flash Worn:                    No
> Present volumes:                         0
>
> Volume ID:   0 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        1010 LEBs (128245760 bytes, 122.3 MiB)
> State:       OK
> Name:        data
> Character device major/minor: 235:1
>
> This has occurred on multiple systems now.
> Can you please provide me more info on this error? Is this any known issue with linux 2.6.35 Kernel?

Aren't there more logs of UBI or UBIFS?

> Please let me know how to proceed with fixing this(any specific patch that needs to be specifically applied on 2.6.35 kernel).

Can you please reproduce using a recent kernel?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
