Received: from smtp.mailix.net ([66.11.225.183])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7xAJ-0000MI-1o
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 21:22:43 +0000
Received: from [77.66.67.178] (helo=[192.168.0.10])
	by smtp.mailix.net with asmtp (Exim 4.24-CA) id 1P7xAX-0004rs-EM
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 14:22:57 -0700
Message-ID: <4CBCBA9D.4040202@jeppesens.com>
Date: Mon, 18 Oct 2010 23:22:37 +0200
From: Karsten Jeppesen <karsten@jeppesens.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Expanding UBI fs to maxavailable size
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,
....I think I found an error :-)

I have an ARM platform with either 32 or 64MB FLASH, and I want to make 
an image that I can burn more or less directly (ie: not tar) into the 
flash regardless if its the 32 or the 64MB edition.
So I assumed that is what the autoresize flag is about, but maybe I am 
wrong here.
I can get ubiformat to burn the image to the flash, but subsequently the 
filesystem doesn't expand to occupy the max available area.
What am I doing wrong - and how is it supposed to be achieved? Or is 
this an error or a missing feature?

Content of ubinize.cfg is>
---
[kjp_ubi]
mode=ubi
image=kjp.img
vol_id=0
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize
---

and my generation script looks like this:
---
#!/bin/sh
rm -rf work *.img 2>/dev/null
mkdir work
tar xzf armroot-stripped.tar.gz --directory work
mkfs.ubifs --root=work --min-io-size=1 --leb-size=130944 
--max-leb-cnt=232 -o kjp.img -x zlib
ubinize -o ubi.img --min-io-size=1 --peb-size=131072 ubinize.cfg
---

Burning the image to flash using:
ubiformat /dev/mtd4 -e 0 --yes -f ubi.img

The resulting filesystem will in the 64 MB edition be about 470 leb's. 
But the stupid thing wont expand. Sigh.

Enlightenment will be greatly appreciated

Sincerely,
Karsten Jeppesen
