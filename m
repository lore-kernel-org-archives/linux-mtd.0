Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlzNj-0000ck-T0
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:03:40 +0000
In-Reply-To: <52970DEE.3070302@elreha.de>
References: <5295C538.6040207@elreha.de>
 <OFD4B20B8F.D587329D-ONC1257C30.0038B520-C1257C30.0039136C@transmode.se>
 <52970DEE.3070302@elreha.de>
To: "Albrecht, Harald" <harald.albrecht@elreha.de>
MIME-Version: 1.0
Subject: Re: JFFS2 Garbage collection issue
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OFC984D643.0017DB63-ONC1257C31.003C807A-C1257C31.003CB8B3@transmode.se>
Date: Thu, 28 Nov 2013 12:03:14 +0100
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Hi All,
> 
> thank you for the fast reply.
> What we figured out is that the jffs2_garbage_collect_pass loops for 
> several minutes in the first for(;;) loop. It always went into the if 
> statement after jffs2_get_ino_cache. In this situation it's not 
> interruptable by any signals.

Yes, by then it is too late. You need to force GC during normal operation
so that when you reboot there isn't much GC left to do.
Try sending the right signal to the GC thread, say every minute(just to 
test something)

> 
> Regards
>    Harald
> 
> 
> "linux-mtd" <linux-mtd-bounces@lists.infradead.org> wrote on 2013/11/27 
> 11:11:04:
> >> Hi all,
> >>
> >> we are currently facing a problem with the Garbage-collection on a 
JFFS2
> >> file system.
> >>
> >> We have an embedded linux system based on an ARM9 AT91RM9200 
processor
> >> with an Intel / Micron JS28F256 NOR-flash of 32MB in size.
> >> The Flash holds the U-Boot loader and its environment and in the main
> >> part (30MB) of the chip a JFFS2-based root-file-system.
> >> Our Linux kernel version is 2.6.24.3
> >>
> >> Some minutes after startup of the system, the garbage collector 
(gc.c)
> >> does a scan of the file system, gathering information for the garbage
> >> collection procedures that may be initiated based upon that data.
> >> On some file systems, especially such with long runtime and therefore
> >> many file operations, this scan consumes a lot of time. On some 
systems
> >> it stays in that scan for more that 10 minutes. The problem with this
> >> behaviour is the fact, that during the scan the file system is 
locked,
> >> and therefore all file operations are suspended. This leads to a 
crash
> >> of the system, when the application program hangs for a long time,
> >> waiting for a file operation to return from a system call, and the
> >> watchdog is not triggered.
> >>
> >> In a test system without watchdog, after the scan, the system runs
> > normally.
> >> The flash chip itself shows no errors, so it seems to be a problem of
> >> the file system.
> >>
> >> Any idea or suggestion to solve the problem would be very welcome!
> > The simple fix is to send a signal(SIGCONT?) to the GC process 
regularly
> > to do GC
> > over time. That way you don't get all GC at boot time.
> >
> >   Jocke
> > 
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
