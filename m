Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjDid-0004KY-30
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 19:45:47 +0000
Date: Wed, 20 Nov 2013 16:45:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: Regarding the l2-mtd branch in linux-next
Message-ID: <20131120194521.GB27064@localhost>
References: <20131120114654.GA26240@localhost>
 <20131120183417.GI9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131120183417.GI9468@ld-irv-0074.broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 20, 2013 at 10:34:17AM -0800, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Wed, Nov 20, 2013 at 08:46:55AM -0300, Ezequiel Garcia wrote:
> > Can you explain in detail the differences between l2-mtd/master and
> > l2-mtd/next?
> > 
> > I'm seeing linux-next merges the former, but instead maybe it should
> > be the latter?
> > 
> > What do you think?
> 
> I only created the l2-mtd.git 'next' branch recently because I don't
> think linux-next likes to see new stuff during the merge window that's
> not going into the current release cycle. So I just queued up stuff in a
> different branch temporarily, and I plan to bring it into 'master' on
> top of 3.13-rc1 once the merge window closes.
> 
> In answer to your second question, then, the inclusion of
> l2-mtd.git/master in linux-next is exactly as intended.
> 
> I am new at this whole maintainership thing, though, and I could be very
> wrong about the intended development process regarding linux-next and
> the merge window. I couldn't find much clear documentation regarding
> this process. I suppose it's something you learn over time. Any comments
> are welcome.
> 

Hm, I see. Well, I'm not an expert but the above sounds just about the
right thing to do.

Sorry for the noise!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
