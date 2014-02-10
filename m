Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCmSV-0003Nl-OL
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 08:43:20 +0000
Date: Mon, 10 Feb 2014 09:42:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210094246.659e876a@skate>
In-Reply-To: <20140208225149.GA22376@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Willy Tarreau,

On Sat, 8 Feb 2014 23:51:49 +0100, Willy Tarreau wrote:

> > I really vote for dropping write support at all.
> 
> Why ? When you put a read-only filesystem there such as squashfs, the
> only writes you'll have will be updates, and write support will be the
> only way to update the filesystem. So removing write support seriously
> impacts the usefulness of the feature itself.

Why can't you use ubi_updatevol to do the update of the squashfs image?
I.e instead of updating through the block layer, you update at the UBI
layer level. No?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
