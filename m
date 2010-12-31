Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PYXEh-0000fx-1Z
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2010 05:09:08 +0000
Received: by wyf22 with SMTP id 22so11448146wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Dec 2010 21:09:04 -0800 (PST)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1293765366-27147-1-git-send-email-thomas@wytron.com.tw>
References: <4D1C3565.1030800@wytron.com.tw>
	<1293765366-27147-1-git-send-email-thomas@wytron.com.tw>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 31 Dec 2010 00:08:44 -0500
Message-ID: <AANLkTinuOGP7=97UOq5eRe+FxNq3zwKnQQUdCaLT_OqC@mail.gmail.com>
Subject: Re: [PATCH] mkfs.jffs2: fix devtable count as mkfs.ubifs does
To: Thomas Chou <thomas@wytron.com.tw>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 30, 2010 at 22:16, Thomas Chou wrote:
> The counting was incorrect. Follow that of mkfs.ubifs.

hmm, sounds like we should rip the stuff out of both and put into
lib/devtable.c.  feel up to the challenge ?
-mike
