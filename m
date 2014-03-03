Received: from mail-ie0-f169.google.com ([209.85.223.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKaBa-0005eK-8j
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 21:14:06 +0000
Received: by mail-ie0-f169.google.com with SMTP id to1so503224ieb.14
 for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2014 13:13:39 -0800 (PST)
Date: Mon, 3 Mar 2014 15:13:36 -0600
From: Andrew Ruder <andy@aeruder.net>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: What is wrong?
Message-ID: <20140303211336.GA7369@gmail.com>
References: <4315632.KkRm7kzq26@leonp.plris.com>
 <20140227011148.GI4194@ld-irv-0074>
 <1553411.O1igofskp7@leonp.plris.com>
 <20140227212208.GG13420@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140227212208.GG13420@norris-Latitude-E6410>
Cc: Leon Pollak <leonp@plris.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 27, 2014 at 01:22:08PM -0800, Brian Norris wrote:
> Perhaps Richard or Andrew can comment on whether this patch should help
> you. But I think JFFS2 on NAND uses write-buffered support which can be
> affected by this bug.

Definitely sounds like the same issue and I'm kind of glad to see it
crop up in another filesystem.  Also glad you Cc'd me with the URL
because I had the painful task of recreating this issue on another
filesystem on my TODO list as I didn't think it had ever been committed.

Cheers,
Andy
