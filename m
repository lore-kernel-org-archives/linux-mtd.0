Received: from barry.mail.mindspring.net ([207.69.200.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DBq0-0006tA-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 22:18:04 +0100
Message-ID: <3B32645D.BF65C965@nexus-tech.net>
Date: Thu, 21 Jun 2001 17:17:17 -0400
From: Kyle Harris <kharris@nexus-tech.net>
MIME-Version: 1.0
To: Vipin Malik <vipin.malik@daniel.com>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621155737.A26310@crystal.2d3d.co.za> <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com> <20010621163537.A26714@crystal.2d3d.co.za> <001a01c0fa64$7bb97840$1501a8c0@Herman> <3B3234DE.7497B63C@Rikers.org> <3B324E77.3A47AB4@daniel.com> <3B324C72.85BFF986@Rikers.org> <3B325156.271EE3C4@daniel.com>
Content-Type: text/plain; charset=us-ascii
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

Hey,

I've read thru several posts and Vipin's jffs_guide. It appears that
JFFS, at his time, is about the most reliable open source fs for
embedded systems, even though it still has some problems. When JFFS
fails, is the filesystem still usable? My question is this. What if you
save only a small datafile (< 1K) and write it alternately to 2
different JFFS partitions (or even the same partition). At boot, you
read from both and get the latest, valid copy. This way if one is bad
you still have a backup. How reliable would this be? 

Just wondering... Kyle.

Vipin Malik wrote:
> 
> Tim Riker wrote:
> 
> > ok,
> >
> > what about reiserfs on CF then?
> >
> 
> I have tested one *major* brand of IDE flash devices and 2 brands of CF
> devices, in more than 20K power fail tests.
> 
> Both suffer from low level failures, which cause the IDE driver layer to "give
> up" with
> "unrecoverable errors". The CF is so bad that I just gve up on the testing
> after a few hundred cycles.
> 
> The IDE flash was better, but not much.
> 
> Will raiserfs be happy if the underlying IDE /dev/hdxx driver returns
> "unrecoverable error" from the IDE device?
> 
> Your call.
> 
> Vipin
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
