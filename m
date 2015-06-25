Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z85Kc-00020i-Dr
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 11:28:35 +0000
Message-ID: <1435231689.9627.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Thu, 25 Jun 2015 14:28:09 +0300
In-Reply-To: <558BD3B0.8080209@cn.fujitsu.com>
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

On Thu, 2015-06-25 at 18:10 +0800, Dongsheng Yang wrote:
>  > -o - default behavior (no atime)
>  > -o relatime - relative atime support
> 
> We would find both of them are MS_RELATIME set. But we
> want to do different thing in these cases. So I introduced
> the force_atime. Then:

Oh, do you know where exactly the default MS_RELATIME gets set? 
