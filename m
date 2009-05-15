Subject: Re: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by
	Numonyx
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <49FFF86F.2070402@nokia.com>
References: <49FFF86F.2070402@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 16:37:17 +0300
Message-Id: <1242394637.27996.246.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-05 at 11:27 +0300, Adrian Hunter wrote:
> >From e400da3456896505edbf7c39a14668c2c718ace4 Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Tue, 5 May 2009 11:04:19 +0300
> Subject: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by Numonyx
> 
> In addition to adding the Numonyx manufacturer code, this patch
> also ensures 'sync. write' is disabled when reading identification
> data - something that the Numonyx chip objects to, but the
> Samsung chip seems to ignore.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>

Pushed this to l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
