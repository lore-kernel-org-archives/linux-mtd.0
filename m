Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqFsw-0006qQ-2K
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 01:43:38 +0000
Received: by pwj3 with SMTP id 3so2805947pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 18:43:36 -0700 (PDT)
Message-ID: <4C7C5E43.3070409@gmail.com>
Date: Mon, 30 Aug 2010 18:43:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: NAND flash data table
References: <4C75FF39.9010709@gmail.com>	
	<1282802549.24044.267.camel@localhost>
	<1283171651.12995.58.camel@brekeke>
In-Reply-To: <1283171651.12995.58.camel@brekeke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/30/2010 5:34 AM, Artem Bityutskiy wrote:
> If you cannot do this, let me know, I'll try to adapt this to the mtd
> web site - this piece of information is very useful.

Sorry, I worked on the table last week, got a decent patch, and meant to
tidy it up a bit. I will send a reasonably acceptable patch following
this e-mail.

> Also, I please, take a look at my l2 tree - I think I picked up or
> commented on all your patches, but there were many and I could miss
> some. Please, let me know if something is missing.

I think you've got everything in your l2 master or dunno, except the new
ONFI, >= 4KiB page Micron patch, which was a bit ugly. As recommended,
I'll do a resend of that on top of ONFI.
