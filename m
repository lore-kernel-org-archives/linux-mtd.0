Received: from gateway.innominate.fta-berlin.de ([141.16.74.40] helo=gateway.bln.gelonet.local)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 182SRA-00052U-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 09:24:52 +0100
Received: from tkeitel by tkeitel001.bln.gelonet.local with local (Exim 3.35 #1 (Debian))
	id 182SRW-00015O-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 10:25:14 +0200
Date: Fri, 18 Oct 2002 10:25:14 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: Re: check disk usage
Message-ID: <20021018082514.GA3934@tkeitel001.bln.gelonet.local>
References: <3DAF2486.8000006@redswitch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3DAF2486.8000006@redswitch.com>
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

On Thu, Oct 17, 2002 at 13:58:46 -0700, Xiaogeng (Shawn) Jin wrote:
> Hi,
> 
> My root filesystem is jffs2, which is mounted by kernel getting booting 
> parameters "root=/dev/mtdblock3 rw" from the command line. I noticed 
> that running 'df -k' only shows the usage of those devices that are 
> mounted explicitly by 'mount' command but not the root filesystem. The 
> following is the result of 'df -k' running on busybox-0.60.2.
> 
> # df -k
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/mtdblock0           16384       688     15696   4% /usr
> /dev/mtdblock1           16384      5836     10548  36% /home
> /dev/mtdblock2           16384       652     15732   4% /var
> 
> On a regular linux system, e.g. RedHat, we do get information about the 
> usage of the root filesytem, right?
> 
> Is this a problem? If it's is, is it related to jffs2 or busybox?

Have you checked the strace output of df -k? As far as I can see, it
looks in /proc/mounts. Maybe this is of some help to you.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
