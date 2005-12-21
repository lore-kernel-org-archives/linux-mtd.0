Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ep3J3-0005qy-Bg
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 07:43:02 -0500
Message-ID: <43A94DF7.8050209@ru.mvista.com>
Date: Wed, 21 Dec 2005 15:43:35 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <20051216122331.GA801@angel.research.nokia.com>	<43A690EA.5050903@gmx.de>
	<20051221093034.GA7781@angel.research.nokia.com>
In-Reply-To: <20051221093034.GA7781@angel.research.nokia.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Christian Lehne <christian_lehne@gmx.de>, tglx@linutronix.de,
	priewasser@gmail.com, "Zhao, Forrest" <forrest.zhao@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: EBH with OneNAND doesn't work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jarkko Lavinen wrote:

>Thanks Christian, your patch helpt me to get JFFS2 working without
>using too many printks.
>
>Currently wbuf.c:jffs2_check_nand_cleanmarker_ebh() assumes the node header 
>fits in the first free region.  The magic and node type would take 4 bytes.
>If we have only 2 byte free regions available,  this is not enough
>and the struct jffs2_unknown_node needs to be assembled.
>  
>
I hope we'll eliminate this problem soon when new functions to 
read/write the free OOB area as a contiguous array of bytes are introduced.

Vitaly
