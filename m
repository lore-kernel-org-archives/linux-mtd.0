Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qboj1-000507-DZ
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:58:16 +0000
Received: by pvg20 with SMTP id 20so684074pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:58:12 -0700 (PDT)
Subject: Re: [PATCH 0/3] fixups for OOB ECC problems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 29 Jun 2011 09:59:04 +0300
In-Reply-To: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
References: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309330748.23597.125.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 16:28 -0700, Brian Norris wrote:
> Hello,
> 
> Now that we have added the possibility that mtd->read_oob returns
> -EUCLEAN or -EBADMSG for corrected bitflips and for uncorrectable errors,
> respectively, there are more pieces of code that need to take this into
> account. These patches should address some of these by ignoring bitflips
> when bit accuracy is not needed or by ignoring corrected errors when
> scrubbing would be unnecessary.
> 
> There are still other cases to address, for example, some flash-based BBT
> code.
> 
> This applies on top of l2-mtd-2.6.git. Patch 3 is an amendment to commit
> abf386c475beab813dc9b3366e592e00255e987a, ("mtd: nand: handle ECC errors
> in OOB"), so it can be squashed in if you want. Let me know if you want
> me to do this and do a resend.

Do you test these things somehow? I'd just injected some code to a
driver or nandsim which returns -EUCLEAN for OOB and check what fails.

-- 
Best Regards,
Artem Bityutskiy
