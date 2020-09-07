Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BBDC43461
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 13:13:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F55320768
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 13:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EI4EHC+Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vPfOtsVr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F55320768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K3J+3M6g2h/k2b65g1tzeRpT8NXBeiJMk9EHhOyiNWw=; b=EI4EHC+QpUqY+OrfAoVhitn8TG
	gGr8CrkWOenhLcKsU5WiAHe/ZcOa89P7NDS+uTvqA4FygMq/0RHAC1zcqkInhy9ljUvtTGkucI3Sh
	KYozwdOaaEkvJ1o3FXI68Bn52R+o4k6TLkMmfirjRCKp6qVRxg+wKbmY9socIF2DHZQwX0qOlaFb4
	uwNgmKecBCX7CVtv3E7bR59L9gA1ZVL7VQbfjziYZl02/rLE9sLK6rQGYRqUFYDSlH77REY5Xs2Aw
	647kKZCpC332Zgp62oycWcz7ZWzle6be6x7qJE1yRaUGm+IBOEDSwCTKIDk1cbSd5bTKi5lihreCX
	Crhv7DzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFGwR-0006tU-Bi; Mon, 07 Sep 2020 13:12:15 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFGwP-0006so-3q
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 13:12:14 +0000
Received: by mail-pf1-x441.google.com with SMTP id d9so2344111pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Sep 2020 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mQErZJkrXkGcG6H4fNjIVIXnCcUM38mstIyVPCAFh0g=;
 b=vPfOtsVrL5xzBURuOJIF2abakOQQm8sK0XWGjTQ0Qu3KH2QQ0RKAKUJ0Mwi8w1Yf45
 ZZvs34Lv6iu/bY92n3KCMTKM16YdQ+9JBdkxEeb+3gcA02eM37f/6GMRYn2JqCPw5D3u
 AonG75dSuC4z/vsnpMkdzvXupc/7Qs6BDh95pEMO63eaJ7Oogma4zXIuySGietUYkZRU
 0nOyaeNQaaJTOvVEL6zIugvw9ApsntGP9qjgKXa6APid7Z4LjDfNtdiipkXTsvDWEoCI
 g7IWUhnVuEwH53QqjEVcQ8v3UiVH0ri1tHS1A5Rd2r0882VP7kZ6nPLmQwQBRf/VcDAj
 FYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mQErZJkrXkGcG6H4fNjIVIXnCcUM38mstIyVPCAFh0g=;
 b=tjYpTvs80/4QOS0PQhQnkHX+AW9aSEOARTZ4vhAP8MlHPPHWMuJPTR1//lCEPz91jv
 BtyNSxw7hk/xb2qK3SiG1wmcah2FTE/gMfyJZDG4Vqu+HJgG3qhsFxdKw/b6PWbIIkTd
 fa0eyeHHE6AM4g1EtGFPSirZXH/gTMJLkn5pQdqrhJNAnW2t+Pe6A/u1As17luwhNfE+
 LD5J8q5axxSIAkIX6h+6BH2uAlTUqXE1rKauNfDvBSs9gFCRAjXiw243qOTjz86nMzpc
 NGlVDFuAYCXehn75RYiLzSCH0Bs7kcduYGOpst5H/bqWvOmvg/3nggDlomB15P4/ybLA
 2SHw==
X-Gm-Message-State: AOAM533xHYrQLfKRyZihyXbvQeXQUvJE9dbCfc7cCiTuoRDrwDrh4HKZ
 edZ/Yi7vvDQtD2yqjy7C8bOfl4dQOLxFkHPK9idND/uu+rqmAQ==
X-Google-Smtp-Source: ABdhPJwclEiawZnqQ5hlu+icfPD1DKFsQQzoQX6x/l4dytRyS7bNyR7+PgOlFbhS5KtuBPyUpsXcJZcRaSq9D4+T8Z8=
X-Received: by 2002:a05:6a00:2302:: with SMTP id
 h2mr6193353pfh.222.1599484328726; 
 Mon, 07 Sep 2020 06:12:08 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Barr <itbarr72@gmail.com>
