Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbIwb-0000K6-2k
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 11:07:16 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=[::1])
	by emc.emcraft.com with esmtp (Exim 4.10) id 1FbIu6-0002Vk-00
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 19:04:38 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 3 May 2006 19:07:22 +0400
References: <200605031556.37660.atrey@emcraft.com>
	<200605031828.51552.atrey@emcraft.com> <4458C0C4.9090601@yandex.ru>
In-Reply-To: <4458C0C4.9090601@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605031907.22346.atrey@emcraft.com>
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 May 2006 18:40, Artem B. Bityutskiy wrote:
> I meant, whether it can happen with a real-life flash device taking into 
> account it's limited lifetime. Bear in mind, each eraseblock has limited 
> resource. I guess for huge flashes this may be the case, but JFFS2 is 
> not usable on them anyway. I'm too lazy to look at digits.

I have made some estimates and agree, that lifetime of an ordinal flash device 
is significantly less than the point where the maximum version value is 
achieved. For example:
	Partition size: 1MB
	Erase block size: 128KB
	Block count: 8
	Average node len: 150b
	Maximum erase count: 100 000
	max_ver_per_blok = (Erase block size) / (Average node len) = 128KB / 150
		= 874
	max_ver_per_erase_cycle = (Block count) * max_ver_per_block = 8 * 874
		= 6990
	max_ver = (Maximum erase count) * max_ver_per_erase_cycle = 699 * 10^6 
		= 0x29AAAAAA

But, how about the guys who make image snapshots? I understand, that it is 
better to copy all information to some place, format the partition and copy 
the informatuib back. But, if someone would want to make an image snapshot of 
a JFFS2 partition in order to restore it somewhen later. In this case version 
numbers retain. And they can be big. However, maybe it is not worth talking 
about it.

--
Regards,
Dmitry
