Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYXF4-0003du-Ow
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 04:37:16 +0000
Subject: Re: ubifs_scan() error handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <1278995289.16634.126.camel@localhost>
References: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
	<1278995289.16634.126.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 07:32:08 +0300
Message-ID: <1278995528.16634.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 07:28 +0300, Artem Bityutskiy wrote:
> > Would it make sense and be acceptable to make this call any time
> > ubifs_scan() returns an error? 
> 
> May be. I'll think and return to you.

We can probably go for it, but the current recovery is not enough for
MLC anyway. So I'd prefer to do the change you propose as a part of
larger UBIFS on MLC patch-set.

Please, analyse ubifs_recover_leb(), find out what should be changed
there for MLC, send a patch-set.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
