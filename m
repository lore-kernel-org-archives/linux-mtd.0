Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CG0BU-0001jm-A2
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 15:13:45 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Kalev Lember <kalev@colleduc.ee>
In-Reply-To: <4166DC47.5010104@colleduc.ee>
References: <20041004215001.769d8017.nipo@ssji.net>
	<Pine.LNX.4.44.0410051152070.2033-100000@kiire.colleduc.ee>
	<20041006213434.55d36d65.nipo@ssji.net> <4166DC47.5010104@colleduc.ee>
Content-Type: text/plain
Message-Id: <1097261009.11402.1703.camel@thomas>
Mime-Version: 1.0
Date: Fri, 08 Oct 2004 21:05:53 +0200
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pouillon <nipo@ssji.net>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-08 at 20:28, Kalev Lember wrote:
> No, it is not supported. According to 
> http://www.tri-m.com/products/msystems/files/specs/mddoc_spec.pdf the 32 
> MB Millennium Plus has 16 bit data bus while the supported 16 MB Mil+ 
> has 8 bit bus.

Hmm, I think you talk about different things.

>> This time, chip is probed as a DoC-Mil+ 32MB, driver complains about 
>> it not being supported. It seems ok, and as mtd are much like rocket
>> science to me, I'll wait a little until it is (i hope) supported...

The DoC has Doc-chip-ID 0x41 according to the datasheet.
http://www.m-systems.com/files/documentation/doc/Mobile_Plus_32_64MB_DS_Rev1.7.pdf

from include/linux/mtd/doc2000.h
#define DOC_ChipID_DocMilPlus32 0x40
#define DOC_ChipID_DocMilPlus16 0x41

So how is it identified as a Mil+32 ? 

The chip can be accessed in 16 bit mode, but it does not need the two
parallel chip magic which are neccecary for the Mil+32.

Please correct me, if I'm wrong or talking about something different :)

tglx
