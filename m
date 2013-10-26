Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Va0wj-0006D4-0y
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2013 10:18:17 +0000
Received: by mail-wg0-f43.google.com with SMTP id b13so4841956wgh.10
 for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2013 03:17:54 -0700 (PDT)
Message-ID: <1382782672.5901.25.camel@karhu.quadriga.com>
Subject: Re: Patching mkfs.ubifs.c for running under Windows ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: gutemine <gutemine@oozoon.de>
Date: Sat, 26 Oct 2013 11:17:52 +0100
In-Reply-To: <7c74c0d714e8e87daebbfd0163642d71@localhost>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
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

On Sat, 2013-09-21 at 12:58 +0200, gutemine wrote:
> As users of ubidump under Windows now asked me for getting also the
> possibility to re-pack their extracted ubifs images, I'm considering to
> patch mkfs.ubifs.c, so that it handles also the Windows hard and softlinks
> and my dummy device files correctly.

Generally, I am OK with making the code support windows, why not? But
this should be done very nicely and should not be intrusive. I guess you
should send patches and then we'll see.

-- 
Best Regards,
Artem Bityutskiy
