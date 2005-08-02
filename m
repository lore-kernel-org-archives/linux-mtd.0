Received: from postfix3-2.free.fr ([213.228.0.169])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E01nr-0004Ib-PY
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2005 14:48:05 -0400
Received: from [192.168.1.100] (tou31-1-82-235-144-230.fbx.proxad.net
	[82.235.144.230])
	by postfix3-2.free.fr (Postfix) with ESMTP id CB76EC18C
	for <linux-mtd@lists.infradead.org>;
	Tue,  2 Aug 2005 20:47:46 +0200 (CEST)
Message-ID: <42EFDC03.3000104@free.fr>
Date: Tue, 02 Aug 2005 22:48:03 +0200
From: Christian Gagneraud <chgans@free.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: MTD+DOC2000+Grub issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm facing issue when using grub on DOC200 with MTD on a PC104/i586 
system (apx4d from blue chip tech.).
I've read carrefully 
http://lakeshoremicro.com/diskonchip-grub-howto.html, and others docs 
and mailing list archives on the net, but i doesn't understand what's 
wrong with my system.

Before doing anything the BIOS gives the folowing message:
--
WAIT...
DOC Socket Services - Version 0.2
(C) Copyright 1992-1996, M-Systems Ltd.

TrueFFS-BIOS -- Version 3.3.9 for DiskOnChip 2000 (V4.2)
Copyright (C) M-Systems, 1992-2000

Apx-4d Solid State Disk BIOS v1.01.00
(C)1997-1998 Blue Chip Technology Ltd.

[normal behaviour follow]
--

Once i've reflashed successfully the Doc (and after lot of try and 
unsucces) with a freshly build grub (v0.94 with mtd patch), the best i 
get is:
--
WAIT...
Doc Found
Doc Found
Apx-4d Solid State Disk BIOS v1.01.00
(C)1997-1998 Blue Chip Technology Ltd.

[No grub promt, behaviour as if grub was ignored]
--

What's i've noticed, is the double "DoC Found" message, instead of a 
"DoC found" followed by a "Doc 2000".

by reading through doc_stage1.S -- as i understand --, grub "just"
copy itself at top memory, store it's address and register its INT18 
handler, and finally "lret".
It then expect to be called again by the just registered INT18, but 
that's not what append...
Instead it is call again "from the begining" and that's all!


I guess i'm doing the rigth thing, but my sytem is perhaps exotics, due 
to the second firmware?

Has anyone any clue on this?

Christian.
