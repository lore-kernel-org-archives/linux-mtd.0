Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JA433-0002tZ-2w
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 13:54:30 +0000
Message-ID: <477B95B5.2030509@nokia.com>
Date: Wed, 02 Jan 2008 15:46:29 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Nancy <nancydreaming@gmail.com>
Subject: Re: Does UBI support MLC nand flash?
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
In-Reply-To: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

ext Nancy wrote:
> Sir / Madam,
> 
>              Does UBI support MLC nand flash?
> 
>              According to the MLC nand spec, It is only allowed write
> once per erased
> block, moreover, it isn't allowed ramdom write during a block, means
> the page number must be increase during the write PED operation.
> 
> 
> --
> Best Regards,
> Nancy
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

As Artem is on holiday, I am replying to this.

UBI (and UBIFS) write sequentially to NAND pages within an eraseblock so there should be no problem with MLC NAND.

However the driver must not set up subpages because UBI will prefer to write subpages if they are available.
