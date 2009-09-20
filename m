Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MpPpB-0006lG-9l
	for linux-mtd@lists.infradead.org; Sun, 20 Sep 2009 17:03:50 +0000
Date: Sun, 20 Sep 2009 19:01:31 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: RFC: nand and onenand can't coexist
Message-ID: <20090920170130.GA19668@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
Cc: STEricsson_nomadik_linux@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While testing the nomadik-onenand patch as applied by
dwmw2 to the mtd-2.6 git tree, I found that I can't declare
both a nand and onenand platform device in the same file.

The problem arises from the new platform_data for onenand, which
requires me to include <linux/mtd/onenand.h> in the same
file where I include <linux/mtd/nand.h>.

There are two errors reported:

* onenand_state_t and nand_state_t define the same enums,
  but with different values

* struct nand_bbt_descr and other material is defined both
  in nand.h and bbm.h.

For the latter, including bbm.h from nand.h, removing duplicates,
should work file (I'm going to try it right now).

The former is more of an issue, moreso because the same values
(FL_READY and such) are defined in <mtd/flashchip.h> as well.
Shouldn't they be rather unified?

A quick grep shows that

* nand_state_t is defined by ./include/linux/mtd/nand.h
  and never used.

* onenand_state_t is defined by ./include/linux/mtd/onenand.h
  and never used

* flstate_t is defined in ./include/linux/mtd/flashchip.h
  and used in a few places.

Should I try to unify things in order to allow OneNand and Nand
coexist in the same board source file and remove duplicates?

I'm going to work on the problem anyways, I just don't know
if patches in this direction are acceptable or not.

thanks
/alessandro
