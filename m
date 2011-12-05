Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXS5E-0007yz-Qj
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:31:25 +0000
Received: by laai10 with SMTP id i10so1298488laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:31:23 -0800 (PST)
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 05 Dec 2011 08:31:19 +0200
In-Reply-To: <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1323066682.2316.18.camel@koala>
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

On Fri, 2011-12-02 at 20:00 +0100, Robert Jarzmik wrote:
> This patch takes into account checkpatch, sparse and ECC
> comments.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Pushed to l2-mtd-2.6.git, thanks. But I still see this warning when
I compile on x86_64:

drivers/mtd/devices/docg3.c:1050:12: warning: ‘doc_get_erase_count’ defined but not used [-Wunused-function]

Artem.
