Received: from ipmail02.adl6.internode.on.net ([203.16.214.140])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NG3Cv-0000jS-1f
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 04:22:25 +0000
Received: from [192.168.14.33] ([192.168.14.33])
	(authenticated user iwo@call-direct.com.au)
	by mail.call-direct.com.au (Kerio MailServer 6.7.0)
	for linux-mtd@lists.infradead.org; Thu, 3 Dec 2009 15:16:01 +1100
Message-ID: <4B173CEB.5050103@call-direct.com.au>
Date: Thu, 03 Dec 2009 15:22:03 +1100
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Looks like a UBIFS bug...
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've got some weird UBIFS-related behaviour. I'd welcome
any suggestions.

This is an ARM927-based embedded system with NAND FLASH,
Kernel 2.6.32-rc8 with a custom MTD NAND driver.

While attempting to write a file to a UBIFS volume, UBIFS claims 

UBIFS error (pid 866): check_lpt_type: invalid type (15) in LPT node type 0

followed by "cannot reserve n bytes" messages every second or so.
After this point the fs is read-only.

I don't know how to trigger it reliably, but while experimenting
with different mtd partition sizes and debug levels, I was able
to catch it with debug level 2 enabled. The full log is attached.

I tried to cut the problem down, disabling unrelated volumes and
reducing the MTD partition size, but in that configuration I was
not able to trigger the problem with UBIFS debug enabled. That is,
enabling debug made the problem go away.

Thus, the log shows two UBIFS partitions. /opt is the one with
the problem:

ubi0:usrl                65.2M     20.0k     61.8M   0% /usr/local
ubi1:opt                109.0M      1.6M    102.6M   2% /opt

Basically, starting from a fully erased MTD partition, I run

ubiattach /dev/ubi_ctrl -m 6
ubimkvol /dev/ubi1 -N opt -m
mount -t ubifs ubi1:opt /opt

After that I get the system to write a file into /opt. This is
data streamed over Ethernet, so write units are probably odd sized
blocks. I don't know if this is significant, but I wasn't able
to trigger the problem any other way (e.g. dd if=/dev/urandom, or
copying the exact same file via cp).


Kind regards,

Iwo
