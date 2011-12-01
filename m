Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1g7-0006TM-H1
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:07:36 +0000
Received: by lagu2 with SMTP id u2so770586lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:07:34 -0800 (PST)
Subject: Re: [PATCH] Documentation: add sysfs entries for mtd docg3 chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 01 Dec 2011 10:07:29 +0200
In-Reply-To: <1322604995-7419-1-git-send-email-robert.jarzmik@free.fr>
References: <1322604995-7419-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322726852.2332.10.camel@koala>
Mime-Version: 1.0
Cc: greg@kroah.com, linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-29 at 23:16 +0100, Robert Jarzmik wrote:
> Add documentation for MSystems disk-on-chip docg3 chips
> sysfs entries, which enable and disable protection areas,
> giving or disabling access to the chip's memory.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Pushed to l2-mtd-2.6.git, thanks!

Artem.
