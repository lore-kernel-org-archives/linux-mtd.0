Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16g3wy-0006xJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 13:16:52 +0000
Message-ID: <003201c1bf92$97c3b340$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: I need your help . 
Date: Wed, 27 Feb 2002 08:26:46 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

hiram@thyme.com.tw said:

> Sorry, we don,t support UnitSizeFactor of !=1 yet

I've seen this happen with the latest versions (5.0) of the M-Systems firmware.  Using the
4.2 version (still available at www.m-sys.com) makes this problem go away.

To clarify, use the DOS DFORMAT utility with the DOC42.EXB file.  The TrueFFS driver for
Linux is *not* needed - as this is what the open-source MTD drivers are replacing.
