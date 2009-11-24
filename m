Received: from smtp-vbr16.xs4all.nl ([194.109.24.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCx43-0000x9-2w
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 15:12:30 +0000
Message-ID: <4B0BF7CE.3040106@aimvalley.nl>
Date: Tue, 24 Nov 2009 16:12:14 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] enable erase-suspend-program for CFI cmdset_0002
References: <200911191101.nAJB1wwH000784@linpc062.aimsys.nl>
	<1259073406.29118.17.camel@localhost>
In-Reply-To: <1259073406.29118.17.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	Nicolas Pitre <nico@fluxnic.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

> I did not follow the patch conversation too closely - but should you be
> the patch author or Joakim? If you took it as it is - then it is Joakim.
> If you modified it, then at least Joakim's name should be in the commit
> log.
> 

I also removed the "printk(ERR_NOTICE ...", so I guess I modified it.

you want me to re-submit the patch with CC or Acked-by Joakim ?
