Received: from [213.86.99.234] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kGFI-0004ai-J7
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 05:49:56 +0100
Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19kGF9-0005ZY-00
	for linux-mtd@lists.infradead.org; Wed, 06 Aug 2003 05:49:48 +0100
Message-ID: <3F308914.2050500@hectrix.com>
Date: Wed, 06 Aug 2003 12:50:28 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NFTL formatting problem; alternatives?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

Since the latest mtd cvs doesn't build nftl_format, I wonder if there 
are any alternatives in Linux. I also tried building nftl_format from 
mtd snapshot 2002-07-31, the one mentioned in Karim's book. But since I 
have already patched my 2.4.21 kernel with mtd snapshot 2003-08-04, I 
failed to compile the former util snapshot. I even tried patching 2.4.21 
with the mtd snapshot 2002-07-31, but failed. So, how can I perform a 
NFTL format in Linux, instead of using dformat.exe in DOS?

Another problem is concerning the order of operations of preparing the 
DOC. According to Karim's book, I successfully built a grub_firmware and 
  loaded it to my DOC (previously erased by eraseall) using 
doc_loadbios. The next step is to NTFL format my DOC. But the precaution 
is that the NFTL driver would interfere with nftl_format, and therefore 
I have to either compile the NFTL driver as a module and unload it when 
NTFL formatting, or eraseall my DOC and reboot so that the 
kernel-built-in NFTL driver would not detect it. Since I already 
built-in the driver, I prefer the second approach. But if I eraseall my 
DOC and reboot, can I still doc_loadbios the grub_firmware and then 
nftl_format my DOC at 98304?

Regards,

Selwyn
