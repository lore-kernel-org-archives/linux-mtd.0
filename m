Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoNF-0003Og-8m
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:30:15 -0400
Message-ID: <4337AB45.9020607@yandex.ru>
Date: Mon, 26 Sep 2005 12:03:17 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>
	<43303409.5030406@users.sourceforge.net>
	<43303D59.1040805@yandex.ru>
	<433067BF.6080909@users.sourceforge.net>
	<1127399674.28625.18.camel@sauron.oktetlabs.ru>
	<43341DCD.6090002@users.sourceforge.net>
	<20050925125455.GA28978@wohnheim.fh-wedel.de>
In-Reply-To: <20050925125455.GA28978@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Anders Grafstrom <grfstrm@users.sourceforge.net>
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> On Fri, 23 September 2005 17:22:53 +0200, Anders Grafstrom wrote:
>=20
>>jffs2 makes a second try if a failed erase is reported by the mtd=20
>>driver. But only for NAND (in jffs2_write_nand_badblock()). What I'm=20
>>after is a retry for NOR as well. But I wrote the patch so it would=20
>>retry for other cases of failure too.
>=20
> Is a retry really an improvement?  When a block cannot be properly
> erased on the first try, I would not trust it anymore.  Instead of a
> retry, I'd rather mark it as a bad block and not touch it again.

 From the other hand, why not to retry? Does it hurt? Is this in the=20
critical code-path? Deity knows what happend to the hardware/driver, may =

be there was a short magnetical disturbance and that was the reason why=20
the block was not erased. May be one of the lines/cirquits outside of=20
the flash was affected but the block is really erasable. Actually, after =

I've read the paper that *you* pointed=20
(http://www.cs.wisc.edu/adsl/Publications/iron-sosp05.pdf), I'm rather=20
positive about the idea of retrying. The articlae is about HDDs, but IMO =

is also acceptable flash devices in this respect.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
