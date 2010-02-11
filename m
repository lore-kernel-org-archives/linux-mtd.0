Subject: Re: JFFS2 mount fail & crash on 2.4.26 kernel
From: David Woodhouse <dwmw2@infradead.org>
To: Amol Lad <amol.lad@gmail.com>
In-Reply-To: <8c675e9b1002111222ibfe32b6p4c513262a10ac518@mail.gmail.com>
References: <8c675e9b1002102157p33e4e7fg3239c62642bc008e@mail.gmail.com>
	<1265872946.2529.3770.camel@macbook.infradead.org>
	<8c675e9b1002111222ibfe32b6p4c513262a10ac518@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Feb 2010 20:33:52 +0000
Message-ID: <1265920432.2529.5500.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-12 at 09:22 +1300, Amol Lad wrote:
> Sorry for non giving enough information. The devices are in the field
> since last 5 years and never showed problems. (This shows the
> robustness of jffs2 fs). Recently only some devices are approaching
> 90% usage and this problem showed up....

OK, if it's really been in the field for 5 years then perhaps you're not
_quite_ as insane as I thought you were for using a 2.4 kernel -- so
maybe I was a little harsh in my initial response. But only a little --
even by 2005, deploying a 2.4 kernel was a strange thing to do.

Did you get a proper backtrace?

> It will be completely unfair to ask for any fix on such an old kernel.
> So any ideas on recovery will help before I push RED button (i.e. call
> the devices back to factory and re-flash jffs2 image..)
> 
> Do we have any tool like fsck that can be used for recovery? (I tried
> mounting the device after these errors and crash, but mount hangs and
> never returns. "ps" shows mount in "D" state)

Does this crash every time you mount the file system? That makes it nice
and simple, in some ways.

Can you take an image and try mounting it with a 2.6.3x kernel -- I
assume it'll be fine, but if it _does_ fail, then you magically get us
to care.

And if it does work, then you get to look through the commits between
then and now and work out how we fixed it...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
