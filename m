Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bfd4t-00046A-Nl
	for linux-mtd@lists.infradead.org; Wed, 30 Jun 2004 07:16:36 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812DF@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E79351812DF@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1088594193.4636.205.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 30 Jun 2004 12:16:33 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: BBT question on DOC MIL Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-06-30 at 07:05 -0400, Carlos, John J USAATC wrote:
>  Looking at the current nand_bbt.c file looks like for other chips that
> each block contains it bbt. 

Do you mean each _chip_ contains its own BBT? I think we changed that so
that we can have a BBT which covers a whole cluster of chips. Thomas?

John, can you join us on IRC? It's much more productive that way (at
least when we're all present :)

-- 
dwmw2
