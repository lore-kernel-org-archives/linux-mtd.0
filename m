Received: from qmta06.westchester.pa.mail.comcast.net ([76.96.62.56])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDAk7-00052Z-Ff
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 04:44:11 +0000
Message-ID: <4949D4F9.4000709@timesys.com>
Date: Wed, 17 Dec 2008 23:43:37 -0500
From: Joseph Cheek <joseph.cheek@timesys.com>
MIME-Version: 1.0
To: "Linux Users list. Open to all LinuxLink subscribers."
	<linux-users-list@lists.timesys.com>
Subject: Re: [linux-users-list] Data loss on unclean powercycle with JFFS2/NAND
References: <705901BA1DF18142AB3DE716DDF374F801FBD840@CBA0E2K03.CBA0.centerbeam.com>
In-Reply-To: <705901BA1DF18142AB3DE716DDF374F801FBD840@CBA0E2K03.CBA0.centerbeam.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Manu,

I don't know about the JFFS2 issue, but does this sed need to happen
dynamically?  Can you instead just ship the pre-modified inittab?

If not, you could possibly try sed -i (inplace edit) if you are using
sed proper and not busybox sed.  That might shorten the amount of time
in which inittab is in an in-between state.

Thanks!

Joseph Cheek, joseph.cheek@timesys.com
Packaging Technologies Team Lead
TimeSys Corp., www.timesys.com



Manu Rao wrote:
> We have an embedded system with ARM9, running linux 2.6.22 and jffs2 on
> Samsung nand.
> As part of our bootup process, we modify the /etc/inittab so that the
> getty login screen is replaced with our application.
>
>   if sed "/^#*T0/cT0:23:respawn:/sbin/getty -L -n -l /our_app/app ttyS0"
> /etc/inittab > /etc/inittab_tmp; then
> 	mv /etc/inittab_tmp /etc/inittab
>
> We have recently discovered units where the inittab suddenly becomes a
> zero-length file. My conjecture was that this had to do with the
> write-buffering, and when I add a sync after the move, it helps
> somewhat.
>
> The way I understood jffs2, if we have a FileA that is being replaced
> with a FileB, we should always have access to either FileA or FileB. But
> without any doubt, inittab is getting zeroed out.
>
> How does a move in the Filesystem occur? How can the size become zero?
>
> Any pointers appreciated.
>
> Thanks
> Manu Rao
> San Jose, CA
>
> _______________________________________________
> linux-users-list mailing list
> linux-users-list@lists.timesys.com
> https://lists.timesys.com/listinfo/linux-users-list
>   
