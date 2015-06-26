Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8Ors-0004Rq-Ng
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 08:20:13 +0000
Message-ID: <1435306788.9627.64.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Fri, 26 Jun 2015 11:19:48 +0300
In-Reply-To: <558D04B8.5050300@cn.fujitsu.com>
References: <1433831809.28854.17.camel@sauron.fi.intel.com>
 <55769D97.3010602@nod.at> <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
 <20150624003335.GG22807@dastard> <558BD010.6020207@cn.fujitsu.com>
 <1435226918.9627.14.camel@sauron.fi.intel.com>
 <558BD3B0.8080209@cn.fujitsu.com>
 <1435231689.9627.17.camel@sauron.fi.intel.com>
 <558CA82B.7050306@cn.fujitsu.com>
 <1435302083.9627.36.camel@sauron.fi.intel.com>
 <558CFB96.2000006@cn.fujitsu.com>
 <1435304624.9627.47.camel@sauron.fi.intel.com>
 <558D04B8.5050300@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Dave Chinner <david@fromorbit.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-06-26 at 15:52 +0800, Dongsheng Yang wrote:
> 
> Yes, it's only used in util-linux now. But do you think it's weird
> that:
> -o atime - no atime (we treat it as the default behavior)
> -o noatime - no atime

Yes, it is, and worse, this is inconsistent with other file-systems,
e.g., ext4. So I think I am convinced that with UBIFS_ATIME_SUPPORT
we'll end up with a better overall result.
