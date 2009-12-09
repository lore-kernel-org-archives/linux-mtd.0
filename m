Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIKCp-0006G8-1D
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 10:55:43 +0000
Subject: Re: UBIFS on kernel 2.6.24?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <200912091140.03345.david.jander@protonic.nl>
References: <200911231510.40294.david.jander@protonic.nl>
	<200912081745.03588.david.jander@protonic.nl>
	<1260348108.19669.1220.camel@localhost>
	<200912091140.03345.david.jander@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 12:55:09 +0200
Message-Id: <1260356109.19669.1289.camel@localhost>
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

On Wed, 2009-12-09 at 11:40 +0100, David Jander wrote:
> Back on topic:
> I have repeated the nand-tests on another board, and they ran just fine, 
> repeating for quite a while without any error, so I guess that proves that the 
> hardware and nand-driver are working reasonably well. OTOH, The two failed 
> systems, also were running for several months with very heavy flash-disk I/O 
> (not as much as to wear it out though, there's still roughly 40% free space on 
> the UBI volume). It has gone through installing ubuntu on it, and building 
> several debian packages from source, etc... all apparently without problems, 
> until one day 'ls -l /etc/' just failed.
> I will try to pull from ubifs-v2.6.24.git, but I'd like to know your opinion 
> on what the chances are that this update will fix the problem or bug that 
> caused this corruption?

I cannot tell for sure, it may.

What I can say for sure is that I personally is not very interested in
solving problems for too old UBIFS code-base. Well, problems I can
reproduce here, in my setup, are OK, but subtle problems which I cannot
reproduce here are not OK - I really want to be sure UBI/UBIFS are
up-to-date and this is not something we already fixed.

BTW, from now on 2.6.24 back-port support is dropped. But it is
up-to-date _now_ :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
