Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgIPR-0005Rh-GC
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 06:52:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?Q?=E6=9E=97=E6=84=8F?= =?UTF-8?Q?=E7=BF=94?= <lnys@avamax.com>
In-Reply-To: <002201c3d985$8ff790f0$1a140a0a@leonnb>
References: <002201c3d985$8ff790f0$1a140a0a@leonnb>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1073976604.5541.10.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 13 Jan 2004 06:50:05 +0000
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-13 at 11:30 +0800, 林意翔 wrote:
>              I also do another test for reading or writing Nand flash by MTD
> block driver and it is ok (I mean reading or writing 200KB data from/to Nand
> flash is not more than 1 second).  So I don't know what the problem is. Do
> anyone meet the similar problem or any idea?

Use profiling to see where it's spending all its time. Read the
'readprofile' man page.

-- 
dwmw2
