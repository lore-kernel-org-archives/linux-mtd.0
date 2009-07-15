Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRA8e-0003ak-AW
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 19:27:40 +0000
Subject: Re: open command fails in UBIFS when pass O_DIRECT Flag
From: "Jon Fraser" <jfraser@broadcom.com>
To: "Adrian Hunter" <adrian.hunter@nokia.com>
In-Reply-To: <4A5D8DE5.2070900@nokia.com>
References: <9bde694e0907140725t66f5361dlc10c511081462eb2@mail.gmail.com>
	<4A5D8DE5.2070900@nokia.com>
Date: Wed, 15 Jul 2009 15:27:23 -0400
Message-ID: <1247686043.26784.99.camel@chaos.ne.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: jfraser@broadcom.com,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	naveen yadav <yad.naveen@gmail.com>
Reply-To: jfraser@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is this planned for the future?
Is there any technical reason that prevents implementing direct IO?

Jon Fraser
Broadcom

On Wed, 2009-07-15 at 01:05 -0700, Adrian Hunter wrote:
> naveen yadav wrote:
> > I am using UBIFS file system, and i am able to read/write.
> > But when i use O_DIRECT flag it fails in open command. will you pls
> > let me know is it issue with UBIFS.
> 
> UBIFS does not support direct I/O, sorry.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
