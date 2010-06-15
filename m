Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOWkT-0005zC-Hw
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 14:04:19 +0000
Received: by iwn3 with SMTP id 3so840289iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jun 2010 07:04:16 -0700 (PDT)
Message-ID: <4C178893.9010204@mvista.com>
Date: Tue, 15 Jun 2010 19:35:07 +0530
From: Philby John <pjohn@mvista.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS mount failure on NOR flash
References: <1276606779.20001.18.camel@localhost.localdomain>
	<1276609047.19028.270.camel@localhost>
In-Reply-To: <1276609047.19028.270.camel@localhost>
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

On 06/15/2010 07:07 PM, Artem Bityutskiy wrote:
> On Tue, 2010-06-15 at 18:29 +0530, Philby John wrote:
>> Hello,
>>
>> Platform: Cavium CN5020
>> Filesystem: UBIFS
>> Flash Type: NOR
>> Flash Size: 8MB
>> Partition Details Kernel Log:
>> Creating 2 MTD partitions on "phys_mapped_flash":
>> 0x000000000000-0x000000700000 : "Octeon BOOT partition"
>> 0x000000700000-0x000000800000 : "Octeon test partition"
>>
>>
>> $mount -t ubifs ubi1:test /mnt/nor
>> UBIFS error (pid 851): init_constants_early: too few LEBs (12), min. is 17
>> mount: wrong fs type, bad option, bad superblock on ubi1:test,
>>         missing codepage or helper program, or other error
>>         (for several filesystems (e.g. nfs, cifs) you might
>>         need a /sbin/mount.<type>  helper program)
>>         In some cases useful info is found in syslog - try
>>         dmesg | tail  or so
>>
>>
>> But JFFS2 is able to mount the same partition flawlessly. Shouldn't
>> UBIFS be able to do the same? What I would like to know is, is this the
>> expected behavior or a bug? If its a bug I would like to look into it.
>
> Yes, this is expected. For such a tiny flash partition you should rather
> use JFFS2. I've just created a FAQ entry for you:
>
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_few_lebs
>

Okay, thanks for the clarification.

Regards,
Philby
