Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CE0C282CC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 12:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E352083B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 12:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZz50ar9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="V10Ft3QG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51E352083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piyqhbvzssTMz7ivR9QidKQcvNnFAoypAjGqtEexyRs=; b=kZz50ar9lTyTRd
	qFKFuemQrGKj1SHtYu6oa65sJMxKgjhKkmSbkjUsSEpFQTb6vw5znPaPLRQfoU/hic1lsnz4KhAqp
	dNvE1nmZ/SGJtGVkvZ64d8lVGF8UAXM5xNCDluG12+hIhk1BAIi/9pzHDf0Cmbv9WrHt4s+h9TBJs
	OuZMO4MTdF1PJ6+K5OgIuvJtvKUynzR7BhtQxapMO9Bc+TzZ6ykOEbA6yfErj49ITS0tMXBOMkeTD
	Br83HCNg4OrCBRQ/LGMF5QFWmzph+Adr4qt6pRNMoZIdLrvQprS1Avua36PKg78WJllo3q0DupYS1
	ofYBnlLvvLiHszZQmWVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqzv6-0006wd-9L; Tue, 05 Feb 2019 12:33:44 +0000
Received: from nh505-vm2.bullet.mail.kks.yahoo.co.jp ([183.79.57.104])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqzv2-0006wD-A5
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 12:33:43 +0000
Received: from [183.79.100.138] by nh505.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 12:33:37 -0000
Received: from [183.79.100.137] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 12:33:37 -0000
Received: from [127.0.0.1] by omp506.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 12:33:37 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 87514.80924.bm@omp506.mail.kks.yahoo.co.jp
Received: (qmail 92876 invoked by alias); 5 Feb 2019 12:33:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549370017; bh=GKCkwtckOvecv1k4fiHys9BYXvMP7vRe1qc//Gga3uM=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index;
 b=V10Ft3QG0mDlOTyXSrMzlh4eNuyDekgJlEm6aSBNkpBFXOHdnVDI2XsmarW8bKe6VdnLZD8szCOorXMDKbqpNWqSWRFC5K5/oVEHV7KEflxZStcYWAKnji1ms+H03HwmbwlmuNhwYDUBptsI+WCMNBpTFRc5s2TOgPaxAjvoPIU=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index;
 b=i+/zoIuhNS4xYKV1YQ4ezpHEPM6fz1S2bEOs65XM6TKgqlTQjpbRTjRK8z0XmRfjxctZXyaOsiin9he+vfDwqQz76Und8FdyhAr8t5Clv2SghXgtqNllJc60FauQxEyONCkswVFDYP4SpYdXLOgsBdlVRUopgbn3arB03jQevao=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP; 5 Feb 2019 12:33:36 -0000
X-YMail-JAS: dohi644VM1mK.7JrsjYcqs4iqqjkIxze.QOPJvpSExN17R_MXtdQkjhcBeqPXiMpDbEckQSOS_aoaMPjGvlQwpcg4FB3FRJBN3X83XmKOAXD7Mp2jJRRP3hQwy6f_sYRLQi9Jyi__Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: t3vMvDkVM1m3WXKadd3EorWNEESoY_ri1thX2k2MTAdi3m3
 QYZGFbVH9FuBue_pfKnaQx5hsI9s9US0Ie4LdkZecadcJ3r.zXMZcrNOe_fx
 iN9ahdbFIvvYzFFguiLrpFzAQilzmJe2Cs1EGSFaMPv7enj2ZA6lmyTPCJjv
 Q2Jpjjg2bQGBZKJwOJJogw2.C6c173JukdI09YcF2qEOiNRPtQMkbkHD683f
 jrfdBmGe9auxoKdQDocRVMrmTRzsnuTir4i7l_DOQtXTX4rd0mZ_ZTmOe67q
 mWvvQGxHzrR1IkBqdTqPMumrXfhQMsiBpYu3P9ZooVxDCx84tE9PQzBywFJv
 J4sPq_8dh96MJw9miPHybdQHPCU3taAzSSrIu6NlAoASjmpiy731xuYiTGl4
 PVn2JtG3JBZ7nNkeowg4XMKdxDXjY5bS1b4fDaRB9Qr9YXzJm3c4ZDs4NAT.
 5dzS2SEeIMYndXMW9Y1r7i8gO0VC.bYpma6UOLYN0zMfZowvYvbNXZ_k1SfN
 C4wFMsRdA7AnwnFSkB93rNzRF9S2ZgRn_38Fz.nu8yIlqJsADJW4E7W1KHvq
 xZqE6DpviTfqy7IzermQD.4fXFX0eKWm3N5xffrrHRss5T8lC
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Vignesh R'" <vigneshr@ti.com>,
 "'Boris Brezillon'" <bbrezillon@kernel.org>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
 <20190204182004.29894-2-ikegami_to@yahoo.co.jp>
 <002601d4bcb6$cf5aa140$6e0fe3c0$@yahoo.co.jp>
 <1ba13d48-8b78-2c74-53b8-cbccbcddaba9@ti.com>
