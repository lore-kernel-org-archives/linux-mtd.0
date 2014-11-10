Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnsXI-0004qT-KU
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 17:13:53 +0000
Date: Mon, 10 Nov 2014 11:12:53 -0600
From: Ben Shelton <ben.shelton@ni.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/4] UBIFS: Add xattr support for symlinks
Message-ID: <20141110171253.GA18047@bshelton-desktop>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
 <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
 <1415628106.22887.122.camel@sauron.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <1415628106.22887.122.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/10, Artem Bityutskiy wrote:
> Could you please re-test this with any kernel and carefully verify
> symlinks. I think this should not work, because in case of symlinks we
> already store the link target path in the inode, and with this patch the
> target patch will be over-written with the SELinux label. I expect this
> to be seen easily on testing - symlink targets should be corrupted.
> 
> Artem.
> 

I retested this with a 3.18-rc3 kernel on one of our ARM-based targets.
The kernel has patch 1/4 with your changes, plus patches 2/4, 3/4, and
4/4 as posted.

Initially, I booted the target with SELinux disabled.  I then created
'testfile' and made a symlink 'testlink' pointing to it.  I also created
a symlink 'testlink_2' that points to /bin/bash.

I then enabled SELinux in permissive mode and rebooted the target.  As
this was the first boot into SELinux, it relabeled the filesystems and
rebooted.  After it came back up, I created 'testfile_afterrelabel' and
made a symlink 'testlink_afterrelabel' pointing to it.  In addition, I
checked the symlinks that are managed by update-alternatives.  Finally,
I ran `ls -lRZ / | grep ^l` and did not see any corrupted symlink
targets.

The results are below, and they look sane to me.  Please let me know if
there is additional testing you would like me to perform.

admin@galvanized:~# uname -a
Linux galvanized 3.18.0-rc3-ni-04094-g7b78529 #1 SMP Mon Nov 10 09:59:06 CST 2014 armv7l GNU/Linux
admin@galvanized:~# mount | grep ubifs
ubi1:rootfs on / type ubifs (rw,relatime,seclabel)
ubi0:bootfs on /boot type ubifs (rw,noatime,sync,seclabel)
ubi0:config on /etc/natinst/share type ubifs (rw,relatime,sync,seclabel)
admin@galvanized:~# pwd
/home/admin
admin@galvanized:~# ls -lZ
total 8
-rw-r--r--. 1 admin administrators user_u:object_r:user_home_t 15 Nov 10 16:20 testfile
-rw-r--r--. 1 admin administrators root:object_r:user_home_t   21 Nov 10 16:50 testfile_afterrelabel
lrwxrwxrwx. 1 admin administrators user_u:object_r:user_home_t  8 Nov 10 16:21 testlink -> testfile
lrwxrwxrwx. 1 admin administrators user_u:object_r:user_home_t  9 Nov 10 16:21 testlink_2 -> /bin/bash
lrwxrwxrwx. 1 admin administrators root:object_r:user_home_t   21 Nov 10 16:51 testlink_afterrelabel -> testfile_afterrelabel
admin@galvanized:~# which ls     
/bin/ls
admin@galvanized:~# ls -lZ /bin/ls
lrwxrwxrwx. 1 admin administrators system_u:object_r:bin_t 12 Nov 10 16:08 /bin/ls -> ls.coreutils
admin@galvanized:~# ls -lZ /bin/grep
lrwxrwxrwx. 1 admin administrators system_u:object_r:bin_t 25 Nov  5 20:39 /bin/grep -> /usr/lib/busybox/bin/grep

Best,
Ben
