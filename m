Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDAxT-0007Vp-5l
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 07:39:19 +0000
Received: by ewy3 with SMTP id 3so135405ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Apr 2011 00:39:16 -0700 (PDT)
Subject: Re: JFFS2 loss of power expectations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Cliff Brake <cliff.brake@gmail.com>
In-Reply-To: <BANLkTi=b6XGamVPAfuQZJo=sRQy286xh0g@mail.gmail.com>
References: <BANLkTi=b6XGamVPAfuQZJo=sRQy286xh0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Apr 2011 10:36:21 +0300
Message-ID: <1303457781.2757.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2011-04-22 at 01:05 -0400, Cliff Brake wrote:
> I'm helping debug a system that is running the 2.6.27 kernel with
> JFFS2 (with summary) on SLC NAND.  The CPU is a PXA270 (cm-x270), and
> appears to be using NAND_ECC_SOFT.  We are experiencing some file
> system corruption if we lose power when the system is booting up.
> There is some amount of file system activity when udev and other
> system components start, but overall there is not much that is being
> written to the file system.
> 
> A few questions:
> 
> 1) should this combination be fairly robust to power failure (are
> failures expected, or possible)?

Probably, but you have to test this anyway.

1. Despite JFFS2 is considered old and robust - it is not maintained
very well for the last couple of years.
2. SLC NANDs in the past were more robust than modern SLCs and new
challenges like unstable bits may have changed the situation with JFFS2
robustness.

So - test it.

> 2) any suggestions for debugging this?

Some kind of device which may cut power is needed. Then you may write a
test program or script, cut power at random point, boot up, make sure
the FS look ok.

Or simply cut the power at random point between [0-N] seconds, then boot
up all the way to the end, check everything is ok, reboot, cut power,
etc.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
