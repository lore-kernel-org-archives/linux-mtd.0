Received: from wsip68-15-115-9.ok.ok.cox.net ([68.15.115.9] helo=mail.forestsidingsupply.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170sO7-0000DB-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 00:10:55 +0100
Date: Thu, 25 Apr 2002 18:10:52 -0500
To: Murtada Shah <mshah@yottayotta.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: removing invalidate_device makes it boot /dev/mtdblock/0
Message-ID: <20020425181052.A17405@ns2.forestsidingsupply.com>
References: <3CC87F1F.2010407@yottayotta.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3CC87F1F.2010407@yottayotta.com>; from mshah@yottayotta.com on Thu, Apr 25, 2002 at 04:11:43PM -0600
From: mike@forestsidingsupply.com (Mike Mattice)
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Yes, it is.  I had that problem recently as well.  The e-mail
should be in the archives.

Mike

On Thu, Apr 25, 2002 at 04:11:43PM -0600, Murtada Shah wrote:
> I got past my last problem (last post by me today) by erasing 
> invalidate_device line in mtdblock_release
> 
> Is this OK? I'm using 2.4.18-rmk3
> 
> Murtada
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
