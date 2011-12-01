Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1VX-0005Ik-OT
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 07:56:40 +0000
Received: by mail-lpp01m010-f49.google.com with SMTP id u2so766814lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2011 23:56:39 -0800 (PST)
Subject: Re: [PATCH] nandtest: use seed argument
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Date: Thu, 01 Dec 2011 09:56:37 +0200
In-Reply-To: <1322132254-5830-1-git-send-email-j.weitzel@phytec.de>
References: <1322132254-5830-1-git-send-email-j.weitzel@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322726198.2332.5.camel@koala>
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

On Thu, 2011-11-24 at 11:57 +0100, Jan Weitzel wrote:
> if a seed is provided it is actually not used. First call is
> "seed = rand()" killing the given seed.
> 
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>

Pushed to mtd-utils.git, thanks!

Artem.
