Received: from kuzey.cc.boun.edu.tr ([193.140.192.30])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CnZ9-0004Qv-Rx
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 22:32:08 +0100
Received: (from Yarasa [193.140.204.176])M2003050600323523663
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 00:32:35 +0300
From: "Sinan Kusdogan" <kusdogan@boun.edu.tr>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 6 May 2003 00:33:01 +0300
Message-ID: <001f01c3134d$e7a25190$b0cc8cc1@Yarasa>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: CFI chip problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to boot my own kernel on a non-standard board that uses Hynix
7201 CPU. I've its original zImage that boots successfully. But my own
kernel couldn't find my Hynix Flash ROM which is fully CFI compatible.
It can not detect the CFI chip using cfi_send_gen_cmd functions in
"cfi_probe.c" file. Chip's at physical address 0. 

1. How can i find the virtual address of flash from the original kernel?

2. Why doesn't physically mapping at location zero work?

Thnx,
Sinan Kusdogan
