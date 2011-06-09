Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUePC-0006KG-O1
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:32:11 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUeP2-0003Yb-UM
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:32:00 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 14:32:00 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 14:32:00 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Thu, 09 Jun 2011 14:31:46 +0200
Message-ID: <m3f1v61in4l13ths5ibps1n3gvu159ia2k@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<1307622037.7374.81.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 09 Jun 2011 15:20:37 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>> Default UBI LEB size:           129024 bytes, 126.0 KiB
>> Maximum UBI volumes count:      128
>> ==============
>> #Create root filesystem
>> ubuntu:/> mkfs.ubifs --squash-uids -m 2048 -e 131072 -c 1984 -d
>
>Use  -e 129024

Thanks Artem, but I'm still getting the error :-/

Here's what I did:
========================
ubuntu:/> mkfs.ubifs --squash-uids -m 2048 -e 129024 -c 1984 -d
./romfs -D device_table-min.txt -o ./images/rootfs.ubifs

ubuntu:/> cat ubi.cfg
[ubifs]
mode=ubi
image=./images/rootfs.ubifs
vol_id=0
;What size to use?
vol_size=248MiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize

ubuntu:/> ubinize -o rootfs.ubi.img -m 2048 -p 128KiB -s 512 ./ubi.cfg
ubuntu:/> mv rootfs.ubi.img /var/www

appliance:> cd /var/tmp ; wget -c http://192.168.0.3/rootfs.ubi.img

appliance:> ubiformat /dev/mtd2 -s 512 -f rootfs.ubi.img

appliance:> ubiattach /dev/ubi_ctrl -m 2
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: vtbl_check: too large reserved_pebs 2016, good PEBs 1984
UBI error: vtbl_check: volume table check failed: record 0, error 9
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
ubiattach: error!: cannot attach mtd2
           error 22 (Invalid argument)
========================

According to some out-of-band information, "In most cases, the formula
for the offset boils down to: LEB_size = PEB_size - (((Subpage_size +
Page_size) * Page_size) / Page_size)".

So, using the infos provided by mtdinfo, I find this: 131.072 - (((
512 + 2.048) * 2.048 ) / 2.048 ) = 128.512

Should I use that number instead of 129024?

Also, I wonder if maybe I should leave some room in the NAND partition
for the Ubifs journal + error log? I used vol_size=248MiB in ubi.cfg,
but maybe this is too big?
