Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcFlC-0000bT-2N
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 11:50:18 +0000
Received: by iwn35 with SMTP id 35so2278850iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 04:50:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Thu, 30 Jun 2011 14:51:08 +0300
In-Reply-To: <20110629114329.154aaef2@schlenkerla.am.freescale.net>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
	<1309225852-1664-2-git-send-email-b35362@freescale.com>
	<1309328529.23597.106.camel@sauron>
	<20110629114329.154aaef2@schlenkerla.am.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309434673.23597.176.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@ozlabs.org, b35362@freescale.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-29 at 11:43 -0500, Scott Wood wrote:
> On Wed, 29 Jun 2011 09:22:04 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Tue, 2011-06-28 at 09:50 +0800, b35362@freescale.com wrote:
> > > +	/* Hack for supporting the flash chip whose writesize is
> > > +	 * larger than 2K bytes.
> > > +	 */
> > 
> > Please, use proper kernel multi-line comments. Please, make sure
> > checkpatch.pl does not generate 13 errors with this patch.
> 
> Most of the checkpatch complaints are about existing style in the file --
> particularly, the use of tabs only for indentation, with spaces used for
> alignment beyond the indentation point.

OK, fair enough, but the multi-line comment is a valid complain,
although minor. And you guys could just fix the style issues as well in
a separate patch-set.

-- 
Best Regards,
Artem Bityutskiy
