Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B858FC34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 07:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A664207FD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 07:20:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPKc2C3J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO6B4I8W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A664207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgaEIUDCfWlnkW+ToeKrX1jX8xGw8XixvjdCm5S3ha4=; b=fPKc2C3JnwMOcU
	sLszOgKS3uDAQsPnpp4fwzAti/J3ebQioKjiIm+GS7cCLzSSRsnAnJhRv5A42vwVkUEbzYtV5M6Py
	2pfpDtPds3H/5zFUAqBf929wRfo/mARZ70dDTaeaYn9QsRrFBQB/S+TmFw3iJah1gvNk8S4GKWBFN
	QXMTIjQZ3I3QjmV8KRnTK7XzE0pDQX5gn3xgSYOU9P9+jIy+u7+FEN5RSxG6MirsIE6tU7Wc2wOKI
	ny8EZDh6wyxeUx0VcFJRLnL70lXbnVqT6CwNu3TMFkDpc4DXeAy7dfl6mJmrJhPoFiDuS+blMqRzX
	r7A4PtDbKn9jp91Czquw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3xBR-0000Nx-RH; Tue, 18 Feb 2020 07:20:41 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3xBO-0000Nf-RL
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 07:20:40 +0000
Received: by mail-il1-x143.google.com with SMTP id p8so16408995iln.12
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 23:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7jGl0wNCwOoe/f3cnv39Il46yTDC1l6xo6CwzoreJxU=;
 b=lO6B4I8WSsFjKKmxAxN5wqEqtcta6kLddINbSf9+T+lC0uBzrhQNhlKxxKK/CkmY2N
 7LTGEND2H9q+YIE3LRNpeImX2TLMY2DcQeFS7yeSRBjQgkSOMYYPGzKJxX3UOhICF4uz
 x4ZtRw3xFZXmtim7AG3xsyFPQOUsKRLQIk4z/mah/l9cBzGaX1EdKaj8BmiqXd4x9e/V
 ZYyYAftP+2SwcOsKyYdxyqxA3X5AJGVX/I6Kk1iSaA1KSc/4PFw9L7hQOV/Mu/tUeJ/4
 /yV4UCPyTCPEqIDUb1/rOE/hBSanmuUE1JmmkLuc5xHwui7u3cV6ZCirbQ3TMS44kxlR
 ClMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7jGl0wNCwOoe/f3cnv39Il46yTDC1l6xo6CwzoreJxU=;
 b=FP5Au3ru4O83yPlUOIFjs5bUZPL9dQwWvy+MmZ9PQdLx7ScO895cSu5oTrRG7QPKcO
 ZMpmTyr60aWk+aXH2JS3pgghcZ6oaU4Bdkdw77MEH3stbBRbmGtWYRjtv028TFf6BJ0J
 IKtHKR5WqHTZBGvQA2BDWtkXgMt3Ret9SryQvUGGYBdzyuUjeyapMVolDbxo8JlVsGBY
 H5llIngf/yWWih5WoH44+UPAIh0aM/cZUgyvyNHXH20xPqiS6DwDrU5yzBbxTGZOLbYK
 mLk30v6N5c2XSurXCpCmRNRYKiXxc12p9MPZM5DN93JFAR5AWh1C8MzAU3oADDbLgMT9
 /fUw==
X-Gm-Message-State: APjAAAUSrApcM3o2rGU0RXYGpuGCz6Fh2M/kbrVu7c/MODmY2Srk6d10
 KxRpH8vGbaKcaEdPxyQ0wSTfBmUo/XDNzwzVqyE=
X-Google-Smtp-Source: APXvYqw6842SKZ5OauYiNhy08S/JKCohjTd+EbXULneGmKen0zPFYa1bUB2YJLmHkUlhAP43GRCFWAzjgav7zYJ2f78=
X-Received: by 2002:a92:5855:: with SMTP id m82mr17716040ilb.302.1582010437335; 
 Mon, 17 Feb 2020 23:20:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 17 Feb 2020 23:20:36
 -0800 (PST)
