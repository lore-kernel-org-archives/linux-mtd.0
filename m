Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hbHT-0000cS-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 20:36:39 +0100
Date: Wed, 21 Aug 2002 14:36:34 -0500
Subject: Re: Cannot mount my NAND device with JFFS2
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
From: Ken Offer <koffer@arlut.utexas.edu>
In-Reply-To: <1029957655.3996.4.camel@thomas.tec.linutronix.de>
Message-Id: <4D4AAA26-B53D-11D6-92ED-000393467F1A@arlut.utexas.edu>
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wednesday, August 21, 2002, at 02:20  PM, Thomas Gleixner wrote:

> On Wed, 2002-08-21 at 20:43, Ken Offer wrote:
>> Hi all,
>>
>> I can erase and test my smart media card NAND driver just fine
>> (i.e. eraseall seems to work, nandtest works, mtd0 and mtd1 show
>> up in /proc/mtd).  So far so good.  However, when I try to mount
>> the device with jffs2 I get:
>>> mount -v -t jffs2 /dev/mtdblock1 /mnt/jffs
>> mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
>>         or too many mounted file systems
> Have you erased the flash before mount or have you copied stuff to the
> flash ?
> Can you please turn on JFFS2 debugging  to 1 and send the output ?
> make sure that you do
> #echo 9 >proc/sys/kernel/printk

Thanks for the reply!  Got it to work finally.  I had two kernel 
trees going and inadvertently forgot to turn on 
"CONFIG_JFFS2_FS_NAND" in the latest version.  I assumed it was 
on (duh, it was in the old tree...)

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
