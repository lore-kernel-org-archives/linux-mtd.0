Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiVlu-0004yD-0r
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 07:46:38 -0500
Message-ID: <4554749E.5040205@ru.mvista.com>
Date: Fri, 10 Nov 2006 15:46:22 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code:	respin
References: <20061109152617.GB12624@ru.mvista.com>
	<1163147018.3925.9.camel@sauron>
In-Reply-To: <1163147018.3925.9.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Artem Bityutskiy wrote:
<snip>

>patching file drivers/mtd/nand/nand_base.c
>Hunk #2 succeeded at 1006 (offset -1 lines).
>Hunk #4 succeeded at 1260 (offset -1 lines).
>Hunk #5 succeeded at 1282 (offset -2 lines).
>Hunk #6 succeeded at 1300 (offset -1 lines).
>Hunk #7 succeeded at 1321 (offset -2 lines).
>Hunk #8 succeeded at 1343 (offset -1 lines).
>Hunk #9 FAILED at 1665.
>  
>
Hmmm...
vital@laja:~/work/opensource/mtd$ git-pull mtd_in
Already up-to-date.
vital@laja:~/work/opensource/mtd$ patch -p 1 < patches/nand-ooblen-fix.patch
patching file drivers/mtd/inftlcore.c
patching file drivers/mtd/nand/nand_base.c
patching file drivers/mtd/mtdchar.c
patching file drivers/mtd/mtdconcat.c
patching file drivers/mtd/nand/nand_bbt.c
patching file drivers/mtd/nftlcore.c
patching file drivers/mtd/ssfdc.c
patching file fs/jffs2/wbuf.c
patching file drivers/mtd/mtdpart.c
patching file include/linux/mtd/mtd.h
vital@laja:~/work/opensource/mtd$

I'm working with the main MTD tree (dwmw2's)... Is yours the same?

Vitaly
