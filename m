Received: from [81.6.214.140] (helo=mail.infocell-its.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DImhG-0008LG-IX
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2005 07:58:19 -0400
Message-ID: <42527DD5.4080009@infocell-its.com>
Date: Tue, 05 Apr 2005 13:00:21 +0100
From: Zeri Virgo <zerivirgo@infocell-its.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>
	<424CAE31.8040302@ieee.org> <425157C5.4040007@infocell-its.com>
	<425181A7.2010809@ieee.org>
In-Reply-To: <425181A7.2010809@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:
> A recent modification to support variable-sized
> ecc_calc and ecc_code arrays didn't take into account the possibility of 
> NULL oobsel.  Fixed in CVS.
> 
> Let me know if DOCBoot finally works for you, please!

OK... diskonchip probing was fine with a fresh chip. Here's what I've
tried...

Built a kernel with MTD etc linked in (temporarily including hard-disk
stuff) and verified booting it from the hard-disk (obviously the 
diskonchip driver doesn't show the firmware partition, but that's ok).

Used M-Systems dformat (from tffs_5.1.4_DOS_TOOLS.zip) to resize the
firmware area
     A:\> DFORMAT /WIN:D000 /BDKL0:2M

Rebooted into a kernel with modules and ran
     # modprobe diskonchip show_firmware_partition=1
     # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00004000 "DiskOnChip 2000 (NFTL Model)"
mtd1: 00208000 00004000 " DiskOnChip Firmware / Media Header partition"
mtd2: 03df8000 00004000 " DiskOnChip BDTL partition"

Edited docboot/cmdline to
     root=/dev/mtdblock1 rootfstype=jffs2 ro

Uncommented "#define OLD_DOC2K" in doc_bootstub.h

Copied in the bzImage I'd tested booting from hard-disk.
     # make
     # flash_eraseall /dev/mtd1
     # nandwrite -o /dev/mtd1 doc_spl
     # flash_eraseall -j /dev/mtd2

Tested mounting and unmounting /dev/mtdblock2 which seemed OK. (My 
cmdline above assumes that this will show as /dev/mtdblock1 when the 
linked-in driver is loaded.)
Rebooted and disabled/removed all other boot devices. As the BIOS gets 
going, I see "Installing DOCBoot." then a "System Configurations" page with
     ...<snip>...
     Verifying DMI Pool Data .........
     Loading kernel... _

where the "_" is a flashing cursor. The keyboard is unresponsive and 
nothing further happens :(

By the way, I have not yet copied any files to the jffs2 filesystem on 
/dev/mtdblock1 except a small text file to test the filesystem.

Any ideas? I'd really like to get this going.

Thanks again,

- Zeri
