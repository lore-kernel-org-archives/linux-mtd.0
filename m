From: stepan@suse.de (Stefan Reinauer)
Date: Sun, 16 Mar 2003 13:05:19 +0100
Subject: devbios port to MTD
In-Reply-To: <1047657619.2134.40.camel@contact.skynet.coplanar.net>; from jerj@coplanar.net on Fri, Mar 14, 2003 at 11:00:19AM -0500
References: <1047657619.2134.40.camel@contact.skynet.coplanar.net>
Message-ID: <20030316130519.A21957@suse.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Jeremy

> I've been hacking away for a few days at the devbios code, my goal being
> to port it to the MTD framework.  Apart from being "the right thing" in
> my opinion, as well as in the devbios TODO, it solves a few practical
> problems:  
[..]

great! It is definintely "the right thing to do", as it unifies the 
two projects, providing the users one interface instead of the 
3 flash devices - 3 drivers mentality. MTD has the far better concept
as devbios evolved from the old idea of just not having to use a
DOS bootdisk for flashing my mainboard. Also, MTD has a much bigger
userbase, being less specific than devbios is.

> So far I have refactored devbios to eliminate global variables (void
> *bios), and static flashdevice structures.
Good idea. It it's one of the ugly things that survived the time when
the system firmware chip was the only flash device in my system.

> The flash probing routine is
> now a separate "library", which can use devbios flash_{readb,writeb}, or
> when linked into MTD, will use the map driver's access routines.  The
> MTD chip driver which uses the probe routine is about half done.  Any
> enhancements to the devbios probe routine "library" will automatically
> enhance the MTD chip probe routine as well.

> I plan to make map drivers out of the devbios pcisets.c code in a
> similar manner.
 
If there's not a big objection from the MTD developers, I'd vote for
including the devbios rudiments into MTD completely, allowing it to
be included in the Linux Kernel some day. I'm sure nobody has anything
against getting rid of the devbios device interface stuff in favour
of this unification.

> I'm posting this to elicit comments from the respective parties, words
> of wisdom, cautions, etc.

> I will post the initial devbios refactoring patch once I've checked it
> over again.

I'm willing to help and contribute hints and code wherever i can.

Stefan
  
-- 
The use of COBOL cripples the mind; its teaching should, therefore, be
regarded as a criminal offense.                      -- E. W. Dijkstra
