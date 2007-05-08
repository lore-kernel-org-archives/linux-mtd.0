Received: from wx-out-0506.google.com ([66.249.82.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlOC3-0001xS-85
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 07:49:24 -0400
Received: by wx-out-0506.google.com with SMTP id t8so1748090wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 May 2007 04:49:21 -0700 (PDT)
Message-ID: <acd2a5930705080449q2930ad50n521b70263d1c2fdb@mail.gmail.com>
Date: Tue, 8 May 2007 15:49:21 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "=?ISO-8859-1?Q?Michael_K=F6nig?=" <Michael.Koenig@ipcas.de>
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
In-Reply-To: <D1CA5322EC0446D8F2053C9D@franken3>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <D1CA5322EC0446D8F2053C9D@franken3>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael,
> cse0: Probing a 0x04000000 bytes large window at 0xe0000000.
> cse0: Found 1 x16 devices at 0x0 in 16-bit bank
> cse0: Found an alias at 0x800000 for the chip at 0x0
> cse0: Found an alias at 0x1000000 for the chip at 0x0
> cse0: Found an alias at 0x1800000 for the chip at 0x0
> cse0: Found an alias at 0x2000000 for the chip at 0x0
> cse0: Found an alias at 0x2800000 for the chip at 0x0
> cse0: Found an alias at 0x3000000 for the chip at 0x0
> cse0: Found an alias at 0x3800000 for the chip at 0x0

that's b/c you're supplying too large a window, but that's harmless AFAICS.

> The system boots fine and reading isn't a problem either, but it seems that
> no data is actually written to the Flash. When creating a new file on JFFS2
> I get an error message like this:
>
> Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)

I'd check if you have the right width set up first.

Vitaly
