Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo9s5-0004Fp-Hr
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 11:44:30 +0000
Message-ID: <1415706244.22887.156.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Joe Perches <joe@perches.com>
Date: Tue, 11 Nov 2014 13:44:04 +0200
In-Reply-To: <1415642273.8868.8.camel@perches.com>
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
 <5460F7D8.2030100@nod.at> <1415642273.8868.8.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-11-10 at 09:57 -0800, Joe Perches wrote:
> On Mon, 2014-11-10 at 18:37 +0100, Richard Weinberger wrote:
> > Am 03.11.2014 um 14:58 schrieb Tanya Brokhman:
> > > If there is more then one UBI device mounted, there is no way to
> > > distinguish between messages from different UBI devices.
> > > Add device number to all ubi layer message types.
> 
> Adding "error" and "warning" to the message logs is
> duplicative to the KERN_<LEVEL> logging information.
> 
> > > Changes from V5:
> > > 	- Added ptr verification @ ubi_err/ubi_msg/ubi_warn
> > > 	Removed extra printing of ubi number
> > > 	Removed new messages.
> 
> Did you all ever look at what I posted?
> 
> https://lkml.org/lkml/2014/10/14/280
> 
> smaller code, consistent prefixing, consistent with
> typical kernel style, etc.

No, I did not, because Tanya is someone who actually using and
developing that stuff, and you are more of being on the watch for the
kernel in general. So naturally, I use my limited time to first check
her stuff. Sorry for this.

But Let me change small things in Tanya's patch first. The if you'd be
kind enough to implement your changes on top of that, that'd be perfect.

Artem.
