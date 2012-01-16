Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmilV-0007tp-J7
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 09:22:10 +0000
From: Oliver Neukum <oneukum@suse.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] PM / MTD: Fix regressions related to mtd_suspend()
Date: Mon, 16 Jan 2012 10:23:45 +0100
References: <201201151443.30897.rjw@sisk.pl> <201201160018.02305.rjw@sisk.pl>
 <1326705441.14299.10.camel@sauron.fi.intel.com>
In-Reply-To: <1326705441.14299.10.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201201161023.45321.oneukum@suse.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Linux PM list <linux-pm@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 16. Januar 2012, 10:17:21 schrieb Artem Bityutskiy:
> Thanks Rafael!
> 
> I've pushed this patch to l2-mtd-2.6.git (David, would you please merge
> it upstream?).

Does this need to go into stable?

	Regards
		Oliver
