Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgW1F-0006yk-DL
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 09:46:21 +0000
Message-ID: <1413884755.7906.424.camel@sauron.fi.intel.com>
Subject: Re: bad node type after using ubiupdatevol
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Per Smitt <per.smitt@sbie.se>
Date: Tue, 21 Oct 2014 12:45:55 +0300
In-Reply-To: <1413882313759.52960@sbie.se>
References: <1413805882326.37838@sbie.se>
 ,<1413811808.7906.278.camel@sauron.fi.intel.com>
 <1413813476716.79473@sbie.se>
 ,<1413814665.7906.316.camel@sauron.fi.intel.com>
 <1413882313759.52960@sbie.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-10-21 at 09:05 +0000, Per Smitt wrote:
> > First of all, do you have fastmap enabled or disabled (check
> > your .config)
> 
> It is not at all in my config. I am running a Freescale i.MX28 yocto
> solution and it uses kernel 2.6.35.3.

Oh, it is so old. There might have been fixes since then. And I am not
sure how out-of-date the MTD tests are in this kernel.

Artem
