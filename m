Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQU8W-0002il-Jy
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 06:08:25 +0000
From: Fengguang Wu <fengguang.wu@intel.com>
To: LKP <lkp@eclists.intel.com>,
	Philip Li <philip.li@intel.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, peterpandong@micron.com,
 zszubbocsev@micron.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, beanhuo@micron.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 adrian.hunter@intel.com, dedekind1@gmail.com, richard@nod.at
Subject: [PATCH kernel-tests] kbuild: don't CC the list for BUILD DONE
 notifications
Date: Tue,  2 Feb 2016 14:07:59 +0800
Message-Id: <1454393279-31223-1-git-send-email-fengguang.wu@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[linux-review:Bean-Huo/Add-a-bakvol-module-in-UBI-layer-for-MLC-paired-page-power-loss-issue/20160202-104450] 2078d3920abf1d89be7eaf087100b4482dd532dc BUILD DONE

To: Bean Huo <jackyard88@gmail.com>
Cc: peterpandong@micron.com, zszubbocsev@micron.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, beanhuo@micron.com, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, adrian.hunter@intel.com, dedekind1@gmail.com, richard@nod.at

https://github.com/0day-ci/linux  Bean-Huo/Add-a-bakvol-module-in-UBI-layer-for-MLC-paired-page-power-loss-issue/20160202-104450
2078d3920abf1d89be7eaf087100b4482dd532dc  drivers:mtd:ubi: Kconfig Makefile

Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 lib/kbuild.sh | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/kbuild.sh b/lib/kbuild.sh
index 757aefb..bb879e5 100755
--- a/lib/kbuild.sh
+++ b/lib/kbuild.sh
@@ -5075,9 +5075,6 @@ email_header()
 			eval "$($LKP_SRC/bin/yaml-to-shell-vars $REVIEW_ROOT/$head_commit)"
 			echo "In-Reply-To: <$message_id>"
 			echo "TO: ${from//$'\n'/, }"
-			[[ $subject =~ (RFC|Re: |RE: ) ]] && return
-			echo "CC: ${to//$'\n'/, }"
-			echo "CC: ${cc//$'\n'/, }"
 		else
 			add_to "$(git_committer $head_commit)"
 		fi
-- 
2.7.0.rc3
