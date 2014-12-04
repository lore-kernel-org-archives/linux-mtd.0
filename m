Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwZOM-0007aB-46
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 16:36:34 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so35334253wiw.13
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 08:36:11 -0800 (PST)
MIME-Version: 1.0
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Thu, 4 Dec 2014 17:35:51 +0100
Message-ID: <CAF3KAoQMA+GHA-f_7Vy00MZwf1bPOBOv3AU_Kgg-G-JUHzDyzg@mail.gmail.com>
Subject: Extended Attribute support in mkfs.ubifs
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I am about to try to re-use and extend the patch
http://patchwork.ozlabs.org/patch/321572/ to support not SELinux
"security.selinux" extended attribute, but "security.capability" XATTR
name space.
As defined in https://github.com/torvalds/linux/blob/fd5984d7c8e8e249aca0c515817ab1e7dee1502c/include/uapi/linux/xattr.h

Maybe since it doesn't require to have SELinux on the test/build
machine it could be accepted? (if that was the reason for this patch
to be refused, which would be strange because SELinux can be present
but deactivated).

Does it seems feasible? Or am I on a wrong path?

Thanks

Bruno
