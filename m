Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nxp3N-0001Q2-9O
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2010 22:09:26 +0000
Message-ID: <4BB66B16.10003@gmx.net>
Date: Sat, 03 Apr 2010 00:09:26 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: BUG: physmap modprobe & rmmod
References: <20100402134058.c4682716.randy.dunlap@oracle.com>
	<20100402144727.2c80a6b2.randy.dunlap@oracle.com>
In-Reply-To: <20100402144727.2c80a6b2.randy.dunlap@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02.04.2010 23:47, Randy Dunlap wrote:
> On Fri, 2 Apr 2010 13:40:58 -0700 Randy Dunlap wrote:
>
>   
>> 2.6.34-rc2 kernel:
>>
>> Boot up on a common PC, then: modprobe physmap ; rmmod physmap
>> and bang.
>>     
> This is with close to an allmodconfig on x86_64, including:
>
> CONFIG_MTD_PHYSMAP=m
> CONFIG_MTD_PHYSMAP_COMPAT=y
> CONFIG_MTD_PHYSMAP_START=0x8000000
> CONFIG_MTD_PHYSMAP_LEN=0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=2
>   

Forgive me if this sounds weird, but I was under the impression that
most people who want to reflash their BIOS on x86 (most prominent
physmap usecase on x86) are using a pure userspace solution with
flashrom <http://www.flashrom.org/> nowadays.

flashrom has the advantage of not needing a kernel recompile if you want
support for new chips/chipsets. flashrom doesn't use MTD and accesses
/dev/mem instead. AFAIK flashrom supports BIOS/EFI/... flashing on all
x86 chipsets which are supported by MTD, and on a few other x86 chipsets
(and network/storage/graphics cards) which are not supported by MTD.

Regards,
Carl-Daniel
