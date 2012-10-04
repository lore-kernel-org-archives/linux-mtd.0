Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJiz7-0002GQ-A4
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 10:48:54 +0000
Message-ID: <506D698E.6010704@nod.at>
Date: Thu, 04 Oct 2012 12:48:46 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd-www: Add fastmap doc
References: <1349191749-5247-1-git-send-email-richard@nod.at>
 <20121003201447.18ad7d2e@skate>
In-Reply-To: <20121003201447.18ad7d2e@skate>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas, Brian,

Thanks for your comments!
I'll send an updated version very soon.

On 03.10.2012 20:14, Thomas Petazzoni wrote:
> It would probably be good to explain what happens when
> fm_autoconvert=0. I guess that images are then not automatically
> converted, but then how does one creates a new image that has the
> fastmap feature built-in? I haven't followed the whole discussion, are
> changes to mtd-utils tools like ubinize planned?

Yeah, support for ubinize is planned.
But first kernel implementation has to be stable, tested (!) and accepted.
By putting fastmap into mainline we hope that many interested users test
fastmap in real world scenarios and give us feedback.

Thanks,
//richard
