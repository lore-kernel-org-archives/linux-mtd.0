Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=CH1EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbxre-0001PX-Dn
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 16:43:47 +0000
Date: Wed, 29 Jun 2011 11:43:29 -0500
From: Scott Wood <scottwood@freescale.com>
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
Message-ID: <20110629114329.154aaef2@schlenkerla.am.freescale.net>
In-Reply-To: <1309328529.23597.106.camel@sauron>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
	<1309225852-1664-2-git-send-email-b35362@freescale.com>
	<1309328529.23597.106.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, b35362@freescale.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 29 Jun 2011 09:22:04 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Tue, 2011-06-28 at 09:50 +0800, b35362@freescale.com wrote:
> > +	/* Hack for supporting the flash chip whose writesize is
> > +	 * larger than 2K bytes.
> > +	 */
> 
> Please, use proper kernel multi-line comments. Please, make sure
> checkpatch.pl does not generate 13 errors with this patch.

Most of the checkpatch complaints are about existing style in the file --
particularly, the use of tabs only for indentation, with spaces used for
alignment beyond the indentation point.

-Scott
