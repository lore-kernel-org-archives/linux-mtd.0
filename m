Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16057C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 14:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E22321974
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 14:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yb9ApEmA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPW6aIve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E22321974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6me2aV97wfit6jR22srNFmlppeBeMLeixQgR0IJ/26I=; b=Yb9ApEmANb9+/Gz82ziIGc3QP
	OW1LX7OAOiFr0mLFyTR5jsp8bp/wYI5351FwNjjmD34MrWzEzKfoGjU3PsMolEBUef5lCrcgIax46
	tAxK8VJ/lvG65S/nf5f2szoD9QEDTzF7ZmlwR5CRTBZ/8pSMAUMyYa6nVKK1/2o755PZTcpOvtB7r
	AGf6PXCIij/cNf0MansFfOhQbc0y0vgDgOR5kqSscknXusibom+I785c5DWY4oJH+v4XDxFtXbE0R
	Gk2ZygOhkW9z6Pe6E2uShRkaqoQPOcfoU/VBKFCNRPCr36BdyhWoBsVhUvHpUW/ViJzXbFF3eTRXN
	zkWQDNFNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvCw-00061n-Mg; Thu, 17 Sep 2020 14:48:22 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvCu-00061J-CX
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 14:48:21 +0000
Received: by mail-ua1-x941.google.com with SMTP id 77so774502uaj.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2020 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6c3fatYvjjopsp2TORMhemWLXEbb7EeUUQ7S0mllMzU=;
 b=SPW6aIvehPppSGjSsRep9pd9JR+MUYM7gdN6oDNlxQCzJsBOzcYtCHsUeoglDgn4j2
 L0HyFpq+u1PUQOGOUQZ+g69CH4eNchPmFlKFotZAjuYEH+Q7mQL7kMFR/AaPjP2EkJjV
 o8MiYjR0/GctX4C9U7i/cqziHO5Lth58XPm4xf38+LPArN2/cp8rQlXUuxhHYIgvewGn
 BFye4Ld+z4qrI7tgW6LHmkTvPDtKiqADRZoBbG0Nipfti8vhXavcpF0L8/Fw0eaG2E6/
 exRqud6q279rWu0GSAt+A4Ga6xe/NEecggZKGT+PRRV8MzOnc9FuQSBNLnFGkJYmht7E
 /h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6c3fatYvjjopsp2TORMhemWLXEbb7EeUUQ7S0mllMzU=;
 b=BYup0A4IIK64/b9RPM8UVQRlmdAdDo/LUFXoaItfp2Xe62L5wvGAWBzjC08lMg2Ww6
 h2uf0mQS3oVQrB5M7rcjtisNi9IaI9Hv3KqcUaYDLQGTLJ170nzxkS3lk8aoEJi0nFID
 QaOA/RB8ExX7VRnRqSvz01YdBVohK1QBuoNaWHHVZ5TAwkvwjfdSwMR4gKmDXLwabhjb
 7Nj/4ToSSyCz1Qo/kwdLDzv+vJTjb6k82foYr2cPt1p0RFFqcYO2fmii5Fgatkoq+q0w
 sne4vugMrAyqlh9V3gkMS19cD4nWB7JggZMsE4yrHleIw5LDw47BL+Pv29TuFVNDg29X
 gc3Q==
X-Gm-Message-State: AOAM531TiK7lG9us8LMUZDN7Z7pY12534sn2TR1E609cliMtptoN430K
 WGz+lMLG0EgAiPLs3TGbVA4DEpR5JjowwkVSh6g=
X-Google-Smtp-Source: ABdhPJwBAyOm+IvB/syihYq58L6PGafkO5u516Clb6wSMjKEn0IvtOQTCIXjQFsAnrmlntRdjtAnazy9bKx2qc4mrws=
X-Received: by 2002:ab0:702a:: with SMTP id u10mr15738466ual.59.1600354096824; 
 Thu, 17 Sep 2020 07:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
In-Reply-To: <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
From: Kristof Havasi <havasiefr@gmail.com>
Date: Thu, 17 Sep 2020 16:48:42 +0200
Message-ID: <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_104820_440825_868A6AAE 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the meantime we could create a simple "clean trigger", independent from our
business logic! It is done by creating random files and then deleting them.
BUT *the size* of the files and *the number* of them do have an influence.
As well as whether we delete them or not.
We could reproduce this behaviour on multiple devices.

A stripped down version of the trigger-script (without echos and such):

```
#!/bin/bash
DEST_DIR=/root/panictest
FILE_CNT=15
FILE_SIZE="10M"
DO_CLEANUP='y'
POST_SYNC_SLEEP=1

[ -d "$DEST_DIR" ] && rm -rf "$DEST_DIR"

mkdir -p "$DEST_DIR"

for i in `seq 1 $FILE_CNT` ; do
    OUT_FILE="$DEST_DIR/file$i"
    if ! dd if=/dev/urandom of=$OUT_FILE bs=$FILE_SIZE count=1 > /dev/null; then
        break
    fi
done

sync
sleep $POST_SYNC_SLEEP
df -h

if [[ "$DO_CLEANUP" == 'y' ]]; then
    rm -rf $DEST_DIR
    sync
    sleep $POST_SYNC_SLEEP
fi

reboot
```

