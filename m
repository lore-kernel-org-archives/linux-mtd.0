Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbKqx-0006K0-W4
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 12:05:01 -0400
Message-ID: <4295F3A4.70303@arcom.com>
Date: Thu, 26 May 2005 17:04:52 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <20050526152256.GS6681@pengutronix.de>
	<4295ED9E.6000508@arcom.com> <4295EE70.8000608@imc-berlin.de>
In-Reply-To: <4295EE70.8000608@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:
> David Vrabel wrote:
>> You can pad the JFFS2 image with the --pad option to mkfs.jffs2.
> 
> But isn't it padded with 0xFF only?
> 
> Or will it place the magic "1985 2003" as well?

Since I happened to have an image lying around I checked and it does
place the clean markers at the start of every erase zone.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
