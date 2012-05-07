Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRJVR-0000zW-K5
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 08:41:23 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] make_a_release.sh: suggest announcement e-mail
Date: Mon,  7 May 2012 11:44:38 +0300
Message-Id: <1336380278-13532-1-git-send-email-dedekind1@gmail.com>
Cc: "Josh Boyer \(Fedora\)" <jwboyer@gmail.com>,
 "Riku Voipio \(Debian\)" <riku.voipio@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'make_a_release.sh' script appears to be extremely useful - I do not
forget things as I used to anymore (amending Makefile, signing, uploading
to the FTP server, etc). It is very useful that it suggest me exact commands
which I may just copy-past to my command line.

This patch improves the script and makes it suggest the e-mail announcement
which I may just copy-paste to my command line and the announcement will
be sent using 'git send-email' command. It will include all the interested
parties in CC.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 make_a_release.sh |   36 ++++++++++++++++++++++++++++++++++--
 1 files changed, 34 insertions(+), 2 deletions(-)

I am now CCing all the people who will be CCed during the announcement. I'll
send mtd-utils-1.5.0 announcement using this script shortly.

diff --git a/make_a_release.sh b/make_a_release.sh
index 460335b..44d67cc 100755
--- a/make_a_release.sh
+++ b/make_a_release.sh
@@ -57,10 +57,42 @@ git archive --format=tar --prefix="$release_name/" "$tag_name" | \
 echo "Signing the tarball"
 gpg -o "$outdir/$release_name.tar.bz2.asc" --detach-sign -a "$outdir/$release_name.tar.bz2"
 
-cat <<EOF
+scp_url="casper.infradead.org:/var/ftp/pub/mtd-utils"
+ftp_url="ftp://ftp.infradead.org/pub/mtd-utils"
+git_url="git://git.infradead.org/mtd-utils.git"
+
+cat <<EOF1
 Created $outdir/$release_name.tar.bz2
 Please, verify, then push the tag and upload the tarball and the signature
 You can use these commands:
+
+------------------------------------------------------------------------------
 git push origin master $tag_name
-scp $outdir/$release_name.tar.bz2 $outdir/$release_name.tar.bz2.asc casper.infradead.org:/var/ftp/pub/mtd-utils
+scp $outdir/$release_name.tar.bz2 $outdir/$release_name.tar.bz2.asc $scp_url
+------------------------------------------------------------------------------
+
+Please, send an announcement, below is the command you may run in your
+run. Substitute "me" with your e-mail address if needed, although it is
+cleaner to configure 'git send-email' to interpret 'me' as an alias for
+your name/email, see 'sendemail.aliasesfile' git configuration option.
+
+------------------------------------------------------------------------------
+mtd_tmpfile=\$(mktemp)
+
+cat > \$mtd_tmpfile <<EOF
+Subject: [ANNOUNCE] $release_name is released
+
+Hi,
+
+$release_name is released.
+
+Tarball:               $ftp_url/$release_name.tar.bz2
+Tarball gpg signature: $ftp_url/$release_name.tar.bz2.asc
+Signed git tag:        $git_url $tag_name
 EOF
+
+git send-email --from me --to 'MTL Mailing List <linux-mtd@lists.infradead.org>' --cc 'Peter Korsgaard (buildroot) <jacmet@sunsite.dk>' --cc 'Josh Boyer (Fedora) <jwboyer@gmail.com>' --cc 'Riku Voipio (Debian) <riku.voipio@linaro.org>' \$mtd_tmpfile
+
+rm \$mtd_tmpfile
+------------------------------------------------------------------------------
+EOF1
-- 
1.7.7.6
