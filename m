Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RyKp0-0006XN-Ag
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2012 10:13:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id 944E6167445
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2012 11:13:34 +0100 (CET)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id j+AMlP1laoaq for <linux-mtd@lists.infradead.org>;
 Fri, 17 Feb 2012 11:13:28 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by ra.se.axis.com (Postfix) with ESMTP id 6B1201672CB
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2012 11:13:28 +0100 (CET)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
 by seth.se.axis.com (Postfix) with ESMTP id 688E33E08A
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2012 11:13:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 q1HADS7D027907
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2012 11:13:28 +0100
Date: Fri, 17 Feb 2012 11:13:28 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: UBI/ubifs problem
In-Reply-To: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
Message-ID: <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Yesterday I reported a problem I had when flashing a ubifs volume.

On Thu, 16 Feb 2012, Ricard Wanderlof wrote:

> ...
> UBIFS error (pid 2965): validate_sb: bad superblock, error 8
> mount: Mounting ubi0:rwfs on /mnt/2 failed: Invalid argument
> ...

I think I've figured this out part way. I've been specifying a=20
--max-leb-count of 1000 to mkfs.ubifs, thinking that it basically just=20
sets a maximum size for the resulting file system. But it seems that it=20
also sets some sort of bounds for how much space it expects to take up in=
=20
the volume. If I reduce the --max-leb-count to the size of the target=20
volume, I get no errors and the file system mounts fine.

That being so, I think the resulting error message is odd, which indicates=
=20
there is a bug somewhere, probably in mkfs.ubifs ?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
