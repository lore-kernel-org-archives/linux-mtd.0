Date: Tue, 10 Nov 2015 18:15:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/10] ARM MTD AFS v2 partition support
Message-ID: <20151111021549.GV12143@google.com>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

On Thu, Oct 15, 2015 at 03:08:43PM +0200, Linus Walleij wrote:
> Years ago, the ARM reference platforms moved away from the footer
> format parsed by the current AFS code in MTD. As far as I can
> tell this begun with the RealView reference designs (mach-realview)
> and the new format has been used in RealView, Versatile Express
> and recently the Juno Development platform (64bit).
> 
> The code has not been working for newer designs for a long time.
> Proper parsing of the flash image partitions is very helpful when
> you want to replace firmware when running full Linux and none of
> the boot monitors or boot loaders.
> 
> After this, AFS parsing will work on all ARM reference designs,
> or well, all I could test. I tested the Integrator/AP, RealView
> PB11MPCore and Juno Development Platform.
> 
> The first 9 patches basically refactors the current code to
> make the old partition format more encapsulated, while the last
> patch adds the new v2 format.

Pushed the first 4 to l2-mtd.git/next (for 4.5). I'll move them to
/master when the merge window closes.

I'm reviewing the rest, but I have some comments on patch 5.

Also, do you have a pointer that documents the v2 format? I can probably
find something myself, but I'm a bit lazy, and if you have something
easy to point me to, that'd save me some time :)

Regards,
Brian
