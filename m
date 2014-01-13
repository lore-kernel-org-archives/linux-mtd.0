Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2chK-0007bO-F8
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 08:16:38 +0000
Date: Mon, 13 Jan 2014 15:41:02 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140113074100.GA10266@shlinux2.ap.freescale.net>
References: <1389581697-28309-1-git-send-email-b32955@freescale.com>
 <CAGWqfiiRtRoT_qE4SjrkMDspxEWePRbX9krZxXM-TtVSxuhSLg@mail.gmail.com>
 <20140113065914.GA26113@shlinux2.ap.freescale.net>
 <CAGWqfiiZMaH1i9aTLQpqjMFnnXqi0xHoFquOLjZ_FNNYkg_AhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGWqfiiZMaH1i9aTLQpqjMFnnXqi0xHoFquOLjZ_FNNYkg_AhA@mail.gmail.com>
Cc: Vikram.Narayanan@in.bosch.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, bpringlemeir@nbsps.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 08:52:48AM +0100, Elie De Brauwer wrote:
> through the status. (Well to be honest the entire switching between chunks and
> pages confused me a lot on this monday morning, it could be me but when
> iterating over chunks, switching to pages and breaking out of the for
The more important reason is that read a page and check if it is an erased page
is more _strict_ then just read a chunk.

thanks
Huang Shijie
