Received: from mail4.cadvision.com ([207.228.64.49])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wlbL-0005la-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 15:35:19 +0100
Message-ID: <007601c15d64$9d3e40a0$1801a8c0@wirelessnetworksinc.com>
From: "Herman Oosthuysen" <Herman@WirelessNetworksInc.com>
To: "Ray Lehtiniemi" <rayl@otii.com>, <linux-mtd@lists.infradead.org>
References: <20011024231113.E15411@otii.com>
Subject: Re: intel J3 strataflash chip support
Date: Thu, 25 Oct 2001 08:52:05 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Howdy all,

Wireless Networks Inc. successfully ported the Intel VFM to uCLinux version
2.2.38 (We used a 28F320 chip).  We are in the process of setting up a deal
with Intel to reverse licence our mods back to them so they can distribute
it to Linux users.  It is a simple file system:
a. No sub-directories.
b. All files have the same time stamp and size of 0 (Linux doesn't care).
c. All files have the directory attribute set (Linux doesn't care).

Apart from that, it works.  Some adventurous soul can add the missing
features, but it is good enough for us as is.  Intel will have the code some
time soon.

Cheers,

Herman Oosthuysen
Herman@WirelessNetworksInc.com


----- Original Message -----
From: Ray Lehtiniemi <rayl@otii.com>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, October 24, 2001 11:11 PM
Subject: intel J3 strataflash chip support


>
> hi folks
>
> i'm evaluating intel's 28F320J3A device for use in an arm-linux
application.
> since it is CFI compliant, and from scanning the archives, i gather it is
> supported. (please! correct me if i'm wrong)
>
> the marketing kit for this part mentions a piece of software, VFM (virtual
> small block file manager).  there is a single reference to VFM in the
archives
> from early july 2001.  the poster mentioned running into some kind of
problems
> with 2.0.38, and buying the VFM code resolved things.
>
>
> if i'm using 2.4 kernel, is there any reason to spend time looking at VFM?
> could someone outline the differences between VFM and MTD+JFFS2?  any
success
> or failure stories with this device would also be welcome.
>
>
> thanks in advance
>
> --
> --------------------------------------------------------------------------
-
>     Ray Lehtiniemi <rayl@mail.com> <rayl@otii.com>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
