Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYGv7-0007BT-QO
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 16:34:15 +0000
Message-ID: <5509A8EA.10201@nod.at>
Date: Wed, 18 Mar 2015 17:33:46 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, ricard.wanderlof@axis.com
Subject: Re: [PATCH 2/2] ubi-utils: ubinize: Add fastmap suport to image
 creation
References: <1426668763-6463-1-git-send-email-tlinder@codeaurora.org>
 <550951C9.2040509@nod.at> <550956D7.9030309@codeaurora.org>
 <55095E45.8030401@nod.at> <55096BA6.1030708@codeaurora.org>
 <55096D6D.5000707@nod.at> <5509725F.6050606@codeaurora.org>
In-Reply-To: <5509725F.6050606@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.03.2015 um 13:41 schrieb Tanya Brokhman:
> (thinking out-loud, trying not to reveal our flasher details)
> UBI aware flasher has to:
> 1. scan partition and collect ec values
> 2. for each PEB of the image: update the ec_header, erase PEB and flash the image
> 3. for remaining empty PEBs erase and write ec_heaser
> 
> For generating FM in flasher we need to update #2 and while flashing the image construct the FM data in memory. (what PEB, for what volume etc). this is O(1)
> 
> When we have the layout in memory we need to construct the actual FM data => go over all lists => O(number of dev PEBs) => probably can be neglected as well.
> 
> Ok, I take it back: run time wont be effected. What will be effected is memory consumption.

Yeah, but a smart flasher would of course not keep the whole image in memory.

> If I remember correctly, when we discussed this whole idea a while back you mentioned that a lot of users use their own proprietary flasher. So from your experience: you think
> users will prefer to have a libfastmap and not ubinize enhancement?
> Maybe implementing libfastmap to be added to any flasher isn't such a bad idea. Then the whole "ubi awareness" can be implemented there.
> I wasn't aware of the fact that ubinize is skipped. Is this common?

I've seen that more than once. Customers tend to use their own non-trivial tools. ;)
If we implement libfastmap ubinize could also use it (plus a big fat warning that you'll need a fastmap aware flasher).

Thanks,
//richard
