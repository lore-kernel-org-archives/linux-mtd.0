Received: from smtprelay0021.hostedemail.com ([216.40.44.21]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abSKk-0007zo-RP
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 12:26:32 +0000
Message-ID: <1457007958.4044.111.camel@perches.com>
Subject: Re: [PATCH V2] ubifs: Add logging functions for ubifs_msg,
 ubifs_err and ubifs_warn
From: Joe Perches <joe@perches.com>
To: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Adrian
 Hunter <adrian.hunter@intel.com>
Date: Thu, 03 Mar 2016 04:25:58 -0800
In-Reply-To: <1456994368.2169.28.camel@gmail.com>
References: <1456944509.4044.27.camel@nod.at>
 <1456945122.4044.35.camel@perches.com> <1456994368.2169.28.camel@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-03-03 at 10:39 +0200, Artem Bityutskiy wrote:
> On Wed, 2016-03-02 at 10:58 -0800, Joe Perches wrote:
> > 
> >  
> >  UBI FILE SYSTEM (UBIFS)
> > -M:	Artem Bityutskiy <dedekind1@gmail.com>
> > -M:	Adrian Hunter <adrian.hunter@intel.com>
> > +M:	Richard Weinberger <richard@nod.at>
> >  L:	linux-mtd@lists.infradead.org
> >  T:	git git://git.infradead.org/ubifs-2.6.git
> >  W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
> Hi Joe,
> 
> could please, re-send this patch with the following modifications:
> 
> 1. Put Richard's name first.
> 2. Do not remove mine and Adrian's name. We are not very active, but
> still useful.
> 
> Thanks!

Hello Artem.

It's not really for me to change Richard's maintainership.
It should be his sign-off, not mine.

My suggestion would be to add him and designate you and Adrian
as R: reviewers instead of M: maintainers like below.
---
 MAINTAINERS | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81302e4..61e17a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11266,8 +11266,9 @@ S:	Maintained
 F:	drivers/scsi/u14-34f.c
 
 UBI FILE SYSTEM (UBIFS)
-M:	Artem Bityutskiy <dedekind1@gmail.com>
-M:	Adrian Hunter <adrian.hunter@intel.com>
+M:	Richard Weinberger <richard@nod.at>
+R:	Artem Bityutskiy <dedekind1@gmail.com>
+R:	Adrian Hunter <adrian.hunter@intel.com>
 L:	linux-mtd@lists.infradead.org
 T:	git git://git.infradead.org/ubifs-2.6.git
 W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
@@ -11350,8 +11351,8 @@ F:	Documentation/scsi/ufs.txt
 F:	drivers/scsi/ufs/
 
 UNSORTED BLOCK IMAGES (UBI)
-M:	Artem Bityutskiy <dedekind1@gmail.com>
 M:	Richard Weinberger <richard@nod.at>
+R:	Artem Bityutskiy <dedekind1@gmail.com>
 W:	http://www.linux-mtd.infradead.org/
 L:	linux-mtd@lists.infradead.org
 T:	git git://git.infradead.org/ubifs-2.6.git
