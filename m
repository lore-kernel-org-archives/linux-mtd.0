Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm8QV-0004zC-Bp
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 15:20:34 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id n2OFKDb9004762
	for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2009 10:20:19 -0500
Received: from dbde70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id n2OFKCTs014422
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Mar 2009 20:50:13 +0530 (IST)
From: "Singh, Vimal" <vimalsingh@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 24 Mar 2009 20:50:11 +0530
Subject: Is high_memory check in omap2.c for OneNAND is sufficient?
Message-ID: <19F8576C6E063C45BE387C64729E73940427A869DA@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

There is check for 'high_memory' in 'drivers/mtd/onenand/omap2.c', always b=
efore doing 'dma_map_single'.
Snippet:
----------------------
        if (buf >=3D high_memory) {
                struct page *p1;
----------------------
This check seems not sufficient. There should be a check for upper boundary=
 too.
Thinking scenario when 'buf' is less than 'high_memory', but somewhere near=
 to it, and 'count' is big enough to beyond 'high_memory'.
Then again, function 'dma_cache_maint' will report bug.

Snippet:
--------------
void dma_cache_maint(const void *start, size_t size, int direction)
{
        const void *end =3D start + size;

        BUG_ON(!virt_addr_valid(start) || !virt_addr_valid(end - 1));
-------------

Should we replace "if (buf >=3D high_memory)" with "if (buf >=3D high_memor=
y || (buf + count -1) >=3D high_memory)"...?

---
vimal=
