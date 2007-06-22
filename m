Received: from john.hrz.tu-chemnitz.de ([134.109.132.2])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1g6Y-0001D4-KT
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 06:11:05 -0400
Message-ID: <467BA051.50202@informatik.tu-chemnitz.de>
Date: Fri, 22 Jun 2007 12:11:29 +0200
From: =?ISO-8859-15?Q?Martin_D=E4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
MIME-Version: 1.0
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: Real-time flash simulator
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
	<467B952E.30308@informatik.tu-chemnitz.de>
	<20070622093945.GC17988@lazybastard.org>
In-Reply-To: <20070622093945.GC17988@lazybastard.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, martin.daeumler@s2003.tu-chemnitz.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jörn,

On Fri, 22 June 2007 11:39 +0200, Jörn Engel wrote:
>> In my opinion, for real-time
>> issues it is necessary to avoid garbage collection. So, a layer between
>> file system and raw flash, performing wear-levelling and bad block
>> management could be one approach to be investigated furhter. The
>> real-time flash simulator is just one step in this direction.
> 
> What makes the "layer between file system and raw flash" so special, if
> you don't mind me asking?  If wear-leveling and bad block management
> causes latency, that latency does not go away by moving it to some other
> layers.

that is right! The idea is to use a (not specified) file system which 
performs in-place updates on top of this layer. This layer should map
logical to physical erase units. So, wear-levelling possibly could be
used to "displace" garbage collection. The goal is to decrase latency
and above all make it more deterministic.

But please note that is just one theoretical idea to make a flash file
system real-time capable. Indeed, other approaches and file systems like
LogFS has to be investigated further for this purpose too.

It seems the development of a real-time flash file system is still in
the fledgling stages, hence I asked here for a flash simulator to make
work easier.


Regards,

Martin
