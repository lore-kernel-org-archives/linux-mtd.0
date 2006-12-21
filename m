Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxPtp-0004s6-Gg
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 10:32:02 -0500
Date: Thu, 21 Dec 2006 17:30:48 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: Eraseblocks torture: OneNAND results
Message-ID: <20061221153048.GA16357@angel.research.nokia.com>
References: <24414989.16841166158970543.JavaMail.weblogic@ep_ml08>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24414989.16841166158970543.JavaMail.weblogic@ep_ml08>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin

I have tried your patch on an Omap 2420 base test board with OneNand
and it seems to work.

I had previously run an earlier version of torture test and had some
worn out erase blocks available. When I try to erase them I see often
controller error occuring and it is caught and returned correctly.

But I have also encounted cases where there is no erase error but yet
erase verify fails. I then tried a retry aften the failed verify and 
on the second read the erase block is blanj, all FF, as it should.

Jarkko Lavinen
