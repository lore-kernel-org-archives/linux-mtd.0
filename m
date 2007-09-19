Received: from av-gw2.cc.tut.fi ([130.230.130.111])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IY0Tn-00007r-8A
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 10:24:43 -0400
Message-ID: <46F13100.9020705@tut.fi>
Date: Wed, 19 Sep 2007 17:24:00 +0300
From: Timo Piiroinen <timo.piiroinen@tut.fi>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: mkfs.jffs2 and mksum
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>	
	<1190206217.14370.155.camel@sauron> <46F12C4D.9060204@tut.fi>
	<1190211192.14370.166.camel@sauron>
In-Reply-To: <1190211192.14370.166.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Artem Bityutskiy kirjoitti:
> On Wed, 2007-09-19 at 17:03 +0300, Timo Piiroinen wrote:
>   
>> Yes it is NAND flash. I tried to add dummy file to my filesystem to 
>> increase the size of image and after that remove that dummy file to free 
>> space, unfortunately I couldn't remove the file cause the filesystem was 
>> 100% full,
>> and that's the real problem.
>>     
>
> Just do not pad FS image at all. You do not have to. Just leave the rest
> of the flash to contain all 0xFF, i.e., erase it before flashing.
>
>   
I use the redboot bootloader to flash image (using fis create), if I 
flash with lenght parameter same as image size it won't work, cause 
after that there is mtd/2 which is length of image and mtd/3 which 
contains rest of free flash (and I want mtd/2 to use all available flash).
I'll try to create image using legth of free flash and write rest of it 
after jffs2 image (unused part) with 0xFF.
