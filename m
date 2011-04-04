Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6jwJ-0002aW-Ej
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 13:35:32 +0000
Message-ID: <4D99C974.5060800@openwrt.org>
Date: Mon, 04 Apr 2011 15:36:52 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V5 06/10] MIPS: lantiq: add NOR flash support
References: <1301470076-17279-1-git-send-email-blogic@openwrt.org>
	<1301470076-17279-7-git-send-email-blogic@openwrt.org>
	<1301661832.2789.56.camel@localhost>
In-Reply-To: <1301661832.2789.56.camel@localhost>
Content-Type: text/plain; charset=UTF-8
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

Hi Artem

thanks for the feedback, comments inline
>
>> +ltq_copy_from(struct map_info *map, void *to,
>> +	unsigned long from, ssize_t len)
>> +{
>> +	unsigned char *f = (unsigned char *) (map->virt + from);
>> +	unsigned char *t = (unsigned char *) to;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ebu_lock, flags);
>> +	while (len--)
>> +		*t++ = *f++;
>> +	spin_unlock_irqrestore(&ebu_lock, flags);
>>     
> Can you use memcpy here instead?
>
>   

as we are copying to/from iomem, we cannot use memcpy as the
pre-fetching breaks the copy process. the normal alternative is to use
memcpy_to/fromio, however on MIPS this breaks down to a normal memcpy.

i will fold your comments into the patch and resend it ASAP

thanks, John
