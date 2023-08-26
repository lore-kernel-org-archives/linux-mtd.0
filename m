Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D877C83F11
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CcYILR90poV1f9RMced9+eXW12Kq3Et6eogquZaayQ=; b=pkdqDxLt0TGiNz
	ceW1aEi2pJIe1qPUZOs2m/POwiMhkIq3X6W7leRUTJN8bDq+3uOdWX1UaVQvzy8+J1YBcCXRg2sQ4
	mRMKaZczp9wC3HLTO8edxX0ZyoXOUDor47GGUJ5//h3aAOBsTQbaLyHADzAu6C5NBoJd6rGkVy955
	4TWhd1Nii8B8TwAaJOb5TOGD5ET+4MzkQ90vJ6/6Mbj0VSgW86890xysYCpCCcOSFSMY//L/ouhns
	jAG0MxaEXGYoQZ5j9CEhkQ4dK03WzhrxrZNYqUUC5jHO8cLjn0nyD/mrHHvSXF+lj1Xfrv9fQlsLs
	8dVbkWPxnix928KfMbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZnGn-006WSp-2a;
	Sat, 26 Aug 2023 06:59:41 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZnGh-006WRk-1M
	for linux-mtd@lists.infradead.org;
	Sat, 26 Aug 2023 06:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693033175; x=1724569175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8m7G2/O7JyDUFzbF1iO3H8x210d51lOyDfQC7OxdN/g=;
  b=oJXSBrzAlI8IM5EnwtXjycnPTJkO1Q2o2rVMJmdKZ0s8wC4UvpCkgkkm
   5HqFWKYXkErAsWd+7AgGI/zYe5q9YK+rvXWN6O5WRAAgeBYIUPlES9YcO
   h45WnCQox1r01JvPyS1ZlQNYXufcaVuMTLyngBqTaTAZB1Dd4g7QyBT1X
   qqi14TiwF9BwPtOHe+TtbHoilcF7lUF/w+7hfKdo+5yVU4jKGYr7Wls6u
   OLRDlLuaAbZ0QNftbYWgvTGbxOZg21qMf38+UbNPVPnVdByA2vDGk+hiZ
   o83IlSMjF3K35/FGuqVOWwCYKn/kvK6GuVdMNQB2OBerPCD6xzc4Y8nL2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373728852"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="373728852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 23:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861291303"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="861291303"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 23:59:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZnGU-0004RR-1I;
	Sat, 26 Aug 2023 06:59:22 +0000
Date: Sat, 26 Aug 2023 14:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y.Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	ceph-devel@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Matthieu Baerts <matthieu.baerts@tessares.net>,
	Mat Martineau <martineau@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>,
	linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	linux-inte@web.codeaurora.org, grity@vger.kernel.org,
	"Jason A.Donenfeld" <Jason@zx2c4.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/12] ubifs: Do not include crypto/algapi.h
Message-ID: <202308261414.HKw1Mrip-lkp@intel.com>
References: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_235935_530227_0EE9285B 
X-CRM114-Status: GOOD (  12.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Herbert,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master rw-ubifs/next rw-ubifs/fixes v6.5-rc7 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/fscrypt-Do-not-include-crypto-algapi-h/20230823-183716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/E1qYl9s-006vDm-IW%40formenos.hmeau.com
patch subject: [PATCH 2/12] ubifs: Do not include crypto/algapi.h
config: x86_64-randconfig-075-20230823 (https://download.01.org/0day-ci/archive/20230826/202308261414.HKw1Mrip-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261414.HKw1Mrip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261414.HKw1Mrip-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ubifs/auth.c:12:
>> include/linux/verification.h:23:11: error: use of undeclared identifier 'EINVAL'
                   return -EINVAL;
                           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/auth.c:18:
   In file included from fs/ubifs/ubifs.h:16:


vim +/EINVAL +23 include/linux/verification.h

817aef260037f3 Yannik Sembritzki 2018-08-16  19  
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  20  static inline int system_keyring_id_check(u64 id)
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  21  {
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  22  	if (id > (unsigned long)VERIFY_USE_PLATFORM_KEYRING)
f3cf4134c5c6c4 Roberto Sassu     2022-09-20 @23  		return -EINVAL;
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  24  
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  25  	return 0;
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  26  }
f3cf4134c5c6c4 Roberto Sassu     2022-09-20  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
