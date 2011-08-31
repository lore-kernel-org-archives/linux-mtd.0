Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QydoX-0007u7-JU
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 05:58:18 +0000
Date: Wed, 31 Aug 2011 07:58:54 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110831055854.GA12713@logfs.org>
References: <20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 August 2011 15:37:09 +0530, srimugunthan dhandapani wrote:
> 
> > Are you sure you have my patch applied?
> >
> 
> To clarify on the bugs I reported
> 1. bonnie test( bonnie  -s 20 -r 10) does not complete . It gets stuck
> at "Creating  files in sequential order ..."
> (tested with nandsim, kernel 3.0.1. and 2.6.38.8; consistently
> reproducible on 2 machines.)
> The free command show that, while the bonnie test was run for half an
> hour, free space changed from 2982340 KB to 2550156 KB.

The only trouble is that no amount of bonnie output helps me to nail
this one down.  What I need is the kernel output - more specificly the
output of the debug patch I sent you.  Lacking that, there is nothing
I can do.  Can you ensure you have my patch applied, rerun the rest
case and send me the kernel results?

Alternatively we can spend our time figuring out the differences
between your and my setup.  You could run a different kernel with
different patches applied, have a different .config or a different
machine - probably all three.  But my gut feeling is that it shouldn't
be too hard to fix the bug, provided you are able to run test patches
and return the results to me.

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
