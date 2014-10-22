Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrNX-0000vv-7n
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:34:47 +0000
Message-ID: <54476C0F.4050603@nod.at>
Date: Wed, 22 Oct 2014 10:34:23 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
 <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
 <54476785.5020603@nod.at> <544768A5.5000505@codeaurora.org>
In-Reply-To: <544768A5.5000505@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.10.2014 um 10:19 schrieb Tanya Brokhman:
> I care :) Its in my TODO to update ubinize to leave space for fastmap anchor (and perhaps generate a fastmap data as well but this is just a thought).

While talking about fastmap TODOs, here you can find my fastmap patch queue:
https://git.kernel.org/cgit/linux/kernel/git/rw/misc.git/log/?h=ubi-current

These patches are *not* ready for mainline, some of them need a rewrite
to meet all design goals of UBI. But maybe the one or other fixes an issue
which is on your TODO list. :-)

Thanks,
//richard
