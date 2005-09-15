Received: from [84.204.75.148] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFoUR-0000Br-Bo
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 03:49:11 -0400
Message-ID: <4329274E.7000705@yandex.ru>
Date: Thu, 15 Sep 2005 11:48:30 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de> <432817FF.10307@yandex.ru>
	<4328291E.9030002@mw-itcon.de>
In-Reply-To: <4328291E.9030002@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:

[snip]
 > [42949498.320000] PM: dataflash_write: 1022208 .. 1030656
[snip]
> [42949495.640000] jffs2_write_dnode wrote node at 0x0000e770(2) with 
> dsize 0x4, csize 0x4, node_crc 0x33de5e85, data_crc 0x56bc8289, totlen 
> 0x00000048
JFFS2 writes a node at offset 0x0000e770.

[snip]
> [42949518.470000] PM: dataflash_write: 1022208 .. 1030656
[snip]
> [42949515.170000] Obsoleting node at 0x0000e770 of len 0x48: <7>Wasting
After the second echo, it obsolets the old data node.

[snip]
> [42949515.190000] jffs2_write_dnode wrote node at 0x0000e7fc(2) with 
> dsize 0x4, csize 0x4, node_crc 0x8f17e80f, data_crc 0x56bc8289, totlen 
> 0x00000048
And writes the new node at 0x0000e7fc

But your messages show that the write goes to the same place.

May be (guessing):
1. Your messages are invalid?
2. Something goes on with JFFS2 wbuf and it is committed to the same 
page (unlikely)?
3. Your flash driver is incorrect?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
