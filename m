Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SgL2-0001aP-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 16:58:40 +0100
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "Patrik Fuchs" <pfuchs@giga-stream.de>, <linux-mtd@lists.infradead.org>
Subject: RE: Boot kernel right from JFFS2
Date: Thu, 11 Jul 2002 08:58:06 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFGEJGDJAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <MNEEJPPNAELHIHNGGLHOAEJNCAAA.pfuchs@giga-stream.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Is it possible to boot a compressed kernel(Version 2.4.17) with ppcboot
> 1.1.5 right from jffs2 as root filessystem residing on the first MTD
> partition? Do you have a description or a HOWTO for that?

We are not using ppcboot but this is what I did that seemed to make sense.
1. Create a minimum of 2 MTD partitions
2. Use the first MTD partition to store the compressed image. This is really
just a place holder and you never mount it.
3. You can either jump to the compressed image location if you are using the
embedded boot or copy it from flash into RAM, I assume this is something
that ppcboot can handle just fine.
4. Your default boot line will contain something like: root=/dev/mtdblock1.
Depending on your kernel, you may have to apply a patch so it recognizes
JFFS2 as a valid root file-system type. (I had this problem with HHL 2.0)

Using this approach eliminates the need for the BIOS to understand the
file-system structure. Of course there is also the initrd, mount jffs2 from
the ramdisk approach. Pick your poison.

Hope this helps...
