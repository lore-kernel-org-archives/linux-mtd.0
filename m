Received: from [213.154.159.190] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fULD-00040j-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 23:15:32 +0000
Received: from localhost (IDENT:rcorlan@localhost.localdomain [127.0.0.1])
	by pinot.profis.ro (8.9.3/8.8.7) with ESMTP id BAA01289
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 01:30:10 -0500
Date: Tue, 26 Feb 2002 01:30:10 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: linux-mtd@lists.infradead.org
Subject: Support for parallel access in nand chips
In-Reply-To: <0202251944320H.03406@thomas>
Message-ID: <Pine.LNX.4.10.10202260121390.701-100000@pinot.profis.ro>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On our application (a PPC405 embedded system), we use two TC58256 NAND
chips conected on a 16-bit bus. we designed it this way in order to
increase the read/write speed - it would double our bandwidth. The
problem, of course, is that nand.c only accesses the flash 8 bits at a
time.

We intend to hack nand.c to use the 16-bit access (and make a special
entry in nand_chip with a double erase_size), but i'd like to know if
anybody thought of supporting the parallel access.

Radu

-------------
Radu Corlan           Snail Mail: Bucuresti sect. 1, 
rcorlan@pcnet.ro             str. Argentina nr. 28, 71206 Romania

   You can still escape the "Gates" of Hell!   
                 Use Linux!                       
-------------
