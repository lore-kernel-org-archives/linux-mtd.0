Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF77C43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 14:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A7021743
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 14:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V03WFtq9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.com header.i=@mail.com header.b="jvZnqKmR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12A7021743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0rCR56vBVaa43xyPSmTLehoAK9xKU10nISWxwIAQknw=; b=V03
	WFtq9fnuyVIv3Dafk9SYW+dYwStjPMvx29Sojfv/dReU37GyLBu7BKX82aWYAjHCjTdAO2BxFg9SH
	AZvpiNl4gbZBGThJ1O+GvuFHLrJsq8BTKvZ1w86j+Z3hF6G0j+hiQssXSyzsPgyY+0+bjnjGbbz0p
	IT+n2a+vZxflsPWmahJHl+5/D+0YGLNdx0XxdIx8dwMStBqDw6fU3G2hdJM+EYoEGRjMlqbcyTD6G
	46b7fv0H2lsUkMv4D4CV6H+7nw4JLPbQMyEvbss8J5RaFU2Efeu235jsLHdkzfeXiZfYkv5vYD1vH
	J0aBMfIOcJXEpUco2o9wtJXM4ZVeHqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLpwS-0006q3-DT; Wed, 01 May 2019 14:10:36 +0000
Received: from mout.gmx.com ([74.208.4.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLpwP-0006pA-94
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 14:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1556719828;
 bh=wZRLBEp8Rw4YuDwWlsob+y0JkLYnqCcA/OiIjnlMciU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=jvZnqKmR3AI2xEQ7d23CHs64HuVWFxbm1jE9XQ1AV/A5t3U64md7jGzTS+j++DQDG
 nDFtx5PT5fx+BQDXjNeALzZIPpH6BtmhVWCTunV3I5jFA+mXgo4RMQjhJJZajEYgiE
 HsZ1kAxeuLCVbo9IgZwRPCWsiMXVBDloKCTrliII=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [91.188.62.81] ([91.188.62.81]) by web-mail.mail.com
 (3c-app-mailcom-lxa08.server.lan [10.76.45.9]) (via HTTP); Wed, 1 May 2019
 16:10:28 +0200
MIME-Version: 1.0
Message-ID: <trinity-6f5a6dee-773f-4141-9b34-daaa48446eec-1556719828713@3c-app-mailcom-lxa08>
From: Vesta <laguna-mc@mail.com>
To: linux-mtd@lists.infradead.org
Subject: Mounting the squashfs/read-only Linux file system on MTD partition
Date: Wed, 1 May 2019 16:10:28 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:1WcgaaKfzTh7tsUQ4D/ERVcwjs4w/un1sPpeWOdlVgaKUfOvKDIuLHmDSUkCIZgZSOuvL
 qBsDe8WbUeyn0IztnsbfpSEvSlKx7z/E0PCnugmqpQprZZu7V9IxYqGm2FujEPyH1R567eL3XHLT
 cLkoQWZNtadgCWPbq80/29JlYosf2N2TC//53Ib9Xw1YJbqkcQ6ITU9hhil21+HTaPdAGi/iovl3
 Ri4E9U0nL4U5gRoLA2zGTjbIuDTUergH6nLRNE1u3YI0t1LInZDs9SnQ7PlsDuhOIwvUF9x6BbHL
 5E=
X-UI-Out-Filterresults: notjunk:1;V03:K0:vlmcC5gTuW4=:uv2WIMO+ld2xJuooyXBg8x
 Iu4VXJZpZmRrTqmjEPDVJOg25JlvK/UMG54bVNsw4CJc6NT8WVBj7U5VhsgnylHs/kQGZ/+4I
 DqNyJRY1evlp9NoOyvlo5VFqcnpkVRxukdCemoRgtL0Sizy2Pc7lRF8gOhsgNQE82JVnRpgiH
 HRmQgcpjnKbM+GcLv5miIRVuhLCqy5wJob1WTaI7W7ACP5r2oVmzq9OYCyuanu9ZVjvu+mhvv
 XHUoTvQxc2vEZbLk9S1J5Je0t7ao5IyMD8MqICTImer5+qXlf9tncwj8x5zKg0GCSr+fUvJz0
 PwtZNIFpR0QwRyPWZHgZ5p46LkYvckkpFgiNX1jriytLkYXqCgVWNUqobmtLqAqPSr8DuHzcX
 hRja4NI31E09MOPX5/l+Ni3R7IX5rmkOdJj1h5BNfH40yQztpYNIFtcqzb6U+OfKi9cQ41+ch
 Org6rtB9geMVaQcYoo/t1Qvs3eY6BG/Ph5bXVMVVuDEZ4+fBEKsIS6plnH1IRQygQLKz5HlZa
 hBWnySkccYAwkEnhh6g6OlWb9adPyPShSOgJnByQpI+uPIKDNxpksTvlta+PrCkJb9kcdmOT8
 oWBMgn8bRr8QjtWM9+EXag58i8TCIwwV+hWKjcDEWs6CdD8m2h0CIxQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_071033_427798_223C824B 
X-CRM114-Status: UNSURE (   5.42  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Device have embedded Linux version 2.6.26.5, at boot time the system creates 11 MTD partitions on NAND flash.
I'm in limited Busybox shell.
BusyBox v1.10.2 (2017-08-02 14:07:25 CST) built-in shell (ash)
Enter 'help' for a list of built-in commands.

/bin/sh: can't access tty; job control turned off
# mount -t proc proc /proc
# mount -t sysfs sysfs /sys
# mount -t tmpfs tmpfs /tmp
# mount -t tmpfs none /dev
# mkdir /dev/pts
# mount -t devpts devpts /dev/pts
# mdev -s
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00060000 00004000 "u-boot"
mtd1: 00020000 00004000 "u-bootenv"
mtd2: 013e0000 00004000 "ROMIMAGE"
mtd3: 00700000 00004000 "HALFIMAGE"
mtd4: 01260000 00004000 "LINUX_ROOTFS"
mtd5: 00200000 00004000 "HS_FW"
mtd6: 00100000 00004000 "FPAR"
mtd7: 00080000 00004000 "CISCO"
mtd8: 00020000 00004000 "EEPROM"
mtd9: 00080000 00004000 "NVRAM"
mtd10: 00080000 00004000 "CA_DATA"
# mount
rootfs on / type rootfs (rw)
/dev/root on / type squashfs (ro)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
tmpfs on /tmp type tmpfs (rw)
none on /dev type tmpfs (rw)
devpts on /dev/pts type devpts (rw,mode=600)

# df -h
Filesystem                Size      Used Available Use% Mounted on
rootfs                    8.0M      8.0M         0 100% /
/dev/root                 8.0M      8.0M         0 100% /
tmpfs                    13.9M         0     13.9M   0% /tmp
none                     13.9M         0     13.9M   0% /dev

# ls -al
drwxr-xr-x   19 1005     1005          219 Aug  2  2017 .
drwxr-xr-x   19 1005     1005          219 Aug  2  2017 ..
drwxrwxr-x    6 1005     1005           86 Aug  2  2017 .svn
drwxrwxr-x    2 1005     1005          432 Aug  2  2017 bin
-rwxr-xr-x    1 1005     1005       715844 Aug  2  2017 cordless_nodect.coma
drwxrwxrwt    5 0        0            2720 Jan  1 00:04 dev
drwxr-xr-x    2 1005     1005            3 Aug  2  2017 eeprom
drwxr-xr-x    4 1005     1005          386 Aug  2  2017 etc
drwxr-xr-x    2 1005     1005            3 Aug  2  2017 fpar
drwxr-xr-x    4 0        0              48 Aug  2  2017 home
drwxr-xr-x    2 1005     1005            3 Aug  2  2017 hsfw
drwxr-xr-x    3 1005     1005          287 Aug  2  2017 lib
drwxrwxr-x    2 1005     1005            3 Aug  2  2017 mnt
drwxr-xr-x    2 1005     1005            3 Aug  2  2017 nvram
dr-xr-xr-x   27 0        0               0 Jan  1 00:00 proc
lrwxrwxrwx    1 1005     1005            8 Aug  2  2017 root -> tmp/root
drwxr-xr-x    2 1005     1005          642 Aug  2  2017 sbin
drwxr-xr-x   10 0        0               0 Jan  1 00:00 sys
drwxrwxrwt    2 0        0              40 Jan  1 00:00 tmp
drwxr-xr-x    7 1005     1005           73 Aug  2  2017 usr
lrwxrwxrwx    1 1005     1005            7 Aug  2  2017 var -> tmp/var
drwxr-xr-x    6 1005     1005         4051 Aug  2  2017 www

How to mount the Linux root file system on mtd4 (LINUX_ROOTFS)? It's squashfs/read-only filesystem. What is correct steps?
Does all the rest MTD partitions have JFFS2 file system?

Regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
