Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1dg-00068l-8P
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:05:04 +0000
Received: by lagu2 with SMTP id u2so769756lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:05:02 -0800 (PST)
Subject: Re: [PATCH v2] mtd/docg3: fixes and cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 01 Dec 2011 10:05:00 +0200
In-Reply-To: <1322604577-12309-1-git-send-email-robert.jarzmik@free.fr>
References: <1322604577-12309-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322726702.2332.9.camel@koala>
Mime-Version: 1.0
Cc: sfr@canb.auug.org.au, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-29 at 23:09 +0100, Robert Jarzmik wrote:
> This patch takes into account checkpatch, sparse and ECC
> comments.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Could you please send a patch which cleanly applies to l2-mtd-2.6.git -
this does not. This one does not apply both before and after Dan's
patch.

Artem.
