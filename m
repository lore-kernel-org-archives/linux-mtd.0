Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UPBxR-0004bh-Da
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2013 13:18:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id A9A39261389
 for <linux-mtd@lists.infradead.org>; Mon,  8 Apr 2013 15:17:56 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id i3bluvy6vh77 for <linux-mtd@lists.infradead.org>;
 Mon,  8 Apr 2013 15:17:55 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by ra.se.axis.com (Postfix) with ESMTP id 8D93E2613B6
 for <linux-mtd@lists.infradead.org>; Mon,  8 Apr 2013 15:17:08 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by seth.se.axis.com (Postfix) with ESMTP id 8BA0D3E455
 for <linux-mtd@lists.infradead.org>; Mon,  8 Apr 2013 15:17:08 +0200 (CEST)
Date: Mon, 8 Apr 2013 15:17:08 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: UBI, udev and systemd
Message-ID: <alpine.DEB.2.00.1304081509460.10377@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I've got a problem when using systemd and UBI. The problem manifests 
itself as systemd waiting for a given UBI device to become ready so it can 
perform a mount operation listed in /etc/fstab.

More specifically, /etc/fstab contains a line of the form:

/dev/ubi0_25         /usr/local         ubifs      defaults           0 0

and /dev/ubi0_25 is created by the kernel when it attaches /dev/mtd2 to 
/dev/ubi0 . We use devtmpfs, and it can be seen that /dev/ubi0_25 appears 
just after devtmpfs is mounted.

However, when systemd then comes to mount /usr/local, it times out, 
claiming that /dev/ubi0_25 never becomes ready. Normally, the kernel 
would notify udev which in turn would notify systemd that the device 
exists.

The device node does exist, and ubinfo says the corresponding volume is 
present in /dev/ubi0.

(In the actual case, /dev/ubi0_25 is symlink and not a hard coded devices; 
however, I've crystalized the problem down to occurring also with hard 
coded device names to try and narrow it down).

I know this might be a more systemd-related issue, however, it seems that 
there might be something about the way UBI reports device state changes to 
udev etc, or that just someone using UBI and systemd on their system has 
had a similar problem and solved it.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
