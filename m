Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ajs70-0006Jx-VS
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2004 03:36:03 +0000
From: "Mark Richards" <markr@massmicro.com>
To: "'Matthew S. McClintock'" <mattsm@arlut.utexas.edu>,
        "'David Woodhouse'" <dwmw2@infradead.org>
Date: Thu, 22 Jan 2004 22:35:57 -0500
Message-ID: <003a01c3e162$03ab7a00$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1074623299.4726.2.camel@chuck.arlut.utexas.edu>
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I finally managed to get a good build running on the 2.4.24 kernel on RedHat
7.2, applying the MTD drivers.  Here's what I had to do:

1. Copy the sources (not link them).
2. Include the JFFS drivers.
3. Use make oldconfig (make xconfig is not properly supported by one of the
MTD make files)

In a previous try I also had to fix one of the sources which had an extra
parameter defined, but in my finally-successful build this problem did not
show up.  

So the problem I had - lock up when issuing a umount - is resolved, but it
was not easy getting there :)

I can't explain why the MTD version that ships with the 2.4.24 kernel has
this problem and I can't find any reference to it searching the newsgroups,
etc.  


Mark Richards


> -----Original Message-----
> From: Matthew S. McClintock [mailto:mattsm@arlut.utexas.edu]
> Sent: Tuesday, January 20, 2004 13:28
> To: David Woodhouse
> Cc: Mark Richards; linux-mtd@lists.infradead.org
> Subject: RE: MTD - DOC 2000 freezes on umount
> 
> On Tue, 2004-01-20 at 12:22, David Woodhouse wrote:
> 
> > Bizarre. It's a define_bool, which is relatively new -- but not so new
> > it's not in 2.4.24, I thought. As you're only interested in the
> > DiskOnChip drivers, you're right that it doesn't affect you (assuming
> > that's what you meant:)
> 
> I'm using the linuxppc_2_4_devel tree if that helps any.
> 
> --
> Matthew S. McClintock <mattsm@arlut.utexas.edu>
