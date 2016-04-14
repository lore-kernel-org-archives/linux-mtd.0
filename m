Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqe7g-0008Ff-N1
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 10:03:43 +0000
Date: Thu, 14 Apr 2016 12:03:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
Message-ID: <20160414120319.02f5f859@bbrezillon>
In-Reply-To: <570F4AB1.2020600@samsung.com>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570E0506.4040705@samsung.com> <20160413203905.06371b4c@bbrezillon>
 <570F4AB1.2020600@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jacek,

On Thu, 14 Apr 2016 09:45:53 +0200
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> Hi Boris,
> 
> On 04/13/2016 08:39 PM, Boris Brezillon wrote:
> > Hi Jacek,
> >
> > On Wed, 13 Apr 2016 10:36:22 +0200
> > Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >
> >> Hi Ezequiel,
> >>
> >> Thanks for the update. From the previous discussion I've inferred
> >> that it has been agreed on the whole patch to go through the LED tree.
> >>
> >> Applied whole patch set to the for-next branch of linux-leds.git,
> >> with acks from Boris, then.
> >
> > Can you provide an immutable branch containing those changes?
> 
> No problem, I've created mtd-nand-trigger branch in the repository
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
> 

I've merged this branch into nand/next.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
