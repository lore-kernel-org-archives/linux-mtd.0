Received: from galaxy.systems.pipex.net ([62.241.162.31])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJ9cb-0003bn-17
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 08:27:02 -0400
Message-ID: <4253D61C.6010109@infocell-its.com>
Date: Wed, 06 Apr 2005 13:29:16 +0100
From: Zeri Virgo <zerivirgo@infocell-its.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>	<42527DD5.4080009@infocell-its.com>
	<4252EC5D.4090806@ieee.org> <4253D280.6090308@infocell-its.com>
In-Reply-To: <4253D280.6090308@infocell-its.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Just to give you a clearer picture, the bzImage is 1148021 bytes and 
> doc_spl is 1187472 bytes. The nandwrite command writes doc_spl from 0 up 
> to the erase block at 0x118000 which is well within the 0x208000 
> firmware area.

Hey, I just noticed that 0x11c000 (0x118000 + 4000) is only 1163264 
bytes - doesn't that mean doc_spl wasn't fully written to the chip!?

- Zeri
