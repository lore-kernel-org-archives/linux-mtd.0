Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CSfO6-0003F2-6P
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 12:39:07 -0500
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.12.10/8.12.10) with ESMTP id iACHd2eg009581
	for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2004 17:39:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 09545-01 for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2004 17:39:01 +0000 (GMT)
Received: from max (max.rpnet.com [192.168.1.15]) (authenticated bits=0)
	by tim.rpsys.net (8.12.10/8.12.10) with ESMTP id iACHd0lY009569
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2004 17:39:01 GMT
Message-ID: <010b01c4c8de$82cc2b90$0f01a8c0@max>
From: "Richard Purdie" <rpurdie@rpsys.net>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 12 Nov 2004 17:38:54 -0000
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Sharp SL Series NAND Driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As mentioned on IRC, I've ported the nand driver for the Sharp SL series to
the current kernel. This first patch adds the driver which supports all the
Zaurus models that use nand flash. (thanks for the pointers in trimming it
down! :)

http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl.patch

I also have some other patches I'd appreciate your views on. Two of these
should be straightforward. The third is more for comments.

http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-map.patch - maps a ROM on
the device (I think its used to access configuration information?).

http://www.rpsys.net/openzaurus/mtd/rp-jffs2-longfilename.patch - if you try
and create filenames longer than 255 characters, the fs gets corrupted. This
adds a couple of checks to prevent it.

http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-extra.patch - This is for
comments. The sharp driver uses a smaller eraseblock than the current mtd
code supports so I have to disable a check to get the code to work properly.
I think this is due to a limitation on kmalloc? The code gets around this by
using dma_alloc_coherent. Is there a way I can do this in an acceptable
manner? (I'm assuming the above patch isn't acceptable?)

(NB: The filesystem is written out by an older driver we can't change so we
have to remain compatible with it - changing eraseblock size therefore isn't
an option).

Thanks,

Richard
