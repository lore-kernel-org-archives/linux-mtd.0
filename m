Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFrg7-0007sy-KH
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 06:08:52 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Lorenzo PARISI <lorenzo.parisi@st.com>
In-Reply-To: <83197f15.8bfe70e2.81c1800@mail1.agr.st.com>
References: <83197f15.8bfe70e2.81c1800@mail1.agr.st.com>
Content-Type: text/plain
Message-Id: <1097229657.11402.1440.camel@thomas>
Mime-Version: 1.0
Date: Fri, 08 Oct 2004 12:00:57 +0200
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	YAFFS mailing list <yaffs@stoneboat.aleph1.co.uk>
Subject: Re: Benchmark errors
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-08 at 11:52, Lorenzo PARISI wrote:
> Hi all,
> nand_write_oob: Failed write verify, page 0x0....

So it works with JFFS2 and it fails on YAFFS. The MTD internal interface
was reworked some time ago and it might be that the write verify does
not work with YAFFS anymore, as YAFFS is using a legacy variant of the
interface. Can you please switch of the write verify and test again ?

tglx
