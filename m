Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhTw9-0005WK-3B
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 13:08:51 -0400
Message-ID: <46322E19.7020409@indefia.com>
Date: Fri, 27 Apr 2007 20:08:41 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Strange JFFS2 Cleanmarker on NAND
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

After testing JFFS2+NAND for a while, I wanted to try summary and some 
other stuff, decided to start from scratch.
So I did a flash_eraseall -j and tried to mount it.
But it didn't mount and complained that there wasn't a cleanmaker. So i 
did nanddump and saw that there were correct cleanmarkers at the 
beginning of the flash, but was some other values beginning from 0x00a80000.

at the beginning:
# nanddump /dev/mtd0 | hexdump -C
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x10000000...
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00000800  ff ff 19 85 20 03 00 00  00 08 ff ff ff ff ff ff  |.... 
...........|
00000810  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00020fe0  ff ff ff ff ff ff ff ff  19 85 20 03 00 00 00 08  |.......... 
.....|
00020ff0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00021800  ff ff 19 85 20 03 00 00  00 08 ff ff ff ff ff ff  |.... 
...........|
00021810  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|

after 0x00a80000, cleanmarker part was like that:
ff ff 19 85 20 05 00 00  00 18 65 fa fd 45 00 00  |.... .....e..E..|
00 00 00 00 00 00 00 00  00 00 ff ff ff ff ff ff  |................|

ff ff ff ff ff ff ff ff  19 85 20 05 00 00 00 18  |.......... .....|
65 fa fd 45 00 00 00 00  00 00 00 00 00 00 00 00  |e..E............|

I didn't know if this was something meaningful or not, and looked inside 
flash_eraseall and didn't see it writing something like that to flash. I 
did a flash_eraseall again without -j and did a nanddump everything was 
0xff as it should be.
Then did flash_eraseall -j once again, and this time the whole flash was 
like that:

Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x10000000...
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00000800  ff ff 19 85 20 05 00 00  00 18 65 fa fd 45 00 00  |.... 
.....e..E..|
00000810  00 00 00 00 00 00 00 00  00 00 ff ff ff ff ff ff  
|................|
00000820  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00020fe0  ff ff ff ff ff ff ff ff  19 85 20 05 00 00 00 18  |.......... 
.....|
00020ff0  65 fa fd 45 00 00 00 00  00 00 00 00 00 00 00 00  
|e..E............|
00021000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00021800  ff ff 19 85 20 05 00 00  00 18 65 fa fd 45 00 00  |.... 
.....e..E..|
00021810  00 00 00 00 00 00 00 00  00 00 ff ff ff ff ff ff  
|................|
00021820  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|

I re-run the above step (without -j and with -j) and now cleanmarkers 
are ok and I can mount it.

Does anyone have any idea what's going on ?

CPU: Atmel AT32AP7000, kernel 2.6.20.
mtd-utils: latest from svn.

Best Regards,
Semih Hazar
