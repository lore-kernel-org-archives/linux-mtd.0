Date: Thu, 6 Jan 2005 10:08:16 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041223135231.GB24503@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501060954230.5460@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Dec 2004, [iso-8859-1] J=F6rn Engel wrote:

Jorn Engel:=20
> NOR is pretty reliable anyway, so we could just go
> without a checksum.

Can not agree with you. Checksums are requred even for very reliable NOR=20
flashes to be able to detect broken nodes which can appear after unclean=20
reboots.
My understanding is that this is the most important thing why CRCs are=20
needed. The media corruption is of lesser priority. From this perspective=
=20
we may easilly use any weaker (then CRC32) checksum, but this checksum=20
must be good in detecting partially written nodes.

 =20
> Correct.  Simple parity might be a nice reference as well.  It is
> really bad at catching even-bit errors (2,4,6,...), but it's fast.

And please, bear in mind that if we encounter ECC error, this means error=
=20
somwhere in the page. But this page may contain several JFFS3 nodes and we=
=20
may recover some of them. So, having per-node CRC is good idea even if=20
there is ECC (ECC is per-page).
For example, the board may have been rebooted uncleanly during writing ECC=
=20
(the data was already written, ECC is written after data). In this case we=
=20
may have correct data but just wrong ECC. Having CRCs, we might recover=20
all JFFS3 nodes.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
