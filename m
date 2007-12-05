Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Izikj-00015q-Vl
	for linux-mtd@lists.infradead.org; Wed, 05 Dec 2007 01:08:48 +0000
Date: Wed, 5 Dec 2007 02:03:18 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 doesn't use OOB at MLC NAND/OneNAND
Message-ID: <20071205010318.GG26112@lazybastard.org>
References: <20071205005553.GA28782@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071205005553.GA28782@party>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 December 2007 09:55:53 +0900, Kyungmin Park wrote:
> 
> It's the preparation patch for the MLC NAND/OneNAND flash.
> The current jffs2 implementation at NAND case uses the NOP 2, cleanmarker and data each page 0. It breaks the NOP 1 limitation in MLC flash.
> 
> With this patch, we don't write the cleanmarker at oob area.
> I'm not sure it should use the cleanmarker at data area as NOR does.
> Apart from the cleanmarker, there's serious POR issue, paired page at MLC.
> 
> The paired page problem is that if the some page is broken, the paired page is also broken even though it is written correctly at previous time.
> That's the reason the cleanmarker is not big issue at this time.
> 
> Now we support the NOP 1 and later we have to address this paired page issue. I'm not sure when this problem is addressed.
> 
> Any comments are welcome.

I like it.

Jörn

-- 
Joern's library part 3:
http://inst.eecs.berkeley.edu/~cs152/fa05/handouts/clark-test.pdf
