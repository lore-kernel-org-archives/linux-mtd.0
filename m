Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KV1lb-0004Nb-An
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 10:15:16 +0000
Message-ID: <48A9186D.3050902@nokia.com>
Date: Mon, 18 Aug 2008 09:36:29 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dfoley <dfoley@telus.net>
Subject: Re: ubifs mount size
References: <g85ka8$cpi$1@ger.gmane.org>
In-Reply-To: <g85ka8$cpi$1@ger.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dfoley wrote:
> Does this look right (info below) ?
> I create a 55MiB volume, but df only shows 33968KiB
> This is linux-2.6.24.4. I've also used linux-2.6.27-rc3.
> 
> 
> root@tsi-sa2410:~# ubimkvol /dev/ubi1 -N root -s 55MiB
> Volume ID 0, size 3755 LEBs (57676800 bytes, 55.0 MiB), LEB size 15360 
> bytes (15.0 KiB), dynamic, name "root", alignment 1
> root@tsi-sa2410:~# mount -t ubifs ubi1:root /mnt/linux2-root/
> UBIFS: default file-system created
> UBIFS: background thread "ubifs_bgt1_0" started, PID 930
> UBIFS: mounted UBI device 1, volume 0, name "root"
> UBIFS: file system size: 57292800 bytes (55950 KiB, 54 MiB, 3730 LEBs)
> UBIFS: journal size: 2872320 bytes (2805 KiB, 2 MiB, 187 LEBs)
> UBIFS: default compressor: LZO
> UBIFS: media format 4, latest format 4
> root@tsi-sa2410:~# df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> rootfs                    8059      5284      2366  69% /
> /dev/root                 8059      5284      2366  69% /
> /dev/root                 8059      5284      2366  69% /dev/.static/dev
> ubi1:root                33968         0     31204   0% /mnt/linux2-root

Yes this looks right.  UBIFS doesn't really know how much data can be fitted
in the file system, so it makes a worst case estimate.
