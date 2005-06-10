Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DghaN-00067o-Tw
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 07:22:07 -0400
Date: Fri, 10 Jun 2005 13:21:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Munira Ahmed <munira.ahmed@radixs.com>
Message-ID: <20050610112127.GA29546@wohnheim.fh-wedel.de>
References: <BAY2-F11432519227105B42F84CDDAFF0@phx.gbl>
	<42A9496D.9020806@yandex.ru> <1118391261.11408.110.camel@server11>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1118391261.11408.110.camel@server11>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>,
	tong changda <tongcd@hotmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 June 2005 16:14:21 +0800, Munira Ahmed wrote:
> On Fri, 2005-06-10 at 12:03 +0400, Artem B. Bityuckiy wrote:
> > 
> > Many fixes were made since the time of 2.4.20. So, use newer MTD.
> > 
> I am also working on jffs2 and have been advised to update mtd. but I am
> afraid that keeping the kernel same and updating the mtd may result in
> some incomapatibility.

Correct.  You're basically left with three options:
1. Update to a current 2.6 kernel (2.6.11.11 or so).
2. Merge current mtd/jffs2 with your kernel and make sure it works.
3. Convince someone to do 2. for you.  This usually involves money.

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
