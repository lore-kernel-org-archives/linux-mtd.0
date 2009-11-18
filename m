Received: from smtp-vbr3.xs4all.nl ([194.109.24.23])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NAgnx-0007LI-Cw
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 09:26:29 +0000
Message-ID: <4B03BDBD.3040409@aimvalley.nl>
Date: Wed, 18 Nov 2009 10:26:21 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: dedekind1@gmail.com, joakim.tjernlund@transmode.se
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
References: <4B012D0D.4080500@aimvalley.nl>	
	<1258446318.27437.60.camel@localhost>
	<4B02CE86.5000908@aimvalley.nl>
	<1258532918.27437.126.camel@localhost>
In-Reply-To: <1258532918.27437.126.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

> 
> The best way to say thanks is:
> 
> 1. Add a small documentation section about your case to UBIFS howto, so
> others could benefit. You could send a patch against the MTD web-site:
> http://git.infradead.org/mtd-www.git
> 

Ok, I'll do this.

> 2. Make your solution work in upstream out-of-the box.
> 

The solution is to enable erase-suspend for writing for which
Joakim already sent earlier patches.
So if it's OK with him I will send the patch for cmdset_0002.

thanks,
Norbert.
