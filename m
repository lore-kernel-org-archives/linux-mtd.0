Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE710-00009K-3s
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 14:34:54 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Vincent Sanders <vince@arm.linux.org.uk>
In-Reply-To: <20040415111537.GA25362@kyllikki.org>
References: <20040415111537.GA25362@kyllikki.org>
Content-Type: text/plain
Message-Id: <1082035618.8150.173.camel@tubarao>
Mime-Version: 1.0
Date: 15 Apr 2004 07:26:58 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Additional devices, jedec reset and dc21285 fixes
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-04-15 at 05:15, Vincent Sanders wrote:
> OK
> Here are a small series of patches (as discussed with dwmwmwmwmwmwmwmwm2 ;-) 
> 
> The first adds two SST devices to the jedec_probe (they use the SST
> page writing algor - patch to follow).

You are patching against an old version of jedec_probe.c.  It would be
good if all of your patches were against something more recent.

> The third is possibly the most contentious and most
> interesting...while playing with the various SST and MACRONIX devices
> on the footbridge systems (second patch) I have discovered the jedec
> reset sequence...doesnt reset anything but AMD/Intel devices with the
> short reset sequence! - please see the patch and comment and discuss
> as required.

The patch seems sane - I know that the devices I work with work either
way and so the patch shouldn't change anything (I haven't tried it,
though).  Hmmm - I wonder what Intel parts might do - it's been long
enough since I worked with one that I just can't remember.  I think
it'll work with those, too.

> As mentioned the SST devices above use a (currently) unimplemented
> command set - when its clean enough I shall submit the driver for this
> command set, it currently reads fine but writing seems to have issues
> (SST seem to have been on a differing planet inventing this one).

Not just that one - I have a list of SST chips and bugs as long as my
arm that are different than what the rest of the world does.  Yuck.

-- 
Thayne Harbaugh
Linux Networx
