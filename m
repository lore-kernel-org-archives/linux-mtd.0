Received: from smtp.parrot.fr ([213.41.120.202])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HhPx9-0008Do-TT
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 08:53:37 -0400
Message-ID: <4631F17B.3080204@parrot.fr>
Date: Fri, 27 Apr 2007 14:50:03 +0200
From: Matthieu CASTET <matthieu.castet@parrot.fr>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: FAT file system on NAND flash memory
References: <20070412134137.GA25860@pooky.senux.com>
	<625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
In-Reply-To: <625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Seongsu Lee <senux@senux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Josh Boyer a écrit :
> On 4/12/07, Seongsu Lee <senux@senux.com> wrote:
>> Hi,
>>
>> In my knowledge, mtdblock.c must be used to use
>> FAT filesystem on bare NAND flash memories
>> because NFTL is made only for a specific hardware,
>> DiskOnChip.
>>
>> (Layer 0) VFS
>> (Layer 1) FAT (or EXT2, EXT3)
>> (Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
>> (Layer 3) NAND flash memory driver (vendor specific)
>> (Layer 4) Physical NAND flash memory
>>
>> Please let me know if it is wrong.
> 
> That layering is correct, but your results will be bad.  mtdblock
> doesn't handle bad blocks.  So if you have one in the middle of your
> filesystem, it will break things.  You need some kind of translation
> layer if you're going to use NAND.
> 
But UBI could be used between nand and mtdblock ?


Matthieu
