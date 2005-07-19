Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DuqXw-0006lv-3t
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 07:46:14 -0400
Message-ID: <42DCE7E4.2050303@cetrtapot.si>
Date: Tue, 19 Jul 2005 13:45:40 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <42DCD1D3.8070303@cetrtapot.si>
	<42DCD6C1.6010509@yandex.ru>	<42DCDCDA.2090909@cetrtapot.si>
	<42DCDE8C.702@yandex.ru>
In-Reply-To: <42DCDE8C.702@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
>> Flash is NOR Intel E28F128J3A150.
>>
>> I'm booting with NFS enabled kernel and rootfs over NFS, then erasing 
>> mtd partition that holds rootfs and then copying rootfs.jffs2 to mtd 
>> partition like this:
> 
> 
> Could you please enable JFFS2 debugging and post its output?
> 

There you go. This is with JFFS2 debug set to 2 and MTD debug set to 3.
...
NET: Registered protocol family 17
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x234a 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x755a 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x7404 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: 0x2e9e 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010: 0x7084 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0x3922 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0x3d61 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 0x8bd7 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x71ed 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x0f2a 
instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x00005ae4
You cannot use older JFFS2 filesystems with newer kernels
Old JFFS2 bitmask found at 0x00006d1c
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
SR.4 or SR.5 bits set in buffer write (status b0). Clearing.


I dont't understand why would JFFS2 complain about older fs and newer kernel if 
I'm using mkfs.jffs2 from July 2005 snapshot?!

-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
