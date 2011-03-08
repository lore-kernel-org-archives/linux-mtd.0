Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwwDK-00027c-2L
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 12:40:34 +0000
Received: by wwi17 with SMTP id 17so841309wwi.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 04:40:32 -0800 (PST)
Subject: Re: [PATCH/RFC v2 1/3] Shared BCH ECC library
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110308111548.GA6628@parrot.com>
References: <181c9a1c88b781116615761109cccdf89ea877a1.2296641159.git.ivan.djelic@parrot.com>
	<20110308111548.GA6628@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 14:39:05 +0200
Message-ID: <1299587945.2754.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-08 at 12:15 +0100, Ivan Djelic wrote:
> On Mon, Feb 07, 2011 at 02:09:30PM +0000, Ivan Djelic wrote:
> > Hello,
> > 
> > The first patch of this series contains a new generic BCH ECC library.
> 
> Hi,
> 
> It has been a month since this patch was posted, and I did not receive any
> comment/review yet.

I can add it to my l2 tree and may be dwmw2 can merge it then. But could
you please re-send a version with better Kconfig help messages?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
