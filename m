Received: from lakermmtao12.cox.net ([68.230.240.27])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C3dpW-0000M4-II
	for linux-mtd@lists.infradead.org; Sat, 04 Sep 2004 12:55:59 -0400
Message-ID: <001701c492a0$03b51c00$4402a8c0@tinker>
From: "Dan Brown" <dan_brown@ieee.org>
To: <jan@tronrud.no>,
	<linux-mtd@lists.infradead.org>
References: <MDAEMON-F200409041202.AA022737md50000535465@tronrud.no>
Date: Sat, 4 Sep 2004 12:55:20 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: Using partitions on DOC2000 (nftl)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message ----- 
From: "Jan Vestby" <jan@tronrud.no>


> The new diskonchip code can handle one additional partition beyond the
> formatted part.

This is true of NFTL-based devices.  Newer INFTL-based devices can have four
partitions.

> I have only been able to use this by invoking the dformat /SIZE option in
> the
> 4.2 version of the DOS utilities. Howvever, this option is rather brutal:
> bad block table entries beyond the new "size" is silently dropped.

That's very interesting.  And odd.  When you say the BBT entries are
dropped, do you mean they aren't reported by dinfo, or that they really are
erased from the BBT table in the Media Header?  If it's the latter, Linux
will still be aware of them and everything should behave properly.

> Formatting the DOC with the /USE percentage option preserves the bbt data.
> The resulting smaller size shows up in nftl media header entry
> FormattedSize.
>
> Is there any problems with using this parameter to perform the partioning,
> or have I overlooked something ?

Assuming I'm correctly remembering what the /USE parameter does, this won't
help you.  The partition will still take up the same amount of space, but a
larger percentage of it will be in reserved (rather than usable) units.  The
reserved units are used to consolitate data when needed for garbage
collection, and having more of them may increase the efficiency of NFTL.

There is a utility in the mtd util/ directory called docfdisk.  This can be
used to alter INFTL-style partition tables.  Somebody should really add the
ability to alter NFTL partitions as well.  Any volunteers?

    -Dan Brown
