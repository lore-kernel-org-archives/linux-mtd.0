Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F63C5B56A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofZ1t+DQTJI/kL3Fuqgb1cb5ePGAi0Bp2YqxDOJq6kc=; b=stkSZ7Jzpg6p1s
	OI8q0Xe5xCfECDqvYu5+k+yZuvwNfXIPZAWIeBpAdDE0vvJwS/RQ/3DkTTXHHKVGy4J7k3Jvb5LSW
	mCxk1V2LWb3XIcQ9qDCndlreU3wLSu5dceqtX1HM3eI4Dr+a3xBAgUR6+pgxJLcgIJKDpFbp/uEOU
	D+c0uY1UMlLOYFnqfuvxihtDZaID8aN9WKwZ9W8kE4n+FLWwcgHcP4x6WWtxKtOej41hAiRJmiYXj
	DpkNK94/l3t2xTC5H3zQs3uqK6ZfPNX/A4yhvX/ExAImVs0e5a/Xy+VPAChk1roHhRRQDvJmhCe/F
	ji5lhOdK7EY6S3E1iq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu40q-0000000Fcaz-3IlJ;
	Wed, 12 Aug 2026 08:08:36 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu40n-0000000FcZZ-2Nrq
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 08:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786522110;
	bh=c1DE+J+mby3IB31fgXhjHYNrvrVd8RMoQSXDxfKYYAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRmI1u9qhigCMFjW6qDBXwRO0L91FSaRG/8MnIsP2BieBqiYAryKjYtGYoySYLgYd
	 yPu6XyEFTLR6MKxVcfC7tAlPuIj7Hv6RfQoHHuxOE7OzETRlgsdEq6eJYGr0v1v2q7
	 SME85zwJdAF22P9i8egGtDpCRZ/SYH2QlLv/X+nqAa4x/C9eqGQfUZSpwY9a0RVbYJ
	 dMm/o3e95ERu7adfdGJ8Y+0rsnGWdxdJwSWuMF39dGtCOuIUfp5JWcIqka4RFuZ2i9
	 GHnFO78PqHIIJrfWrdhjeSPlmkPdE7EQgezMzU1HeYE93iIWueUEbu92OH5s+BCTaX
	 kPSMbev0y9ieA==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 6CC5C21F
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 17:08:29 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=GWtF8rhO;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 4DF7D65C
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 17:08:28 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso986332a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786522107; x=1787126907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sm6xU1ads4o6kh3PABJu0Yz+vbwX83Nuy6bmPLiLBbo=;
        b=GWtF8rhOzt3Kf6A2HciDQjOSTMKfRioOBabyJxQLy2eHsb0eALHnNB+j55RhS7cGT5
         ZE4FW4CpwBWm8Dcl9w0N6T4wTLKq5nz7XmZZ47EXY3uJZbJNGtlM3CTufRPeIbvo2HCR
         lM4hlcQWosGloeGe3tHDpLxK9vTHCK8/uwGoHxHhLP6tqNVTF8uIz91ymAsoBdqCFtK1
         XDbEoW7+aSuA+ODHGKOa+aaU9T48in/+n3rA5jbFWWsXEUG1J/jj+FSQbOcSGokBIwrx
         8EYZfb2WrcftdM1kLTwAPwTK7Q6i1k0svOM86u/8Zgd71VnIoBeOdhS7NP5HjrZnaMJR
         Yluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522107; x=1787126907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sm6xU1ads4o6kh3PABJu0Yz+vbwX83Nuy6bmPLiLBbo=;
        b=qKuAU+XtGa4j3ehuEScTI7FPIDVyYOyHRwhHWO4A77yxKlJ09mfr8+O+EoqYgq95Ku
         8BGlnSiDTxZSdltvVm/Sdpw85uIQbmfFe/9SpSBLp6RbuG3X3YRkyGfScw+m2wW5PBXa
         1JofatqHwj5y8UF3WBL93ZFYdLn5oZxLJXwYtafLUUDbvrWJIqXOJHFoYl+WTwVfPxT9
         Tj+Qnfop9deZjuB3nWkX6YBc4tH33zZs2YEDuQUpcQstqWsvcPJOJU+6knp2Y/tGl5dQ
         Qni0KP5H+TaXSHxbg1hh4cnDTDKGQJx4sWJxMKhnon4YwFVPCVKvY+st6HJ/xW1zFfDK
         4G9A==
