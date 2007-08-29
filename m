Received: from nf-out-0910.google.com ([64.233.182.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQPTm-00084G-7g
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 11:29:21 -0400
Received: by nf-out-0910.google.com with SMTP id h3so188479nfh
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 08:29:07 -0700 (PDT)
Message-ID: <46D59099.8000709@googlemail.com>
Date: Wed, 29 Aug 2007 17:28:25 +0200
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [2/2] 2.6.23-rc3: known regressions with patches
References: <46D58F89.4010108@googlemail.com>
In-Reply-To: <46D58F89.4010108@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Florian Lohoff <flo@rfc822.org>, Netdev <netdev@vger.kernel.org>,
	Ingo Molnar <mingo@elte.hu>, Trond Myklebust <Trond.Myklebust@netapp.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Christian Casteyde <casteyde.christian@free.fr>,
	Harry Edmon <harry@atmos.washington.edu>,
	Florin Iucha <florin@iucha.net>, nfs@lists.sourceforge.net,
	"Daniel K." <daniel@cluded.net>, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Bret Towe <magnade@gmail.com>,
	Stephen Hemminger <shemminger@osdl.org>,
	Pierre Ossman <drzeus-mmc@drzeus.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Here is a list of some known regressions in 2.6.23-rc4
with patches available.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Andi Kleen                             5
Linus Torvalds                         5
Andrew Morton                          4
Hugh Dickins                           4
Al Viro                                3
Alan Stern                             3
Cornelia Huck                          3
Jens Axboe                             3
Tejun Heo                              3



FS

Subject         : NFSv4 client OOPS
References      : http://lkml.org/lkml/2007/8/28/207
Last known good : ?
Submitter       : Harry Edmon <harry@atmos.washington.edu>
Caused-By       : ?
Handled-By      : Trond Myklebust <Trond.Myklebust@netapp.com>
Patch           : http://lkml.org/lkml/2007/8/28/204
Status          : patch available

Subject         : nfs4 hang/NFS woes again
                  (was USB-related oops in sysfs with linux v2.6.23-rc3-50-g28e8351)
References      : http://lkml.org/lkml/2007/8/15/144
                  http://lkml.org/lkml/2007/8/22/484
                  http://lkml.org/lkml/2007/8/23/134
Last known good : ?
Submitter       : Florin Iucha <florin@iucha.net>
                  Bret Towe <magnade@gmail.com>
Caused-By       : Trond Myklebust <Trond.Myklebust@netapp.com>
                  commit 3d39c691ff486142dd9aaeac12f553f4476b7a62
Handled-By      : Trond Myklebust <Trond.Myklebust@netapp.com>
Patch           : http://lkml.org/lkml/2007/8/28/119
Status          : patch available



MMC

Subject         : Unable to access memory card reader anymore
References      : http://bugzilla.kernel.org/show_bug.cgi?id=8885
Last known good : ?
Submitter       : Christian Casteyde <casteyde.christian@free.fr>
Caused-By       : ?
Handled-By      : Alan Stern <stern@rowland.harvard.edu>
Patch           : http://bugzilla.kernel.org/attachment.cgi?id=12438
Status          : patch available



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
