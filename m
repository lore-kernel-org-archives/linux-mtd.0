Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVEND-0007PN-FH
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 18:38:27 -0400
Date: Tue, 11 Sep 2007 23:55:42 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: linux01@architechnical.net
Subject: Re: nandwrite image fit re-checking?
In-Reply-To: <49847.69.30.123.186.1189536869.squirrel@architechnical.net>
Message-ID: <Pine.LNX.4.64.0709112354550.9441@lnxricardw.se.axis.com>
References: <49847.69.30.123.186.1189536869.squirrel@architechnical.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 11 Sep 2007, linux01@architechnical.net wrote:

> nandwrite doesn't appear to retest if the image still fits into a
> partition after it discovers bad blocks.  If I have an image the same siz=
e
> as a partition and a block is bad, would it then try to write the last
> block into the next partition after skipping the bad block?  (I assume th=
e
> MTD layer would know it's out of range and fail on pwrite).  Is this
> considered a potential bug?

The mtd layer doesn't allow writes outside the current partition, so=20
nandwrite fails and says the image is too big for the partition.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
