Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ktn7-0007Rq-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 21:26:41 +0000
Date: Tue, 12 Mar 2002 22:38:01 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org, Robert Schwebel <robert@schwebel.de>
Subject: Re: [patch] dilnetpc.c broken?
Message-ID: <20020312223801.A7811@wohnheim.fh-wedel.de>
References: <20020311202323.A11507@wohnheim.fh-wedel.de> <200203121322.g2CDMLw14608@dagobert.svc.sysgo.de> <20020312155351.A10431@wohnheim.fh-wedel.de> <200203121503.g2CF3Ew17376@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200203121503.g2CF3Ew17376@dagobert.svc.sysgo.de>; from rob@sysgo.de on Tue, Mar 12, 2002 at 04:03:50PM +0100
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

On Tue, 12 March 2002 16:03:50 +0100, Robert Kaiser wrote:
> Hmm, then you must have a different version of partitions.h in
> /usr/src/linux/include/linux/mtd. Mine is from the MTD CVS
> (cvs up'ed this morning, but the #defines have been there
> for a long time, AFAIK):

That explains a bit. You just found a bug in my partitioning rewrite.
Many thanks!

Jörn

-- 
Highly skilled employees are always promoted to a level of
incompetency. They get promoted for doing a good job, until they
don't.
-- unknown
