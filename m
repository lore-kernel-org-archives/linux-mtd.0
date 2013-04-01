Received: from mail-gh0-f175.google.com ([209.85.160.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UMh3c-0000r4-Er
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2013 15:54:05 +0000
Received: by mail-gh0-f175.google.com with SMTP id f1so406196ghb.20
 for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2013 08:54:03 -0700 (PDT)
From: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: ubifs.fsck implementation
Message-Id: <A8854948-306F-4C37-9E98-CBAAC47FD943@aclimalabs.com>
Date: Mon, 1 Apr 2013 08:54:07 -0700
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good Morning Everyone,

Back in February of 2010 there was a mailing list thread discussing the =
implementation of ubifs.fsck.  =
(http://lists.infradead.org/pipermail/linux-mtd/2010-February/029017.html)=
  The thread discusses how a user space fsck application was not =
implemented and that a kernel '--recover' mount option would probably be =
more relevant.  At which point the thread died.

I am currently running into an issue where our NAND based ubifs =
filesystem is going read only after extended periods in the field.  The =
testing points to power-cuts as the probable cause.  We have made large =
steps towards minimizing the possibility of a power cut etc. but we =
can't help but think that a fsck/recovery tool would be extremely =
helpful in managing the situation.=20

That being said, I was hoping to gauge the external interest in =
developing such a tool/feature.  Additionally, if we could start a =
discussion around the best manner of implementation.

Thanks!

-Colin
--=20


Colin Foe-Parker
Software Engineer
           =20
ACLIMA INC
Direct 415 735 5062  |  Email colin.foeparker@aclimalabs.com
10 Lombard St. Suite 210  |  San Francisco, CA 94111
           =20
This email and any attachments may contain private, confidential and =
privileged material for the sole use of the intended recipient. If you =
are not the intended recipient, please immediately delete this email and =
any attachments.
