Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MNkBS-000584-5j
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 09:08:31 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MNkBM-0005A6-Ow
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 09:08:16 +0000
Received: from woodchuck.wormnet.eu ([77.75.105.223])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2009 09:08:16 +0000
Received: from alex by woodchuck.wormnet.eu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2009 09:08:16 +0000
To: linux-mtd@lists.infradead.org
From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: How to calculate mount a file system ?
Date: Mon, 6 Jul 2009 09:35:25 +0100
Message-ID: <djp8i6-cvq.ln1@woodchuck.wormnet.eu>
References: <a1fb7300907051946g3c12f0bbx1ddd59b2680f7e9c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thang Dao Duy <hanbaoquansexy@gmail.com> wrote:
>
> In web site: http://www.linux-mtd.infradead.org/doc/ubifs.html. I see
> the evaluation value "mount time" between JFFS2 and UBIFS.
> But i don't know  formula to calculate the time to mount one file
> system. So some one can help me this!
>
erm.....

time mount <fs bits heres>

'time' is part of BASH so you might need to fiddle which what shell you 
use.  It's good to see the difference between 'real' and 'cpu' time as 
it should give a rough indication how much of that time is spent in IO 
wait.

You can slip 'time' infront of any shell command you use for very 
rough'n'ready timings.

Cheers

-- 
Alexander Clouter
.sigmonster says: A man's house is his castle.
                  		-- Sir Edward Coke
