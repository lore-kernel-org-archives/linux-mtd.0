Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ObCr4-0003s8-Kp
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 13:27:31 +0000
Received: by eyd10 with SMTP id 10so1499798eyd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2010 06:27:28 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] fix parallel build between ubi-utils and mkfs.ubifs
Date: Tue, 20 Jul 2010 15:24:39 +0200
References: <1279595201-16520-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1279595201-16520-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201007201524.39147.florian@openwrt.org>
Cc: Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tuesday 20 July 2010 05:06:41 Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  Makefile |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index b558705..8457654 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -9,6 +9,9 @@ endif
> 
>  SUBDIRS = lib ubi-utils mkfs.ubifs
> 
> +# mkfs.ubifs needs -lubi which is in ubi-utils/
> +subdirs_mkfs.ubifs_all: subdirs_ubi-utils_all
> +

Do not you want this to be moved after include common.mk instead?
I had a build error with your patch, the version below works for me.
--

--- a/Makefile  2010-01-15 18:12:24.000000000 +0100
+++ b/Makefile  2010-07-20 15:23:02.000000000 +0200
@@ -22,6 +22,9 @@
 
 include common.mk
 
+# mkfs.ubifs needs -lubi which is in ubi-utils/
+subdirs_mkfs.ubifs_all: subdirs_ubi-utils_all
+
 clean::
        -rm -f $(SYMLINKS)
 ifneq ($(BUILDDIR)/.git,)

--
Florian
