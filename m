Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RetAi-0008JK-5a
 for linux-mtd@lists.infradead.org; Sun, 25 Dec 2011 18:51:48 +0000
Received: by lahc1 with SMTP id c1so8621008lah.36
 for <linux-mtd@lists.infradead.org>; Sun, 25 Dec 2011 10:51:42 -0800 (PST)
Subject: Re: [PATCH 00/28] introduce wrappers for mtd interfaces
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Sun, 25 Dec 2011 20:51:40 +0200
In-Reply-To: <4EF7383C.6010003@newsguy.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
 <4EF7383C.6010003@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324839101.2054.2.camel@koala>
Mime-Version: 1.0
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

On Sun, 2011-12-25 at 06:50 -0800, Mike Dunn wrote:
> And a merry Christmas to you too, Artem :)

Thanks, merry Christmas.

> I guess the plan is to eventually move the wrappers out of the header file and
> no longer declare them inline?

Those which contain some code - sure.
