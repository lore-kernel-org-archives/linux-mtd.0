Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO47n-0000QL-LU
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 06:26:18 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren Sokolowsky <Oren_S3@VERIFONE.com>
In-Reply-To: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 09:25:26 +0300
Message-Id: <1246947926.20721.299.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-07-06 at 21:30 +0300, Oren Sokolowsky wrote:
> the ubi debug is enable aswell. I do not see anything special.
> Do i need to do anything else before  ubiattach except ubiformat ? 

Could you please send it to me anyway?

Could you please double check you have the latest mtd-utils?
Could you please provide the output of ubiformat --version ?

Also, could you please format your flash with the -v ubiformat
option. Do you see message like:
"ubiformat: write volume table to eraseblocks 0 and 1"?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
