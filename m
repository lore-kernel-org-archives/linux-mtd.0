Received: from bay19-f37.bay19.hotmail.com ([64.4.53.87] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkfjL-0001Qb-KG
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 05:07:12 -0400
From: "w h" <wh3cq@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 14 Jul 2004 09:07:09 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY19-F37r2IAlyof1r00056a32@hotmail.com>
Subject: CRC error in cramfsck
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Today I meet a problem which makes me tear my hair out. This phenomenon 
never occurred before.I use Moto DragonBall MX1 ADS.

The command "cramfsck -x Dir Filename" worked ok before. But this afternoon 
when I use it to decompress some cramfs file I made by myself, it occurs 
the error as following. But it works well with the original root.cramfs in 
MX1 ADS. 
warning: file extends past end of filesystem
./crmfsck: crc error

Also there is error in using "mkcrmfs Dir Filename" to make my own cramfs 
file, which never 
happened before:

Everything: 4 kilobytes
Super block:76 bytes
CRC:fdeb894a

Is there anyone who knows the reason? Please help. Thanks!

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
