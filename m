Received: from smtp6.centerbeam.com ([64.95.134.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDNYa-0004fP-1J
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 18:25:08 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-users-list] Data loss on unclean powercycle with JFFS2/NAND
Date: Thu, 18 Dec 2008 10:25:02 -0800
Message-ID: <705901BA1DF18142AB3DE716DDF374F801FBDACB@CBA0E2K03.CBA0.centerbeam.com>
In-Reply-To: <4949D4F9.4000709@timesys.com>
References: <705901BA1DF18142AB3DE716DDF374F801FBD840@CBA0E2K03.CBA0.centerbeam.com>
	<4949D4F9.4000709@timesys.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: "Joseph Cheek" <joseph.cheek@timesys.com>,
	"Linux Users list. Open to all LinuxLink subscribers."
	<linux-users-list@lists.timesys.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joseph:
Thanks for your response.
We sometimes have customers who like to use the serial port for their
own applications. We have made it this way so that customers can switch
it on and off. The replacing of the inittab is done only when the serial
service is turned on.

I will try the inplace edit, but I'm still intrigued by jffs2 behavior.
I'm not sure if its jffs2, mtd/NAND or sed that is to blame. We do have
a different linux based system that does not exhibit this problem, but
its slightly different in that it runs jffs2 on NOR rather than NAND.

Thanks a lot
Manu
PS: Do you know of any other forums that might be able to help?


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Joseph Cheek
Sent: Wednesday, December 17, 2008 8:44 PM
To: Linux Users list. Open to all LinuxLink subscribers.
Cc: linux-mtd@lists.infradead.org
Subject: Re: [linux-users-list] Data loss on unclean powercycle with
JFFS2/NAND

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
> We have an embedded system with ARM9, running linux 2.6.22 and jffs2
on
> Samsung nand.
> As part of our bootup process, we modify the /etc/inittab so that the
> getty login screen is replaced with our application.
>
>   if sed "/^#*T0/cT0:23:respawn:/sbin/getty -L -n -l /our_app/app
ttyS0"
> /etc/inittab > /etc/inittab_tmp; then
> 	mv /etc/inittab_tmp /etc/inittab
>
> We have recently discovered units where the inittab suddenly becomes a
> zero-length file. My conjecture was that this had to do with the
> write-buffering, and when I add a sync after the move, it helps
> somewhat.
>
> The way I understood jffs2, if we have a FileA that is being replaced
> with a FileB, we should always have access to either FileA or FileB.
But
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
>  =20

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
