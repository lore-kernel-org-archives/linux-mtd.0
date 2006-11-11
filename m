Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GitaS-0003Af-92
	for linux-mtd@lists.infradead.org; Sat, 11 Nov 2006 09:12:07 -0500
Received: by ug-out-1314.google.com with SMTP id m2so744852uge
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Nov 2006 06:11:57 -0800 (PST)
Message-ID: <6d6a94c50611110611j2d1bce01p9e227e2ff5bc1bae@mail.gmail.com>
Date: Sat, 11 Nov 2006 22:11:56 +0800
From: Aubrey <aubreylee@gmail.com>
To: dedekind@infradead.org
Subject: Re: mount costs too long
In-Reply-To: <1163178941.3925.18.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
	<1163159781.19697.24.camel@crusty.rchland.ibm.com>
	<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
	<1163174898.3925.13.camel@sauron> <4554A592.5000308@ru.mvista.com>
	<1163176000.3925.15.camel@sauron> <4554AA07.5020204@ru.mvista.com>
	<1163178941.3925.18.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/11/06, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Fri, 2006-11-10 at 19:34 +0300, Vitaly Wool wrote:
> > B/c due to the MTD layer rework, there's no way now to use custom
> > oobinfo in yaffs.
> > Therefore, as yaffs1 presumes the SmartMedia OOB layout one can either
> > read/write raw OOB but that will most probably break the bad block
> > handling, or implement a small shim layer putting spare OOB area into
> > SmartMedia OOB layout or back. Any other way will result in
> > incompatibility with the older version of yaffs1.
>
> OK, as it was said that YAFFS1 becomes much slower, this means that it
> reads more data from OOB then if it were working with older kernel.
> Right? Why it reads more data?
>

Well, If I understand correctly, this should be a YAFFS issue. I got
the following explaination from YAFFS mailing list:
------------------
 Charles Manning to yaffs, me

On Saturday 11 November 2006 03:53, Vitaly Wool wrote:
> You'll have to do some code hacking to speed things up. I.e. you'll
> need to set up your OOB layout according to SmartMedia spec and then
> you'll be able to remove the translation shim in yaffs code.

It is important to understand this:

The mtd NAND driver is generic code that is parameterised by configuration
tables to make it flexible. This gives an (almost/often) out of the box
experience, and IMHO, is pretty slick code, but there's a cost associated
with the flexibility.

A custom driver can be a lot faster, but then it won't be generic any more.

Most people who want fast NAND speed end up writing their own custom drivers
to maximise ransfer with their hardware.
---------------------

I think I need more time to read source code to understand this. Did
anyone enable yaffs on small page NAND chip on the kernel >= 2.6.18?

-Aubrey
