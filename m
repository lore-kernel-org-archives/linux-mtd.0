Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M20HC-0002Un-EW
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 09:52:33 +0000
Message-ID: <41906.192.168.10.89.1241689856.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <46149.192.168.10.89.1241686786.squirrel@dbdmail.itg.ti.com>
References: <46149.192.168.10.89.1241686786.squirrel@dbdmail.itg.ti.com>
Date: Thu, 7 May 2009 15:20:56 +0530 (IST)
Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large     
	page NAND chips
From: "vimal singh" <vimalsingh@ti.com>
To: "David Brownell" <david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com, nsnehaprabha@ti.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 7, 2009 at 2:41 PM, David Brownell <david-b@pacbell.net> wrote:
> On Thursday 07 May 2009, vimal singh wrote:
>> > Comments would be good, highlighting (a) byte 5 is reserved,
>> > it's the manufacturer bad block marker, (b) 8 bytes @16 are
>> > expected by JFFS2.  Not everyone will "just know" those.
>>
>> How about leaving bytes '4' and '5' for bad block marker, to support 16-bit
>> NAND parts too.
>
> This 4-bit ECC engine only works for 8-bit wide parts ...
> or are you suggesting that in case TI re-engineers that
> engine in the future?
I am omap guy and was not aware of that. In omap HW BCH ECC (4- or 8- bit
correction)can work both kind of memories.

Regards,
vimal
