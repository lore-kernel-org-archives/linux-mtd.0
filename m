Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CktC-00034m-9s
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 19:40:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Kelly <mgkelly59@yahoo.com>
In-Reply-To: <20030505140612.95087.qmail@web9607.mail.yahoo.com>
References: <20030505140612.95087.qmail@web9607.mail.yahoo.com>
Message-Id: <1052160051.2446.18.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 05 May 2003 19:40:51 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Need help understanding jffs2 mount activity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-05 at 15:06, Mike Kelly wrote:
> If the 700KiB file is copied then deleted, would this
> result in 4KiB nodes for the new file? 

Yes, assuming you copy it sensibly. If you read and write in smaller
blocks then no. The 'cp' command should do the right thing.

>  If so, shouldn't the bootup time be quicker, since there are
> less nodes to CRC check?  The bootup time seems to
> remain the same, even after several reboots.

It _should_ be somewhat quicker since there are fewer nodes to CRC
check, hence fewer node headers -- obviously there's still the same
amount of data. 

The real answer, though, is to simply avoid checking all those CRCs at
mount time, and to postpone the checking till later. That's implemented
in the latest code in CVS -- updating to that should give you a fairly
dramatic improvement, especially if you also implement the 'point'
method in your board's map driver. 

-- 
dwmw2
