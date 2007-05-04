Received: from [149.6.83.202] (helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjuvQ-0005BY-5p
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 06:22:09 -0400
Message-ID: <463B02F5.6060503@parrot.com>
Date: Fri, 04 May 2007 11:55:01 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: RO jffs2 implementation for bootloader
References: <loom.20070503T102421-36@post.gmane.org>
	<1178186163.7539.62.camel@sauron>
In-Reply-To: <1178186163.7539.62.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Artem,

Artem Bityutskiy a écrit :
> On Thu, 2007-05-03 at 08:40 +0000, Matthieu CASTET wrote:
>> I need to mount a jffs2 partition in a bootloader. I tried u-boot that support
>> jffs2, but it is very slow (2 minutes for mounting a 64MB partition).
>> Do you know if there are other (fast) implemenation of jffs2 suitable for a
>> bootloader ?
> 
> Not sure about any existing "fast" implementation, but mounting a JFFS2
> partition is about scanning whole partition. You may optimize some
> thing, but you have to scan anyway.
> 
Well u-boot implementation is very slow. For 64MB partition : 2 minutes 
for u-boot and 11 s for linux (3s with summary).


>> I want to avoid to use raw partition on NAND :
>> - because the bootloader need to access several files (kernel, boot data, rescue
>> images, some configuration).
>> - nand scrubbing (on read) is not possible to handle (jffs2 don't handle it
>> either if it is a read only partition)
> 
> I would suggest to create a small JFFS2 partition with kernel so that it
> is mounted quickly by the bootloader. Then you could mount it to /boot
> of your "main" partition.
> 
Even with small partition, u-boot implementation is very slow, that's 
why I asks for other implementations.


While I am at it, is there some code of UBI (RO static partition) suited 
for integration in bootloaders ?


Thanks,

Matthieu
