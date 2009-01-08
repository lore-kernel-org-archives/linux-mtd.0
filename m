Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=vm-dmz.priv.inaccessnetworks.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKwwv-0007LI-1l
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 15:37:34 +0000
Message-ID: <49661DA5.2020606@inaccessnetworks.com>
Date: Thu, 08 Jan 2009 17:37:09 +0200
From: Kostas Nakos <knakos@inaccessnetworks.com>
MIME-Version: 1.0
To: Sean MacLennan <smaclennan@pikatech.com>
Subject: Re: [PATCH] ndfc driver
References: <4950D8EA.7010905@inaccessnetworks.com>	<20081223170040.4e58de3f@lappy.seanm.ca>	<4958AD4E.8090608@inaccessnetworks.com>	<20090105202340.7fd0f8c1@lappy.seanm.ca>	<49647B16.50006@inaccessnetworks.com>
	<20090107122147.2a29a657@lappy.seanm.ca>
In-Reply-To: <20090107122147.2a29a657@lappy.seanm.ca>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Sean MacLennan wrote:
> The ndfc entry must be a child of the ebc entry. So move the ndfc into
> the ebc entry, and change the reg back to <0 0 2000>. It should then
> work.

OK, I tried that. I had the same crashes, unless I reverted to my hacks 
and also set the address to 0xd0000000. So, exactly the same behavior. 
Note also that the dts in use has been derived from a sequoia-based dev 
board setup, back in 2.6.26. Let me know if there's anything else you 
want me to try out.

Thanks for your efforts,
Kostas
