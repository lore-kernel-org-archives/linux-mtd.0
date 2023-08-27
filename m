Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43360C71153
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Aug 2023 01:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/40z6p1mjt0gg4LnIF7VXJAZY1VwXagcIchKsKEdHs=; b=g44H0eNU8dxhYi
	8/+TY9mQrQqi6rV2Kp6Hf1f6Q+PNpq3jLpHR6ZixTYswZXj02XQwicNuf2GdKh3mWB+4hknGS3h8p
	Kbp7ceS13W0QInimIVffDfAcSIwBfqWVGRjtgM7X+bL0nb1DsLTSClGkl/phS0YMOuBtKEKFnD/rz
	scb90TtE2OhUxMGdLmpjWM6cXZI5cuDf8XXn6B3Fja1462kffdqLcU4KJhoNB4eh+5ppp/gsuSg/J
	BMvd3einzLAo86BRKXb7SQY3iycJLSUS/Rp5Slkcf99b6/GfvE1GVEfxk0dQsFvMWgONstGaoMGbX
	Jv+jXlRVXVCr2xwjp0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4mi-007NSn-30;
	Sun, 27 Aug 2023 01:41:48 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4mg-007NST-0I
	for linux-mtd@lists.infradead.org;
	Sun, 27 Aug 2023 01:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693100506; x=1724636506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SwkzD2XXqz25xBQj7+Qw+0ndFDroxkcAVZksTk/82zE=;
  b=X2I18fwQ+NEEoKTQSJLVZqhl+lmRzyZBCaaeYnGzdUgn7qfTwcjjW/tU
   F/Iq8Vifym+QTg4zWzmPRi1Yb9300F5G7GOK2QX2SwDfZ18gv4wvIocBf
   HK1HjKgzQWjsm7j8hxqpBLM75XPtPrS8kYkzuolfMEirNK9OzfYAAWq8x
   whjWshXshuCioILcYRf5exOzPWe+3zrWTlvxSCMR3ZxFPr0kCoM+pl8vN
   LfRr9pLurAL+PLlQLsaLnnHwo9w3lchMk4q69h1Ghu05JpkPqdb06P847
   GN+P8wSbPyMkXgzJtws1o23LTzqNPAy64VR2ARe9G/ZeAGPr2nazyoeG4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="373790146"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="373790146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 18:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="687707446"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="687707446"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Aug 2023 18:41:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa4mT-0005GT-2s;
	Sun, 27 Aug 2023 01:41:33 +0000
Date: Sun, 27 Aug 2023 09:40:48 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 2/12] ubifs: Do not include crypto/algapi.h
Message-ID: <202308270908.Go1QPOZ7-lkp@intel.com>
References: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_184146_175435_5680C746 
X-CRM114-Status: GOOD (  16.37  )
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
config: x86_64-randconfig-r016-20230823 (https://download.01.org/0day-ci/archive/20230827/202308270908.Go1QPOZ7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270908.Go1QPOZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270908.Go1QPOZ7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ubifs/auth.c:12:0:
   include/linux/verification.h: In function 'system_keyring_id_check':
>> include/linux/verification.h:23:11: error: 'EINVAL' undeclared (first use in this function)
      return -EINVAL;
              ^~~~~~
   include/linux/verification.h:23:11: note: each undeclared identifier is reported only once for each function it appears in


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
