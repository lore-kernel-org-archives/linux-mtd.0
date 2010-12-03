Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POYBT-0003sF-R4
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 16:08:32 +0000
Received: by bwz5 with SMTP id 5so8805397bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 08:08:30 -0800 (PST)
Subject: Re: bud_replay size question
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Iribarne <siribarne@grid-net.com>
In-Reply-To: <4CF691F0.9010607@grid-net.com>
References: <4CF691F0.9010607@grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 18:07:57 +0200
Message-ID: <1291392477.2365.64.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-01 at 10:20 -0800, Steve Iribarne wrote:
> What I'm trying to determine is how to figure out how big the replay_bud 
> LEB list can get based on my configuration.  Is there such a thing or am 
> I just dreaming?

Yeah, maximum amount of buds is max_bud_bytes / leb_size rounded up, I
thing. max_bud_bytes is stored in the superblock (see struct
ubifs_sb_node). The smaller it is, the smaller is the UBIFS journal.

You can control max_bud_bytes with the -j option of mkfs.ubifs. Try to
make it smaller.

Frankly, we (UBIFS authors) made this mechanism, but never really played
with journal size and always used the default one. Please, play with
this and report your findings - you can hit bugs if you start making it
too small or too large, but may be not. Dunno. But it has to make UBIFS
keep the journal smaller.

Alternatively, you can try to look at all UBIFS allocations. I will not
be surprized if it allocates some buffers which are not really neaded in
R/O mode, although we did do some work to allocate less resources when
we are in R/O mode. You can experiment in Linux, because it is easier,
and if you find unneeded buffers, fix this, and then port your changes
to u-boot.

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
