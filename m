Received: from lana.hrz.tu-chemnitz.de ([134.109.132.3])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1fMq-0008V2-DQ
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 05:23:57 -0400
Message-ID: <467B952E.30308@informatik.tu-chemnitz.de>
Date: Fri, 22 Jun 2007 11:23:58 +0200
From: =?ISO-8859-15?Q?Martin_D=E4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: Real-time flash simulator
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
In-Reply-To: <1182499773.4403.76.camel@sauron>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Artem,

On Fri, 2007-06-22 at 10:09 +0200, Artem Bityutskiy wrote:
> I am not an expert in real-time, so I would ask you to elaborate on what
> particularly makes nandsim not real-time? What are your requirements?

The flash simulator has to simulate a raw flash memory with given
timings, size, etc. Nandsim performs the delays by busy waiting. The
question is if nandsim will meet this timings on every condition, e.g.
under heavy load. This includes write operations as well as read
operations. The simulator is just software but it has to be
deterministic like real raw flash.

This simulator should be a tool to examine the real time behaviour of
flash file systems.

>> Furthermore, there are some efforts to develop a (scaleable) real-time
>> capable flash file system?
> 
> We develop UBIFS (see MTD web site) but we do not set real-time
> requirements. You are welcome to collaborate.

The overall goal of my work is to develop respectively to examine the
feasibility of a scaleable flash file system on raw flash. Like
mentioned on the MTD web site this might be very difficult because
of wear-levelling and bad block management. In my opinion, for real-time
issues it is necessary to avoid garbage collection. So, a layer between
file system and raw flash, performing wear-levelling and bad block
management could be one approach to be investigated furhter. The
real-time flash simulator is just one step in this direction.


Regards,

Martin
