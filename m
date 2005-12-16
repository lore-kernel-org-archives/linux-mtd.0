Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnErT-000555-8q
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 07:39:04 -0500
Message-ID: <43A2B522.7070402@gmail.com>
Date: Fri, 16 Dec 2005 13:37:54 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <20051216122331.GA801@angel.research.nokia.com>
In-Reply-To: <20051216122331.GA801@angel.research.nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: EBH with OneNAND doesn't work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The problem might be related to the free OOB bytes

It is.

1. OOB positions in struct nand_oobinfo are wrong in OneNAND driver.
2. flash_eraseall has to be fixed, there are also some OOB troubles
    when working on OneNAND.

Both issues are already fixed up by us; we got JFFS2 mounting and 
running on OneNAND. A colleague of mine will clean up the massacre we 
did in MTD OneNAND and provide a patch, hopefully on monday.

Regards,
Bernhard
