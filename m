Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions
	causes kernel panic
From: David Woodhouse <dwmw2@infradead.org>
To: Anders =?ISO-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>
In-Reply-To: <4810F73A.5000305@users.sourceforge.net>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<1208011719.2698.19.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
	<Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>
	<4810F73A.5000305@users.sourceforge.net>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2008 23:15:15 +0100
Message-Id: <1209075315.11578.9.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-24 at 23:10 +0200, Anders Grafström wrote:
> [    4.251504] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> [    4.261504] pgd = c3cd8000
> [    4.271504] [00000000] *pgd=03d9b031, *pte=000010cf, *ppte=0000100e
> [    4.291504] Internal error: Oops: 3cd981f [#1]
> [    4.291504] Modules linked in:
> [    4.291504] CPU: 0    Not tainted  (2.6.25-1 #5)
> [    4.291504] PC is at jffs2_write_end+0x54/0x264

list *jffs2_write_end+0x54

And can you reproduce with CONFIG_JFFS2_FS_DEBUG=1? 

-- 
dwmw2
