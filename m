From: jasmine@hex.linuxgrrls.org (Jasmine Strong)
Date: Fri, 21 Mar 2003 17:42:58 +0000 (GMT)
Subject: help: network cannot startup from FLASH
In-Reply-To: <1048245508.1717.21.camel@tweedy.ksc.nasa.gov>
Message-ID: <Pine.LNX.4.33.0303211739400.23519-100000@hex.linuxgrrls.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


On 21 Mar 2003, Bob Chiodini wrote:

> One other thing:  Is your bootpd/dhcpd configured fro the correct MAC?

I think the important question is why is the MAC address changing?  Since
the ethernet interface on a PowerQUICC design is actually provided by one
of the four integrated interfaces that give the chip its name, it's hard
to see how an ancillary part could be causing this.

My suspicion is that the QUICC registers are getting corrupted by the MTD
code driving the NAND device in some way.  That's making the MAC address
come out wrong and also stopping the device producing any real ethernet
packets.

I've seen similar problems with IDE interfaces on PowerQUICC devices in
the past.

-Jas.
