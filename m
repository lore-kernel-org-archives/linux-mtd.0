Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0E00-0005oy-37
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 12:39:40 +0000
Subject: Re: giving room for Linux filesystems on MLC/SLC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Emmanuel Michon <emmanuel.michon@polytechnique.org>
In-Reply-To: <81859150910200356i1e80bb4er1b97046f43415938@mail.gmail.com>
References: <81859150910200356i1e80bb4er1b97046f43415938@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Oct 2009 15:39:25 +0300
Message-Id: <1256042365.29856.260.camel@localhost>
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

On Tue, 2009-10-20 at 12:56 +0200, Emmanuel Michon wrote:
> Hello,
> 
> we're preparing in my company the software for a general purpose (.5K,
> 2K, 4KB page)
> hardware MLC/SLC controller, especially how we're going to
> choose the byte offsets of a page+spare for `metadata' and `bad
> blocks' (those are excluded by our ECC check hardware).
> 
> 0                                               4096+epsilon
> | metadata | data | bb info | data
> 
> Our primary goal is to be compatible with our proprietary filesystem,
> but if we can enable Linux family of MTD FS with little effort, let's
> prepare it
> 
> `bad block' information is a hardware stuff (unconsistently, poorly)
> documented to be near the start of spare area.
> 
> For some reason we have this 4 byte metadata at the start of each
> page. Does this software concept apply to ubifs and friends and should
> it be sized differently?

We work with an abstract flash mode: it consists of eraseblock, each
eraseblock has several min. I/O units. So if in your cases the driver
hides these meta-data bytes, it should be fine.

However, current UBIFS is hard-coded with an assumption that min. I/O
size is power of 2. This would probably have to change. There was no
fundamental reason why we did it like this, we just wanted to save some
CPU cycles and avoid divisions. But this can be changed.

> Btw, any success stories about UBIFS+MLC since the FAQ report on this topic?

I have not heard them.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
