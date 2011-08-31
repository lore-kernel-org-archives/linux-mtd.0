Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QyfX2-0000s9-MK
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 07:48:21 +0000
Date: Wed, 31 Aug 2011 09:49:02 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110831074902.GA26382@logfs.org>
References: <20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
	<CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 August 2011 12:52:54 +0530, srimugunthan dhandapani wrote:
> On Wed, Aug 31, 2011 at 11:28 AM, Jörn Engel <joern@logfs.org> wrote:
> 
> > I can do.  Can you ensure you have my patch applied, rerun the rest
> > case and send me the kernel results?
> 
> I applied your patch1  and the bonnie output is the same(stuck at
> "Creating  files in sequential order ..."). The kernel is from your
> git directory(http://git.kernel.org/?p=linux/kernel/git/joern/logfs.git;a=summary)
> I am pretty sure i applied the patch. The git diff output is below[1]
> 
>  The kernel log is at
>  https://docs.google.com/leaf?id=0BycgLWCW61phNjY0ZDg4ZjUtYzAyMy00YTgwLWFlMmItNjlmZWIzMWFlNGUy&hl=en_US

600M.  And starting at line 34285 or about 0% in, the output mutates
to something like the below.  Not very useful. :(

Aug 31 12:28:06 mll kernel: [  991.561293] logfs_write_obj_alia 8,, 83,(3f(320(#2 #s #es sesaseiaslialilialilialialialialialialialialialialialialialilialialialilialialialililialialialilialialialilililialialialialialilialialiallialilialialialiaali_alj_abjo_ws_fsgfogflo lo] l4] 7581586156.561.591.9 9  [  >[7>[<7
Aug 31 12:28:06 mll kernel: <7
Aug 31 12:28:07 mll kernel: last message repeated 4 times
Aug 31 12:28:06 mll kernel: <
Aug 31 12:28:06 mll kernel: <7
Aug 31 12:28:06 mll kernel: <7
Aug 31 12:28:06 mll kernel: <
Aug 31 12:28:06 mll kernel: <
Aug 31 12:28:06 mll kernel: <7
Aug 31 12:28:06 mll kernel: <7
Aug 31 12:28:06 mll kernel: <

Can you set LOGFS_DEBUG to 0, both to cut down the noise and in the
hope that the log output doesn't get corrupted like this again?

> While i still have your attention, i would like to point out at max
> writepage size restriction in logfs. Currently logfs has a max
> writepage size as 4K. Currently, large page nand flashes and MLC nand
> come in  8K page sizes. As the usecase for logfs is large nand
> flashes(mostly with parallel and DMA write capabilities),  it may be
> essential to remove the 4K write page size restriction.
> I was only able to change the logfs-tools for >4K writepage size. If
> you send a patch, that makes logfs useable for writepagesize >4K, i
> can try on real hardware, instead of nandsim and give you the results
> :-)

That sure sounds useful.  I'll have a look...

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
