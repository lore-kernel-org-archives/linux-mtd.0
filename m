Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkASJ-0008EQ-8E
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 11:01:07 +0000
Message-ID: <1399978838.1797.35.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 13 May 2014 14:00:38 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3D17D4@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11F5@post.tritech.se>
 , <1397567532.4441.9.camel@karhu>
 <ED3E0BCACD909541BA94A34C4A164D4C5B3D17D4@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mats,

yes, I was a bit confused. But generally I do not immediately like this
patch is that it adds complexity to already complex, not very
well-structured and not very well-commented code.

And it adds another option, which means that the potential user will
have to think about using it or not.

On Tue, 2014-04-15 at 15:07 +0000, Mats Kärrman wrote:
> Both the "-p" and the "-P" options enable UBIFS power-cut tests. AfaIk there is no such thing for UBI (?).
> My problem is that I like to run the tests on my target platform that uses UBIFS as root FS.
> If I enable "power-cut" emulation globally (i.e. echo 1 > /sys/kernel/debug/ubifs/tst_recovery) this will
> enable "power-cuts" not only for the tested partition (good) but also for my root fs (bad).

OK, thanks for explaining.

> UBIFS gives the opportunity to also enable "power-cuts" for a specific UBI volume (e.g.
> echo 1 > /sys/kernel/debug/ubifs/ubi1_0/tst_recovery) but this only works until the UBI partition
> is reattached (the flag is initialized to 0).

Why wouldn't we have this to be the default, and the only way?

> What "-P" does differently from "-p" is that it re-enables the power-cut emulation for the used
> partition before continuing the test after a remount.

Do we really need 2 options for this test? May be we can just use per-FS
knob in the old option?

> It seems that the help-text of integck suggests that the power-cut test mode is available for
> any filesystem that is "able to emulate power-cuts" so the "(currently implemented for UBIFS only)"

Well, this was probably a mistake to add this comment, feel free to kill
it. This is ubifs-specific.

> is there because this is the only fs integck is (currently) able to reenable emulation for. ("-p"
> requires emulation to be enabled before launching integck which took me a while to figure out
> so this should perhaps also be written in the help text).

You are always welcome with a patch :-)

-- 
Best Regards,
Artem Bityutskiy
