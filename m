Received: from rv-out-0708.google.com ([209.85.198.249])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUy3B-0000jj-E5
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 06:49:27 +0000
Received: by rv-out-0708.google.com with SMTP id b17so110103rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Feb 2009 22:49:23 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 5 Feb 2009 15:49:23 +0900
Message-ID: <a5e2b64d0902042249k1c5ba5a3qce9d2f68f0523827@mail.gmail.com>
Subject: Issues with UBIFS xattr support
From: Tim <timasyk@gmail.com>
To: mtd <linux-mtd@lists.infradead.org>, Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found that UBIFS does not fully support xattr manipulation.

I use security context files labeling (in SELinux) that heavily relies
on proper manipulation of xattr by the filesystem.
And issues are:
- ubifs does not store xattr in inode for symbolic link files;
- if new file is created on ubifs, xattr should be automatically
updated with security context label, but it does not.

Maybe there is a patch that fixes those issues already?

Kindest regards,
Tim
