Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Va14w-0006Ma-VV
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2013 10:26:47 +0000
Received: by mail-we0-f182.google.com with SMTP id t61so4907166wes.27
 for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2013 03:26:23 -0700 (PDT)
Message-ID: <1382783181.5901.26.camel@karhu.quadriga.com>
Subject: Re: [PATCH] mtd-utils: Makefile: add LDFLAGS_mkfs.ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Sat, 26 Oct 2013 11:26:21 +0100
In-Reply-To: <a8879fac-dd29-4ed5-8977-89aec49473f2@zimbra>
References: <a8879fac-dd29-4ed5-8977-89aec49473f2@zimbra>
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

On Fri, 2013-09-27 at 11:34 -0500, Aaron Sierra wrote:
> The build rule for mkfs.ubifs was missing an LDFLAGS_* variable like
> mkfs.jffs2 had. This prevented mkfs.ubifs from being built against
> explicit external libraries which is needed when cross-compiling.
> 
> This also adds UUIDCPPFLAGS and UUIDLDFLAGS variables to support the
> mkfs.ubifs build.
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Looks good, pushed to mtd-utils.git, thank you!

-- 
Best Regards,
Artem Bityutskiy
