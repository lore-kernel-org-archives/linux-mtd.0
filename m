Received: from smtp102.sbc.mail.gq1.yahoo.com ([67.195.15.61])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK39G-0000rp-8s
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 04:34:57 +0000
From: David Brownell <david-b@pacbell.net>
To: vimal.newwork@gmail.com
Subject: Re: query: nand read/write method for 2048 + 64 byte page
Date: Thu, 25 Jun 2009 21:28:08 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906252128.08460.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I noticed

 http://lists.infradead.org/pipermail/linux-mtd/2009-June/026133.html

I don't think I understand the question.  But I have two comments
that might help:

 - First, the ECC schemes don't dictate much about how the
   OOB area gets laid out, so what's the problem?  Just pick a
   layout that doesn't clobber manufacturer bad block markers
   and you'll be pretty much OK.  Stick all ECC at the end, to
   keep it simple.

 - Second, I believe that you will see some issues if you
   try to have ECC cover the OOB too.  Problem being that
   the raw_write primitives are used to write OOB data and
   they don't believe it will be ECC protected.

ECC_HW should probably work fine.  You'll just provide your
own ecclayout struct, and set things up so the NAND core knows
the hardware works in 512 byte chunks that give 7 byte each of
ECC data.

- Dave
