Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbbBT-00049v-4e
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 16:30:44 +0000
Date: Tue, 28 Jun 2011 11:30:33 -0500
From: Scott Wood <scottwood@freescale.com>
To: Mike Hench <mhench@elutions.com>
Subject: Re: [PATCH 2/2] mtd/nand : workaround for Freescale FCM to
	supportlarge-page Nand chip
Message-ID: <20110628113033.5e71a8ed@schlenkerla.am.freescale.net>
In-Reply-To: <F87D23B7E1F84E4AB52E4FA4A55F85DC0262C53D@tpamail.elutions.com>
References: <1309225852-1664-2-git-send-email-b35362@freescale.com>
	<F87D23B7E1F84E4AB52E4FA4A55F85DC0262C53D@tpamail.elutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, b35362@freescale.com, linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Jun 2011 11:35:12 -0400
Mike Hench <mhench@elutions.com> wrote:

> 
> Any boot ideas ?
> Will the FCM load 2k and run it?

The 4K boot region will have to be split over pages 0 and 2 (2k view) or
the first half of pages 0 and 1 (4k view).

-Scott
