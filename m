Date: Fri, 25 Apr 2008 11:04:44 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
In-Reply-To: <1209075315.11578.9.camel@shinybook.infradead.org>
Message-ID: <Pine.LNX.4.64.0804251100430.30914@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<1208011719.2698.19.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
	<Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>
	<4810F73A.5000305@users.sourceforge.net>
	<1209075315.11578.9.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	Anders =?ISO-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anders,

Are you reproducing it after failed erase? 
What tool do you use? The last one in excessive erase thread?
If so we could try to reproduce it as well.

Thanks,
Alexey
