Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ExRY4-0002Oh-AK
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 11:13:13 -0500
Received: by wproxy.gmail.com with SMTP id i2so636235wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jan 2006 08:13:06 -0800 (PST)
Message-ID: <e02f82380601130813y57900b8do909d942d48ad4da5@mail.gmail.com>
Date: Fri, 13 Jan 2006 11:13:06 -0500
From: Ron Kundla <rkundla@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Any reported mtd issues with Intel Strataflash TE28F128 J3D75?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

A board I work on is moving from the TE28F128 J3C150 to the TE28F128
J3D75 because the J3C parts are going obsolete. According to the Intel
migration guide, the J3D part is a drop in replacement for the J3C
with a couple of exceptions, such as a change when reading the block
locking configuration identifier codes (J3D uses 0x0000/0x0001 versus
J3C using 0xFFFC/0xFFFF) and some minor detail about the Enhanced
Configuration Register (ECR).

I am using the mtd driver from the 2.4.20 build of Linux (hisses from
the crowd using old kernel) and the problems I am seeing with the new
flash is I get *sporadic* errors on the write cycle. Reading and
erasing seem to work okay.

I've checked my chip select timings and they are in spec for the J3C
part which is okay also for the J3D part.

I appreciate any insight you all might have.

Regards,
Ron Kundla
