Received: from cmsrelay03.mx.net ([165.212.11.112])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B189C-00031g-Kz
	for linux-mtd@lists.infradead.org; Wed, 10 Mar 2004 18:09:39 +0000
Message-ID: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 10 Mar 2004 12:12:21 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: free_list / free_size messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Since moving from JFFS2 2.1 to 2.2, I have noticed klog messages I didn't
see before.  It only seems to happen after a fresh flash when writing data
to the romfs.  sometimes I get a few messages, but this time I only got the
one:

Mar 10 12:07:25 klogd: Eep. Block 0x00120000 taken from free_list had
free_size of 0x00000038!!

It seems to recover, and I cannot find any corrupt files.  I see this error
also listed in the 2.1 source code, but never actually *got* the error
before.

Could someone explain what would cause it?  Sorry if this has been discussed
before, I didn't see anything on it when searching.

Thanks,

-Brian
