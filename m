Received: from smtpout.mac.com ([17.250.248.171])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GHRmL-0002AV-Ou
	for linux-mtd@lists.infradead.org; Sun, 27 Aug 2006 22:02:50 +0100
In-Reply-To: <20060827201648.GA8845@wohnheim.fh-wedel.de>
References: <20060827171728.GB3502@wohnheim.fh-wedel.de>
	<20060827181245.GA14544@gen.formicary.org>
	<20060827201648.GA8845@wohnheim.fh-wedel.de>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Type: text/plain; charset=ISO-8859-1; delsp=yes; format=flowed
Message-Id: <49D5FD4D-4DEC-48CB-B097-D8FD113EA542@mac.com>
Content-Transfer-Encoding: quoted-printable
From: Kyle Moffett <mrmacman_g4@mac.com>
Subject: Re: LogFS
Date: Sun, 27 Aug 2006 16:53:14 -0400
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

On Aug 27, 2006, at 16:16:48, J=F6rn Engel wrote:
> On Sun, 27 August 2006 14:12:45 -0400, Ian Lindsay wrote:
>>
>> So, 28 should be enough for everyone?
>
> No, it just took me more prodding to notice my thinko.  Thank you =20
> for noticing, the bloody bug is fixed now.
>
> Btw, isn't 2^30 32 rather than 28?

Not really. 30 already has the 2 bit set:
   30 =3D 0b11110 =3D 16 + 8 + 4 + 2 + 0
   28 =3D 0b11100 =3D 16 + 8 + 4 + 0 + 0

Feel free to run this in a terminal to check: :-)
   perl -e 'print( (30^2) ."\n" );'

Cheers,
Kyle Moffett
