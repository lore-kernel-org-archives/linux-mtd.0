Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHxBh-0003tE-P4
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2013 14:06:52 +0000
Message-ID: <1363702041.14966.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH -next] UBIFS: fix missing unlock on error in
 ubifs_remount_rw()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Date: Tue, 19 Mar 2013 16:07:21 +0200
In-Reply-To: <CAPgLHd8Uj4-OWahuXSMxcb4Z3siukbveTm=bWNO1toatPwwcmg@mail.gmail.com>
References: <CAPgLHd8Uj4-OWahuXSMxcb4Z3siukbveTm=bWNO1toatPwwcmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-18 at 11:12 +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Add the missing unlock before return from function ubifs_remount_rw()
> in the error handling case.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Thanks, I fixed this up in linux-ubifs.git.

-- 
Best Regards,
Artem Bityutskiy
