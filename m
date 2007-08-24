Received: from wr-out-0506.google.com ([64.233.184.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOd8E-0004Xo-A2
	for linux-mtd@lists.infradead.org; Fri, 24 Aug 2007 13:39:46 -0400
Received: by wr-out-0506.google.com with SMTP id c48so690744wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Aug 2007 10:39:34 -0700 (PDT)
Message-ID: <46CF17C2.9080501@googlemail.com>
Date: Fri, 24 Aug 2007 19:39:14 +0200
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [2/2] 2.6.23-rc3: known regressions with patches v3
References: <46CF1705.8060904@googlemail.com>
In-Reply-To: <46CF1705.8060904@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Florian Lohoff <flo@rfc822.org>, Netdev <netdev@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, "Daniel K." <daniel@cluded.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Ingo Molnar <mingo@elte.hu>,
	Stephen Hemminger <shemminger@osdl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Here is a list of some known regressions in 2.6.23-rc3
with patches available.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Andi Kleen                             5
Linus Torvalds                         5
Andrew Morton                          4
Al Viro                                3
Alan Stern                             3
Cornelia Huck                          3
Jens Axboe                             3
Tejun Heo                              3



MTD

Subject         : error: implicit declaration of function 'cfi_interleave'
References      : http://lkml.org/lkml/2007/8/6/272
Last known good : ?
Submitter       : Ingo Molnar <mingo@elte.hu>
Caused-By       : ?
Handled-By      : David Woodhouse <dwmw2@infradead.org>
Patch           : http://lkml.org/lkml/2007/8/9/586
Status          : patch available



Networking

Subject         : BUG: when using 'brctl stp'
References      : http://lkml.org/lkml/2007/8/10/441
Last known good : 2.6.23-rc1
Submitter       : Daniel K. <daniel@cluded.net>
Caused-By       : ?
Handled-By      : Stephen Hemminger <shemminger@osdl.org>
Status          : fix applied by David Miller

Subject         : sky2 boot crash in sky2_mac_intr
References      : http://lkml.org/lkml/2007/7/24/91
Last known good : ?
Submitter       : Florian Lohoff <flo@rfc822.org>
Caused-By       : 
Handled-By      : Stephen Hemminger <shemminger@osdl.org>
Patch           : http://marc.info/?l=linux-netdev&m=118651402523966&w=2
Status          : patch available



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/
