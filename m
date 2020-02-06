Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9B9C2D0B1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 06:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3160A20720
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 06:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kNtpMnpP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foievkMb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3160A20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YS8uWrZpgFDG6pU+g8IZfnRqFfx/eGc1UMPocPo8GS0=; b=kNtpMnpP51i7d4
	56MskgRKVBpxGf05guJgfZ1j+yZvYcqQpG2zQLZVewgOsFsDpBslh6gEW0vcJX3FPBnU0xyAZSfjD
	ysKyY8bS9L/9BSwPSlswcvdnY3G7jr3ph+czriBvfelhjxnDKF0YJ6DU0mDZwgRL3/vFJ2vQR5ZYw
	RAfpD9rTJA6nLNq2uSH7EWkjehEp1USMWUPJTtPEnaLwJOho+PKctw8Azm+IYAAh7VdE/fnwtrDSW
	Eakx+TPwKq2M4sNYPco9toJ59bB82REol5ahLSZjvCtDd3TuqopJoMBbeaUSMYzNTrGkewucDKL12
	6MQZIVSOtp/XCmhFZZPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izarX-0006Jp-2T; Thu, 06 Feb 2020 06:42:07 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izarU-0006JV-GF
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 06:42:05 +0000
Received: by mail-io1-xd43.google.com with SMTP id x1so5094821iop.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 22:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bEXxKlcyLgE2p3I6l9a4mYEEpl5MYzkVEFvuOyNKPbU=;
 b=foievkMbImjEmCXaGTCfjIBNH8Y3XXMifOWUx7fb+9DjVyF4yyjCUDi6P199YcQJLa
 SqiLgnFCTJ7wu3bwlTcxJFeioXcu36wZL+ecKrXdgvrXAy5z72l0I/cOIvKj/QCutIIM
 Eh2yTdp/I+8bhveyg2S8pLz/GIAcRo4PuAp8Rm8YfazghjaGixf9jBXnoqukitymHEzp
 U4U2lhWUK7afsuNS/ou0lYMuP+mP4jMYPRFeGjwa9vCQJSCReGtUGhyfi3gDxyaBTsBE
 EZ+KIIqeOMdmtyWSfPsETndG3mP37JL01h1MMYPtt9jTaBQ8m9YzKAONzBNHg9B4ZuPT
 Bd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bEXxKlcyLgE2p3I6l9a4mYEEpl5MYzkVEFvuOyNKPbU=;
 b=VUT2SV3JpBxs7qPbCJXaS02ElhXAqdyisfoulHVM17MWivRw57WOa34Vc+17Cs0/ds
 QJF9ir2AzXv7uVuAzhAY5Y+eLzWbCtea3xxrtzUUwWqdMi90m5k6PuxDWRPhGm7iQM2Z
 wTbnuY6WobGa0x3W+wudKABLbzmwZWlf069Ev5EfoSNT1lT6IDqVeEa3z/8QhHbEqvgb
 1chEZaVmta0KUnbbDEaRVpHR5VVflXHC/PWZc5Xy446RqY5jQIBYexcY9q4QvFaNXGTF
 qzOTVg5VFJT4gcMaYKXa3UpYgSl5pbgHP8OIDUWH/7aSQHXuc5QW+Ou00mttDLZgD4Zs
 2QCg==
X-Gm-Message-State: APjAAAV4ewcOYGtApHCkUa+/qkdOnzxCAMhBAbUY1C77n1EIhx4fXxjw
 mMe9O05QTB4iwOi6dkaRBuxUYkU1kAl6sLZCO/HKAGEtvRQ=
X-Google-Smtp-Source: APXvYqxIebhKmY4FjNNAioqVdDNoHQTchq3K5kzsiTAkIlXO/Ul5WdpWaYj9I/TKyYUwIzBKPADbh59zDQwPaFuoHI4=
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr25721223ios.192.1580971322929; 
 Wed, 05 Feb 2020 22:42:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Wed, 5 Feb 2020 22:42:02 -0800 (PST)
In-Reply-To: <CALLGbRKGmVCvDgr7g5D0BQaH6R1J_cfguC9WYRJxwo9KT+Fa-A@mail.gmail.com>
References: <CAA=hcWTvGf9_izDMJhER-S=vEYcc22K4Syp5CuVjUr9tND7cgQ@mail.gmail.com>
 <CAA=hcWSX9tBOjX8DEsg+=9NPdKzdwQBa1PyxA-r9vCLVsz52tg@mail.gmail.com>
 <20200205212301.1e26c263@collabora.com>
 <CAA=hcWT+veAKUUKyJSZEx-mtoPAMzPhzd=gd8XtPq-NbrC9TMQ@mail.gmail.com>
 <CALLGbRKGmVCvDgr7g5D0BQaH6R1J_cfguC9WYRJxwo9KT+Fa-A@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 6 Feb 2020 17:42:02 +1100
Message-ID: <CAA=hcWSELSKA5-rQ+6wrJY3iYdTs4Eeo5rLe0+azLYS7PcgCxQ@mail.gmail.com>
Subject: Re: mtd_nandbiterrs errors
To: Steve deRosier <derosier@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_224204_566809_A768E99F 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Steve,

Glad you help me here as well :-)

On 2/6/20, Steve deRosier <derosier@gmail.com> wrote:
> ECC is dependant on the device. And it can't be mixed-and-matched.
> Every device has a datasheet that will tell you the minimum required.
> You can (and usually should) go more than the minimum required, up to
> however much you can fit in the OOB area. There's several ways to
> check it, one way is to dump a programed page via u-boot `nand dump`
> command from each partition and see how much of the OOB is taken up by
> ECC bits. Personally, I'd do that even if I thought I knew what the
> setting is supposed to be to validate that the data was actually
> written in correctly. Depending on your system, you can find the
> configured strength in your DTS. And also the u-boot config for your
> platform (boot loader and kernel need to agree on ECC settings).

Just got a dts file, it uses fsl,use-minimum-ecc, I think that dts was
copied from original imx6ull EVK, it looks like it is 4 bits.

Sorry for a silly question, how could I run command in u-boot and
Linux to verify the ECC strength bits and setting in u-boot and Linux?

> You need to find the datasheets for your devices, it will tell you
> what you need to know.

The datasheet says "The system has to use a minimum 1-bit ECC per 528
bytes of data to ensure data recovery". For 2KB page size, I guess a 4
bits should be adequate, right? I need to find a way to run commands
in u-boot and Linux to find the ECC bits.

Thank you so much Steve,

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
