Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1SG-0002L9-D2
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 09:59:41 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5B92TD04875
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 12:02:29 +0300 (EEST)
Message-ID: <3EE6EF42.7030405@intracom.gr>
Date: Wed, 11 Jun 2003 11:58:42 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3EE6EBA0.3080508@intracom.gr>
	<1055321465.2097.9.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055321465.2097.9.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>On Wed, 2003-06-11 at 09:43, Pantelis Antoniou wrote:
>
>>Hi
>>
>>As it currently stands the only filesystems supporting
>>raw NAND flash are:
>>
>>JFFS2: Read/write, compressed, best support, slow startup.
>>YAFFS: Read/write, not compressed, newcomer, fast startup.
>>
>>I have a requirement to have a compressed read only
>>root filesystem in my board and I've come to the
>>conclussion that the best fit would be CRAMFS if only
>>had any concept of bad blocks.
>>
>
>I think it would probably be better to implement this as a block device
>driver, or perhaps as an extension to the existing mtdblock/mtdblock_ro
>drivers.
>
>
That is a valid approach.

I take it that you mean a new MTD block device over NAND that
automatically skips over bad blocks and presents an error free
block interface for use by read only filesystems.

Thanks, it really pays off to ask questions first, and hack afterwards ;)

Regards

Pantelis
