Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MWtI-0003ae-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:08:20 +0000
Received: from srvmail-mtl.montreal.ubisoft.org (srvmail-mtl.ubisoft.qc.ca [205.205.27.194])
	by ns1ca.ubisoft.qc.ca (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA29220
	for <linux-mtd@lists.infradead.org>; Fri, 4 Jan 2002 11:19:13 -0500
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8406456D89@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: linux-mtd@lists.infradead.org
Cc: Patrick Allaire <pallaire@gameloft.com>
Subject: From 2.4.9 to CVS ???
Date: Fri, 4 Jan 2002 11:19:13 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

I was using the MTD drivers wich came with the linux 2.4.9 kernel source
code ... now I have moved to 2.4.17 but I have also updated the mtd drivers
with the CVS code, but I am no longer able to boot from my flash. 

MTD setup :

MTD support
MTD partitionning support
Direct char device access to MTD devices
Caching block device access to MTD devices
Detect flash chips by Common Flash Interface (CFI) probe

Support for ST flash chips (it a port from intel chips ... the only
difference, is in the writing because st flash does not support word write
... only complete block writes, its a cfi_cmdset_0020 )

CFI Flash device mapped on My Own Partitions ... same thing as 2.4.9


Every thing is compiled fine ... at boot up, MTD find(probe) my flash, it
printout the partioning it will do ... after that I get 

VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory : 36k freed
Kernel panic: No init found....


I know from the last line that the problems is that the kernel cannot find
/sbin/init ... but it is there, it is exactly the same cramfs I used on
2.4.9 when it was working !!! To be sure it was not corrupted, I redid the
flashing of the /dev/mtdblock0 with my cramfs file ... with the same
results.

Any idea ???

thank you.

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
