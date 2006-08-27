Received: from smtpout.mac.com ([17.250.248.181])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GHOyd-0008QZ-OK
	for linux-mtd@lists.infradead.org; Sun, 27 Aug 2006 19:03:20 +0100
In-Reply-To: <20060827171728.GB3502@wohnheim.fh-wedel.de>
References: <20060824134430.GB17132@wohnheim.fh-wedel.de>
	<20060827053245.GA15747@gen.formicary.org>
	<20060827171728.GB3502@wohnheim.fh-wedel.de>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Type: text/plain; charset=ISO-8859-1; delsp=yes; format=flowed
Message-Id: <E23E222F-25F8-4C2A-8E16-D4B30C01AFDB@mac.com>
Content-Transfer-Encoding: quoted-printable
From: Kyle Moffett <mrmacman_g4@mac.com>
Subject: Re: LogFS
Date: Sun, 27 Aug 2006 14:02:51 -0400
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, Ian Lindsay <iml@formicary.org>,
	fsdevel@wohnheim.fh-wedel.de, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Aug 27, 2006, at 13:17:28, J=F6rn Engel wrote:
> On Sun, 27 August 2006 01:32:45 -0400, Ian Lindsay wrote:
>>  +/* FIXME: This should really be somewhere in the 64bit area. */
>>  +#define LOGFS_LINK_MAX (2^30)
>>
>> Interesting choice of constant.
>
> Yes.  I didn't spend a long time thinking about whether it should =20
> be 2^31 or 2^31-1 or 2^31-2.  It will be a while before it becomes =20
> an issue in real life anyway. :)

Uhm, I think his point is that "^" is the xor operation:
   2^30   =3D=3D 28
   2^31   =3D=3D 29
   2^21-1 =3D=3D 28
   2^21-2 =3D=3D 31

Probably what you wanted was something more like this:

   # define LOGFS_LINK_MAX (1<<30)

Cheers,
Kyle Moffett
