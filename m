Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187S2S-0004WB-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 03:00:00 +0000
Date: Fri, 1 Nov 2002 04:30:07 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Pavel Roskin <proski@gnu.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Adding devices at runtime
Message-ID: <20021101033007.GA3738@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.44.0210312045360.17700-100000@marabou.research.att.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.44.0210312045360.17700-100000@marabou.research.att.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 31 October 2002 21:06:51 -0500, Pavel Roskin wrote:
> If I understand correctly, the MTD driver allows to define two devices in
> predefined memory areas - one using the CFI driver (CONFIG_MTD_PHYSMAP),
> the other using the MTDRAM driver (CONFIG_MTD_MTDRAM).
> 
> What if I want more MTD devices in the known memory areas?  Can I register
> them at runtime, when the kernel is loaded?  Is it possible to do it
> without using modules?  Can I do it without changing the kernel (I mean 
> something like "echo 200000 20000 2 >/proc/mtd").
> 
> I realize that the question is very basic, but my search for "add" and
> "register" in the HOWTO from CVS didn't bring any positive results.
> 
> Can it be that I want something wrong?  I simply want to boot from one
> flash device and be able to access (and possibly rewrite) that device and
> another device.  Both are supported by the JEDEC driver
> (CONFIG_MTD_JEDECPROBE), but they use different (not adjacent) memory
> areas.  (Of course I hacked drivers/mtd/maps/physmap.c to probe
> "jedec_probe", but I know that it's already done right in MTD CVS.)
> 
> Right now I have to use the MTDRAM driver on the boot device, so the I
> cannot rewrite it (I haven't tried, but I don't expect it to work).  I can
> only rewrite the other chip.

Could you be a little more verbose on what your problem is? What kind
of mtd devices do you have, what do you want to do with them, why
register one of them at runtime,...

Something really high level would be nice, too. "I want to run linux
on a d-box and write some data to a cf-card once a day.", something
like that.

It is possible to register devices at runtime. But I don't know of any
driver that gives you an interface to do so without insmod'ing it. A
question of some 50 lines of code to add that functionality.

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