In-Reply-To: <CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
 <CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 18 Feb 2020 18:20:36 +1100
Message-ID: <CAA=hcWQFcdUJKGTOitOAx1URD7r=9PPxsdd=hQO-Yb77=QHTDg@mail.gmail.com>
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed
 to start Run pending postinsts
To: Belisko Marek <marek.belisko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_232038_890739_05B79BFA 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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
Cc: Yocto discussion list <yocto@yoctoproject.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Belisko,

Thanks for your resonse.

On 2/18/20, Belisko Marek <marek.belisko@gmail.com> wrote:
> Can you pls provide output of systemctl status systemd-rfkill
> There should be some more info what issue is.

Failed at step STATE_DIRECTORY spawning /lib/systemd/systemd-rfkill:
Read-only file system, did it try to write something in /lib/systemd?
How should I fix it?


# systemctl status systemd-rfkill -l
* systemd-rfkill.service - Load/Save RF Kill Switch Status
   Loaded: loaded
(8;;file://solar/lib/systemd/system/systemd-rfkill.service/lib/systemd/system/systemd-rfkill.service8;;;
static; vendor preset: disabled)
   Active: failed (Result: exit-code) since Tue 2020-02-18 00:47:30
UTC; 1min 59s ago
     Docs: 8;;man:systemd-rfkill.service(8)man:systemd-rfkill.service(8)8;;
  Process: 149 ExecStart=/lib/systemd/systemd-rfkill (code=exited,
status=238/STATE_DIRECTORY)
 Main PID: 149 (code=exited, status=238/STATE_DIRECTORY)

Feb 18 00:47:30 solar systemd[1]: Starting Load/Save RF Kill Switch Status...
Feb 18 00:47:30 solar systemd[149]: systemd-rfkill.service: Failed to
set up special execution directory in /var/lib: Read-only file system
Feb 18 00:47:30 solar systemd[149]: systemd-rfkill.service: Failed at
step STATE_DIRECTORY spawning /lib/systemd/systemd-rfkill: Read-only
file system
Feb 18 00:47:30 solar systemd[1]: systemd-rfkill.service: Main process
exited, code=exited, status=238/STATE_DIRECTORY
Feb 18 00:47:30 solar systemd[1]: systemd-rfkill.service: Failed with
result 'exit-code'.
Feb 18 00:47:30 solar systemd[1]: Failed to start Load/Save RF Kill
Switch Status.
Feb 18 00:47:30 solar systemd[1]: systemd-rfkill.service: Start
request repeated too quickly.
Feb 18 00:47:30 solar systemd[1]: systemd-rfkill.service: Failed with
result 'exit-code'.
Feb 18 00:47:30 solar systemd[1]: Failed to start Load/Save RF Kill
Switch Status.

>> [FAILED] Failed to start Run pending postinsts.
>> See 'systemctl status run-postinsts.service' for details.
> Pls this one also: systemctl status run-postinsts

# systemctl status run-postinsts -l
* run-postinsts.service - Run pending postinsts
   Loaded: loaded
(8;;file://solar/lib/systemd/system/run-postinsts.service/lib/systemd/system/run-postinsts.service8;;;
enabled; vendor preset: enabled)
   Active: failed (Result: exit-code) since Tue 2020-02-18 00:47:37
UTC; 6min ago
  Process: 153 ExecStart=/usr/sbin/run-postinsts (code=exited, status=0/SUCCESS)
  Process: 159 ExecStartPost=/bin/systemctl --no-reload disable
run-postinsts.service (code=exited, status=1/FAILURE)
 Main PID: 153 (code=exited, status=0/SUCCESS)

