Received: from fmr19.intel.com ([134.134.136.18] helo=orsfmr004.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfZ3s-0001A4-UC
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 03:36:09 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Nov 2005 16:36:00 +0800
Message-ID: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>
From: "Zhao, Forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem

I have been thinking the GC in JFFS3 during these days. But I can't
think out a perfect answer for it. So I want to have some discussion=20
with you.

I think the basic problem is: we need to keep track of both erase
blocks usage(which pages on block are obsolete) and erase blocks
with small erase count in order to achieve the reclamation
efficiency and wear-leveling in GC.
1
If we store the erase block usage information in a file on flash,
we need to sort it in RAM in order to find the dirtiest one.
Then this sort operation is O(N), N is the number of erase blocks.
Also the memory consumed by this sorted data structure is O(N).

2=20
Whether erase count is stored in erase block header or in a file on
flash, we need to sort it in RAM in order to find the one with least
erase count for WL. Also this sort operation is O(N), N is the number
of erase blocks. Also the memory consumed by this sorted data
structure is O(N).

I used to think that we could put the sorted data structure on flash,
but this will incur enormous update operations.

Seems there's no a perfect solution for it. What's your idea
 about this?

BTW. I read some news that Samsung planned to use NAND of large
Volume (8G, 16G) to replace harddisk. But I think the out-of-place
update and limited erase times nature of flash memory makes this
replacement impossible(at least in new future). Although flash has
a faster RW speed than HD, I don't think the real writing operation
(running a file system) on flash will have a better performance than
the one on HD since an update operation on HD will incur multiple
update operations on flash. I think the FS write performance on
flash and FS scalability contradicts with each other.=20
What's your opinion about the NAND replacing HD?

Thanks,
Forrest