Without "chk_lprops" the panic is only visible after the restart, but if it was
enabled the following assertion was triggering an immediate panic:
(Should I "reformat" long log lines in the future or leave them verbatim?)

UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231
UBIFS warning (ubi0:4 pid 649): ubifs_ro_mode.part.1: switched to
read-only mode, error -22
CPU: 0 PID: 649 Comm: ubifs_bgt0_4 Not tainted 5.4.64-00030-gbcb07cf6f1bb #35
Hardware name: Atmel SAMA5
[<c010bb5c>] (unwind_backtrace) from [<c010a7c8>] (show_stack+0x10/0x14)
[<c010a7c8>] (show_stack) from [<c0260c40>] (pack_bits+0x1ac/0x1d0)
[<c0260c40>] (pack_bits) from [<c0261854>] (ubifs_pack_pnode+0xa4/0x144)
[<c0261854>] (ubifs_pack_pnode) from [<c02631c4>]
(ubifs_lpt_calc_hash+0x134/0x220)
[<c02631c4>] (ubifs_lpt_calc_hash) from [<c026acdc>]
(ubifs_lpt_start_commit+0x754/0xe54)
[<c026acdc>] (ubifs_lpt_start_commit) from [<c02599c8>] (do_commit+0x1d0/0x484)
[<c02599c8>] (do_commit) from [<c0259dbc>] (ubifs_bg_thread+0x140/0x154)
[<c0259dbc>] (ubifs_bg_thread) from [<c012fef8>] (kthread+0x114/0x144)
[<c012fef8>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc71fffb0 to 0xc71ffff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231
UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231


Regarding the variable space (fsize-fcount-docleanup), these were our first
rudimental findings:

fsize | fcount | ~used% | docleanup | panic? |
----- | ------ | ------ | --------- | ------ |
 10M  |  10    |  ~10%  |    yes    |   no   |
 10M  |  15    |  ~15%  |    yes    |   yes  |
 10M  |  NA    |  ~25%  |    yes    |   yes  |
 10M  |  NA    |  ~50%  |    yes    |   yes  |
 10M  |  NA    | ~100%  |    yes    |   yes  |
 10M  |  NA    | ~100%  |    no     |   no   |
  1M  |  NA    | ~100%  |    yes    |   no   |

So if we write >100M worth of 10M files and delete them we can
"ropustly" trigger
the panic. But if we do not delete them, the panic does not occour.

But if we fill the flash with 1M files and delete them, we didn't see the panic.


On Thu, 17 Sep 2020 at 15:24, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Tue, Sep 15, 2020 at 4:51 PM Kristof Havasi <havasiefr@gmail.com> wrote:
> > What I have tried:
> > =================
> > Based on the panic log [1], I can see that the panic happens here:
> >     ubifs_lpt_calc_hash
> >         `->ubifs_get_pnode
> > inside the iteration over the LPT pnodes with hashing
>
> Hmm.
>
> > Questions:
> > =========
> > Q1: Are the chk_* knobs authentication aware? Or do they report so loudly
> >     because I enabled the authentication and they cannot handle it yet?
>
> They should. If not they need fixing. :-)

They do seem to be OK, because with chk_lprops enabled, and the clean trigger
script the panic (UBI assertion) was cought immediately, not only
after a restart.

>
> > Q2: Could I use `integr_chk` with authentication and so that the UBI volume is
> >     my root filesystem?
>
> What is "integr_chk"? Do you mean the integ test from mtd-utils?

Sorry, I didn't write the correct name: I meant "integck" from mtd-utlis.

> > UBIFS (ubi0:4): Mounting in authenticated mode
> > UBIFS (ubi0:4): background thread "ubifs_bgt0_4" started, PID 632
> > UBIFS error (ubi0:4 pid 1): ubifs_get_pnode.part.6: error -22 reading
>
> So, it returns -EINVAL. Is this with chk_* enabled?

In both cases: with and without enabled chk_* knobs.

>
> > pnode at 7:37186
> > (pid 1) dumping pnode:
> >         address c7138c80 parent c7138e80 cnext 0
> >         flags 0 iip 3 level 0 num 0
> >         0: free 0 dirty 255408 flags 1 lnum 0
> >         1: free 0 dirty 190192 flags 1 lnum 0
> >         2: free 0 dirty 255360 flags 1 lnum 0
> >         3: free 0 dirty 248896 flags 1 lnum 0
>
> Sascha, does this ring a bell?

FYI: here sometimes I see some node(s) with non-zero value for "free".

>
> --
> Thanks,
> //richard

Just let me know if I can provide any other useful information.

Thank you,
    Kristof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
