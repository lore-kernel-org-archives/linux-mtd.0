Received: from anchor-post-36.mail.demon.net ([194.217.242.86]
	helo=anchor-post-37.mail.demon.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AveYQ-0003gq-D5
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 15:33:02 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 14:58:32 +0000
References: <4034E8ED.5757.55A2D9@localhost> <6971771D4E8E@baydel.com>
	<1077634573.7826.449.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077634573.7826.449.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <698FD51A64D6@baydel.com>
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

On Tuesday 24 Feb 2004 2:56 pm, David Woodhouse wrote:
> On Tue, 2004-02-24 at 14:25 +0000, Simon Haynes wrote:
> > /smc is mounted read only and I cannot write to it.
> >
> > surely this is the same as not remounting root read write ?
>
> Hmmm. What happens if you mount -oremount,rw?

I have just created the fs with a rw mtdblock kernel and rebooted with a ro 
mtdblock. This attempts to remount rw but it cannot.

I have tried booting from the network with a ro mtdblock kernel and 
performing the following operation.

-bash-2.05b# mount -t jffs2 /dev/mtdblock2 /smc
mount: block device /dev/mtdblock2 is write-protected, mounting read-only
-bash-2.05b# mount -oremount,rw /smc
mount: block device /dev/mtdblock2 is write-protected, mounting read-only
-bash-2.05b# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / nfs rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=192.9.200.22 
0 0
/proc /proc proc rw 0 0
/dev/mtdblock2 /smc jffs2 ro 0 0
-bash-2.05b#

I guess this is not how things are supposed to work. Are there any kernel 
settings I should check ?

Cheers 

Simon.
