Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKQwp-0004XZ-4a
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 21:41:33 -0400
Message-ID: <4339F405.8060708@setabox.com>
Date: Wed, 28 Sep 2005 09:38:13 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
References: <43397CAB.21913.1B78D5B@localhost>
In-Reply-To: <43397CAB.21913.1B78D5B@localhost>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCboot "BDK" partition, TLAs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joe,

Joseph M Dupre (AVAB Inc.) wrote:
> What is meant by the "BDK partition" the DOCboot README?
> 
> M-Systems literature uses BDK to refer to their Boot software 
> Development Kit.  With that software API you can access the "Binary 
> Partition".
> 
> So when you refer to the "BDK partition" are you refering to what M-
> Systems calls the "Binary Partition"?

Yes, a BDK partition is a binary partition.

A DOC chip consists of the following partitions: IPL, BDK, BDTL. The 
code in the IPL partition does some system initialization, such as 
initialzing the RAM. You can use the BDK partitions to hold your 
bootloader and kernel image. The BDTL is a filesystem partition and can 
be accessed through /dev/tffsa. I believe the total possible number of 
partitions BDK + BDTL is 4.

You can use the SDK API provided by M-Systems to access the BDK and IPL 
partitions. There is documentation on M-System's website describing all 
of this.

-- 
William J Beksi                          <wjbeksi@users.sourceforge.net>
GPG Key Fingerprint = ED4B 32C3 69E6 C2B7 705C  263F CB2F 3253 E7E1 DB3B
