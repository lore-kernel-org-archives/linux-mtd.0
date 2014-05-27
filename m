Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpGUD-000724-OI
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:28:10 +0000
Message-ID: <1401193666.1304.134.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: add missing ui pointer in debugging code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Date: Tue, 27 May 2014 15:27:46 +0300
In-Reply-To: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
References: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2014-05-13 at 22:27 +0200, Daniel Golle wrote:
> If UBIFS_DEBUG is defined an additional assertion of the ui_lock
> spinlock in do_writepage cannot compile because the ui pointer has not
> been previously declared.
> 
> Fix this by declaring and initializing the ui pointer in case
> UBIFS_DEBUG is defined.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
