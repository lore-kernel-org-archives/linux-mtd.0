Received: from endruntechnologies.com ([130.94.228.14])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjC2n-0002HS-J5
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 03:13:10 -0400
Received: from unknown (HELO endruntechnologies.com) ([67.169.85.122])
	(envelope-sender <bmpenrod@endruntechnologies.com>)
	by 130.94.228.14 (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Jul 2004 07:13:07 -0000
Message-ID: <40EF9703.1010907@endruntechnologies.com>
Date: Sat, 10 Jul 2004 00:13:07 -0700
From: Bruce Penrod <bmpenrod@endruntechnologies.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: ST Micro M29W641D clone of AM29LV641D needs extra reset command
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ths ST Micro M29W641D nor flash chip is a clone of the AMD AM29LV641D. 
As usual, it's not quite a perfect clone and I've solved a problem in 
using it with the cfi_cmdset_0002() probe that is included in the 2.4.26 
kernel mtd driver.

The difference in the two chips is that after a cfi query command is 
performed while in the auto-select state, the ST Micro chip needs two 
reset commands to return to the read state.  The first reset command 
only causes the ST Micro chip to go back to the auto-select state.  The 
AMD part jumps all the way back to the read state with only one reset 
comand.

So the very simple fix which seems to work for me is to add a second 
reset command after the existing one at the bottom of cfi_cmdset_0002(). 
  This is the only place in the mtd code where I found cfi query being 
performed while in the auto-select state.

I haven't tried to determine if this is a common problem across the 
entire ST Micro AMD clone flash product line, but the second reset 
command can do no harm and might solve problems for many.

Bruce
