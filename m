Received: from [2001:470:b:3e:219:66ff:fee3:2c84] (helo=silka.with-linux.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5aet-0007dL-Sd
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 09:28:49 +0000
Message-ID: <4D958DD5.7030501@silka.with-linux.com>
Date: Fri, 01 Apr 2011 02:33:25 -0600
From: Kelly Anderson <kelly@silka.with-linux.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Mtd alignment bug affecting 1.4.X including current git
References: <4D9091B1.80002@silka.with-linux.com>
	<1301645505.2789.23.camel@localhost>
In-Reply-To: <1301645505.2789.23.camel@localhost>
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

On 04/01/11 02:11, Artem Bityutskiy wrote:
> On Mon, 2011-03-28 at 07:48 -0600, Kelly Anderson wrote:
>> Erasing 128 Kibyte @ 0 --  0 % complete.libmtd: error!: unaligned
>> address 2, mtd0 page size is 2048
>>
>> /usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
>> Erasing 128 Kibyte @ 20000 --  3 % complete.libmtd: error!: unaligned
>> address 131074, mtd0 page size is 2048
> What are the flashe_eraseall options you use?
>
flash_eraseall -j /dev/mtd0

or (in the case of the newer mtd-utils)

flash_erase -j /dev/mtd0 0 0
