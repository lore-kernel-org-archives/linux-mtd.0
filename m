Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7NpW-0001IJ-Sk
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 14:06:07 +0000
Subject: Re: [PATCH 04/13] ubi: Kill ubi->alc_mutex
To: linux-mtd@lists.infradead.org
References: <1464609874-15488-1-git-send-email-richard@nod.at>
 <1464609874-15488-5-git-send-email-richard@nod.at>
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <574C48B5.6070105@nod.at>
Date: Mon, 30 May 2016 16:05:41 +0200
MIME-Version: 1.0
In-Reply-To: <1464609874-15488-5-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.05.2016 um 14:04 schrieb Richard Weinberger:
> With our new work model work can never run in parallel.
> So, the serialization mutex is in vain
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Please ignore this patch. It shouldn't be part of this series.
I've dropped it already.

Thanks,
//richard
