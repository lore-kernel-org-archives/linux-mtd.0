Received: from lana.hrz.tu-chemnitz.de ([134.109.132.3])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1gxY-0002ua-M6
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 07:05:51 -0400
Message-ID: <467BAD3C.8060707@informatik.tu-chemnitz.de>
Date: Fri, 22 Jun 2007 13:06:36 +0200
From: =?ISO-8859-15?Q?Martin_D=E4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
MIME-Version: 1.0
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: Real-time flash simulator
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
	<467B952E.30308@informatik.tu-chemnitz.de>
	<20070622093945.GC17988@lazybastard.org>
	<467BA051.50202@informatik.tu-chemnitz.de>
	<20070622102444.GD17988@lazybastard.org>
In-Reply-To: <20070622102444.GD17988@lazybastard.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-15?Q?Martin_D=E4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jörn,

On Fri, 22 June 2007 12:24 +0200, Jörn Engel wrote:
> 
> I guess the first thing you need to do is define what real-time actually
> means.  In particular you need to define the following:
> 
> [...]
> 
> Once you have this, it is possible to determine whether some storage
> stack (filesystem, middle layers, hardware) can fulfill your
> requirements, or how it would need to be changed to do so.
> 
> Alternatively you can go the other way and take a given storage stack,
> trying to determine the characteristics of it.

that is what I do at the moment. The resulting flash file system should
have low-fluctuating latencies. Of course, the overall performance
should not be that bad (it has to be scaleable as well). But it seems I
have to write a real-time capable flash simulator at first ;).

Thank you for your help!


Regards,

Martin
