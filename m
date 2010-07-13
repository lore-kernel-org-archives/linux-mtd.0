Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYXBj-0002Rv-Py
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 04:33:48 +0000
Subject: Re: ubifs_scan() error handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
References: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 07:28:09 +0300
Message-ID: <1278995289.16634.126.camel@localhost>
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

On Wed, 2010-06-23 at 13:04 -0400, twebb wrote:
> Without having a complete understanding of how the UBI and UBIFS
> internals work, I have a question regarding error handling in
> ubifs_scan().
> 
> When ubifs_scan() encounters SCANNED_EMPTY_SPACE during execution, it
> checks whether the LEB is all 0xFFs and if not - returns -EUCLEAN.

Yes, because it UBIFS always writes to LEBs from the beginning to the
end, node by node. Then, when power cut happens, it should have
something like

LEB: | good nodes | a broken node | 0xFFs |

this is what it checks. If it does not see 0xFFs, this is some unknow
situation for UBIFS and it prefers to refuse the flash.

In MLC case, you may have bit-flips. So you need to teach UBIFS to
accept 0xFFs + bitflips.

>   In
> some cases (for example, in orphan.c/kill_orphans()), any error
> returned by ubifs_scan() results in a call to ubifs_recover_leb().

I need to look closer, but looks like we just forgot to check the
need_recovery flag.

> Would it make sense and be acceptable to make this call any time
> ubifs_scan() returns an error? 

May be. I'll think and return to you.

>  And if so, would it make more sense to
> include the ubifs_recover_leb() call in ubifs_scan() at goto
> corruption?

Also need to think.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
