Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN4zX-00034W-WC
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 12:37:06 +0000
Subject: Re: Writing a ubinize'd image to fresh NANDFlash with a burner
From: Artem Bityutskiy <dedekind@infradead.org>
To: Pontus Hedman <pontushedman@navcast.com>
In-Reply-To: <1231872781.16881.47.camel@phedman.navcastinc.local>
References: <1231433726.16113.8.camel@phedman.navcastinc.local>
	<1231857915.5973.18.camel@localhost.localdomain>
	<1231872781.16881.47.camel@phedman.navcastinc.local>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Jan 2009 14:37:29 +0200
Message-Id: <1231936649.5973.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-01-13 at 13:53 -0500, Pontus Hedman wrote:
> I think all I have to do is insert 64 bytes of OOB data every 2048 bytes
> in that image to make it compliant.  So I guess I would make that OOB
> data be all 0xFFs so that the flash OOB parts are left alone?

Probably. You may easily add one more ubinize command line option which
would make it put OOB data to the output image, just like you
described. 

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
