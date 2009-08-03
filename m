Received: from mail64.messagelabs.com ([216.82.249.227])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXnzG-0001rU-L3
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 03:13:27 +0000
To: linux-mtd@lists.infradead.org
Subject: OOB data difference
MIME-Version: 1.0
Message-ID: <OFE6E75894.8CE7F818-ON65257607.0010CA03-65257607.00115485@lntemsys.com>
From: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>
Date: Mon, 3 Aug 2009 08:51:17 +0530
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I booted with ramdisk rfs image and erased one of the flash partition with 
flash_eraseall (with -j option) utility. The OOB data written in the 
partition was as shown as below.

OOB:
        ff ff ff ff ff ff 9a a5
        a6 ff ff ff ff ff ff ff
        ff ff ff ff ff ff 03 33
        0c ff ff ff ff ff ff ff
        ff ff ff ff ff ff 03 c0
        3f ff ff ff ff ff ff ff
        ff ff ff ff ff ff a5 65
        a6 ff ff ff ff ff ff ff

Then, booted with jffs2 rfs image and repeated same operation, the OOB 
data written was

OOB:
        ff ff ff ff ff ff 0c 33
        0c ff ff ff ff ff ff ff
        ff ff ff ff ff ff 30 ff
        0c ff ff ff ff ff ff ff
        ff ff ff ff ff ff f3 cf
        3c ff ff ff ff ff ff ff
        ff ff ff ff ff ff ff c0
        0c ff ff ff ff ff ff ff

command used for erasing flash partition in both cases was 
# flash_eraseall -j /dev/mtd11

I want to know :-
1) why there is difference between written OOB data when erasing while 
booted with ramdisk image and that of when booted with jffs2 image , even 
though i am using same utility (with same option) to erase flash 
partition.
2) is flash_eraseall utility functionality depends on the type of RFS 
system booted with ?
 

Thanks
Rupesh 
