Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PvWfl-0001iQ-TG
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2011 15:12:07 +0000
Received: by bwz1 with SMTP id 1so2235554bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Mar 2011 07:12:03 -0800 (PST)
Message-ID: <4D7100E8.101@mvista.com>
Date: Fri, 04 Mar 2011 18:10:32 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH V3 06/10] MIPS: lantiq: add NOR flash support
References: <1299146626-17428-1-git-send-email-blogic@openwrt.org>
	<1299146626-17428-7-git-send-email-blogic@openwrt.org>
	<4D70DDEA.2050308@mvista.com>
In-Reply-To: <4D70DDEA.2050308@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I wrote:

>> NOR flash is attached to the same EBU (External Bus Unit) as PCI. As 
>> described
>> in the PCI patch, the EBU is a little buggy, resulting in the upper 
>> and lower
>> 16 bit of the data on a 32 bit read are swapped. (essentially we have 
>> a addr^=2)

>    "Are" not needed.

>> To work around this we do a addr^=2 during the probe. Once probed we 
>> adapt
>> cfi->addr_unlock1 and cfi->addr_unlock2 to represent the endianess bug.

>> Signed-off-by: John Crispin<blogic@openwrt.org>
>> Signed-off-by: Ralph Hempel<ralph.hempel@lantiq.com>
>> Cc: David Woodhouse<dwmw2@infradead.org>
>> Cc: Daniel Schwierzeck<daniel.schwierzeck@googlemail.com>
>> Cc: linux-mips@linux-mips.org
>> Cc: linux-mtd@lists.infradead.org
> [...]

>> diff --git a/drivers/mtd/maps/lantiq.c b/drivers/mtd/maps/lantiq.c
>> new file mode 100644
>> index 0000000..674be0a
>> --- /dev/null
>> +++ b/drivers/mtd/maps/lantiq.c
>> @@ -0,0 +1,190 @@
[...]
>> +void
>> +ltq_copy_from(struct map_info *map, void *to,
>  > +    unsigned long from, ssize_t len)

>    Shouldn't it be static?

>> +{
>> +    unsigned char *p;
>> +    unsigned char *to_8;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&ebu_lock, flags);
>> +    from = (unsigned long) (map->virt + from);

>    Why not:

>     from += (unsigned long) map->virt;

> like you do in ltq_copy_to()?

>> +    p = (unsigned char *) from;

>    Could be done in initializer, like in ltq_copy_to().

>> +    to_8 = (unsigned char *) to;
>> +    while (len--)
>> +        *to_8++ = *p++;

>    BTW, you could use memcpy_fromio().

    Actually not, as on MIPS it's implemented via memcpy(). On ARM it doesn 
byte-by-byte copying -- that's why I remembered about it...

WBR, Sergei
