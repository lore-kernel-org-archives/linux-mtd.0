Received: from gw1.transmode.se ([195.58.98.146])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QN6CU-0006Qd-62
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 16:35:50 +0000
In-Reply-To: <4DD4C41E.9020807@mvista.com>
References: <4DD4C41E.9020807@mvista.com>
Subject: Re: mtd: remove duplicate assignment of chip->state
To: Tadashi Abe <tabe@mvista.com>
Message-ID: <OFB5CFBF20.6BF8F558-ONC1257895.005B12A3-C1257895.005B2B15@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 19 May 2011 18:35:48 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Tadashi Abe <tabe@mvista.com>
>
> This is a trivial patch which removes unnecessary assignment of chip->state
> in put_chip(). It's duplicated.
>
> Signed-off-by: Tadashi Abe <tabe@mvista.com>

Looks good for cfi_cmdset_0001.c:

Acked-by: Joakim Tjernlund <joakim.tjernlund@transmode.se>
