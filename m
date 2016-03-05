Date: Fri, 4 Mar 2016 16:43:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: only use __xipram annotation when XIP_KERNEL is set
Message-ID: <20160305004336.GG55664@google.com>
References: <1453736525-1959191-2-git-send-email-arnd@arndb.de>
 <20160305000225.GB55664@google.com> <5158260.vK2YuWzYIn@wuerfel>
 <20160305002203.GF55664@google.com>
 <1457137718.43867.266.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457137718.43867.266.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 05, 2016 at 12:28:38AM +0000, David Woodhouse wrote:
> On Fri, 2016-03-04 at 16:22 -0800, Brian Norris wrote:
> > 
> > ...but, does anyone care about XIP / MTD_XIP then, if the first two
> > examples we have both have long-standing build issues?
> 
> I think there are people trying to make it work on other platforms,
> yes.

OK... can we kill the broken platforms though? I'm not confident that my
and Arnd's workaround attempts will yield anything more than a pat on
our own backs to say "yay, it compiles!" And given the number of
practically unused things we're already maintaining in MTD, I'm always
happy for an excuse to kill off some of it.

Brian
