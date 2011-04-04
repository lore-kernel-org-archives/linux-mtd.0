Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6ecP-0008La-RR
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 07:54:38 +0000
Received: by eyh6 with SMTP id 6so1710122eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 00:54:36 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: renumber conflicting BBT flags
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <4D96D875.9000809@gmail.com>
References: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
	<1301576306.2828.68.camel@localhost>  <4D96D875.9000809@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:52:06 +0300
Message-ID: <1301903526.2760.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-04-02 at 01:04 -0700, Brian Norris wrote:
> Hello,
> 
> On 3/31/2011 5:58 AM, Artem Bityutskiy wrote:
> > Hmm, it seems that the issue is that flags which belong to the same
> > "space" should be in a single file. AFAICS, we have 2 spaces:
> > 
> > 1. Chip flags
> > 2. BBT flags
> > 
> > They are 2 different things. But some of the flags are shared. And this
> > is quite subtle thing.
> > 
> > What I think we should do instead is to avoid sharing the same symbolic
> > constant between 2 different spaces. Is this possible?
> 
> I'm not quite sure. Many of the "shared" options go into the
> nand_chip.options field only so that they can later be copied to a
> nand_bbt_descr.options field. I think this is only out of convenience so
> that we can detect chip-based BBT options like 'scan 2nd page' before we
> have actually allocated and assigned our bbt descriptors. For these
> flags, we can use a new field in nand_chip, like a
> "nand_chip.bbm_options". Then, many shared flags would really become
> "early BBT flags" that could safely be copied over without conflict.

I think it might even be better to kill the options field and instead
introduce bit-fields like:

unsigned int bbt_scan_byte_1and6:1
unsigned int bbt_scan_2nd_page:1
... and so on for all possible flags ...

And of course put sensible comments.

The only caveat is that this is a bit error-prone because users of these
bit-fields may mistakenly decide they are atomic and have nasty race
condition when changing them simultaneously from different threads. But
it does not look like this is of our concern in MTD case.

What do you think?

> Does this make any sense or are there holes in my idea here? I can try
> an RFC patch soon if that would help.

Yes, that makes sense for me for sure. Please, send the patch!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