In-Reply-To: <1ba13d48-8b78-2c74-53b8-cbccbcddaba9@ti.com>
Subject: RE: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
Date: Tue, 5 Feb 2019 21:33:34 +0900
Message-ID: <000901d4bd4f$02d9c800$088d5800$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Content-Language: ja
Thread-Index: AQDjxbIBRBIZFh9gHHguOm1vXT/OEwJPV3jZAckz/9sC/NxYOqd6ZywA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_043340_747632_EA66F67A 
X-CRM114-Status: GOOD (  35.73  )
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
Cc: 'Joakim Tjernlund' <Joakim.Tjernlund@infinera.com>,
 'Chris Packham' <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, 'Felix Fietkau' <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh-san,

Thanks for your advice.
Noted it.

Regards,
Ikegami

> -----Original Message-----
> From: Vignesh R [mailto:vigneshr@ti.com]
> Sent: Tuesday, February 5, 2019 8:58 PM
> To: Tokunori Ikegami; 'Boris Brezillon'
> Cc: 'Joakim Tjernlund'; 'Chris Packham'; linux-mtd@lists.infradead.org;
> 'Felix Fietkau'
> Subject: Re: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to
> retry in do_write_oneword()
> 
> Hi,
> 
> On 04/02/19 11:54 PM, Tokunori Ikegami wrote:
> > Hi,
> >
> > Very sorry for many times resending the patch mails.
> > Since I could not send the mails correctly with the incorrect mail address.
> > Still I can not send correctly the mail to stable@vger.kernel.org so I
> will
> > investigate this later.
> >
> 
> You don't have to explicitly send mail/Cc stable@vger.kernel.org. Its just
> a tag.
> 
> From Documentation/process/stable-kernel-rules.rst[1]:
> Option 1
> ********
> 
> To have the patch automatically included in the stable tree, add the tag
> 
> . code-block:: none
> 
>      Cc: stable@vger.kernel.org
> 
> in the sign-off area. Once the patch is merged it will be applied to
> the stable tree without anything else needing to be done by the author
> or subsystem maintainer.
> 
> Along with Fixes tag[2]:
> A Fixes: tag indicates that the patch fixes an issue in a previous commit.
> It
> is used to make it easy to determine where a bug originated, which can help
> review a bug fix. This tag also assists the stable kernel team in determining
> which stable kernel versions should receive your fix.
> 
> 
> [1]https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.
> html#for-all-other-submissions-choose-one-of-the-following-procedures
> [2]https://www.kernel.org/doc/html/latest/process/submitting-patches.h
> tml#describe-your-changes
> 
> Regards
> Vignesh
> 
> > Regards,
> > Ikegami
> >
> >> -----Original Message-----
> >> From: Tokunori Ikegami [mailto:ikegami_to@yahoo.co.jp]
> >> Sent: Tuesday, February 5, 2019 3:20 AM
> >> To: Boris Brezillon
> >> Cc: Tokunori Ikegami; Felix Fietkau; Chris Packham; Joakim Tjernlund;
> >> linux-mtd@lists.infradead.org; stable@vger.kernel.org
> >> Subject: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
> >> in do_write_oneword()
> >>
> >> As reported by the OpenWRT team, write requests sometimes fail on some
> >> platforms.
> >> Currently to check the state chip_ready() is used correctly as described
> >> by
> >> the flash memory S29GL256P11TFI01 datasheet.
> >> Also chip_good() is used to check if the write is succeeded and it was
> >> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
> >> checking").
> >> But actually the write failure is caused on some platforms and also it
> can
> >> be fixed by using chip_good() to check the state and retry instead.
> >> Also it seems that it is caused after repeated about 1,000 times to retry
> >> the write one word with the reset command.
> >> By using chip_good() to check the state to be done it can be reduced
> the
> >> retry with reset.
> >> It is depended on the actual flash chip behavior so the root cause is
> >> unknown.
> >>
> >> Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> >> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> >> Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> >> Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> >> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> >> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> >> Cc: linux-mtd@lists.infradead.org
> >> Cc: stable@vger.kernel.org
> >> ---
> >> Changes since v3:
> >> - Update the commit message for the comments.
> >> - Drop the addition of blanks lines around xip_enable().
> >> - Delete unnecessary setting the ret variable to -EIO.
> >> - Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.
> >>
> >> Changes since v2:
> >> - Just update the commit message for the comment.
> >>
> >> Changes since v1:
> >> - Just update the commit message.
> >>
> >> Background:
> >> This is required for OpenWrt Project to result the flash write issue
> as
> >> below patche.
> >>
> <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3
> >> 932c7b7b7df7d5fbd48f207e77619eaa7>
> >>
> >> Also the original patch in OpenWRT is below.
> >>
> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/
> >> patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>
> >>
> >> The reason to use chip_good() is that just actually fix the issue.
> >> And also in the past I had fixed the erase function also as same way
> by
> >> the
> >> patch below.
> >>   <https://patchwork.ozlabs.org/patch/922656/>
> >>     Note: The reason for the patch for erase is same.
> >>
> >> In my understanding the chip_ready() is just checked the value twice
> from
> >> flash.
> >> So I think that sometimes incorrect value is read twice and it is depended
> >> on the flash device behavior but not sure..
> >>
> >> So change to use chip_good() instead of chip_ready().
> >>
> >>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++--------
> >>  1 file changed, 10 insertions(+), 8 deletions(-)
> >>  mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
> >>
> >> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> >> b/drivers/mtd/chips/cfi_cmdset_0002.c
> >> old mode 100644
> >> new mode 100755
> >> index 72428b6..91a491b
> >> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> >> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> >> @@ -1627,29 +1627,31 @@ static int __xipram do_write_oneword(struct
> >> map_info *map, struct flchip *chip,
> >>  			continue;
> >>  		}
> >>
> >> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> >> +		if (chip_good(map, adr, datum))
> >> +			break;
> >> +
> >> +		if (time_after(jiffies, timeo)){
> >>  			xip_enable(map, chip, adr);
> >>  			printk(KERN_WARNING "MTD %s(): software
> >> timeout\n", __func__);
> >>  			xip_disable(map, chip, adr);
> >> +			ret = -EIO;
> >>  			break;
> >>  		}
> >>
> >> -		if (chip_ready(map, adr))
> >> -			break;
> >> -
> >>  		/* Latency issues. Drop the lock, wait a while and retry
> >> */
> >>  		UDELAY(map, chip, adr, 1);
> >>  	}
> >> +
> >>  	/* Did we succeed? */
> >> -	if (!chip_good(map, adr, datum)) {
> >> +	if (ret) {
> >>  		/* reset on all failures. */
> >>  		map_write(map, CMD(0xF0), chip->start);
> >>  		/* FIXME - should have reset delay before continuing */
> >>
> >> -		if (++retry_cnt <= MAX_RETRIES)
> >> +		if (++retry_cnt <= MAX_RETRIES) {
> >> +			ret = 0;
> >>  			goto retry;
> >> -
> >> -		ret = -EIO;
> >> +		}
> >>  	}
> >>  	xip_enable(map, chip, adr);
> >>   op_done:
> >> --
> >> 2.11.0
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> 
> --
> Regards
> Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
