Received: from school.cyberec.com ([202.153.122.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JsCk-0002Fu-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 09:49:43 +0100
Message-ID: <3D0DA13D.70803@emsoftltd.com>
Date: Mon, 17 Jun 2002 16:43:41 +0800
From: Jason Chan <jason@emsoftltd.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Bad Block management routine for MTD NandFlash driver?
References: <3D0D9DA9.6090404@emsoftltd.com>  <3D0D981D.8040602@emsoftltd.com> <18852.1024302161@redhat.com> <19294.1024303310@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David,
    Sorry, I don't fully understand your 2nd suggestion, 'translation 
layer' like the SmartMedia one.
Is that means the smartmedia mtd driver already has bad block management?

David Woodhouse wrote:

>jason@emsoftltd.com said:
>
>>    I trying to use EXT2 for my nandflash driver. Is that OK? 
>>
>
>No. You need _some_ kind of file system which is capable of dealing with 
>flash -- either a real file system directly on the flash such as JFFS2, or 
>a 'translation layer' like the SmartMedia one or NFTL if you really need to 
>use ext2 for some reason.
>
>--
>dwmw2
>
>


-- 
Best Regards,

Jason Chan
Emsoft Ltd.
