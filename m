Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKwSI-0001jk-5P
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 14:01:33 +0000
Message-ID: <47A32630.7070108@dave-tech.it>
Date: Fri, 01 Feb 2008 15:01:20 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: JFFS2: file contents in case of data CRC error
References: <47A1FD3F.2020102@dave-tech.it>
	<f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
	<20080131225742.GB26188@shareable.org>
In-Reply-To: <20080131225742.GB26188@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Matt Reimer <mattjreimer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I've seen similar things with cfi_cmdset_0002 on NOR flash, with Linux
> 2.4.26.  Occasional bit flips on reading flash, resulting in zero
> blocks in the read file from JFFS2 - no errors reported to the
> application.
Have you found the JFFS2 portion of code that "zeroes" the block before 
passing it to the userland?

Regards,
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
