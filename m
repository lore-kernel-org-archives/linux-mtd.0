Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GCdzc-00051r-71
	for linux-mtd@lists.infradead.org; Mon, 14 Aug 2006 11:04:52 -0400
Message-ID: <44E090C8.9040400@yandex.ru>
Date: Mon, 14 Aug 2006 19:03:36 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Catherine Smith <catherine@arrows.demon.co.uk>
Subject: Re: OneNAND - Cannot mount jffs2 partition
References: <Pine.LNX.4.33.0608131059220.32638-100000@arrows.demon.co.uk>	<44DF16CC.3070708@yandex.ru>
	<000e01c6bf00$3acdd130$c9fea8c0@Catherine>
In-Reply-To: <000e01c6bf00$3acdd130$c9fea8c0@Catherine>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: John <john@arrows.demon.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Catherine,

Catherine Smith wrote:
> If I don't use the -j, it seems to work, though with a few warnings.
> For example:
>   $ flash_eraseall /dev/mtd5
>   Eraseing 64 Kibyte @ 7f0000 -- 99 % complete
>   $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand
>   Eep. no valid nodes for ino #1
That's harmless.

-j option means to put so-called clean marker at each etaseblock. The 
cleanmarker just means that the eraseblock is clean ant it is safe to 
write data at it. This is needed to guaranty data consistency - it is 
not enough to just check that the eraseblock contains only 0xFF bytes. 
For example, due to unclean reboots which may interrupt an erase 
operation, some bits may become unstable and be read sometimes as 1, and 
sometimes as 0.

If you don't use -j option, JFFS2 will re-erase empty eraseblocks 
itself, and put the clean marker. It may also complain about absence of 
the root inode (which isn't a brilliant idea), but it creates the root 
node automatically.

> Then I can create files in /mnt/onenand, and copy them around or calculate a 
> few signatures. All is well.
> Once, when I tried to mount after a power cycle, it said:
>   jffs2_get_inode_nodes(): CRC failed on node at 0x002dd7c8: Read 
> 0xffffffff, calculated 0x20f0e445
Did you unmount it cleanly? Or just pushed reset? If you didn't unmount 
- it may be harmless.

> Are these warnings, the Eep and the CRC failure, typical and harmless,
> or should I take a keen interest?

If you didn't cleanly unmount, you could have been interrupted a delayed 
wbuf flush and just lost some last-written data. This could cause CRC 
failure. And as JFFS2 cannot distinguish between real corruption and 
corruptions due to unclean reboots - it issued a warning.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
