Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QbCu-0006NS-OC
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 00:10:14 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Pantelis Antoniou <panto@intracom.gr>,
	linux-mtd@lists.infradead.org
Date: Fri, 13 Jun 2003 11:13:09 +1200
References: <3EE6EBA0.3080508@intracom.gr>
In-Reply-To: <3EE6EBA0.3080508@intracom.gr>
MIME-Version: 1.0
Message-Id: <20030612231042.C385C409E@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Cram FS on NAND - How to do this?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[snip]
> JFFS2: Read/write, compressed, best support, slow startup.
> YAFFS: Read/write, not compressed, newcomer, fast startup.

YAFFS is being used extensively and has been shipping in commercial products 
for approx 9 months or so with well over ten thousand units in the field.

>
> I have a requirement to have a compressed read only
> root filesystem in my board and I've come to the
> conclussion that the best fit would be CRAMFS if only
> had any concept of bad blocks.
>
> Looking at the code for CRAMFS I see that it would not
> be very difficult to hack it to detect the bad blocks
> and skip over them on startup. We could rely on
> the same OOB info that JFFS2 has, and just
> make a mapping list as follows:
>
> NAND block  bad?  fs block
> ----------  ----  --------
>     0         n      0
>     1         n      1
>     2         y     skip
>     3         n      2
>
> ... etc
>
> The first complication is that CRAMFS works with
> PAGE_SIZE blocks only, and that should be taken
> into account.

That is not a problem. NAND blocks are a multiple of PAGE_SIZE, therefore 
each NAND block holds say 4 cramfs blocks ie. your table becomes
 NAND block  bad?  fs block
> ----------  ----  --------
>     0         n      0..3
>     1         n      4..7
>     2         y     skip
>     3         n      8..11

>
> The second is that this is the first time I hack filesystem
> code and I would like to ask the list if you see any difficulties
> ahead.
>
> What are your thoughts in this?

While some people (myself included)  have suggested some ways you could 
achieve your goals without native cramfs, I really think that native cramfs 
support would be a GoodThing. It is always good to have another option 
(that's why there are over 30 different file systems available for Linux).

I would not be worried about no previous FS experience. This is more of an 
adaptaion of an existing FS. Having a read-only FS makes it much simpler.

Suggestion: GO FOR IT!

-- CHarles
