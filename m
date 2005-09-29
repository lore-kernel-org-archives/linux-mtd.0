Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvep-0004s4-Og
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:29:57 -0400
Date: Thu, 29 Sep 2005 12:29:03 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050929102903.GF18741@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<433BC08C.2030302@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433BC08C.2030302@inf.u-szeged.hu>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 12:23:08 +0200, Ferenc Havasi wrote:
> Artem B. Bityutskiy wrote:
> >
> > This also spoils wear-levelling...
> 
> It think it is the method which is really does not spoil the
> wear-leveling. The selection of the storing place uses exactly the same
> function what JFFS2 uses to store any other data.

Fair enough.  If not on its own, this should work in combination with
EBH.

Another problem introduced by this patch, btw, is an increased umount
time.  If you have to erase some blocks first, that could be
substantial.

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
