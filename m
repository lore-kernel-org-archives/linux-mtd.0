Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qc1JU-0005ZI-7j
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 20:24:45 +0000
Received: by wwi14 with SMTP id 14so245439wwi.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 13:24:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309330748.23597.125.camel@sauron>
References: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
	<1309330748.23597.125.camel@sauron>
Date: Wed, 29 Jun 2011 13:24:36 -0700
Message-ID: <BANLkTi=-RbAx+gTUenA0gFgfTAWRMeds+w@mail.gmail.com>
Subject: Re: [PATCH 0/3] fixups for OOB ECC problems
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2011 at 11:59 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-06-28 at 16:28 -0700, Brian Norris wrote:
>> Now that we have added the possibility that mtd->read_oob returns
>> -EUCLEAN or -EBADMSG for corrected bitflips and for uncorrectable errors,
>> respectively, there are more pieces of code that need to take this into
>> account. These patches should address some of these by ignoring bitflips
>> when bit accuracy is not needed or by ignoring corrected errors when
>> scrubbing would be unnecessary.
>
> Do you test these things somehow? I'd just injected some code to a
> driver or nandsim which returns -EUCLEAN for OOB and check what fails.

Yes, I've done some testing.

Particularly, I was seeing a problem on boot-time BBM scan (scanning
each block's spare area for a bad block marker), since every ECC error
(correctable or uncorrectable) caused the scan to panic and quit. So
if there were any ECC problems on the whole device, our BBM scan would
fail and the device wouldn't be initialized. I tested this fix on this
particular BBM scan issue, and I've tested some other general OOB
injections and it looks good for now.

Brian
