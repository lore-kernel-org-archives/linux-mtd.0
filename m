Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RR9by-0007WZ-7U
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 21:35:11 +0000
Received: by mail-bw0-f49.google.com with SMTP id t2so3397057bka.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 13:35:09 -0800 (PST)
Subject: Re: [PATCH] mtd: mtd_blkdevs: don't increase 'open' count on error
 path
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 17 Nov 2011 23:35:06 +0200
In-Reply-To: <1320709865-21903-1-git-send-email-computersforpeace@gmail.com>
References: <1320709865-21903-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321565708.2272.11.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-11-07 at 15:51 -0800, Brian Norris wrote:
> Some error paths in mtd_blkdevs were fixed in the following commit:
> 
>     commit 94735ec4044a6d318b83ad3c5794e931ed168d10
>     mtd: mtd_blkdevs: fix error path in blktrans_open
> 
> But on these error paths, the block device's `dev->open' count is
> already incremented before we check for errors. This meant that, while
> the error path was handled correctly on the first time through
> blktrans_open(), the device is erroneously considered already open on
> the second time through.

Pushed to l2-mtd-2.6.git, thanks!

Artem.
