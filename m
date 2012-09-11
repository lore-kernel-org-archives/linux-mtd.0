Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBLcC-00053n-1x
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 08:14:36 +0000
Received: by lbbgf7 with SMTP id gf7so191842lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2012 01:14:33 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 11 Sep 2012 13:44:33 +0530
Message-ID: <CACVe6y2vgiypjvzMYdjBf+SBu9qiWcJrDst-UKe-jS3b=m8GVg@mail.gmail.com>
Subject: UBI : Pairing up PEB
From: VenuGopaL A <hivenu1@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am trying to speed up UBI. In FAQ section, they have mentioned about
merging two or more PEB's and treating them as one composite PEB .
I am not able to find any documentation over the net.

I tried changing the PEB size and LEB size during ubinizing the image
but the file system did not mount and the target crashed.

Please put some light on the pairing up of PEBs.
Target has 512MB OneNAND chip.

Appreciate your help.

-- 
Thanks & Regards
Venu
