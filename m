Received: from simba.math.ucla.edu ([128.97.4.125])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3aZg-0008Uc-9f
	for linux-mtd@lists.infradead.org; Wed, 27 Jun 2007 12:41:02 -0400
Date: Wed, 27 Jun 2007 09:40:53 -0700 (PDT)
From: Jim Carter <jimc@math.ucla.edu>
To: Ram <vshrirama@gmail.com>
Subject: Re: JFFS2 New bie queries.
In-Reply-To: <8bf247760706270439t1b56157dy9671d903fb3aea8f@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0706270928080.561@simba.math.ucla.edu>
References: <8bf247760706270439t1b56157dy9671d903fb3aea8f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Jun 2007, Ram wrote:

> When i do command 'du -sh' i get a size which is totally different
> from command 'df' (disk free)

JFFS2 compresses the data.  I get about 2:1 comression with ARM executable 
cdde; it looks like you got a little more, maybe because the content is 
more predictable, e.g. contains some text.  Don't expect it to be effective 
on already compressed files, e.g. MP3, JPEG, AVI.

Now if I could only put JFFS3 on a 1 GB removeable MMC card, bypassing the 
(on-chip?) disc emulation layer...  Sigh.  This is on a Nokia 770.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)
