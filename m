Received: from mx09.lb01.inode.at ([62.99.145.9] helo=mx.inode.at)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Urkic-00011z-5O
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2013 08:04:47 +0000
Received: from [83.64.51.210] (port=16376 helo=gateway1.hale)
 by smartmx-09.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.69) (envelope-from <helmut.raiger@hale.at>)
 id 1Urkhw-0005qO-7W
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2013 10:04:04 +0200
Received: from mail.hale (mail.hale [192.168.100.5])
 by gateway1.hale (8.13.8/8.13.7) with ESMTP id r5Q83gim001973
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2013 10:03:42 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.hale (Postfix) with ESMTP id 30A65662618
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2013 10:03:50 +0200 (CEST)
Received: from mail.hale ([127.0.0.1])
 by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXKVtPed5mcb for <linux-mtd@lists.infradead.org>;
 Wed, 26 Jun 2013 10:03:40 +0200 (CEST)
Received: from uni24.hale (uni24.hale [192.168.100.108])
 by mail.hale (Postfix) with ESMTPSA id D4B28662604
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2013 10:03:40 +0200 (CEST)
Message-ID: <51CAA03C.4050000@hale.at>
Date: Wed, 26 Jun 2013 10:03:08 +0200
From: Helmut Raiger <helmut.raiger@hale.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS: How to reserve space to be used right before power cut
References: <20130613135031.59037201@parrot.com>
 <1142745477.330790.1371130164128.JavaMail.root@mail.hale>
 <20130613162028.3d17bac2@parrot.com> <51BED0BE.2090701@hale.at>
In-Reply-To: <51BED0BE.2090701@hale.at>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/17/2013 11:02 AM, Helmut Raiger wrote:
> I digged the UBI sources and still have the feeling this won't work:
>
> 1) There seems to be no way to (long term) protect a PEB from being
> moved by the wear leveling sub-system (even scrubbing on bit-flips,
> which may be induced by read-disturbances (reads on nearby pages)).
>
> 2) Temporary protection of a PEB is not really time specific, but depends
> on global PEB erase action (i.e. anything UBIFS does on the same device),
> which is something I can't control.
>
> My impression is, that UBI simply does not support this sort of
> application well. Unmoveable blocks will have a low erase count
> (below average), which is exactly what the WL should avoid.
>
> However I've never timed such a move operation:
> a) move content to a new unused PEB
> b) schedule original PEB for erasure
> It might fit into my timing requirements, but will probably be heavily
> influenced by system load and priorities.
>
> Helmut

Just an update to 'enlight the world'. We are moving to YAFFS2, it has a
deterministic garbage collector which makes it a lot easier to implement
the requested behaviour.
It seems we can even take it off the shelf, currently we are perfomance
testing the write timing.

Helmut


--
Scanned by MailScanner.
