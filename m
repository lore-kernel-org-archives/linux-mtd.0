Received: from web52701.mail.yahoo.com ([206.190.39.152])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp9TF-0000fN-Hk
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 13:13:26 -0500
Message-ID: <20050113181258.13116.qmail@web52701.mail.yahoo.com>
Date: Thu, 13 Jan 2005 10:12:58 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41E699F9.10704@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: NAND fail testing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Is there a simple way (using existing drivers and utilities) to
> "wear out" one byte on a NAND type chip by repeatedly rewriting a
> single byte (single address)?

As I understand, you can write over an already-written page with
new values.  Could you continually write the same data to a page,
except for the byte that you want to wear out?

I think because of the way NAND works, with a 512 byte buffer that
goes all at once into NAND that you can't do much other than
something like this.

Mike
