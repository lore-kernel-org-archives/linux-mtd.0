Received: from mx14.lb01.inode.at ([62.99.145.16] helo=mx.inode.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoVLy-00012e-B0
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 09:03:59 +0000
Received: from [83.64.51.210] (port=9644 helo=gateway1.hale)
 by smartmx-14.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.69) (envelope-from <helmut.raiger@hale.at>)
 id 1UoVLa-00059s-Ay
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 11:03:34 +0200
Received: from mail.hale (mail.hale [192.168.100.5])
 by gateway1.hale (8.13.8/8.13.7) with ESMTP id r5H93GwU027029
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2013 11:03:16 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.hale (Postfix) with ESMTP id 0B0F06624F6
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2013 11:03:23 +0200 (CEST)
Received: from mail.hale ([127.0.0.1])
 by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1ON1kH0AQlM for <linux-mtd@lists.infradead.org>;
 Mon, 17 Jun 2013 11:03:22 +0200 (CEST)
Received: from uni24.hale (uni24.hale [192.168.100.108])
 by mail.hale (Postfix) with ESMTPSA id 92B7E6624DC
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2013 11:03:22 +0200 (CEST)
Message-ID: <51BED0BE.2090701@hale.at>
Date: Mon, 17 Jun 2013 11:02:54 +0200
From: Helmut Raiger <helmut.raiger@hale.at>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS: How to reserve space to be used right before power cut
References: <20130613135031.59037201@parrot.com>
 <1142745477.330790.1371130164128.JavaMail.root@mail.hale>
 <20130613162028.3d17bac2@parrot.com>
In-Reply-To: <20130613162028.3d17bac2@parrot.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/13/2013 04:20 PM, Matthieu CASTET wrote:
> Not gluebi
>
> you have a userspace inferface to ubi : /usr/include/mtd/ubi-user.h
>
>
> You could create a small ubi volume (dynamic or static) of 1 LEB next to
> ubifs (on the same ubi device).
> When you start you make sure the LEB have enough space and that the LEB
> is mapped.
>
> on a power fail signal you write the LEB with your data. Because the
> LEB is already mapped, the write should be imediate.
>
>
> If the ubi volume is on the same ubi device than ubifs, the wear
> leveling will be shared with ubifs.
>

I digged the UBI sources and still have the feeling this won't work:

1) There seems to be no way to (long term) protect a PEB from being
moved by the wear leveling sub-system (even scrubbing on bit-flips,
which may be induced by read-disturbances (reads on nearby pages)).

2) Temporary protection of a PEB is not really time specific, but depends
on global PEB erase action (i.e. anything UBIFS does on the same device),
which is something I can't control.

My impression is, that UBI simply does not support this sort of
application well. Unmoveable blocks will have a low erase count
(below average), which is exactly what the WL should avoid.

However I've never timed such a move operation:
a) move content to a new unused PEB
b) schedule original PEB for erasure
It might fit into my timing requirements, but will probably be heavily
influenced by system load and priorities.

Helmut

--
Scanned by MailScanner.
