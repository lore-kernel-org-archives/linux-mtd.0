Received: from www.sshw.com ([65.18.154.155]
	helo=skynetaccess.skynetaccess.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMqTE-0007jh-U8
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 15:11:49 +0000
Received: from earthlink.net (ba.e5bccf.client.atlantech.net
	[207.188.229.186])	(authenticated (0 bits))hAKF9ie18820
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 10:09:44 -0500
Sender: train@skynetaccess.skynetaccess.net
Message-ID: <3FBCD93B.43DCED6B@earthlink.net>
Date: Thu, 20 Nov 2003 10:09:47 -0500
From: Phil Wilshire <philwil@earthlink.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: MTD ( JFFS2 ) and NFS interaction ARM7TDMI
Reply-To: philwil@earthlink.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am seeing failures when using cp to copy from a nfs mounted file into a 
local flash mounted partition

This is the sort of error I am seeing.

> > Data CRC 0990e3c7 != calculated CRC a7975f2e for node at 00072e80
> > cp: write: Input/output error

Other transfers from local ram to local flash work fine
Also using wget to transfer the file from the server seems to be working.

Interestingly enough using wget to retrieve the file takes about 1/2 the time as a ram
to flash copy.

Looks like a NFS interaction with MTD.

Any one else seen this behavior ?

best regards

   Phil Wilshire

-- 

SDCS -- System Design & Consulting Services LLC, http://www.sysdcs.com
** Embedded Linux Training **  email me for details  
630 Springhouse Sq., Leesburg VA 20175 t: 703 669 9766 f: 703 669 9768
