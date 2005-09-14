Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFWyZ-0005ly-UR
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 09:08:20 -0400
Date: Wed, 14 Sep 2005 15:06:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Marius Groeger <mgroeger@sysgo.com>
Message-ID: <20050914130657.GA26387@wohnheim.fh-wedel.de>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
	<20050913230631.GB29579@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
	<20050914092634.GB22847@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509141136040.12001@mag.sysgo.com>
	<20050914120309.GB25468@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509141426340.26040@mag.sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.63.0509141426340.26040@mag.sysgo.com>
Cc: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 September 2005 14:34:47 +0200, Marius Groeger wrote:
> On Wed, 14 Sep 2005, Jörn Engel wrote:
> 
> >"if your write it portable in the first place" sounds nice, but noone
> >really knows what that means, before the acid test happens.
> 
> I think this is a weak argument in this context. Sticking to the 
> standards should always be a prime directive for any programmer. 
> Moreover, /if/ I follow your argument: it's very unlikely something 
> happens to the semantics of (char*)buf + i, compared to the likelihood 
> of a future GCC discovering honour and making the extensions harder to 
> access.

Yeah, ok.  But then again, void* arithmetic is likely the single best
gcc extension.  We should spread this feature into more compilers and
into the next C standard instead of crippling ourselves.

Commercial companies with paying customers may have a different view
on this subject.  But since I don't receive a monthly cheque to worry
about such problems, please understand my ignorance. ;)

Jörn

-- 
You can take my soul, but not my lack of enthusiasm.
-- Wally
