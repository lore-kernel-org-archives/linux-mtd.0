Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17foPm-0005AO-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 22:13:50 +0100
Received: from ns5.arlut.utexas.edu (ns5.arlut.utexas.edu [10.4.1.6])
	by ns2.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id g7GLDklg046795
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 16:13:46 -0500 (CDT)
Date: Fri, 16 Aug 2002 16:13:44 -0500
Subject: Found ecc verify bug in nand.c
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
From: Ken Offer <koffer@arlut.utexas.edu>
To: LinuxMTD <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <0BBECB8C-B15D-11D6-BE50-000393467F1A@arlut.utexas.edu>
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

Hi all,

Using the cvs code from August 12th, I found a bug in nand.c 
that was causing a page write to fail ecc verify.  In nand.c in 
the function "nand_write_page" there is a line which reads:

    if ((this->data_buf[(oob_config.ecc_pos[i])] != 
ecc_code[i]) && ecc_code[i]) {

This is a compare to see if the ecc has changed.  Unfortunately, 
data_buf is UNSIGNED char and ecc_code is SIGNED char.  When 
compiling under gcc 2.95.3 on a powerpc system, the code ends up 
comparing two identical bytes and fails because one is 
sign-extended (example: comparing 0xc3 becomes "0xc3 == 
0xffffffc3").  I don't know if this makes a difference with the 
x86 compiler, but it does under powerpc.

Changing the local array "ecc_code" to type "u_char" resolves 
the problem.  Verified by running nandtest.

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
