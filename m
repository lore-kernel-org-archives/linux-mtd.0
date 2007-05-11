Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmZGs-0001AT-4c
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 13:51:17 -0400
Received: by ug-out-1314.google.com with SMTP id m2so657715uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 May 2007 10:51:12 -0700 (PDT)
From: borasah@gmail.com
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash write goes wrong
Date: Fri, 11 May 2007 20:58:14 +0300
References: <200705102150.31171.borasah@gmail.com>
	<200705111656.24216.borasah@gmail.com>
	<Pine.LNX.4.64.0705111621430.3951@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0705111621430.3951@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="Iso-8859-9"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705112058.14662.borasah@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > 	Input file is not page aligned
> > 	Data did not fit into device, due to bad blocks
> >
> > 	: Success
> >
> > In fact, I tried without -p and with -n before. Without -p nandwrite
> > gives the above message. Then I put -p and nandwrite started to write...
>
> Sorry, I didn't get it completely right last time. It is good practice to
> pad the image to a complete eraseblock size, but it shouldn't fill the
> whole nand flash partition space available, in case there are bad blocks.

Hmm, you say if the erase block size is 100, and the last part of the image is 
64, the remaining 36 should be padded with 0xFF, but all the other free ones 
can remain as is? 

mkfs.jffs2 -p without SIZE does the above one or to the end of the NAND flash? 
I think the first one...

> So yes, it should be padded with -p, but not to the full size of the
> partition, but a couple of eraseblocks less.

You mean "NAND_size - erase_size * x"? 

> -p specified to nandwrite should also work as it pads the image with 0xff.

Hmm. You dont have to specify -p to the mkfs.jffs2, nandwrite can also do it 
for you, right?

> >> If there indeed are bad blocks it is correct to skip them both when
> >> erasing and writing.
> >
> > OK. What I wanted to learn was different. In the begining there was no
> > bad sector but by the passage of time, when I tried different
> > combinations, bad sector numbers started to increase. Is this normal? Or
> > are there some fundamentally different things between kernel version and
> > mtd-utils so these marks them as bad?
>
> Blocks (nand flash terminology rejects the name 'sectors' in favor of
> 'blocks' and 'pages') can go bad with time, but we're talking about
> thousands if not tens of thousands of erase/write cycles here. So it seems
> there's something wrong here.

Yes, I think too. Now ~140 bad sector is reported during the boot. I just did 
at most 50 read/write...

> There was a patch posted just a week or so ago here which fixed a problem
> with bad block marking and recognition when not using a flash-based bad
> block table.

I'm new to the list. Is this Artem's patch? I applied it, but no success... 
Maybe http://lists.infradead.org/pipermail/linux-mtd/2007-May/018087.html?

> My (limited) experience is that when the jffs2 driver detects more and
> more bad blocks over a short period of time, it is the result of a
> hardware problem i.e. the communication with the nand flash doesn't work
> properly, causing some reads, writes or erase operations to fail. (Case in
> point: during debugging of one of our products I accidentally allocated a
> network traffic indicator output pin to one of the nand flash signals,
> which caused all sorts of weird nand flash problems if the flash was
> accessed at the same time as the network. As long as the network was
> silent, there were no problems whatsoever).

Ricard, thanks for the the information...

--
Bora SAHIN
