Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16siym-00047b-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 12:31:04 +0100
Received: from there ([172.22.2.25])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with SMTP id g33BV1w10862
	for <linux-mtd@lists.infradead.org>; Wed, 3 Apr 2002 13:31:01 +0200
Message-Id: <200204031131.g33BV1w10862@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: linux-mtd@lists.infradead.org
Subject: Re: probing two non-contiguous cfi flash and  a single partition
Date: Wed, 3 Apr 2002 12:32:17 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Am Samstag, 30. März 2002 15:48 schrieben Sie:
> Hi Robert,
> I read the mtd concatnate stuffs which seems to be made for concatnating
> different indedpendent CFI/no-cfi mtd devices. So basically in example
> file of sc520cdp.c, there are three probes for the three devices and then
> concatnating the two flash devices in one.
>
> But my problem seems to be somewhat different. See the follwoing diagrams -
>
>  _________
>
> |         |<--   First flash starts at 0xbf800000
> |
> |4MB      |
> |
> |
> |
> |_________|
>
>  _________
>
> | 640K    | <-- Second flash starts at 0xbfc00000
> |_________|     out of which first 640KB is needed
> |
> |         |     for boot loader.
> |
> | 3360K   |
> |_________|
>
> So there will be two probes for the two flashes. But now I want
> to keep the 640KB(for bootloader) of the second flash to be
> in first partition and the first flash and remaining portion of the second
> flash to be in second partition to be used for JFFS2 mounting.

The example in sc520cdp.c is a simple one, which is why I initially pointed
you at it. There is another example in dilnetpc.c which is more like what you
need, albeit a little more complicated. The idea in your case would be to
partition the second flash into two pieces: one for the 640KB part and one
for the rest. That will give you two MTD device objects corresponding to the
two sections in the second flash. You can then concatenate the second device
object (the one corresponding to the 3360K part) and the device object
corresponding to the first flash (4MB) into a single concatenated device that
will have 4MB + 3360KB size.

Rob


--
----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
