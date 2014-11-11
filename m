Received: from smtprelay0188.hostedemail.com ([216.40.44.188]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo6v7-0001L8-LP
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 08:35:26 +0000
Message-ID: <1415694886.16070.3.camel@perches.com>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
From: Joe Perches <joe@perches.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Tue, 11 Nov 2014 00:34:46 -0800
In-Reply-To: <5461C7C6.6060604@codeaurora.org>
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
 <5460F7D8.2030100@nod.at> <1415642273.8868.8.camel@perches.com>
 <5461C7C6.6060604@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-11-11 at 10:24 +0200, Tanya Brokhman wrote:
> On 11/10/2014 7:57 PM, Joe Perches wrote:
> > On Mon, 2014-11-10 at 18:37 +0100, Richard Weinberger wrote:
> >> Am 03.11.2014 um 14:58 schrieb Tanya Brokhman:
> >>> If there is more then one UBI device mounted, there is no way to
> >>> distinguish between messages from different UBI devices.
> >>> Add device number to all ubi layer message types.
> >
> > Adding "error" and "warning" to the message logs is
> > duplicative to the KERN_<LEVEL> logging information.
> >
> >>> Changes from V5:
> >>> 	- Added ptr verification @ ubi_err/ubi_msg/ubi_warn
> >>> 	Removed extra printing of ubi number
> >>> 	Removed new messages.
> >
> > Did you all ever look at what I posted?
> 
> I did. Its not my place to re-post your change in my patch. I personally 
> prefer it the way I've done it but it's just a matter of opinion and 
> personal preference.

Don't forget object code size.
