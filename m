Received: from out3.bezeqint.net ([192.115.188.209])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVTsA-0004oa-E1
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2010 18:57:15 +0000
Received: from mail.wellsense-tech.com (bzq-218-140-171.cablep.bezeqint.net
	[81.218.140.171])
	by out3.bezeqint.net (Postfix) with ESMTPA id 59DC65E4AEB
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 20:57:10 +0200 (IST)
From: Boaz Ben-David <boaz.bd@wellsense-tech.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 22 Dec 2010 20:53:27 +0200
Subject: RE: UBIFS reboots issue
Message-ID: <39A4B204C321D34DA3490E3B119D5A6C68BF77573C@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
	<39A4B204C321D34DA3490E3B119D5A6C68BF776745@SBS2008.wellsense.local>
	<39A4B204C321D34DA3490E3B119D5A6C68BF776746@SBS2008.wellsense.local>,
	<4D123ED5.3080103@grid-net.com>
In-Reply-To: <4D123ED5.3080103@grid-net.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the quick reply.

About the bad flash part, I am not too sure this is the case.
We can reproduce this on every one of our devices, and also on the developm=
ent board we used which has another (different part number)=20
Samsung chip, also MLC.

Boaz.

________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Steve Iribarne [siribarne@grid-net.com]
Sent: Wednesday, December 22, 2010 8:09 PM
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS reboots issue

> Ok, got it.
>
> Here is the ubiattach and mount outputs:
>

I know we've seen this error... I'm asking someone else here what caused
it...

UnCorrectable RS-ECC Error
UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB



I thought it was a bad flash part but not sure... I'll get back to you
as soon as he answers.  He works remote today.

-stv

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
