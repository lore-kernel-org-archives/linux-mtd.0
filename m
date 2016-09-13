Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjuVp-0002fh-Hj
 for linux-mtd@lists.infradead.org; Tue, 13 Sep 2016 20:41:02 +0000
Subject: Re: [PATCH 2/4] ubifs: Implement RENAME_WHITEOUT
To: kbuild test robot <lkp@intel.com>
References: <201609132243.x3CAincu%fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <435b3880-636c-4271-d885-ce949af2c5a1@nod.at>
Date: Tue, 13 Sep 2016 22:39:53 +0200
MIME-Version: 1.0
In-Reply-To: <201609132243.x3CAincu%fengguang.wu@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kbuild test robot,

On 13.09.2016 16:47, kbuild test robot wrote:
> Hi Richard,
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.8-rc6]
> [cannot apply to next-20160913]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
> 
> url:    https://github.com/0day-ci/linux/commits/Richard-Weinberger/ubifs-Implement-O_TMPFILE/20160913-222814
> config: x86_64-randconfig-x013-201637 (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>    fs/ubifs/dir.c: In function 'lock_4_inodes':
>>> fs/ubifs/dir.c:1041:53: error: 'WB_MUTEX_4' undeclared (first use in this function)
>       mutex_lock_nested(&ubifs_inode(inode4)->ui_mutex, WB_MUTEX_4);
>                                                         ^~~~~~~~~~
>    fs/ubifs/dir.c:1041:53: note: each undeclared identifier is reported only once for each function it appears in

whoops, forgot to stage this hunk:

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1e6673c..096035e 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -157,6 +157,7 @@ enum {
 	WB_MUTEX_1 = 0,
 	WB_MUTEX_2 = 1,
 	WB_MUTEX_3 = 2,
+	WB_MUTEX_4 = 3,
 };

 /*

Thanks,
//richard
