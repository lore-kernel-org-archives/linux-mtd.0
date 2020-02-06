Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE752C35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 00:20:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DDB920661
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 00:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TX/isMci";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTQ5OuhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DDB920661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guFMA2FfdERYG3sLZWb5WOAtdXEhtDUzMCvj5EtkkEU=; b=TX/isMciHVIizD
	+Pkswenl7njnRc962/80gy1BOpT82m3hizr2ykJA3vaJQxzknE5VmNPqHsWHWH5wLz2Q4+myK0zTZ
	ERe1+SWq1wwrT4ctaQQSZEy8XNnRobMnSzWr2gP1+vSXM5vjxGTQ5czW3mSsVwXON8qUB8VAoB7hu
	wDRBVf3ij/WK5RXAmHFf+ll2qyj7oIbKqdRA1NXRVYLxX4RyzLCp+orEJOg9oLpk47DMZ8Z6u18E2
	DkMSmFgRq4d3G+wJ8I4+ZnsfaDE0X9WaETzIrQ0s7U2MaugZ3HOhqwmCPFVeb8AnQzNeTuKFYUx6C
	cFd11Ydz5dTCw4OWQSCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izUuU-0003f9-6S; Thu, 06 Feb 2020 00:20:46 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izUuS-0003en-8m
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 00:20:45 +0000
Received: by mail-il1-x12c.google.com with SMTP id p8so3503511iln.12
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 16:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5awOd4+t6vW73Q4cSo2y30EulxvNLNo8RmSIEuGbKIA=;
 b=iTQ5OuhYL6yb52XBOzClcZZfUDYBmm7u984CTt/8FEG5hmWcQTkUfUO6jyGIfdMHv1
 l9lD+pHVKrYBHKPuksJ+BPXVI7K6ns1rRFua+AWrTp8+mVLwiWPRe+B73+ZJpg3kb1MV
 YWVNZgKJDn1tRQtXowrdb8iUi2M+A4HUK4hcch6TksNQ4lncFoiBcg5p02c7DkslwY0e
 p+xwZPt2Uc9dgdIGE8fQyhkpIh1H1BVPFm53lQC8mz0hq/IrVKhkZiWe7e2tvmcHXt7y
 tnfRWQSNoWwJDZzKfWDPUPEKK64EUVl9TjWmocfR526rygtY9eCtVwEZmsuR/MgkSHr/
 +j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5awOd4+t6vW73Q4cSo2y30EulxvNLNo8RmSIEuGbKIA=;
 b=Dm8XcQGQvvL7doASdSklk17lFAEVXjuRZ7tzfIh7lcHvdXhmciaMjvkgQ7gJOULhxH
 l45T7CfMLMZknRE31vmuO9aHRLZlnZIiPX96zfLq00Hhy59TVylfFq3MnTqwC400MN4H
 ZVMhLbcus3BD+ji28uhpOnegd5E28Z1ZMAZWXg5RL7NVwothOcb3HoFz16uGKr1rmIq8
 K5rrbVFY+8XoA9GW9W3YLG+NjkGp1p0lvq2F/PY4zJPaMcq2pl/LcjIvWZldqzG/MhQc
 CMA6LOD3ot4dmutZ9F/FRJg5leapPrQxXtyroe6ZqERuIoYaehMyPuOXECRCCZR7sNMz
 LjMQ==
X-Gm-Message-State: APjAAAXWt9qolAnYAgFHvTGijbtks8Q6oOfqeeVNaaIZ3NERXuBdlRtW
 7JGzWY75zF6UEZu+2gImATfgarjYxdCtHL+B1Vc=
X-Google-Smtp-Source: APXvYqzX2tGk/2eOdargSrLStgnc8Ch8iQnhPEqzDwPZkEIvAtrncD8Cn6HDXzoF5nj+ar7TVignjDZnPgFtMNSfgQA=
X-Received: by 2002:a92:390d:: with SMTP id g13mr876996ila.53.1580948438408;
 Wed, 05 Feb 2020 16:20:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Wed, 5 Feb 2020 16:20:37 -0800 (PST)
In-Reply-To: <20200205212301.1e26c263@collabora.com>
References: <CAA=hcWTvGf9_izDMJhER-S=vEYcc22K4Syp5CuVjUr9tND7cgQ@mail.gmail.com>
 <CAA=hcWSX9tBOjX8DEsg+=9NPdKzdwQBa1PyxA-r9vCLVsz52tg@mail.gmail.com>
 <20200205212301.1e26c263@collabora.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 6 Feb 2020 11:20:37 +1100
Message-ID: <CAA=hcWT+veAKUUKyJSZEx-mtoPAMzPhzd=gd8XtPq-NbrC9TMQ@mail.gmail.com>
Subject: Re: mtd_nandbiterrs errors
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_162044_334914_B8BB2DA1 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Thanks for the response.

On 2/6/20, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> On Wed, 5 Feb 2020 22:28:50 +1100
> JH <jupiter.hce@gmail.com> wrote:
>
>> Resolved, using kernel test probably a bad idea, change to use
>> mtd-utils nandbiterrs resolved issue.
>
> I doubt it solved the real problem: ECC is not working properly.

You are right, I was working and posted at middle night, my brain was
not functional well. Let me try it again to clarify it.

# nandbiterrs -i /dev/mtd2
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 1/7
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 3/7
Read reported 2 corrected bit errors
Successfully corrected 2 bit errors per subpage
Inserted biterror @ 5/7
Failed to recover 1 bitflips
Read error after 3 bit errors per page

It did have errors after reading 3 bit errors per page. Could it be
ECC strength not be set up correctly?

I did not set up ECC strength, how can I check the ECC strength bit? I
run the nandbiterrs --help, it did not tell me which option I could
check ECC strength bits.

Also, how to set up ECC strength bits?

Sorry for all rudimentary questions.

>> > [  695.257984] mtd_nandbiterrs: Inserted biterror @ 0/0
>> > [  695.262984] mtd_nandbiterrs: rewrite page
>> > [  695.273646] mtd_nandbiterrs: read_page
>> > [  695.280000] mtd_nandbiterrs: Read reported 2 corrected bit errors
>
> The ECC engine should report an uncorrectable error here, not 2
> corrected bits. BTW, an ECC of 2bits/512bytes sounds weak for a 2k-page
> NAND. What's the NAND part you're testing with?

I am currently testing a test unit that is using W29N02GVSIAA, it will
change to Samsung : K9F2G08U0D-SCB0 in the future, I have no idea why
the hardware contractor uses two different parts in development and in
product.

Sorry to repeat my questions above again, how to run nandbiterrs to
read ECC strength bit? And how to run nandbiterrs or other command to
set ECC strength bit? I thought that default should be 4 bits, I have
never set it up here, have no idea why it was 2 bits.

Thank you so much.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
