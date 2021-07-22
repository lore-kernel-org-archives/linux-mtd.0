Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9084EC6377D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 07:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DACC60249
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 07:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DACC60249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NHoiS9detIB9+pcTtQl74YSJRK8pEwGhI/TLXj7U2ac=; b=MgU+cMgFFrPLoI
	fbInRfMzz710Ad2NbwYta5j4+GcYo3ObkqdE8kZIWyU5jec+U78nDn8/t+07b51WPkkcX+Qg9ybKk
	POnMuyutj7fy7x/jLdYBi5Iw803Fd57ci+6Ev2JHDhGb562J5/1fANdnQSSjfUvJgin1v2gBBCemu
	4H2Y5AbHaCqFzEcDgSR07i6LoHVH3lHq9yB8lowGOpjrnxuz5wvel8vKZlel4l6el2acohWfM4BlH
	uJrrm83I2kuPgvzS/iLHT29EwZ5dmT8tLJrR/HV6sFbqGGM4Pyqd8S9TDC+8DNwfz30ddUW+Dzi1u
	PGmojvudStGsjBLrC6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TWS-000bEK-78; Thu, 22 Jul 2021 07:53:36 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TWM-000bDi-GN
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 07:53:32 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 109E55F778;
 Thu, 22 Jul 2021 09:53:26 +0200 (CEST)
Date: Thu, 22 Jul 2021 09:53:24 +0200
From: sg@emlix.com
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Subject: ubifs: corrupted dirent (ENOENT), problably related to O_TMPFILE and
 linkat
Message-ID: <YPkj9NUxNLGG5tjL@emlix.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_005330_739459_65408B4B 
X-CRM114-Status: GOOD (  18.74  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

we encountered an error in ubifs most likely when using O_TMPFILE and linka=
t.

The code (dir.c:ubifs_lookup) we ran into states

        /*
         * This should not happen. Probably the file-system needs
         * checking.
         */
I'd love to, but how? since recovery.c should have taken care of that befor=
e AFAIK


I wish I could give more elaborate information but this one is hard to track
and reproduce.

What has been tried so far and also was the first encounter

- systemd-coredump has been triggered (in our test-setup with kill -SIGABRT=
 of
  some process)
- hardware power-cut (the timing when to poweroff has yet to be found)
- on replaying the journal the fs was mounted read only
- on later boots the fs was mounted properly but when accessing the respect=
ive
  directory an inode could not be found (with ls).
  Traced it down to ubifs_tnc_lookup.
- dead directory entry error lead to ro_mode

Following part of dmesg shows the error

   [   67.480858] UBIFS DBG gen (pid 241): dir ino 93, f_pos 0x0
   [   67.481634] UBIFS DBG gen (pid 241): ino 40735, new f_pos 0x295e98
   [   67.482024] UBIFS DBG gen (pid 241): ino 98493, new f_pos 0x9f9a65
   [   67.482753] UBIFS DBG gen (pid 241): ino 98146, new f_pos 0x18b5dd81
   [   67.483257] UBIFS DBG gen (pid 241): 'tmp' in dir ino 93
   [   67.486920] UBIFS DBG gen (pid 241): 'core.WPEWebProcess.0.e7c55980c2=
30401d8e3941e72f56a95c.251.1530017543000000' in dir ino 93
   [   67.489412] UBIFS error (ubi0:2 pid 241): ubifs_iget: failed to read =
inode 98493, error -2


systemd-coredump opens a file with O_TMPFILE, writes to it and later calls
linkat()
With O_TMPFILE disabled in kernel the error does not occur and systemd uses=
 an
alternate code path.

System =


  Linux 4.19.186 #26 SMP Wed Jul 21 13:19:08 CEST 2021 armv7l GNU/Linux

with following patches of which I thought they might solve the problem
  325b731983d010d358505bf2c40f5e0069af62d2
  dd7db149bcd914db8fdeb19cd5597c0740121bc7

/data/var is bind-mounted to /var the directory used by systemd-coredump.
/data is the actual mountpoint of ubi volume ubi0_2

  systemd version 239

Hardware
  i.MX6Q on a phyCore SOM with a SPANSION S34ML08G201TFI00 NAND flash

  The power-cut is done hard by pulling the CPU reset line.


Can you give me hints how to proceed on this?
- are there any patches from 5.14-rc2 I might have missed
- how to reproduce the error more reliable, ie. find the right time to cut =
power
  It is now at around 4s after issueing 'kill'. With a margin of 500ms
  and step width of 25ms
- with the mentioned above I might get my hands on more useful
  information than the blank tnc and journal spam with enabled DEBUG (had t=
o set LOG_BUF to
  24 (16M) to capture/save all messages
- how to recover by hand
- might it be safe to just get rid of the inode in ubifs_readdir when it ca=
n not
  be found? In our particular case it is just a coredump an we don't care f=
or =

  data loss as long as we can still use the rest of the volume/
  filesystem.
- any more information you require

@Zhihao Cheng I put you in CC for you seem to have some experience regarding
similar problems

Thanks in advance and regards


Sebastian Gro=DF

-- =

B.Sc. Sebastian Gro=DF, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11,
Gothaer Platz 3, 37083 G=F6ttingen, Germany
Sitz der Gesellschaft: G=F6ttingen, Amtsgericht G=F6ttingen HR B 3160
Gesch=E4ftsf=FChrung: Heike Jordan, Dr. Uwe Kracke
Ust-IdNr.: DE 205 198 055

emlix - your embedded linux partner

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
