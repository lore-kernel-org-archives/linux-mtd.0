Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaDkJ-0000ta-A8
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 10:17:32 -0400
Date: Mon, 23 May 2005 16:17:26 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <4291D7D0.7010305@yandex.ru>
Message-ID: <Pine.LNX.4.61.0505231612510.1137@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230940590.25999@kukac.halom.u-szeged.hu>
	<1116846559.16577.18.camel@sauron.oktetlabs.ru>
	<4291D7D0.7010305@yandex.ru>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][03/03] nandsim own geometry
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 23 May 2005, Artem B. Bityuckiy wrote:

>
> Or better try to make it such a way, that it doesn't affect nand_base or 
> nand_ids, even if it will be not very pretty. Otherwise tglx1 may veto this.
>

OK, but what if somebody wants to add support for an unsupported chip? He has to 
modify nand_ids.c, too. AFAIK there is no other way to specify a chip's size. 
It's a litte trouble that all the data is stored statically in a table. It 
should be expandable somehow dinamically, from modules. I see what can I do.

Bye,

   Patrik Kluba