Date: Mon, 7 Sep 2020 14:11:57 +0100
Message-ID: <CAEdYtt5jXnc+_B2-P6bqt7Qk=iFB1gB0wA-JRGfgfBGQzCPtzQ@mail.gmail.com>
Subject: Question about fscrypt on ubifs compared with ext4
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_091213_177812_7A493A34 
X-CRM114-Status: GOOD (  29.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi there,

This is my first time writing to this mail list and I hope this is the
right place for my question.

I am working on an embedded Linux project that can run on multiple
platforms. One uses e.MMC for storage and another NAND flash. I want
to encrypt all the filesystems (mainly to protect against someone
unsoldering the flash chips and putting them in a reader). I want to
try and maintain a common approach across both hardware types as far
as possible. One big difference between the two is the wear levelling
is in the hardware for the e,MMC whereas for NAND I'll be using UBI.

For the root filesystem I am thinking of using squashfs which is
protected using dm-crypt. For the NAND device I have tried this out
and I can layer dm-crypt on top of ubiblock then use the device mapper
to load the squashfs. This maps nicely to the e.MMC world with the
only difference being that the device mapper is on a gpt partition
rather than a ubiblock device.

My challenge is for other read/ write filesystems. I want to mount an
overlay filesystem on top of the read-only root and a data partition.
I want both of these to also be encrypted. I have been investigating
how fscrypt can help me. (I believe dm-crypt won't work with ubifs).

For filesystems on the e.MMC I will be using ext4 and for NAND
ubifs.Documentation says both of these support fscrypt. I've struggled
a bit to find detailed documentation about how to use this with ubi
(there is a lot more for the ext4) but I think that there are some
differences between how this has been implemented on each and I'd like
those who know more to confirm this.

On the NAND side I have only been able to get it to work by using the
fscryptctl tool (https://github.com/google/fscryptctl
) as opposed to the fuller featured fscrypt tool
(https://github.com/google/fscrypt). This was following instructions I
found in a patch to add fscrypt support to mkfs.ubifs here:

https://patchwork.ozlabs.org/project/linux-mtd/cover/20181018143718.26298-1-richard@nod.at/

This appears to encrypt all the files on the partition using the
supplied key. When I look at fscrypt on ext4 it seems here that you
can't do this. The root directory cannot itself be encrypted, only
sub-directories. Reading here:
https://www.kernel.org/doc/html/v4.17/filesystems/fscrypt.html it
says:

"Note that the ext4 filesystem does not allow the root directory to be
encrypted, even if it is empty. Users who want to encrypt an entire
filesystem with one key should consider using dm-crypt instead."

So this is different. It also seems that with ubifs I can't apply
encryption to the subdirectories like I could in ext4. The README.md
here https://github.com/google/fscryptctl gives an example using ext4.
This encrypts a subdirectory called test. I don't see how to do the
same thing using ubifs. Could someone help me?

I've been using the NANDSIM kernel module for testing. At the end of
this post is a script for building an encrypted overlay ubifs
filesystem. As you can see the mkfs.ubifs is taking the key directory
and it appears to apply it to all the files on the partition. You
can't then apply policies to any sub-directories as they are already
encrypted.

I would like to use some of the other features that the userspace
fscrypt tool provides e.g. protectors (so I don't need to use the
master key directly). I can't however see any way to get this fscrypt
tool to setup encryption on a ubifs. The userspace fscrypt command
seems to want to create a .fscrypt directory in the root of the
partition to store information about policies and protectors. This
seems to fit more with the ext4 implementation.

When I try to set-up an unencrypted ubifs with "fscrypt setup" I run
into trouble as making a standard ubifs seems to create a v4 format
version rather than the required v5. This means the "fscrypt encrypt"
command fails. (Errors like this are seen in the dmesg output
[12022.576268] UBIFS error (ubi0:7 pid 6006): ubifs_enable_encryption
[ubifs]: on-flash format version 5 is needed for encryption).  Is
there some way to get mkfs.ubifs to create an unencrypted v5 formatted
filesystem?

Here is my script to create an encrypted ubifs using the fscryptctl tool:

#!/bin/bash

MTD_UTILS_ROOT=../../mtd-utils
FSCRYPTCTL=../../fscryptctl/fscryptctl
MOUNTPOINT=./mnt

dd if=/dev/urandom of=overlay.keyfile count=64 bs=1 # XTS needs a 512bit key
descriptor=`$FSCRYPTCTL get_descriptor < overlay.keyfile`
$MTD_UTILS_ROOT/mkfs.ubifs --cipher AES-256-XTS --key overlay.keyfile
-m 2048 -e 129024 -c 32 -r ./overlay -o overlay.enc.img

$MTD_UTILS_ROOT/ubiupdatevol /dev/ubi0_6 overlay.enc.img

# Try it out
$FSCRYPTCTL insert_key < overlay.keyfile
key=`keyctl show | grep $descriptor | awk '{print $1}'`
mount -t ubifs /dev/ubi0_6 $MOUNTPOINT
ls $MOUNTPOINT
umount $MOUNTPOINT
keyctl unlink $key

NB I've been working with mtd-utils v2.1.2 on a 5.4 kernel.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
