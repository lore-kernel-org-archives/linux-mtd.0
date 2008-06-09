Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5ZEY-0006Y1-9V
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 04:43:55 +0000
In-Reply-To: <20080608121020.GA13200@logfs.org>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
MIME-Version: 1.0
Message-ID: <OF900336E0.BD21AFA6-ON88257463.0019C3EA-88257463.0019F5E4@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Sun, 8 Jun 2008 21:43:33 -0700
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@logfs.org> wrote on 06/08/2008 05:10:20 AM:

>=20
> And while at it, replace the 32bit size with a 64bit blockno and 32bit
> offset.  Unless someone is stupid enough to create devices with 4G
> erasesize, that should last for a human lifetime or something close.
>=20

What kind of block is blockno?  An erase block (which is 128K in my case)=20
or a write block (2K)?
