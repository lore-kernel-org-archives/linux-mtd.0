Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K38LI-0005Wd-MF
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 11:36:49 +0000
Date: Mon, 2 Jun 2008 13:36:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080602113639.GA21359@logfs.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080601174841.GH13094@logfs.org>
	<20080602112807.GA728@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602112807.GA728@shareable.org>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>, vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2008 12:28:07 +0100, Jamie Lokier wrote:
> 
> Did you see if the dual plane feature at least allows erasing the next
> block while writing the current one, so you can do continuous
> streaming log writes without big pauses?

No, it simply allows the same operation to be done for two seperate
blocks.

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
