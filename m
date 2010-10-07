Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3t2p-0006Sx-6P
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 16:10:12 +0000
Received: by gwj21 with SMTP id 21so5696gwj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 09:10:06 -0700 (PDT)
MIME-Version: 1.0
Sender: dsd.olpc@gmail.com
In-Reply-To: <OFB9367F81.DD135AF9-ONC12577B5.00550D41-C12577B5.00557990@transmode.se>
References: <20101006210036.92C229D401B@zog.reactivated.net>
	<OFB9367F81.DD135AF9-ONC12577B5.00550D41-C12577B5.00557990@transmode.se>
Date: Thu, 7 Oct 2010 17:09:59 +0100
Message-ID: <AANLkTikGL87-J-EbRiStmRaVN=g-rH7XL6SNB0zYwuaQ@mail.gmail.com>
Subject: Re: [doesn't work] JFFS2: Dynamically choose inocache hash size
From: Daniel Drake <dsd@laptop.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7 October 2010 16:33, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> Does #define INOCACHE_HASHSIZE <something bigger> work?

Yes. Tested for years as value 1024 in OLPC builds.

> if so I would guess something is using inocache_hashsize before
> it is initialized.

Me too. But it's initialized early, at the same time as inocache_list.
And all users of inocache_hashsize use the list at the same time. So
if that were as obvious as it sounds, we'd be seeing bigger problems.

Thanks for your input!
Daniel
