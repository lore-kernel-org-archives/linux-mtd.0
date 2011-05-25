Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPIsg-0005Vs-1E
	for linux-mtd@lists.infradead.org; Wed, 25 May 2011 18:32:30 +0000
Date: Wed, 25 May 2011 20:31:54 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
Message-ID: <20110525183154.GA20866@parrot.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
	<Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
	<BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
	<20110525164107.GA16801@parrot.com>
	<0A40042D85E7C84DB443060EC44B3FD32A69415800@dekaexchange07.deka.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A69415800@dekaexchange07.deka.local>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 25, 2011 at 07:04:40PM +0100, Atlant Schmidt wrote:
> Ivan:
> 
> > <digression> ...
> > And recent Micron devices do not store markers in flash; they just
> > return 0x00 for any byte read in a bad block (instead of the real
> > data), using an internal bad block table.
> > </digression>
> 
>   Does this mean that it is impossible to mark additional
>   bad blocks in these devices as blocks go hard-bad during
>   use? Or do commands exist to extend the internal bad
>   block table? (And do our MTD drivers know how to do that?)
> 

Note that the usual bad block detection still works on those Micron devices.
They just do not store markers in flash.

You can still mark a block gone bad either by writing your own marker into the
block or (better) in a separate BBT. The internal Micron table is hard-wired
and only used to shortcut access to factory bad blocks AFAIK.

Regards,

Ivan
