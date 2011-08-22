Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE009.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvWw1-00029S-3R
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 16:01:09 +0000
Message-ID: <4E527C91.6080009@freescale.com>
Date: Mon, 22 Aug 2011 10:58:09 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>		<4E4D452C.7050805@parrot.com>
	<4E4DD661.5080006@freescale.com>	 <4E4E2571.20409@parrot.com>
	<4E4EA70B.9050203@freescale.com> <1314010719.2644.114.camel@sauron>
In-Reply-To: <1314010719.2644.114.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	LiuShuo <b35362@freescale.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/22/2011 05:58 AM, Artem Bityutskiy wrote:
> On Fri, 2011-08-19 at 13:10 -0500, Scott Wood wrote:
>> On 08/19/2011 03:57 AM, Matthieu CASTET wrote:
>>> How the bad block marker are handled with this remapping ?
>>
>> It has to be migrated prior to first use (this needs to be documented,
>> and ideally a U-Boot command provided do do this), or else special
>> handling would be needed when building the BBT.  The only way around
>> this would be to do ECC in software, and do the buffering needed to let
>> MTD treat it as a 4K chip.
> 
> It really feels like a special hack which would better not go to
> mainline - am I the only one with such feeling? If yes, probably I am
> wrong...

While the implementation is (of necessity) a hack, the feature is
something that multiple people have been asking for (it's not a special
case for a specific user).  They say 2K chips are getting more difficult
to obtain.  It doesn't change anything for people using 512/2K chips,
and (in its current form) doesn't introduce significant complexity to
the driver.  I'm not sure how maintaining it out of tree would be a
better situation for anyone.

-Scott
