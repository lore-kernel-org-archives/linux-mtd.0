Received: from mail05b.webhosting-verizon.net ([209.238.3.61])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17K6cc-0003YH-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 01:13:22 +0100
From: "David Cooper" <david@forcedpotato.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>
Cc: "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000
Date: Mon, 17 Jun 2002 20:22:10 -0400
Message-ID: <AIEOIMKIOAAJKHJOGAEFMEDLCEAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.44.0206171830460.1415-100000@server.superbt.com>
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

Thanks for the tip.

I tried this but, of course, the screen goes blank, system hangs and I can
never look at the xinit.log file.

When I do a hard reboot, this file is gone.

Cheers,

David Cooper

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ilguiz Latypov
Sent: Monday, June 17, 2002 6:32 PM
To: David Cooper
Cc: Linux MTD
Subject: RE: X Windows Performance with DOC 2000



Will this line log anything meaningful?

   xinit > /tmp/xinit.log 2>&1

Ilguiz

On Mon, 17 Jun 2002, David Cooper wrote:

> Any other suggestions?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
