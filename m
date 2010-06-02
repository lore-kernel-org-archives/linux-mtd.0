Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OJltN-0001Cq-Ue
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 11:13:50 +0000
Subject: Re: ubi question
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C0622E6.7070203@parrot.com>
References: <4C0622E6.7070203@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Jun 2010 14:10:48 +0300
Message-ID: <1275477048.27484.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-02 at 11:22 +0200, Matthieu CASTET wrote:
> Hi,
> 
> I have some question about ubi implementation.
> I have read most of the "drivers/mtd/ubi/ubi-media.h" documentation.
> 
> The doc is not very clear about the case when data_size is set for
> dynamic volume.

Please, when you get the understanding, submit a patch which amends the
comments.

>  From my understanding it is set in case copy_flag is set 
> and the value is the logical eraseblock size.

Yeah, copy_flag tells that this VID header was written by UBI when some
other PEB was copied.

And yes, data_size and data_crc flags are valid when the copy_flag is 1.

IOW:

1. copy_flag says this PEB was created by copying, and that data_size
and data_crc fields are valid for this PEB
2. data_crc contains CRC32 of the first data_size bytes of this PEB.

> When a block with copy_flag set, when we append data (and make the crc 
> invalid),

When we append data, we do not make CRC invalid. CRC was calculated for
the first data_size bytes in this PEB. And it stays valid forever.

The only reason we have this data_crc/data_size fields is to tolerate
power cuts. When sacnning later, and encountering 2 PEB which belong to
the same volume/LEB, we pick the copy if the CRC is valid.

>  do we make sure that all previous version of this logical 
> eraseblock are removed from flash ?

No, this is not required. We just append data. In case of power cut we
will pick the newer PEB because it has larger seq_num, and we'll check
CRC and it'll match.

> Why layout volume isn't a static volume with one eraseblock and update 
> done with atomic leb update (copy flag) ?

Atomic LEB change was introduce later, after first UBI implementation
has been finished. We introduce the atomic LEB change to satisfy UBIFS
needs. You can spot event that the comments in ubi-media.h mention only
wear-levelling copying, but not the atomic LEB change case - simply
because they were not updated.

If you happen to send a patch which clarifies the comments, feel free to
update them and mention the atomic LEB change stuff as well.

> This would have :
> - make the crc ckeck done by generic code (static volume one)
> - make the handling of update by generic code
> - avoid to having to handle dynamic volume in minimalist implementation 
> (bootloader)
> Do I miss something ?

Yeah, probably, but it is too late now :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
