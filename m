Received: from fk-out-0910.google.com ([209.85.128.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IKeKU-0007VC-Sw
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 14:07:53 -0400
Received: by fk-out-0910.google.com with SMTP id 19so2634468fkr
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Aug 2007 11:07:49 -0700 (PDT)
Message-ID: <46C09C23.8070906@googlemail.com>
Date: Mon, 13 Aug 2007 20:00:03 +0200
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [2/2] 2.6.23-rc3: known regressions with patches
References: <46C09B4D.6040907@googlemail.com>
In-Reply-To: <46C09B4D.6040907@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Dan Zwell <dzwell@gmail.com>, Tony Luck <tony.luck@intel.com>,
	Florian Lohoff <flo@rfc822.org>,
	linux-usb-devel@lists.sourceforge.net, Greg KH <gregkh@suse.de>,
	Jan Dittmer <jdi@l4x.org>, Ingo Molnar <mingo@elte.hu>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Netdev <netdev@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Thomas Renninger <trenn@suse.de>,
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
Cornelia Huck                          3
Jens Axboe                             3
Tejun Heo                              3



Modpost

Subject         : modpost bug breaks ia64 cross compilation
References      : http://lkml.org/lkml/2007/7/27/30
                  http://lkml.org/lkml/2007/7/27/418
Last known good : ?
Submitter       : Jan Dittmer <jdi@l4x.org>
Caused-By       : Thomas Renninger <trenn@suse.de>
                  commit 29b71a1ca74491fab9fed09e9d835d840d042690
Handled-By      : ?
Patch           : http://lkml.org/lkml/2007/8/2/211
Status          : patch was suggested



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

Subject         : sky2 boot crash in sky2_mac_intr
References      : http://lkml.org/lkml/2007/7/24/91
Last known good : ?
Submitter       : Florian Lohoff <flo@rfc822.org>
Caused-By       : 
Handled-By      : Stephen Hemminger <shemminger@osdl.org>
Patch           : http://marc.info/?l=linux-netdev&m=118651402523966&w=2
Status          : patch available



USB

Subject         : USB hard disk problem due to "usb-storage: implement autosuspend" patch
References      : http://lkml.org/lkml/2007/8/9/329
Last known good : ?
Submitter       : Dan Zwell <dzwell@gmail.com>
Caused-By       : Alan Stern <stern@rowland.harvard.edu>
                  commit 8dfe4b14869fd185ca25ee88b02ada58a3005eaf
Handled-By      : Alan Stern <stern@rowland.harvard.edu>
Status          : patch available



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/
