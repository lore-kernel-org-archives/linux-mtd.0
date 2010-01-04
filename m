Received: from [81.103.221.47] (helo=mtaout01-winn.ispmail.ntl.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRrlO-0004e0-Rz
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 18:34:51 +0000
Received: from aamtaout02-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout01-winn.ispmail.ntl.com
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20100104183407.XQPS17029.mtaout01-winn.ispmail.ntl.com@aamtaout02-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Mon, 4 Jan 2010 18:34:07 +0000
Received: from Parkytowers.ntlworld.com ([86.30.40.23])
	by aamtaout02-winn.ispmail.ntl.com
	(InterMail vG.2.02.00.01 201-2161-120-102-20060912) with ESMTP id
	<20100104183407.NJYA21638.aamtaout02-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
	for <linux-mtd@lists.infradead.org>; Mon, 4 Jan 2010 18:34:07 +0000
Date: Mon, 04 Jan 2010 18:33:52 +0000
To: linux-mtd@lists.infradead.org
From: David Parkinson <parky_dw@ntlworld.com>
Subject: M-systems DOC 2000
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Message-Id: <20100104183407.NJYA21638.aamtaout02-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've been doing stuff with some old GEODE-based thin clients (circa 
2003) and have Linux running off CF cards on the IDE interface.  A 
couple of them (Neoware Capio and Relisys RWT200EM) have DOC 2000s on 
them (32Mb and 16Mb respectively) which hold the original WinCE 
firmware and I thought it would be interesting to try and utilise 
these - however Google has not been my friend here.

Currently I'm using Tiny Core and have rebuilt the kernel and 
included MTD support along with the drivers for the DOC 2000.  I've 
got as far as getting the message "No DiskOnChip devices found" in 
the start-up messages.  I did wonder whether the M-systems DOS-based 
tool set (v5.1.4.0?) would help me get a grip on things, but all the 
"download from here" links that Google found link to the m-systems 
website that I believe vanished some time ago.  How-to's that I've 
found are all 4-5 years old and generally refer to M-systems drivers 
and/or require ancient kernels and specific compilers....  (I have 
however managed to locate and download the device datasheets!)

I'd appreciate any pointers to any documentation or tools that would 
help me with my quest.

Regards

David
