Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FAO67-0000fY-KL
	for linux-mtd@lists.infradead.org; Sat, 18 Feb 2006 04:09:51 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200602161432.17447.manningc2@actrix.gen.nz>
References: <43EB96DC.3030900@eptar.com>
	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>
	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
	<200602161432.17447.manningc2@actrix.gen.nz>
Content-Type: text/plain
Date: Sat, 18 Feb 2006 10:10:25 +0100
Message-Id: <1140253826.2480.651.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles,

On Thu, 2006-02-16 at 14:32 +1300, Charles Manning wrote:
> 1) ECC on tags....  Tags are so small that a single-bit correction is probably 
> enough. Multibit is probably a good thing to investigate.
> 2) More OOB being used for multi-bit schemes will probably mean less space 
> available for tags.

We really should start to think seriously about oob usage for arbitrary
data storage at all. I know that YAFFS(2) depends on that, but looking
at the required mess in the code to keep this up for all the 9999
variants of ECC/RS whatever mechanisms, bad block marking schemes ...

Some words about Reed Solomon.

Reed Solomon needs hardware support for performance reasons. Efficient
usage of Reed Solomon requires a different Data / RS-code layout:

512 Byte Data
8 Byte RS Code
512 Byte Data
8 Byte RS Code
512 Byte Data
8 Byte RS Code
512 Byte Data
8 Byte RS Code
32 Byte OOB

This layout is supported already (see rtc_from4.c). It requires usage of
flash based bad block tables.

	tglx
