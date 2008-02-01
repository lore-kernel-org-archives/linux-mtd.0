Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKwSF-0001jd-IL
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 14:01:27 +0000
Message-ID: <47A32628.2070808@dave-tech.it>
Date: Fri, 01 Feb 2008 15:01:12 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: JFFS2: file contents in case of data CRC error
References: <47A1FD3F.2020102@dave-tech.it>
	<f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
In-Reply-To: <f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> up to JFFS2. I'm not sure, but I think what happened from there is
> that JFFS2 failed to decompress a block and instead of returning an
> error it left the page zeroed. You can use jffs2dump to correlate the
> offset reported in the CRC error with the problematic inode. Check the
> thread "bit flip" in October 2007.
Thanks a lot for this advice. The system is based on linux 2.4.20 and 
ELDK 2.0.2 so the jffs2dump is not available out-of-the-box. I'll try to 
build recent mtd-utils package.

> What platform is this on?
PowerPC 405EP.


Regards,
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
