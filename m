Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DAQG-0006it-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 20:47:25 +0100
Message-ID: <3B325156.271EE3C4@daniel.com>
Date: Thu, 21 Jun 2001 14:56:06 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Tim Riker <Tim@Rikers.org>
CC: Herman Oosthuysen <Herman@WirelessNetworksInc.com>,
 	Abraham vd Merwe <abraham@2d3d.co.za>,
 	MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621155737.A26310@crystal.2d3d.co.za> <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com> <20010621163537.A26714@crystal.2d3d.co.za> <001a01c0fa64$7bb97840$1501a8c0@Herman> <3B3234DE.7497B63C@Rikers.org> <3B324E77.3A47AB4@daniel.com> <3B324C72.85BFF986@Rikers.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Tim Riker wrote:

> ok,
>
> what about reiserfs on CF then?
>

I have tested one *major* brand of IDE flash devices and 2 brands of CF
devices, in more than 20K power fail tests.

Both suffer from low level failures, which cause the IDE driver layer to "give
up" with
"unrecoverable errors". The CF is so bad that I just gve up on the testing
after a few hundred cycles.

The IDE flash was better, but not much.

Will raiserfs be happy if the underlying IDE /dev/hdxx driver returns
"unrecoverable error" from the IDE device?

Your call.

Vipin
