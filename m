Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qylb2-0000A8-J7
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 14:16:53 +0000
Date: Wed, 31 Aug 2011 16:17:31 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110831141731.GA29862@logfs.org>
References: <20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
	<CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
	<20110831074902.GA26382@logfs.org>
	<CAMjNe_csYHWCRFXt6sW1FpMaS_RFGLM6z1ML6_-3xb-5x7DZtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_csYHWCRFXt6sW1FpMaS_RFGLM6z1ML6_-3xb-5x7DZtg@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 August 2011 18:19:30 +0530, srimugunthan dhandapani wrote:
> On Wed, Aug 31, 2011 at 1:19 PM, Jörn Engel <joern@logfs.org> wrote:
> 
> > Can you set LOGFS_DEBUG to 0, both to cut down the noise and in the
> > hope that the log output doesn't get corrupted like this again?
> 
> It doesn't crash, so nothing much is printed in kern.log if LOGFS_DEBUG=0.

Ok.  So for those of us who are a bit slow (me), you say that you
cannot reproduce the bug with LOGFS_DEBUG=0.  In order to reproduce
it, you have to set LOGFS_DEBUG=LOGFS_DEBUG_ALL or some such.  Is that
right?

> I produced the log with LOGFS_DEBUG=0xDFF, (without LOGFS_DEBUG_ALIASES)
> Its a 60MB log file "kern_LOGFS_DEBUG=0xDFF.log" shared in the following link:
> 
> https://docs.google.com/leaf?id=0BycgLWCW61phNjY0ZDg4ZjUtYzAyMy00YTgwLWFlMmItNjlmZWIzMWFlNGUy&hl=en_US

LOGFS_DEBUG=0xDFF is equivalent to LOGFS_DEBUG=LOGFS_DEBUG_ALL - the
unset bits aren't used anyway.  Which leaves me utterly confused.
Were you unable to reproduce, but you sent me the log anyway?

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
