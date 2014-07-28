Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBbHk-00087i-6W
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 03:07:38 +0000
Date: Mon, 28 Jul 2014 00:06:16 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Using UBIFS as an FTL
Message-ID: <20140728030616.GA1545@arch.cereza>
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
 <53D2EB45.9060302@huawei.com>
 <CAFLxGvxDFxtBzKutVUAaJyt54WC3R1qzKyko2cKSEyMGd832fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvxDFxtBzKutVUAaJyt54WC3R1qzKyko2cKSEyMGd832fA@mail.gmail.com>
Cc: Daniel Ehrenberg <dehrenberg@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 artem.bityutskiy@linux.intel.com, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 Jul 09:20 AM, Richard Weinberger wrote:
> On Sat, Jul 26, 2014 at 1:41 AM, hujianyang <hujianyang@huawei.com> wrote:
> > On 2014/7/26 2:21, Daniel Ehrenberg wrote:
> >> - loopback-mounting a file on ubifs--From skimming the code, it looks
> >> to me like ubifs uses some nice datastructures to handle writes within
> >> a file without doing read-modify-writes all the time as ubiblock
> >> forces. ubifs authors/maintainers, do you see any downside to using
> >> ubifs this way?
> >
> > This way seems most easily to realize. Synchronize the loop file and
> > maybe you will never worry about power cut.
> >
> > How about using UBI-layer and writing a new block driver to handle
> > bio? This driver should care about which leb on the flash has data
> > and other thing else(I don't have a clear idea now). The 'leb_change'
> > ops in UBI-layer maybe helpful for in-place update and atomic write.
> > But This way is harder than using a loop file.
> 
> Instead of adding another UBI block layer, please integrate such functionality
> in Ezequiel's UBI block.
> 

Daniel already mentioned it didn't git his needs. Quoting him:

"""
- ubiblock--the read-modify-write sounds unacceptable to me, even if
wear leveling and atomicity are handled.
- Some coworkers have suggested a new effort to build a new block
device, but that that's a huge project and takes a long time to get
right.
"""

Daniel: Maybe you can mention why you believe it's unacceptable?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
