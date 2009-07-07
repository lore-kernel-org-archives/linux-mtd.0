Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MODUN-0000Iv-Fo
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 16:26:09 +0000
Date: Tue, 7 Jul 2009 18:25:43 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [Patch] Support large devices for flash_eraseaal
Message-ID: <20090707162543.GB26579@logfs.org>
References: <20090707140337.GA24749@logfs.org>
	<20090707162231.GA26579@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20090707162231.GA26579@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 7 July 2009 18:22:32 +0200, Jörn Engel wrote:
> 
> +static int get_info(const char *devname, struct mtd_info_user64 *mtd64)
> +static int do_erase(int fd, struct erase_info_user64 *ei64, struct mtd_info_user64 *mtd64)

Thinking about it, these two functions probably ought to go into a
library of some sorts.  I just used flash_eraseall as a proof-of-concept
test program, so my interest in this area is exhausted.  But maybe
someone else feels young and energetic. :)

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
