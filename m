Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CyGc7-0008Bu-34
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 16:40:12 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1CyGab-0005MG-81
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 22:38:37 +0100
Received: from 212.242.189.63 ([212.242.189.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Feb 2005 22:38:37 +0100
Received: from martin by 212.242.189.63 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Feb 2005 22:38:37 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Mon, 07 Feb 2005 22:36:45 +0100
Message-ID: <cu8n22$acu$1@sea.gmane.org>
References: <54CC136E5398384485619BC34B3A0F0B055D0DB0@ma00exh02.atitech.com>
	<20050207195209.GC25504@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050207195209.GC25504@wohnheim.fh-wedel.de>
Sender: news <news@sea.gmane.org>
Subject: Re: Follow-up to wearing / caching question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

>> I've been tasked with approximating the lifespan of the flash
>> (JFFS2) filesystem embedded in our products. Is there a best method
>> for calculating the space required for a fixed-size file over a
>> given lifespan? If we want our flash filesystem to be available for
>> an approximate lifespan of 20 years, given the wear-leveling
>> duty-cycle of JFFS2, and an average block endurance of 100k 
>> write/erase cycles, would I need 150% of the file's size? 200%?
>> 1000%?
=== 8< 8< 8< ===
> Another way to look at it is an imaginary 1MiB flash.  You can write
> it 100k times, for a total of 100GiB written to it.  With 600M seconds
> in your expected 20 years, that gives you ~160 Bytes/s average write
> speed.  Not very much.
Then what about the pagesize and corresponding writebuffer - this may 
have an effect, as well, when talking that slow write rates, right?!

> Is that the calculation you were looking for?
I liked it alot - thanks! ;-)

// Martin
