Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvfVe-00020h-RP
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 12:38:48 -0500
Date: Mon, 31 Jan 2005 18:38:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050131173851.GL6694@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
	<Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
	<20050131172133.GJ6694@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501311722120.17207@phoenix.infradead.org>
	<1107192551.7567.31.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107192551.7567.31.camel@windu.rchland.ibm.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>, tglx@linutronix.de,
	David Woodhouse <dwmw2@infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 January 2005 11:29:11 -0600, Josh Boyer wrote:
> 
> Because they aren't just commonly used units.  See:
> 
> http://physics.nist.gov/cuu/Units/binary.html

Oh crud!  They also picked the capital K.  All right, standard is
close enough to common sense, who cares.

Below code accepts 'Ki' (standard) and 'ki' (analog to decimal k).  It
also chews the final 'B' if people want to pass it.  Changes are
untested.

And for the curious, the 'u' in ustrtoul stands for "unit".

static int ustrtoul(const char *cp, char **endp, unsigned int base)
{
        unsigned long result = simple_strtoul(cp, endp, base);

        switch (**endp) {
        case 'G':
                result *= 1024;
        case 'M':
                result *= 1024;
        case 'K':
        case 'k':
                result *= 1024;
        /* By dwmw2 editorial decree, "ki", "Mi" or "Gi" are to be used. */
                if ((*endp)[1] == 'i')
                        (*endp) += 2;
                if (**endp == 'B')
                        (*endp) += 1;
        }
        return result;
}


Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
