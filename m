Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cfiks-0005RW-JC
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 12:52:38 -0500
Date: Sat, 18 Dec 2004 18:52:22 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041218175222.GB4147@wohnheim.fh-wedel.de>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1103391155.10788.13.camel@squizzey.bult.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 18 December 2004 17:32:35 +0000, Gareth Bult (Encryptec) wrote:
> 
> There's a public health warning attached to this code ..
> 
> I've not cleaned it up and I've not added any comments ..

I'll wear protective gloves then.  Thanks!

> fyi; I don't use mkfs.jffs2 .. I flash_eraseall the device then work
> from there with "tar".. there seems to be no benefit [for me] to using
> mkfs and it seems a little more reliant on the device size than the
> erase program.

Makes a lot of sense.  Both approaches have some advantages.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams?
