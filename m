Received: from rcsinet15.oracle.com ([148.87.113.117])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RDCAZ-0002ln-Vf
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 09:29:12 +0000
Date: Mon, 10 Oct 2011 12:28:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [smatch stuff] mtd/ubi/gluebi: signedness warnings
Message-ID: <20111010092857.GA16165@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Smatch complains about some to the checks in gluebi.c

drivers/mtd/ubi/gluebi.c +177 gluebi_read(6) warn: unsigned 'len' is never less than zero.
drivers/mtd/ubi/gluebi.c +221 gluebi_write(6) warn: unsigned 'len' is never less than zero.
drivers/mtd/ubi/gluebi.c +270 gluebi_erase(7) warn: unsigned 'instr->len' is never less than zero.

I think probably these checks can just be removed?  Can these things
wrap if we passed a huge value for instr->len?

   270          if (instr->len < 0 || instr->addr + instr->len > mtd->size)
   271                  return -EINVAL;

I don't know enough about how these are called to say.

regards,
dan carpenter
