Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE001.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXggk-0001iq-Ci
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 21:34:55 +0000
Date: Fri, 17 Jun 2011 16:34:42 -0500
From: Scott Wood <scottwood@freescale.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Subject: Re: NAND BBT corruption on MPC83xx
Message-ID: <20110617163442.204348a0@schlenkerla.am.freescale.net>
In-Reply-To: <BANLkTikyKObukzVw+c10HyDz+Q=PH4jozA@mail.gmail.com>
References: <BANLkTikyKObukzVw+c10HyDz+Q=PH4jozA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Jun 2011 16:54:27 -0400
"Matthew L. Creech" <mlcreech@gmail.com> wrote:

> Hi, I posted this on the Linux-MTD list but haven't gotten any hits.
> Since it looks like it could be MPC83xx-specific, I'm reposting here.
> Rick Johnson noted a problem in fsl_elbc_nand.c back in May which
> might be related:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-May/035372.html

It seems that the generic code always passes -1 with PAGEPROG, and only
provides the actual page address on SEQIN.

I don't think the ECC readback is needed, and the fact that it looks like
it has always been broken would seem to confirm that.  It's broken in
other ways, too -- it assumes a particular ECC layout.  Let's get rid of it.

As for the corruption, could it be degradation from repeated reads of that
one page?

> More info on this board:
> - MPC 8313 SoC
> - 1GB Samsung NAND flash (K9K8G08U0B)
> - Linux 2.6.31
> - U-Boot 2009.06

Hmm, 2.6.31... it's probably not related to this problem, but you
should cherry pick b3a70f0bc32d1b70584bcaa6019fa4260b0da92e and
476459a6cf46d20ec73d9b211f3894ced5f9871e.

-Scott
