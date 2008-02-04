Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JM2IH-0007vn-KK
	for linux-mtd@lists.infradead.org; Mon, 04 Feb 2008 14:27:40 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: JFFS2: file contents in case of data CRC error
Date: Mon, 4 Feb 2008 17:25:17 +0300
Message-ID: <523F3D8D8C97554AA47E53DF1A05466A01881021@nnsmsx411.ccr.corp.intel.com>
In-Reply-To: <47A49B39.5010903@dave-tech.it>
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
	<47A32600.9000807@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
	<47A49B39.5010903@dave-tech.it>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: "llandre" <r&d2@dave-tech.it>
Cc: linux-mtd@lists.infradead.org, jamie@shareable.org, mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>> -> As result hole in the file has been formed.=20
>> -> You read 0x0 in the middle of the file.
> I can't find the function that, in case of obsolete node, zeroes the=20
> chunk of data passed to user space. Can you?
See jffs2_read_inode_range() function.

>> I think nobody considered such tests before. I am not sure if any
file
>> system may be reliable in such a case with temperature tests.
> Hmm ... I don't think the environmental condition may influence JFFS2=20
> behaviour. The NAND used in the test is industrial grade so it is=20
> guaranteed by manufacturer that it works in -40/+85 degC range. JFFS2=20
> clearly does not anything about environment temperature. On the other=20
> hand I'm wondering if temperature variation caused multiple bit
flipping=20
> in one NAND block that MTD was not able to correct and this led to the

> problem we are talking about.

I guess the problem is related to multiple bit flipping caused by
temperature.=20

Thanks,
Alexey
