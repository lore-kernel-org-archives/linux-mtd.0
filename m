Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKc6I-0004q9-Nc
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 17:21:51 +0000
Date: Wed, 7 Jan 2009 12:21:47 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Kostas Nakos" <knakos@inaccessnetworks.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20090107122147.2a29a657@lappy.seanm.ca>
In-Reply-To: <49647B16.50006@inaccessnetworks.com>
References: <4950D8EA.7010905@inaccessnetworks.com>
	<20081223170040.4e58de3f@lappy.seanm.ca>
	<4958AD4E.8090608@inaccessnetworks.com>
	<20090105202340.7fd0f8c1@lappy.seanm.ca>
	<49647B16.50006@inaccessnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 07 Jan 2009 11:51:18 +0200
"Kostas Nakos" <knakos@inaccessnetworks.com> wrote:

> Of course; attached. This is the one I use to boot the 2.6.28 kernel 
> (with the hackish ndfc patches). The only changes required while 
> migrating the entire dts from 2.6.26 to .28 concern just the ndfc
> block and particularly the parameter names according to the new
> scheme.

The ndfc entry must be a child of the ebc entry. So move the ndfc into
the ebc entry, and change the reg back to <0 0 2000>. It should then
work.

Cheers,
   Sean