Feb 18 00:47:36 solar systemd[1]: Starting Run pending postinsts...
Feb 18 00:47:36 solar run-postinsts[153]: Configuring packages on first boot....
Feb 18 00:47:36 solar run-postinsts[153]:  (This may take several
minutes. Please do not power off the machine.)
Feb 18 00:47:36 solar run-postinsts[153]: /usr/sbin/run-postinsts:
eval: line 1: can't create /var/log/postinstall.log: nonexistent
directory
Feb 18 00:47:36 solar run-postinsts[153]:  Removing any system startup
links for run-postinsts ...
Feb 18 00:47:37 solar systemctl[159]: Failed to disable unit: File
/etc/systemd/system/sysinit.target.wants/run-postinsts.service:
Read-only file system
Feb 18 00:47:37 solar systemd[1]: run-postinsts.service: Control
process exited, code=exited, status=1/FAILURE
Feb 18 00:47:37 solar systemd[1]: run-postinsts.service: Failed with
result 'exit-code'.
Feb 18 00:47:37 solar systemd[1]: Failed to start Run pending postinsts.

Was the problem to write to /var/log, the /var/volatile does not have a log?

# ls -l /var
drwxr-xr-x    2 1000     1000           160 Feb 18  2020 backups
drwxr-xr-x    5 1000     1000           100 Feb 18 00:47 cache
drwxr-xr-x    9 1000     1000           180 Feb 18 00:47 lib
drwxr-xr-x    3 1000     1000           224 Feb 18  2020 local
lrwxrwxrwx    1 1000     1000            11 Feb 18  2020 lock -> ../run/lock
lrwxrwxrwx    1 1000     1000            12 Feb 18 00:52 log -> volatile/log
lrwxrwxrwx    1 1000     1000             6 Feb 18  2020 run -> ../run
drwxr-xr-x    3 1000     1000            60 Feb 18  2020 spool
lrwxrwxrwx    1 1000     1000            12 Feb 18  2020 tmp -> volatile/tmp
drwxrwxrwt    8 root     root           160 Feb 18 00:47 volatile

# ls -l /var/volatile/
drwxr-xr-x    5 1000     1000           100 Feb 18 00:47 cache
drwxr-xr-x    9 1000     1000           180 Feb 18 00:47 lib
drwxr-xr-x    3 1000     1000            60 Feb 18  2020 spool

All system mount is the same as the original RW rootfs, did both write
to none standard RW system mount?

Here is defined system mount in fstab:

proc                 /proc                proc       defaults              0  0
devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
tmpfs                /run                 tmpfs
mode=0755,nodev,nosuid,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              0  0


Here is the mount:

# mount
ubi0:rootfs-volume on / type ubifs (ro,relatime,assert=read-only,ubi=0,vol=2)
devtmpfs on /dev type devtmpfs
(rw,relatime,size=84564k,nr_inodes=21141,mode=755)
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,relatime)
securityfs on /sys/kernel/security type securityfs
(rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
cgroup2 on /sys/fs/cgroup/unified type cgroup2
(rw,nosuid,nodev,noexec,relatime,nsdelegate)
cgroup on /sys/fs/cgroup/systemd type cgroup
(rw,nosuid,nodev,noexec,relatime,xattr,name=systemd)
tmpfs on /etc/machine-id type tmpfs (ro,mode=755)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev)
debugfs on /sys/kernel/debug type debugfs (rw,nosuid,nodev,noexec,relatime)
fusectl on /sys/fs/fuse/connections type fusectl
(rw,nosuid,nodev,noexec,relatime)
tmpfs on /var/volatile type tmpfs (rw,relatime)
ubi0:data-volume on /data type ubifs (rw,noatime,assert=read-only,ubi=0,vol=3)
tmpfs on /var/spool type tmpfs (rw,relatime)
tmpfs on /var/cache type tmpfs (rw,relatime)
tmpfs on /var/lib type tmpfs (rw,relatime)
tracefs on /sys/kernel/debug/tracing type tracefs
(rw,nosuid,nodev,noexec,relatime)

How should I fix it?

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
