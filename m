Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LC5Y2-0004h6-Mj
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 04:59:14 +0000
Message-ID: <59034.192.168.10.89.1229317139.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <1229094690.13686.426.camel@sauron>
References: <35044.192.168.10.89.1229077681.squirrel@dbdmail.itg.ti.com>
	<37466.192.168.10.89.1229084724.squirrel@dbdmail.itg.ti.com>
	<20081212100650.2c31279e@zod.rchland.ibm.com>
	<1229094690.13686.426.camel@sauron>
Date: Mon, 15 Dec 2008 10:28:59 +0530 (IST)
Subject: Re: [PATCH] [MTD] [NAND] : Correcting file name in the header
	section.
From: "Manasa Gangaiah" <x0099189@ti.com>
To: dedekind@infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, 2008-12-12 at 10:06 -0500, Josh Boyer wrote:
>> On Fri, 12 Dec 2008 17:55:24 +0530 (IST)
>> "Manasa Gangaiah" <x0099189@ti.com> wrote:
>>
>> > This patch corrects the file name in the header section.
>> >
>> > Signed-off-by: Manasa Gangaiah <manasa.gangaiah@ti.com>
>>
>> NAK.
>>
>> It would be better to remove them entirely.  That way they don't need
>> to be updated again if the file is renamed or moved.
>
> Agree, there is little point in putting file name and path there.

Thanks for the comments. Will make changes and send the patch.

- manasa
