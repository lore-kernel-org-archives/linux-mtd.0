Received: from ussvlmgty03.spansion.com ([12.151.36.115])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtgOh-0002GS-Vu
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 12:38:36 +0000
Message-ID: <4C88D53D.1070109@spansion.com>
Date: Thu, 9 Sep 2010 14:38:21 +0200
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
MIME-Version: 1.0
To: qzhan2009@gmail.com
Subject: Re: Re: Anyone can help me about do_write_buffer at cfi_cmdset_0002
References: <AANLkTi=vYL2uAycRoaBW3cG5EHb_FU3sYcP=899ouHuK@mail.gmail.com>
In-Reply-To: <AANLkTi=vYL2uAycRoaBW3cG5EHb_FU3sYcP=899ouHuK@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 >    In functions
 >    do_write_buffer @ drivers/mtd/chips/cfi_cmdset_0002.c.
 >    /* why word_write_time? */

I assume this is because the write times as given by CFI are typical times and 
is most cases the device is faster than that. In other words, if we waited 
"buffer_write_time" before starting to poll then the device would already have 
finished the operation and we would waste time in most cases.

Actually, newer devices would work without any delay after sending the command 
cycles and before polling. However, first generation MirrorBit devices (-A and 
-M families) required a 4us delay to give stable status information. So 
waiting the typical word program time is a good compromise. It gives you 
maximum performance while still keeping compatiblility with older devices.

--Gernot
