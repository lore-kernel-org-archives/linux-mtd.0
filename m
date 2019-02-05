Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7A5C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 13:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18631206DD
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 13:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AAsUWnBa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="pQiejRdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18631206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bo/feMmt3LoWZ/MlgWYFwHThxKh/Fzgounprg4yOUvI=; b=AAsUWnBaEw5Etf
	7YuyioQPGEbyKtjtvClsObyCMIqkzibKQhIfhzLEPsI4JQ5AqukEzEeTK0jWPHhWCzQAW88HS5k6K
	cWAtOk4zyhuVvS1V6OwcgWiaA+fbt+rBWJCLDqEP5wMxnBFzPVQFfPAByaV4+qoTbcpUPDlgA2VYR
	tl/vie61abDv/1joRuVy4sHcelIS3V8vcPmEx0ZNEJr5wuoO0FDDTCFmCgvmm5zCZPeuGoD79tl2v
	FI/5Ku/Bi2zICnLKPASk0vT50mXMZ2EzY0JqtcMeWVgGfPooX6WWCeGJyCuCNG2Y7ts4oVHaTr0yo
	T5ThvqRnRy+DjUyvGFOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0ZL-0002cm-II; Tue, 05 Feb 2019 13:15:19 +0000
Received: from nh602-vm5.bullet.mail.ssk.yahoo.co.jp ([182.22.90.30])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0ZC-00029M-G6
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 13:15:18 +0000
Received: from [182.22.66.104] by nh602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 13:15:05 -0000
Received: from [182.22.91.132] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 13:15:05 -0000
Received: from [127.0.0.1] by omp605.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 13:15:05 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 382149.4893.bm@omp605.mail.ssk.yahoo.co.jp
Received: (qmail 5738 invoked by alias); 5 Feb 2019 13:15:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549372505; bh=0E1eTM891qMRLhFUODY9oNt/1pk9HtiFjAovBw2D2PQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index;
 b=pQiejRddMhWVCwoJ6a5l2V245ACMUdEaAMSnOvUxjJTEdySAgOK28FVVnSn8b9CYQSczmq2dJtRvVGxDWGJ2tQ3RSJHe39uWqZzOb/iC5vj8979hCyF8803FpQHHES7ln8VPh8AruCu/QJZAh5qLH85hkSw1x+Ag05zBJSnlkAE=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index;
 b=fwIrthRP1st724G2UavxoOEeRTIsR/zyattlKp8tHrhy8GmRW0hrWNR49ea62lxE7UpOsCFRg3S1FCM5R+ZcAg2vA+8LG+fwGKdhWKmK4BxMgTNCiNG1yLFKLNSOKvUUw4vbs25g3C/uLCojgZWGi299iRLnRFSv93PVDUycXwU=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with login)
 by smtp5003.mail.kks.ynwp.yahoo.co.jp with SMTP; 5 Feb 2019 13:15:05 -0000
X-YMail-JAS: P43lkRIVM1njKSyHDlZOnzTv12ZLjZVmt4Pi4XPxO5eRJvjgmdsk5vK4I5MGZ5YUqgSPGBKGfiHFj.JQvBhNMt.4zeG.VgVcOSoG_.ScZmrFmUzdAAmIhuFjphcWbd2eL_H158ewqQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: uQwVM0oVM1m0tbZw19WHACSQ3rQkLy1_Gw4na0Q5iGqj_KH
 0PLcjQ23gAD2s2gwG7KK6fqYH18nz.4z.rrjoqvdfJ9vLe.dIGLwViz717mq
 9d175_XqNJu0Yyl1WQ7fdPDiBk2Wb9h9hsAr73VAqQDBAlfn.txwdou8nwEl
 RBpphIiv9hdBqrxCXw_OkT5QyDkUhbimgGpOsxC0zK45Fi9jxhtAowonp5OM
 lVP9ihejXYXwi.j6b6GHZOT74Pjm4CDODZGmAd6._6YIo0VEXnlft.LvpJPa
 FCjNy55wH5nbOBEZa4ki6ymjrAc9BityuvyxkX.nuLOwIksTyb0ZZycvWj9O
 qxt0lG4s4a54sCAtjkktI9fx95D2Y8g8LaznKLJUwCQuc5rmIgvKhAQrMXkc
 pk8vNJoZmbid0RXF_n5BkLlTGBYiv9ZbAR.ofKO_s6Zz66c9AkvQLTH01eVl
 uWR2ZuduhZ81Fp58A.hnwuNbvWJMGUm03DFB8mbQKZ_o6eNASwYCgdfWxe2W
 gfMUSfmWYNgvq0oCDPcBZnB6eSRmaeY7jNpnGzkdDzu1NkCPQqdwsHxBb9SA
 7YEG3iA5A0RtVJYFNjxRqERE5J3nKdN_0H3VD.HQeu7UkxhUo
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Boris Brezillon'" <bbrezillon@kernel.org>, <psobon@amazon.com>,
 "'Joakim Tjernlund'" <Joakim.Tjernlund@infinera.com>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>	<20190204173550.29703-3-ikegami_to@yahoo.co.jp>
 <20190204190534.456d7bb4@bbrezillon> 
