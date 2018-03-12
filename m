Received: from smtprelay0246.hostedemail.com ([216.40.44.246]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1evRD3-0002Oo-Oo
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 17:26:07 +0000
Message-ID: <1520875536.2049.11.camel@perches.com>
Subject: Re: [PATCH] mtd: chips: Replace printk() with pr_*() and define
 pr_fmt()
From: Joe Perches <joe@perches.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>, dwmw2@infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>,  linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Mar 2018 10:25:36 -0700
In-Reply-To: <20180312170208.GA10604@seema-Inspiron-15-3567>
References: <20180312170208.GA10604@seema-Inspiron-15-3567>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-03-12 at 22:32 +0530, Arushi Singhal wrote:
> Using pr_<loglevel>() is more concise than printk(KERN_<LOGLEVEL>).
> This patch:
> * Replace printks having a log level with the appropriate pr_*() macros.
> * Define pr_fmt() to include relevant name.
> * Remove redundant prefixes from pr_*() calls.
> * Indent the code where possible.

Hello Arushi.

When you do these, please remember to remove the unnecessary
and inconsistent uses of periods and to coalesce formats
where appropriate.

Also, there was _some_ logic here behind the use of the
"cfi_cmdset_0001:" prefix on only some of the error messages.

Perhaps the commit message should describe that change a bit
more fully.

Lastly, please run checkpatch on your proposed patches.

$ ./scripts/checkpatch.pl --terse patch.mbox
patch.mbox:151: ERROR: space prohibited before that close parenthesis ')'
patch.mbox:160: ERROR: space prohibited before that close parenthesis ')'
patch.mbox:183: WARNING: line over 80 characters
patch.mbox:201: WARNING: line over 80 characters
patch.mbox:211: ERROR: space required after that ',' (ctx:VxV)
patch.mbox:253: WARNING: quoted string split across lines
patch.mbox:273: WARNING: line over 80 characters
patch.mbox:273: WARNING: Prefer using '"%s...", __func__' to using 'put_chip', this function's name, in a string
patch.mbox:282: WARNING: line over 80 characters
patch.mbox:304: WARNING: line over 80 characters
patch.mbox:313: WARNING: line over 80 characters
patch.mbox:346: WARNING: line over 80 characters
patch.mbox:364: WARNING: line over 80 characters
patch.mbox:376: WARNING: line over 80 characters
patch.mbox:383: WARNING: line over 80 characters
patch.mbox:456: WARNING: line over 80 characters
patch.mbox:465: WARNING: line over 80 characters
total: 3 errors, 14 warnings, 343 lines checked