X-Forwarded-Encrypted: i=1; AHgh+RrHnA5l1nBEK7a7nmmBILQD2BHwIK3TiLMfwTd+T4kQvOv+x6Dd5mZjbxMOUpXQucBbQRhbTV9PIa4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbu3ZJe9me/3ZuVANnMVYtrZI3JuLvcHtbRvizyRADi2MBplwX
	9HlLkkzdeThOfk75VZqT5xtzY5I8DBqXrwtdABpamh6A/f7qv4WHPxzOLcqzAf6zxorkOQ8XrpP
	JcyXW6jJDV54NfTSEy0LTasqD58+LQfby/4t/CHwjfi3UpTsH9OrfrjEKFsk5/vdfSc3w
X-Gm-Gg: AR+sD11OLZisqdqEQN3gxWefnd8WBET4gOQfJVsS1LPc05P8do3D2JWYDMUCYT51F/w
	J/ghvcAueEntk6Hclf/fra3Qic5LPhRBBKBlmvSawoQwXDqidHq1i2m/t6FtcPzt8j5YQmElOMX
	DkYGbOkJ1jiiyH+H/+v8rRRQE6+dLeLXsWBr/VCI/Lk9bdBwcnQ0x+OW4i6BigLgK83CDfDOs08
	kkRZRsYgtgEJzokGEpZO3GkFQn58J4asHVGUEVMFlMsOXwR0vKMafRtUWixDPNl0YIYyhg6+k5f
	VlTG63ptMVq/Hfg/y/6kEf5ThqE0RikLqKiTQBd2krfkAkEzdbFaNLo57CnO0lznfuUWRiwXECn
	N6VD6cAzzHnseCw71XgGdMwzjgkeEE3BNtav5FrBQR3KNlWcj
X-Received: by 2002:a17:90b:48cf:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-393013d19a2mr3711817a91.3.1786522107163;
        Wed, 12 Aug 2026 01:08:27 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-393013d19a2mr3711754a91.3.1786522106668;
        Wed, 12 Aug 2026 01:08:26 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-392f97fc409sm1004974a91.1.2026.08.12.01.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:08:26 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:08:14 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Md Sadre Alam <md.alam@oss.qualcomm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daisuke Mizobuchi <mizo@atmark-techno.com>
Subject: Re: [PATCH RFC v2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <anwp7lxvdKOEr3Vw@atmark-techno.com>
References: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
 <anv-3hSRMVgJAsOt@atmark-techno.com>
 <87tsozn63o.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tsozn63o.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_010833_834686_7CA9F9B2 
X-CRM114-Status: GOOD (  23.61  )
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

Miquel Raynal wrote on Wed, Aug 12, 2026 at 09:35:55AM +0200:
> On 12/08/2026 at 14:04:30 +09, Dominique Martinet <dominique.martinet@atmark-techno.com> wrote:
> 
> > Dominique Martinet wrote on Wed, Aug 12, 2026 at 04:14:02AM +0000:
> >> +	// the W25N04LW chip actually has two free ranges per section:
> >> +	// "User Data I" at (16 * section) + 4, length 12
> >> +	// "User Data II" at (16 * section) + 2, length 2
> >> +	// The later is not ECC protected so this only returns User Data I
> >
> > (will fix to use block comment like the rest of the file + latter typo
> > as per Sashiko comment in v3, after we've reached an agreement on what
> > to do here -- there were no other Sashiko comment)
> 
> I haven't checked the diff yet, but the commit message contains a SoB
> from anther person which is listed first. You must be Author + first SoB or
> you can give someone else authorship + first SoB and take 2nd SoB (which
> means you carried the patch without changing it). If you want to credit
> another person, please have a look at the Co-developed-by wording.

Thanks, will add a Co-developed-by tag for them in v3 after other
discussions are settled


I've also been stressing/torturing the nand a bit and I'm noticing a lot
of ECC errors (regardless of erase cycle count); all ECC errors are
apparently focused on two bits regardless of the sector the error
happened on (bit 0x20 at offset either 0x7e or 0x80 in any sector,
from checking data with nanddump -n and diffing the output)

This error is reliably readable so it happened on write, but
erase+nandwrite properly clears the error, and there's just too many
(~20-40 over 1MB of data, so 2048 512 bytes sectors), so I think that's
worth investigating further before applying even if I don't see what
could possibly cause this in the nand code

(Well, I guess it could also just be how this batch turned out, but I'm
surprised that the errors would always happen on the same two bits...
It didn't happen with the 04KW so hopefully not a SPI bug either...)

I need to wait next week to test on different hardware to rule out a
hardware bug and I'll reach out to our contact at winbond as well

Thanks,
-- 
Dominique



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
