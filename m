Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NINbs-0007yM-G0
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 14:33:49 +0000
Subject: Re: UBIFS on Atmel Dataflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
In-Reply-To: <1260348786.19669.1231.camel@localhost>
References: <hfnn6u$ah1$1@ger.gmane.org>
	<1260348786.19669.1231.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 16:33:08 +0200
Message-Id: <1260369188.5408.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-09 at 10:53 +0200, Artem Bityutskiy wrote:
> > Any comments on this are highly appreciated.
> 
> Yeah, I need to make ubiformat nicely return error instead of dying.

Just pushed a fix. It should now gracefully refuse your flash, instead
of dying. Did not test, though.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
