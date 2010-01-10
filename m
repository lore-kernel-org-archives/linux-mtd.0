Received: from pholcus.org.uk ([95.172.25.234] helo=vm4285.vps.tagadab.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTuY5-0000yG-4A
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:57:33 +0000
Message-ID: <4B49A486.5060402@colonel-panic.org>
Date: Sun, 10 Jan 2010 09:57:26 +0000
From: Peter Horton <zero@colonel-panic.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI fails to initialise in kernel update marker
References: <20100105111436.GA2046@turtle.localnet>
	<1263116531.7315.143.camel@localhost.localdomain>
In-Reply-To: <1263116531.7315.143.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/01/2010 09:42, Artem Bityutskiy wrote:
> On Tue, 2010-01-05 at 11:14 +0000, Peter Horton wrote:
>> The in kernel copy of a volume's update marker is not initialised from the
>> volume table.
>>
>> Signed-off-by: Peter Horton<zero@colonel-panic.org>
>>
>> --- linux-2.6.32.orig/drivers/mtd/ubi/vtbl.c	2010-01-05 10:56:13.000000000 +0000
>> +++ linux-2.6.32/drivers/mtd/ubi/vtbl.c	2010-01-05 10:57:03.000000000 +0000
>> @@ -566,6 +566,7 @@
>>   		vol->reserved_pebs = be32_to_cpu(vtbl[i].reserved_pebs);
>>   		vol->alignment = be32_to_cpu(vtbl[i].alignment);
>>   		vol->data_pad = be32_to_cpu(vtbl[i].data_pad);
>> +		vol->upd_marker = vtbl[i].upd_marker;
>>   		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
>>   					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
>>   		vol->name_len = be16_to_cpu(vtbl[i].name_len);
>
> Am I right that this means that whole "forbid using volume with
> unfinished update" functionality has not worked properly? Or I miss
> something? Looks like I should send this patch to -stable as well.
>

The in kernel update marker was always clear on reboot, regardless of 
the flag in the volume table. Consequently reading from the volume 
worked after a reboot even after a failed update.

P.
