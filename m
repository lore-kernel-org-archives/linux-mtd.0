Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfrOA-0008CV-2i
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 22:05:43 -0500
Date: Sun, 19 Dec 2004 04:05:41 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20041219030541.GB22451@wohnheim.fh-wedel.de>
References: <20041218175909.GC4147@wohnheim.fh-wedel.de>
	<BCEFJBPJCGFCNMMMIDBHGENBCJAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHGENBCJAA.Joakim.Tjernlund@lumentis.se>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 18 December 2004 19:13:35 +0100, Joakim Tjernlund wrote:
> >
> > Nope.  I completely ignored the remainding byte if len is uneven and
> > didn't bother much about the usual corner-cases.  Xor with ~0, off by
> > one, all that.  It's not performance relevant, so that can be done
> > later.
> 
> Yes, I noticed that but crc16(~0, "abcd", 4) does
> not yield the same result as mine.

int main()
{
	int *i = (void*)"abcd";
	printf("%d", *i % 65521);
}

17544

This results differs from both.  Maybe I can understand the difference
after getting some sleep.

Jörn

-- 
They laughed at Galileo.  They laughed at Copernicus.  They laughed at
Columbus. But remember, they also laughed at Bozo the Clown.
-- unknown
