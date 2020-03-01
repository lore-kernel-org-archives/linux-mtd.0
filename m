Return-Path: <SRS0=VCdk=4S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFCEC3F2CD
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2020 21:29:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCAD24680
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2020 21:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H9xdI+gY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmJ9jPRY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCAD24680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fvrj3Jl6AJYkVJkqbtLUv7Lx0QZuUYR5+nINdxj45HE=; b=H9xdI+gYFtjPab
	wLn5+h4+uVjOJUE3X0QG3dIr370QWMnXdUm5QFLQFbphkY8M9MPkJXHi3TkG/Vn2AW6zxcGBsE0u9
	mOtqZmfLy1E+wU4LdKq8nxw5fGI4letT8BJ1F+8aXjTV7QkiaTwXgD7ycV88gcof0MwIUtSqTrp2q
	JLyuTzo34ZarHq9x0thC1HBm2A/Yf0HrqtD213DTi9hoq4R3inCe/vq9pQwlbJ8qJhq4mFLKSCRRF
	XBN6e5nYL+Bo7iOXj2B5ScC3qyWrj4djc1VpEop//OmLfoXE1W6V6s/1H2CPlMlvJle+8DoHA7CFD
	Dxb/Lao8fgBr4GRJCmxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8W99-0001ac-VI; Sun, 01 Mar 2020 21:29:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8W96-0001a8-HW
 for linux-mtd@lists.infradead.org; Sun, 01 Mar 2020 21:29:10 +0000
Received: by mail-wm1-x341.google.com with SMTP id u9so2958515wml.3
 for <linux-mtd@lists.infradead.org>; Sun, 01 Mar 2020 13:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vxXXI1tBc7pHV3kXAvDCfyvoURjlGYdjmzLNjwzJrK0=;
 b=NmJ9jPRYEFZ7qkxxUwAwokgCOLWLMUJna7XuCGsIdpZEvkErrUJw3ylfcnhkaopFqG
 5+13i/XyiFVUj45hxqa2Q7G3eYZMkpsXDmudLwsPrzkRzS6LvRnI+F74T+EHpjSeZmgA
 mmKgE9Jl+bB8a/31Y4z64iGExcMBG0ibrCC1xZyAkIoeZzrf0UVMEEVaztg+6H0GywGr
 AfV+VWbwvPuYrukW6fiEoSIFHzy1yjSm9A3fkZXSdJa6aboLAjpgwYWzyvcBcMe36IvN
 7dH+nBKlWtJ7DZXy8dPP2sIb7rUlXAM4dCESxgGiXo1QBi7D7Czr0SD0EduEujShXN1O
 NTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxXXI1tBc7pHV3kXAvDCfyvoURjlGYdjmzLNjwzJrK0=;
 b=AiFPL+JZx6nvWh6ZEc7+V2QV5Jah7FOJJpHgb5qHSZxwO4CrfRKBxGs2CSTp1THA/0
 c7ZJHVg3LNrZP01rUKdptvJJw+L7tm6ZK3ppZuF3TL6Q0KpYPJeOW80rObQU+XjrqJbb
 oCZXFRpP3vixfCHkzQG23YiMgvj7gSLhnNiP/Lo/4HRpd8GIJS+njX9nAOJmMuBFVGhf
 a2o+kKCBzljUBg8Dc9oUGWQ09WbBQHUg4wvKKloYFy5XMUPwvU0ffhL09TL/NxAqSs+j
 BeJfvPHx0XMgLJRy5x0h4cj/A+MPjf4ToMCk4NWpKsztudYo/okdlqH3mekBRqS8fPFb
 KPgw==
X-Gm-Message-State: APjAAAWKhn7Gvv9sax6quibp0TC8V/9u5RKgX1M9A4XHuY8WQa/KPnE/
 230khhMPsZ7czGvJnM1wEm1WxeTgMtLL6D0l7j46SQ==
X-Google-Smtp-Source: APXvYqxmio/9+DcnELHicPshCT+I5bKeudCkF7dWKCDkVnLyR99QHAseOxki+EWy0mLeULisyBbnSfU+CZzTlHPlrYM=
X-Received: by 2002:a7b:c119:: with SMTP id w25mr16228806wmi.116.1583098141820; 
 Sun, 01 Mar 2020 13:29:01 -0800 (PST)
MIME-Version: 1.0
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
In-Reply-To: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 1 Mar 2020 22:28:50 +0100
Message-ID: <CAFLxGvztqWq-oi1weZcFJOcnngbNdGwmEpJMEMsrfqfJb4Dt2Q@mail.gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
To: Timo Ketola <Timo.Ketola@exertus.fi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_132908_607206_314C4350 
X-CRM114-Status: GOOD (  14.07  )
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

Timo,

