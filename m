Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Rg4P-00018L-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 20:57:05 +0000
Message-ID: <3C488E1F.46D2E05B@cs.uni-bonn.de>
Date: Fri, 18 Jan 2002 22:05:35 +0100
From: Loehnertz@t-online.de (Martin =?iso-8859-1?Q?L=F6hnertz?=)
Reply-To: ml@cs.uni-bonn.de
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DOM-Module vanishes
Content-Type: text/plain; charset=us-ascii; x-mac-type="54455854"; x-mac-creator="4D4F5353"
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

Hello,

this is perhaps a bit late because I already returned the module to the
shop and it is now sent to the manufacturer but I wold still like to
find out what has happened.

I bought an Adlink 16 MB DOM Flash Module. This is a DOC with some
additional hardware that makes it look like an IDE Drive,

I inserted it as secondary master and it did not work. After some time I
found out that
the 2nd IDE was deactivated in the BIOS. I activated it and the module
was found immediately.

The BIOS detected it as 1000 cyc 16 tracks instead of 490/32 as
described by the manual, but the manual said to belive in the BIOS
autodetect stuff.

I created a partition table with one large ext2fs partition. I formatted
it, wrote data and read data successfully . I was happy and switched off
the computer for that day.

Next day the Module was no found by the BIOS. It was not a wrong setting
or anything.
After some time of experimenting (expecially switching on and off the
computer some times) it showed up again. All data had vanished (also the
partition-table).
I formatted, wrote data, read data everything ok.
I shut down the computer, started again and it was not found anymore.

I tried it in another computer (old 386) without BIOS autodetection, set
the parameters according to the manual and only got errors when trying
to speak to the Module.

Still both computers detect the existence of some object, as they need
significantly longer to decide that there is no object than they need if
I remove it.

As I said I already sent it back - but has anybody any Idea ?

Thank you very much
Martin Loehnertz
