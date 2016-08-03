Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bV0SD-0000k6-Gb
 for linux-mtd@lists.infradead.org; Wed, 03 Aug 2016 17:59:47 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, gustavo@zacarias.com.ar,
 otavio@debian.org, riku.voipio@linaro.org, pascal.bleser@opensuse.org,
 mpluskal@suse.com, dwmw2@infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 5/5] Fix make_a_release script
Date: Wed,  3 Aug 2016 19:57:15 +0200
Message-Id: <20160803175715.1171-6-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20160803175715.1171-1-david.oberhollenzer@sigma-star.at>
References: <20160803175715.1171-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 configure.ac      |  4 +++-
 make_a_release.sh | 18 +++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/configure.ac b/configure.ac
index 8c5afad..6924b09 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,6 +1,8 @@
 AC_PREREQ([2.60])
 
-AC_INIT([mtd-utils], 1.5.2, [linux-mtd@lists.infradead.org], mtd-utils)
+m4_define([RELEASE], 1.5.2)
+
+AC_INIT([mtd-utils], [RELEASE], [linux-mtd@lists.infradead.org], mtd-utils)
 AC_CONFIG_MACRO_DIRS([m4])
 AM_INIT_AUTOMAKE([foreign subdir-objects dist-bzip2])
 AM_SILENT_RULES([yes])
diff --git a/make_a_release.sh b/make_a_release.sh
index c0b4807..1cf0f67 100755
--- a/make_a_release.sh
+++ b/make_a_release.sh
@@ -32,8 +32,8 @@ tag_name="v$new_ver"
 echo "$new_ver" | egrep -q -x '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' ||
         fatal "please, provide new version in X.Y.Z format"
 
-egrep -q -x 'VERSION = [[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' Makefile ||
-        fatal "Makefile does not contain \"Version = X.Y.Z\" line"
+egrep -q -x "m4_define\(\[RELEASE\], [0-9]+\.[0-9]+\.[0-9]+\)" configure.ac ||
+        fatal "configure.ac does not contain \"m4_define([RELEASE], X.Y.Z)\""
 
 # Make sure the git index is up-to-date
 [ -z "$(git status --porcelain)" ] || fatal "Git index is not up-to-date"
@@ -41,19 +41,23 @@ egrep -q -x 'VERSION = [[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' Makefile ||
 # Make sure the tag does not exist
 [ -z "$(git tag -l "$tag_name")" ] || fatal "Tag $tag_name already exists"
 
-# Change the version in the Makefile
-sed -i -e "s/^VERSION = [[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/VERSION = $new_ver/" Makefile
+# Change the version in the configure.ac
+sed -i -e "s/^m4_define(\[RELEASE\], [0-9]\+.[0-9]\+.[0-9]\+)/m4_define([RELEASE], $new_ver)/" configure.ac
 
 # And commit the change
-git commit -s -m "Release $release_name" Makefile
+git commit -s -m "Release $release_name" configure.ac
 
 # Create new signed tag
 echo "Signing tag $tag_name"
 git tag -m "$release_name" -s "$tag_name"
 
 # Prepare signed tarball
-git archive --format=tar --prefix="$release_name/" "$tag_name" | \
-        bzip2 > "$outdir/$release_name.tar.bz2"
+./autogen.sh
+./configure
+make dist-bzip2
+mkdir -p "$outdir"
+mv "$release_name.tar.bz2" "$outdir"
+
 echo "Signing the tarball"
 gpg -o "$outdir/$release_name.tar.bz2.asc" --detach-sign -a "$outdir/$release_name.tar.bz2"
 
-- 
2.9.0
