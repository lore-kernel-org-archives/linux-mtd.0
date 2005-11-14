Received: from relay02.roc.ny.frontiernet.net ([66.133.182.165])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbhvL-0002io-LZ
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 12:15:24 -0500
From: John Bowler <jbowler@acm.org>
To: "'David Vrabel'" <dvrabel@arcom.com>
Date: Mon, 14 Nov 2005 08:37:38 -0800
Message-ID: <006c01c5e939$ba996570$1001a8c0@kalmiopsis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <43786392.5030102@arcom.com>
Cc: linux-mtd@lists.infradead.org,
	'Alessandro Zummo' <azummo-lists@towertech.it>
Subject: RE: ixp4xx stuff
Reply-To: jbowler@acm.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Vrabel
>> along with the other NSLU2 patches.  We found that it is now =
necessary to
>> set CONFIG_MTD_LE_BYTE_SWAP - with the NSLU2 patches =
CONFIG_MTD_BE_BYTE_SWAP
>> must be set.  If this is not done (i.e. if BE is set) the flash probe =
fails.
>
>Neither of these options should be enabled.  The flash data is returned
>in the same order regardless of the endianness of the CPU.

What is the difference between CONFIG_MTD_BE_BYTE_SWAP and ..._NO_SWAP =
on a
BE machine?

John Bowler <jbowler@acm.org>
