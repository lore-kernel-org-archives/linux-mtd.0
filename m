Received: from cdptpa-bc-oedgelb.mail.rr.com ([75.180.133.32])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3nUy-0006Ck-CF
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 12:23:57 +0000
Message-ID: <50337E4C.5040904@cincinnatitechnologies.com>
Date: Tue, 21 Aug 2012 08:25:48 -0400
From: Russell Zuck <rzuck@cincinnatitechnologies.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Is my erase block size correct?
References: <500EC7D9.8020509@cincinnatitechnologies.com>
 <1345213158.27859.93.camel@sauron.fi.intel.com>
In-Reply-To: <1345213158.27859.93.camel@sauron.fi.intel.com>
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

On 8/17/2012 10:19 AM, Artem Bityutskiy wrote:
>> mtd0
>> >Name:                           nor_flash
>> >Type:                           dataflash
>> >Eraseblock size:                512 bytes
> What does /proc/mtd contain?
My apologies for the delayed reply.  I've been on vacation and unplugged 
by design.

Currently, we are booting out of the nor_flash partition and also 
loading the kernel from there.  Due to other technical challenges, we 
are not using either the mtd1 or mtd2 partitions at the moment.

dev:    size   erasesize  name
mtd0: 00400000 00000200 "nor_flash"
mtd1: 00100000 00020000 "nand.bootloader"
mtd2: 00300000 00020000 "nand.kernel"
mtd3: 1fc00000 00020000 "nand.rootfs"

Please see my thread "UBIFS corruption after software upgrade" 
originally posted on 7/24/2012 for more details about the problem that 
prompted this question about erase block size.  Any assistance you can 
provide with this issue would be greatly appreciated.

Best regards,

Russell Zuck
