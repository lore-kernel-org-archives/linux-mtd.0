Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5voa-0008Kv-Uz
	for linux-mtd@lists.infradead.org; Sat, 02 Apr 2011 08:04:13 +0000
Received: by pvh11 with SMTP id 11so965283pvh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Apr 2011 01:04:10 -0700 (PDT)
Message-ID: <4D96D875.9000809@gmail.com>
Date: Sat, 02 Apr 2011 01:04:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] mtd: nand: renumber conflicting BBT flags
References: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
	<1301576306.2828.68.camel@localhost>
In-Reply-To: <1301576306.2828.68.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 3/31/2011 5:58 AM, Artem Bityutskiy wrote:
> Hmm, it seems that the issue is that flags which belong to the same
> "space" should be in a single file. AFAICS, we have 2 spaces:
> 
> 1. Chip flags
> 2. BBT flags
> 
> They are 2 different things. But some of the flags are shared. And this
> is quite subtle thing.
> 
> What I think we should do instead is to avoid sharing the same symbolic
> constant between 2 different spaces. Is this possible?

I'm not quite sure. Many of the "shared" options go into the
nand_chip.options field only so that they can later be copied to a
nand_bbt_descr.options field. I think this is only out of convenience so
that we can detect chip-based BBT options like 'scan 2nd page' before we
have actually allocated and assigned our bbt descriptors. For these
flags, we can use a new field in nand_chip, like a
"nand_chip.bbm_options". Then, many shared flags would really become
"early BBT flags" that could safely be copied over without conflict.

Does this make any sense or are there holes in my idea here? I can try
an RFC patch soon if that would help.

Thanks,
Brian
