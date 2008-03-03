Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWCJg-0007Kc-GV
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 15:11:00 +0000
Date: Mon, 3 Mar 2008 16:10:12 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080303151012.GB17732@lazybastard.org>
References: <20080223235742.GE2202@elf.ucw.cz>
	<fe810cf0802242348w625a7e7bj1a5476d6c79662@mail.gmail.com>
	<20080303121510.GD28369@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080303121510.GD28369@elf.ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 March 2008 13:15:11 +0100, Pavel Machek wrote:
> 
> Patch is here (I whitespace-damaged it, sorry], and I've seen no
> discussion.. should it just be applied?

There was discussion.  The patch is a pure band-aid.  It should not make
a difference at all, so clearly something is very wrong and we should
dig deeper to find the real problem.  So far noone has done it.

Jörn

-- 
All models are wrong. Some models are useful.
-- George Box
