Received: from mail.milliontech.com ([210.17.151.186])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATiTL-00054M-LB
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 14:04:19 +0000
Received: from milliontech.com ([192.168.168.70])
	by mail.milliontech.com (8.11.6/8.11.6) with ESMTP id hB9E2Pn24690
	for <linux-mtd@lists.infradead.org>; Tue, 9 Dec 2003 22:02:25 +0800
Message-ID: <3FD5D62F.4070501@milliontech.com>
Date: Tue, 09 Dec 2003 22:03:27 +0800
From: Martin Chan <martinc@milliontech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Subject: error when coping jffs2 file system to mtd0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have DOC 2000 and I can "mount -t msdos /dev/nftla1 /mnt".

I prepare a root.jffs2 using mkfs.jffs2 -d /dir -o root.jffs2

However, when I want to copy my root.jffs2 to /dev/mtd0, I get the
following errors:
Dec 9 10:48:09 webprint syslog.info klogd: MTD_open
Dec 9 10:48:09 webprint syslog.info klogd: MTD_ioctl
Dec 9 10:48:09 webprint syslog.info klogd: Invalid ioctl 5401
(MEMGETINFO = 80204d01)
Dec 9 10:48:09 webprint syslog.info klogd: MTD_write
Dec 9 10:48:09 webprint syslog.warn klogd: ECC needs a full sector write
(adr: 0 size 88)
Dec 9 10:48:09 webprint syslog.info klogd: _DoC_WaitReady called for
out-of-line wait
Dec 9 10:48:09 webprint syslog.info klogd: _DoC_WaitReady called for
out-of-line wait
Dec 9 10:48:09 webprint syslog.info klogd: MTD_close

I have tried serval times, and get the same errors.
What did I miss?

Thanks,
Martin