In-Reply-To: 
Subject: RE: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Tue, 5 Feb 2019 22:15:02 +0900
Message-ID: <000d01d4bd54$cddfdd50$699f97f0$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Content-Language: ja
Thread-Index: AQITFMB2buvM7RscwGDN/9ZvoNjxcwFaP3ntAu2efYGlMQXgYIABOcLA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_051510_940786_6D69219D 
X-CRM114-Status: GOOD (  28.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Boris Brezillon' <boris.brezillon@free-electrons.com>,
 'Chris Packham' <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, 'Fabio Bettoni' <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Przemyslaw-san and Jocke-san,

Sorry for the endless loop problem that was caused by my change.
As Boris-san mentioned I have just understood the problem and it looks that
it will be resolved by this change also.
Anyway I also will do try to fix by the change.

  Note: My old email address is not able to be used now.

Regards,
Ikegami

> -----Original Message-----
> From: Tokunori Ikegami [mailto:ikegami_to@yahoo.co.jp]
> Sent: Tuesday, February 5, 2019 3:28 AM
> To: 'Boris Brezillon'
> Cc: 'Boris Brezillon'; 'Joakim Tjernlund';
> 'linux-mtd@lists.infradead.org'; 'Chris Packham'; 'Fabio Bettoni'
> Subject: RE: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready()
> from do_write_buffer()
> 
> Hi Boris-san,
> 
> Thank you so much for your quick reviewing.
> I see and will do that later.
> 
> > This patch actually fixes a bug (as reported in the other thread), so
> > please add Fixes and Cc-stable tags and explain why it might cause
> > an infinite loop in the commit message.
> 
> Regards,
> Ikegami
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:bbrezillon@kernel.org]
> > Sent: Tuesday, February 5, 2019 3:06 AM
> > To: Tokunori Ikegami
> > Cc: Boris Brezillon; Joakim Tjernlund; linux-mtd@lists.infradead.org;
> > Chris Packham; Fabio Bettoni
> > Subject: Re: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready()
> > from do_write_buffer()
> >
> > On Tue,  5 Feb 2019 02:35:41 +0900
> > Tokunori Ikegami <ikegami_to@yahoo.co.jp> wrote:
> >
> > > It is enough to use chip_good() only so chip_ready() is not necessary.
> > > Since chip_good() is doing the same check chip_ready() is doing plus
> an
> > extra
> > > check to make sure we end up with the data we wrote.
> > >
> > > For this change the order to check timeout also will be changed at
same
> > time.
> > > The order is not a hard requirement, it's just better to avoid the
case
> > where
> > > the data update happens just after the timeout has expired.
> > >
> > > Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> >
> > This patch actually fixes a bug (as reported in the other thread), so
> > please add Fixes and Cc-stable tags and explain why it might cause
> > an infinite loop in the commit message.
> >
> > > Cc: Fabio Bettoni <fbettoni@gmail.com>
> > > Co: Hauke Mehrtens <hauke@hauke-m.de>
> > > Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > Cc: linux-mtd@lists.infradead.org
> > > ---
> > > Changes since v3:
> > > - Update the commit message for the comment.
> > > - Change the email address of Tokunori Ikegami to
> ikegami_to@yahoo.co.jp.
> > >
> > > Changes since v2:
> > > - None.
> > >
> > > Changes since v1:
> > > - None.
> > >
> > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > index 91a491b..ca9d5fa 100755
> > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > @@ -1878,14 +1878,14 @@ static int __xipram do_write_buffer(struct
> > map_info *map, struct flchip *chip,
> > >  			continue;
> > >  		}
> > >
> > > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > > -			break;
> > > -
> > >  		if (chip_good(map, adr, datum)) {
> > >  			xip_enable(map, chip, adr);
> > >  			goto op_done;
> > >  		}
> > >
> > > +		if (time_after(jiffies, timeo))
> > > +			break;
> > > +
> > >  		/* Latency issues. Drop the lock, wait a while and retry
> > */
> > >  		UDELAY(map, chip, adr, 1);
> > >  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
