Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Avf9C-00040m-Dz
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 16:11:02 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 15:47:23 +0000
References: <4034E8ED.5757.55A2D9@localhost> <698FD51A64D6@baydel.com>
	<1077636903.7826.487.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077636903.7826.487.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <69BCB2F40B2B@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 3:35 pm, David Woodhouse wrote:
> On Tue, 2004-02-24 at 14:58 +0000, Simon Haynes wrote:
> > I have just created the fs with a rw mtdblock kernel and rebooted with a
> > ro mtdblock. This attempts to remount rw but it cannot.
>
> Hmm. OK, hack jffs2 to use the same major number as ramdisk, then try to
> mount /dev/ram2 instead :)

I hacked fs/jffs2/super.c and fs/jffs2/super_v24.c. Only the v24 got 
compiled. I guess this is because my kernel is 2.4.21.  I had to also include 
ramdisk in the kernel as it was previously missing ? Does this effect MTD ?
This mounted rw.

-bash-2.05b# ls -l /dev/ram2
brw-rw----    1 root     disk       1,   2 Jan 31  2003 /dev/ram2
-bash-2.05b# mount -t jffs2 /dev/ram2 /smc
-bash-2.05b# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / nfs rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=192.9.200.22 
0 0
/proc /proc proc rw 0 0
/dev/ram2 /smc jffs2 rw 0 0
-bash-2.05b#
