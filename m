Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dwz2c-0002cP-HE
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2005 05:14:33 -0400
Date: Mon, 25 Jul 2005 11:14:25 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050725091425.GB10616@wohnheim.fh-wedel.de>
References: <BAY17-F15C6182BFC9EEA8E5AD337E8CA0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F15C6182BFC9EEA8E5AD337E8CA0@phx.gbl>
Cc: dedekind@yandex.ru, tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 July 2005 17:10:22 +0800, zhao forrest wrote:
> 
> I refined the patch and reduced the indentation from 7-level to
> 4-level. Will 4-level indentation be acceptable?

Compared to the rest of JFFS2, that's fine.  Still, the technical
parts of the patch should be reviewed by someone else.

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
