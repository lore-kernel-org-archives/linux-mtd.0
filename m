Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RciDD-0005Ti-KN
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 18:45:24 +0000
Received: by wera10 with SMTP id a10so1972687wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2011 10:45:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324133082.4240.29.camel@sauron.fi.intel.com>
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
 <1323725206.2297.24.camel@koala>
 <CAN8TOE9-4j0pC5Vocu4v9toczvKAyKnRtZ6AE3fjt7Fk8PaZ=g@mail.gmail.com>
 <1324133082.4240.29.camel@sauron.fi.intel.com>
Date: Mon, 19 Dec 2011 10:45:21 -0800
Message-ID: <CAN8TOE__Nq58ZRDwr15LcaXif582JLP+LhLsyv_5AYYA16XKUg@mail.gmail.com>
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
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

On Sat, Dec 17, 2011 at 6:44 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> OK, I've cut mtd-utils-1.4.9 bug-fix release, this time with my
> new script, so I hope nothing is forgotten.

Well, it seems like you didn't update the master branch; I had to `git
fetch --tags` to get to the v1.4.9 tag, which is ahead of master. I
don't know if that needs/requires an update to your release script to
ensure you don't miss it in the future?

Brian
