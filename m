Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QHNin-0003nC-8i
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 22:05:34 +0000
Date: Wed, 4 May 2011 00:03:42 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Cliff Brake <cliff.brake@gmail.com>
Subject: Re: JFFS2 loss of power expectations
Message-ID: <20110503220342.GA3862@parrot.com>
References: <BANLkTi=b6XGamVPAfuQZJo=sRQy286xh0g@mail.gmail.com>
	<1303457781.2757.26.camel@localhost>
	<BANLkTinscG0a3mOwvCwQOLKRNoabStkOYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BANLkTinscG0a3mOwvCwQOLKRNoabStkOYg@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 03, 2011 at 09:08:26PM +0100, Cliff Brake wrote:
> >> 2) any suggestions for debugging this?
> >
> > Some kind of device which may cut power is needed. Then you may write a
> > test program or script, cut power at random point, boot up, make sure
> > the FS look ok.
> 
> Yes, we have a programmable PS set up to cut power during boot, and we
> can reproduce JFFS2 file system corruption with a day or so of
> testing.  We are using a fairly old CPU board with a small SLC flash
> (128MB).
> 
> Now, the question is how do we prevent it?
> 
> We are looking into mounting the root file system in RO and sync
> modes, etc, but don't have test results yet.
> 
> So, just looking for general ideas how to improve this situation.

Hi Cliff,
Just a few debugging ideas that helped me a lot in the past:

1. Try to focus your random power cuts so that they happen precisely during a
nand write/erase operation; this will help reproduce bugs much faster.
Ideally you could try to use a hw timer or watchdog to trigger a software
reset with µs precision. 

2. Using instrumentation and targeted power cuts as described above, you
should be able to isolate the last interrupted nand operation that caused a
corruption: is it an interrupted page programming, or a partially erased block?

3. During reboot after a power cut, look for nand read failures. Are they
located as expected in the last page/block that was programmed/erased ? Or do
they appear in unrelated locations ? Or not appearing at all ?

4. If the above steps do not lead to an obvious explanation, they may still
provide you with a way to dump nand contents (before and after corruption) and
systematically reproduce the bug on a linux pc running nandsim. This makes
debugging much easier.

On the improvement side, I was going to suggest mounting as much as possible
as RO, but you mentioned that already.

Hope that helps,
Regards,

Ivan
