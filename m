Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIJnT-0005Qu-J8
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 01:39:09 -0400
Message-ID: <43323D33.6040000@setabox.com>
Date: Thu, 22 Sep 2005 13:12:19 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: Hsu sabrina <sabrina.hsu1@hotmail.com>
References: <BAY18-F12FD5D013FA03D0DF29370DA970@phx.gbl>
In-Reply-To: <BAY18-F12FD5D013FA03D0DF29370DA970@phx.gbl>
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: No RedBoot partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sabrina,

Hsu sabrina wrote:
> Hi, Linux gurus!
> I¡¦ve got a problem with booting my kernel. The kernel on reference board
> boots successfully while on my board fails. The only difference is a
> flash memory I use in my board. I understand that I need to make some
> adjustments but unfortunately I¡¦m not a linux specialist. I attached the
> boot log and marked differences in booting process.
> Reference board:
> 6 RedBoot partitions found on MTD device phys_mapped_flash"
> Creating 6 MTD partitions on "phys_mapped_flash":
> 0x00000000-0x00040000 : "RedBoot"
> 0x00040000-0x00100000 : "kernel"
> 0x00100000-0x00e80000 : "root"
> 0x00e80000-0x01fe0000 : "unallocated"
> 0x01fe0000-0x01fff000 : "FIS directory"
> 
> My board:
> No RedBoot partition table detected in phys_mapped_flash
> Using physmap partition definition
> Creating 3 MTD partitions on "phys_mapped_flash":
> 0x00000000-0x00100000 : "Bootloader"
> 0x00100000-0x00300000 : "Kernel"
> 0x00300000-0x02000000 : "UserFS"

You should first verify that your board can boot by directly loading the
images into ram through tftp:
load -v -r -b 0x800000 root
load -v -r -b 0x1600000 kernel
exec

If that works you need to correctly create the partitions on the your
board's NOR flash using the fis command. See the Redboot user's guide.

-- 
William J Beksi                          <wjbeksi@users.sourceforge.net>
GPG Key Fingerprint = ED4B 32C3 69E6 C2B7 705C  263F CB2F 3253 E7E1 DB3B
