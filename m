Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L4fEF-0001rf-QO
	for linux-mtd@lists.infradead.org; Mon, 24 Nov 2008 17:28:08 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2258229wfc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Nov 2008 09:28:05 -0800 (PST)
Message-ID: <52e42efe0811240928g6bc4c8a6rd7483289f0ae83a2@mail.gmail.com>
Date: Mon, 24 Nov 2008 18:28:05 +0100
From: "Sidney Amani" <seed95@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [UBI] UFFS : Unified Flash File System
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are forth year Epitech (www.epitech.eu) students, our six member
team plan to use and maybe improve UBI as part of our end studies
project.

Our project is UFFS for Unified Flash File System, Unified because it
is going to allow mounting any kind of NAND Flash Memory, this means
any bare Flash or Flash on top of FTL.

It is also going to be ported on several operating systems, we plan to
supported on Fuse (Linux, *BSD, MacOs-X) and Windows and Linux (as a
Kernel module).

      UFFS
   ____/|\
  /        | \
Block    |  |\
  |        |  |  \
 FTL     |  |   \
  |\____/  |    \
  |       |   |     |
  |     UBI |     |
  \       \   |     |
   \       \_|     |
    \         |     |
     \      MTD |
      \____|___|
              |
           NAND

This scheme means if  UBI is available we use it but if it's not
(WinCE) we have to develop a UBI-Like layer.

We contactyou to let you know about our intention and maybe get any
information about some work in progresss of UBI related project?

Has someone heard about a WinCe UBIFS version?

What do you think about our project?

Any suggestion will be welcomed.

--
Sidney Amani
