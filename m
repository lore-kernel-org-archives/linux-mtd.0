Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYDN6-00035M-VF
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 12:14:37 +0000
Message-ID: <1411906442.11836.24.camel@karhu>
Subject: Re: [PATCH] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Sun, 28 Sep 2014 15:14:02 +0300
In-Reply-To: <5427C046.5030608@nod.at>
References: <1411886185-7838-1-git-send-email-tlinder@codeaurora.org>
 <5427C046.5030608@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
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

On Sun, 2014-09-28 at 10:01 +0200, Richard Weinberger wrote:
> Tanya,
> 
> Am 28.09.2014 08:36, schrieb Tanya Brokhman:
> > If there is more then one UBI device mounted, there is no way to
> > distinguish between messages from different UBI devices.
> > Add device number to all ubi layer message types.
> > 
> > 
> > Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
> 
> Artem's mail is dedekind1@ not dedeking1@. :)

Yeah, it is not after a King named "Dede" :-) I just liked the Richard
Dedekind's theorem back in the University days :-)

> Anyway, instead of passing ubi->ubi_num down to every log function you can
> just pass the ubi object itself and let the log function access ->ubi_num.

Yes, then we potentially may add more than just the device number to the
messages, if we ever need.

-- 
Best Regards,
Artem Bityutskiy
