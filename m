Message-ID: <425AAEF2.3040903@netwinder.org>
Date: Mon, 11 Apr 2005 13:08:02 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@mindspring.com>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>	<f96d234e050411035522064e02@mail.gmail.com>
	<Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert P. J. Day wrote:

> i did a bit more reading last night and concluded that the PHYSMAP
> stuff would let me define a single flash chip but no more.  so if i
> want multiple chips, it *appears* that i have to write a maps file.

If the chips are of the same type, physmap.c will do what you want - 
just give it the total size of flash space.  Eg. if you have two 32M 
chips then give the size as 64M.  The MTD code is will probe and 
discover the two chips automatically.  Be sure you specify the 
interleave correctly too.

If the chips are of different types, then the more recent mphysmap.c is 
probably what you need.  (I haven't tried this one).

-R
