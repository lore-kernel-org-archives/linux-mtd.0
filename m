Received: from wproxy.gmail.com ([64.233.184.201])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp9ka-0001G6-Tk
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 13:31:20 -0500
Received: by wproxy.gmail.com with SMTP id 36so736016wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Jan 2005 10:30:55 -0800 (PST)
Message-ID: <6934efce050113103077c06b4d@mail.gmail.com>
Date: Thu, 13 Jan 2005 10:30:55 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1105631437.15265.12.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
	<6934efce05011214553465438@mail.gmail.com>
	<1105631437.15265.12.camel@weaponx.rchland.ibm.com>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Guess we'll have to agree to disagree then :).  All I know is that I
> want to be damn sure that the data I'm returning isn't totally screwed.
> Call me paranoid.  A checksum is the only way I know of doing that.

Paranoid :)

Checksums may reduce the chance, as Artem says,  of having your device "start
sending private keys of your corporative clients to random addresses" 
because of flash blocks going bad.  Last I checked, read errors were a
very, very improbable event with high quality NOR and besides
checksuming the filesystem won't help protecting us from gamma rays
causing such a problem once the library is in RAM;)

To humor those of us willing to take our chances trusting the media
won't go bad, would it be possible to architect JFFS3 such that
disabling the checksumming or stripping it out is possible with out
too much pain?

Given the performance we get out of even the fastest checksum
algorithms proposed and tested here, it seems checksumming data that
doesn't need it would be a significant performance bottleneck.  I see
this filesystem bottleneck as a big issue when trying to get Linux to
boot really fast, such as for a cell phone.  I understand that most
cell phones have NOR that can be counted on not to have read errors
and that a single successful Linux based phone model could, in matter
of weeks, become the source of the vast majority of running instances
of JFFS2/3 in the universe.  Some would see that as more support for
the need for checksums, but I think it says it's worth adding a
no-checksum option to serve this potential userbase that just doesn't
need the checksums but does need the speed.

I'm not trying to drag on this discussion just for kicks.  In fact I
think it's probably not worth replying to this message, unless there
is something really fantasic and new to add (For example "By George,
he's right!").  I think we all understand each other now.
