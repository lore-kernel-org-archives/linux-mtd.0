Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182Hd5-0003zl-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 21:52:27 +0100
Received: from [192.168.5.81] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2558566 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2002 13:52:40 -0700
Message-ID: <3DAF2486.8000006@redswitch.com>
Date: Thu, 17 Oct 2002 13:58:46 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: check disk usage
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

My root filesystem is jffs2, which is mounted by kernel getting booting 
parameters "root=/dev/mtdblock3 rw" from the command line. I noticed 
that running 'df -k' only shows the usage of those devices that are 
mounted explicitly by 'mount' command but not the root filesystem. The 
following is the result of 'df -k' running on busybox-0.60.2.

# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock0           16384       688     15696   4% /usr
/dev/mtdblock1           16384      5836     10548  36% /home
/dev/mtdblock2           16384       652     15732   4% /var

On a regular linux system, e.g. RedHat, we do get information about the 
usage of the root filesytem, right?

Is this a problem? If it's is, is it related to jffs2 or busybox?

Thanks,

Shawn.