On Thu, Feb 27, 2020 at 2:04 PM Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> We have a few i.MX6D devices which have corrupted their UBIFS filesystem
> on power cut and refuse to mount them any more.
>
> The log says:
>
> > [   10.382580] UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 158
> > [   10.408838] UBIFS (ubi1:0): recovery needed
> > [   10.802070] UBIFS error (ubi1:0 pid 157): ubifs_scan: corrupt empty space at
> > LEB 99:114688
> > [   10.809054] UBIFS error (ubi1:0 pid 157): ubifs_scanned_corruption: corruptio
> > n at LEB 99:114688
> > [   10.816471] UBIFS error (ubi1:0 pid 157): ubifs_scanned_corruption: first 819
> > 2 bytes from LEB 99:114688
> > [   10.824585] 00000000: 06101831 713b7e1b 002e0640 00000000 000000a0 00000200 0
> > 0000554 00000000  1....~;q@...............T.......
> > [   10.824601] 00000020: 00000000 00000000 0001585b 00000000 0008c48d 00000000 5
> > d512897 00000000  ........[X...............(Q]....
>
> ...
>
> > [   10.827751] UBIFS error (ubi1:0 pid 157): ubifs_scan: LEB 99 scanning failed
> > [   10.834615] UBIFS (ubi1:0): background thread "ubifs_bgt1_0" stops
>
> I think I found the culprit from the mtdblock contents. Fragment from
> hexdump:
>
> > 3ca20000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 04  |UBI#............|
> > 3ca20010  00 00 08 00 00 00 10 00  0c 4d 7c ed 00 00 00 00  |.........M|.....|
> > 3ca20020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca20030  00 00 00 00 00 00 00 00  00 00 00 00 cb 5d 1f 01  |.............]..|
> > 3ca20040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 3ca20800  55 42 49 21 01 01 00 00  00 00 00 00 00 00 00 63  |UBI!...........c|
> > 3ca20810  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca20820  00 00 00 00 00 00 00 00  00 00 00 00 00 00 8d 07  |................|
> > 3ca20830  00 00 00 00 00 00 00 00  00 00 00 00 91 2b 87 87  |.............+..|
> > 3ca20840  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 3ca21000  31 18 10 06 30 3c 6d 96  cd 05 2e 00 00 00 00 00  |1...0<m.........|
> > 3ca21010  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
>
> ...
>
> > 3ca3b8c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 3ca3c000  31 18 10 06 7b 71 87 8f  3c 06 2e 00 00 00 00 00  |1...{q..<.......|
> > 3ca3c010  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
> > 3ca3c020  00 00 00 00 00 00 00 00  5b 58 01 00 00 00 00 00  |........[X......|
> > 3ca3c030  79 c3 08 00 00 00 00 00  97 28 51 5d 00 00 00 00  |y........(Q]....|
> > 3ca3c040  19 58 6d 38 00 00 00 00  19 58 6d 38 00 00 00 00  |.Xm8.....Xm8....|
> > 3ca3c050  00 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
> > 3ca3c060  eb 03 00 00 eb 03 00 00  a4 81 00 00 01 00 00 00  |................|
> > 3ca3c070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3c080  00 00 00 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3c090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3c0a0  31 18 10 06 84 13 e1 a0  00 00 00 00 00 00 00 00  |1...............|
> > 3ca3c0b0  1c 00 00 00 05 00 00 00  44 07 00 00 00 00 00 00  |........D.......|
> > 3ca3c0c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 3ca3c800  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> > *
> > 3ca3d000  31 18 10 06 1b 7e 3b 71  40 06 2e 00 00 00 00 00  |1....~;q@.......|

So, in there is a whole 2KiB area 0xFF.
It is also aligned, so it could be whole page.

> > 3ca3d010  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
> > 3ca3d020  00 00 00 00 00 00 00 00  5b 58 01 00 00 00 00 00  |........[X......|
> > 3ca3d030  8d c4 08 00 00 00 00 00  97 28 51 5d 00 00 00 00  |.........(Q]....|
> > 3ca3d040  19 58 6d 38 00 00 00 00  19 58 6d 38 00 00 00 00  |.Xm8.....Xm8....|
> > 3ca3d050  00 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
> > 3ca3d060  eb 03 00 00 eb 03 00 00  a4 81 00 00 01 00 00 00  |................|
> > 3ca3d070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3d080  00 00 00 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3d090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3d0a0  31 18 10 06 84 13 e1 a0  00 00 00 00 00 00 00 00  |1...............|
> > 3ca3d0b0  1c 00 00 00 05 00 00 00  44 07 00 00 00 00 00 00  |........D.......|
> > 3ca3d0c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 3ca3d800  31 18 10 06 c1 6b e6 57  42 06 2e 00 00 00 00 00  |1....k.WB.......|
> > 3ca3d810  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
> > 3ca3d820  00 00 00 00 00 00 00 00  5b 58 01 00 00 00 00 00  |........[X......|
> > 3ca3d830  0d c5 08 00 00 00 00 00  97 28 51 5d 00 00 00 00  |.........(Q]....|
> > 3ca3d840  19 58 6d 38 00 00 00 00  19 58 6d 38 00 00 00 00  |.Xm8.....Xm8....|
> > 3ca3d850  00 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
> > 3ca3d860  eb 03 00 00 eb 03 00 00  a4 81 00 00 01 00 00 00  |................|
> > 3ca3d870  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3d880  00 00 00 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3d890  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 3ca3d8a0  31 18 10 06 84 13 e1 a0  00 00 00 00 00 00 00 00  |1...............|
> > 3ca3d8b0  1c 00 00 00 05 00 00 00  44 07 00 00 00 00 00 00  |........D.......|
> > 3ca3d8c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 3ca3e000  31 18 10 06 0b 75 3d 9e  44 06 2e 00 00 00 00 00  |1....u=.D.......|
>
> IIUC, ubifs_scan finds empty space at 3ca3c800, stops scanning and
> checks the rest of the LEB for being empty but finds something else at
> 3ca3d000. Then recovery aborts and mounting fails.
>
> Do I understand correctly that empty space should always be continuous
> at the end of the LEB?

Correct.

> How could this kind of corruption happen?

Hard to say. Maybe bad timing settings which cause writes to have no effect.
But usually this leads to ECC errors.
If you can share the image with me I can have a look and with some luck we
find traces.

Is this a mainline kernel?
Wonky drivers can lead to all kind of "interesting" results. :->

> Is there any way to recover from this?

Not really. UBIFS' IO model got violated and it gives up.

> Storage is NAND with 0x20000 erase block size and the kernel is 4.9.88.

I guess 2KiB page size?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
