Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UgwO4-0006wJ-8c
 for linux-mtd@lists.infradead.org; Mon, 27 May 2013 12:18:53 +0000
Date: Mon, 27 May 2013 14:18:28 +0200
From: Jan Kara <jack@suse.cz>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Subject: Re: UBIFS failure & stable page writes
Message-ID: <20130527121828.GA32625@quack.suse.cz>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
Cc: linux-mtd@lists.infradead.org, "jack@suse.cz" <jack@suse.cz>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  Dear Prins,

On Mon 27-05-13 13:17:42, Prins Anton (ST-CO/ENG1.1) wrote:
> We are doing experiments with file systems on NAND flashes and experience
> some problems with UBIFS.  If required; it recovers correct, but on a
> certain moment (at boot) it seems it cannot find its root node anymore
> (recovery succeeded)
> 
> While reading the logs on the kernel.org I came across your patch:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/fs/ubifs?id=182dcfd648aef0705fd04c42cbe507c09e00c25d
> 
> Do you have some information what you experience in case of failure? Is
> it possible to lose (consequent) a root-node because unstable page
> writes?
  No, stable page write work shouldn't have any impact on this. NAND flash
isn't the kind of storage that requires stable pages. I think it's the best
if you ask ubifs maintainers directly - I've CCed them. BTW, you didn't
mention which kernel version you are using.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
