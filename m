Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUeWD-0006Ow-FH
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:39:26 +0000
Message-ID: <4DF0BFA0.4030402@free-electrons.com>
Date: Thu, 09 Jun 2011 14:42:08 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: Gilles Ganault <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<4DF0B36E.2020605@free-electrons.com>
	<7.0.1.0.2.20110609135430.06967d28@free.fr>
In-Reply-To: <7.0.1.0.2.20110609135430.06967d28@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/09/2011 02:26 PM, Gilles Ganault wrote:
> Hello
> 
> At 13:50 09/06/2011, you wrote:
>> > Eraseblock size:                131072 bytes, 128.0 KiB
>> >  [...]
>> > Default UBI LEB size:           129024 bytes, 126.0 KiB
>> > Maximum UBI volumes count:      128
>> > ==============
>> > #Create root filesystem
>> > ubuntu:/> mkfs.ubifs --squash-uids -m 2048 -e 131072 -c 1984 -d
>> > ./romfs -D device_table-min.txt -o ./images/rootfs.ubifs
>> >
>>
>> The -e option of mkfs.ubifs takes the logical eraseblock size.
>> But you specified 131072, the physical eraseblock size.
>> So here, you should have -e 129024
>> The details for computing the LEB size are at
>> http://git.infradead.org/mtd-utils.git/blob/HEAD:/ubi-utils/src/libubigen.c#l40
>>
>> In most cases, the formula for the offset boils down to:
>> LEB_size = PEB_size - (((Subpage_size + Page_size) * Page_size) /
>> Page_size)
> 
> Thanks for the tip, but after recompiling a new root filesystem, I'm
> still getting the same error:
[...]
> BTW, using the formula above, I find this: 131.072 - ((( 512 + 2.048) *
> 2.048 ) / 2.048 ) = 128.512
> 
> I wonder if maybe I should leave some room in the NAND partition for the
> Ubifs journal + error log? I used vol_size=248MiB in ubi.cfg, but maybe
> this is toot big?

(I forgot to reply to all in my first answer)

Oops, sorry, the formula is
((Subpage_size + Page_size)) / Page_size) * Page_size
That is, subpage+page truncated to page.

Maybe you have to take the reserved LEBs into account: 1% of the PEBs.
I'm not sure if they are already included in what mtdinfo displays, though.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
