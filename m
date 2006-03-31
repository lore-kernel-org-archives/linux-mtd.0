Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPFHi-0001P7-Ez
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:47:20 -0500
Date: Fri, 31 Mar 2006 10:47:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexander Belyakov <alexander.belyakov@intel.com>
Message-ID: <20060331084707.GB11367@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<20060330121156.GA31749@wohnheim.fh-wedel.de>
	<442CD1CB.7050509@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442CD1CB.7050509@intel.com>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 March 2006 10:52:59 +0400, Alexander Belyakov wrote:
> 
> >Your code suffers from a lot of very basic things that make it hard to
> >review.  
> 
> What exactly you wish to see here? Hope I can bring clarifications by 
> changing code/comments or via this mailing list.

To some degree, I leave it to you to take a look at your code and
improve it.  There is little point in me pointing out every detail.
In that case I could just write the code myself.

As a starting point, you should take a close look at
Dokumentation/CodingStyle and will notice that your code has a rather
different style.  Worse, your style is not even consistent within
itself.  People will be more inclined to take a closer look if the
code looks similar to what they would expect elsewhere.

Then there's the general rule to make code simple to read.  #ifdef is
a concept that makes code complicated.  Avoiding it where possible is
a good idea.  Having the #ifdef once in a header is better than having
it once in each source file including the header.  Having pretty much
anything once is better than having it in many places.

When you're done with this, please come back.  I'll take a closer look
then.

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
