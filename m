Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NAJNZ-0006E6-PT
	for linux-mtd@lists.infradead.org; Tue, 17 Nov 2009 08:25:42 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "N. van Bolhuis" <nvbolhuis@aimvalley.nl>
In-Reply-To: <4B012D0D.4080500@aimvalley.nl>
References: <4B012D0D.4080500@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Nov 2009 10:25:18 +0200
Message-Id: <1258446318.27437.60.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, joakim.tjernlund@transmode.se
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-16 at 11:44 +0100, N. van Bolhuis wrote:
> > The only way to help from UBI side I see is to lessen the UBI background
> > thread's priority - you could try this. Or for the background
> > formatting, have a 'yield()' call in the UBI background thread.
> > 
> > Or we could have a 'nor_erase_quirk()' in the UBI background thread,
> > which would call yield() if the previous operation was "erase", and the
> > next one is also "erase". You could try this.
> > 
> > Do you have any other suggestions?
> 
> No. Let's try the 'nor_erase_quirk()' solution.

Thinking about this more, I do not like using 'yield()'. JFFS2 had it in
the background thread, and there were many discussions about this, it
hurt one group of people, and helps another group. But it is hacky,
because depending on kernel version, 'yield()' may have different
effects. I do not like it.

Could you just try lowering the UBI bgt priority, and see if it helps?
I would not want to go for any yielding unless you report it does not
help.

Just renice the BGT and see what happens, and report back please.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
