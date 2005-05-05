Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTeBL-0000nG-Go
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 07:06:16 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: kylo@kylo.net
In-Reply-To: <61cc712d050504183852868c04@mail.gmail.com>
References: <61cc712d050504183852868c04@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 05 May 2005 15:05:43 +0400
Message-Id: <1115291143.8559.16.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: smallest jffs2 file system possible
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-05-04 at 18:38 -0700, Kylo Ginsberg wrote:
> Empirically I've determined that this minimum size is effectively 5 *
> N, where N is the physical erase block size of the underlying flash
> part.  Is this correct?  Are there any workaround or patches to enable
> building a smaller file system?  Is a different f/s recommended for
> such an application (must be r/w, don't care about compression
> particularly).
> 
JFFS2 always reserves several blocks for GC. So I doubt you can create
smaller FS without hacking.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
