Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cs8bm-0004Ie-FH
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 18:54:32 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0LNsRJX007278
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2005 18:54:28 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0LNsRql289914
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2005 18:54:27 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0LNsR4d014304
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2005 18:54:27 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050121144619d2899d@mail.gmail.com>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<6934efce050121144619d2899d@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 21 Jan 2005 17:54:24 -0600
Message-Id: <1106351665.10417.8.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-21 at 14:46 -0800, Jared Hulbert wrote:
> New idea.
> 
> Why should we waste time compressing the uncompressable?  JFFS2
> actually spent alot of time compressing.
> 
> I can think of a few possible mechanisms:
> a) extension based
>         -Don't compress files with .mpg, .jpg, .avi, .gz, etc.  User
> defined list?
> b) test first data
>          Compress the first X sized chunk of data to determine if the
> file is compressable.  Make  determination and write data.
> c) test node by node
>           If the last node didn't compress, stop compressing file.

Both b) and c) don't work.  Binary files with large sections of zeros
between seemingly random data compress quite well.  With those schemes
you loose the compression benefit of all those zeros (or any other
repeating pattern).

Option a) could work, maybe.  You can argue that file extensions are
more of a Winders mechanism though.  None of those files have to end in
a specific extension on Linux.  E.g. someone can make a foo.gz, copy it
to foo.notgz, and gzip will still grok it.

But if the list was user definable as you suggested, then users can tune
to their specific usage.

Or, as has been suggested before, you could use xattrs to do per-file
compression.  This is probably the most generic option.

josh
