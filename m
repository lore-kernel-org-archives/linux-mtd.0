Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IVv6-0004YH-8F
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 16:54:24 +0100
Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 19IU4T-00066l-00
	for linux-mtd@lists.infradead.org; Wed, 21 May 2003 14:55:58 +0100
Date: Wed, 21 May 2003 15:52:30 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030521135230.GA18635@wohnheim.fh-wedel.de>
References: <3C6BEE8B5E1BAC42905A93F13004E8AB01CAF732@mailse01.axis.se>
	<000a01c31f9f$ceb90940$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000a01c31f9f$ceb90940$1200a8c0@JOHNB>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: 'Jonas Holmberg' <jonas.holmberg@axis.com>
cc: 'David Woodhouse' <dwmw2@infradead.org>
Subject: Re: Mtd block access (jffs2 formatted) and mtd char
 access(unformatted) on different partitions of a single flashdevice
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2003 09:49:30 -0400, John Burch wrote:
> 
> As far as I know, the feature is unique to AMD though I don't know if it
> is supported across their entire product line.  Also, it is not a CFI
> specific feature.  For example, it's discussed in the 29LV008B (not a
> CFI compliant device) data sheet under the "Sector Erase Command
> Sequence" section.

Is there a way to know if a given chip supports this feature without
checking the chip id against a table?

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
