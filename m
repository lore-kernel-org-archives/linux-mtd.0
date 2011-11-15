Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQFPJ-0000hg-LW
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2011 09:34:22 +0000
Received: by wwe32 with SMTP id 32so3326161wwe.18
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2011 01:34:19 -0800 (PST)
Date: Tue, 15 Nov 2011 09:34:16 +0000
From: Jamie Iles <jamie@jamieiles.com>
To: Kassey Lee <kassey1216@gmail.com>
Subject: Re: non-pci version driver for denali NAND flash controller
Message-ID: <20111115093416.GA5954@totoro>
References: <CAKwPUox5fkNn-goKN=aAsJMa4KKLgr28MGWXNjG107SsDzeL-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwPUox5fkNn-goKN=aAsJMa4KKLgr28MGWXNjG107SsDzeL-Q@mail.gmail.com>
Cc: jamie@jamieiles.com, linux-mtd@lists.infradead.org,
 david.woodhouse@intel.com, yingang.li@intel.com, chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kassey,

On Tue, Nov 15, 2011 at 03:30:07PM +0800, Kassey Lee wrote:
> hi, David, Jamie:
> 
>      I found there is a PCI-VERSION denali NAND flash controller
> drivers/mtd/nand/denali.c.
>      is there any activities to add the support for NON-PCI version on ARM SoC ?
>      If no, I would like to add the NON-PCI version driver for Denali
> to have a try , which way is preferred and accepted by you?
> 
>     1) add  CONFIG_PCI  in denali.c
>     2) add a denali_pci.c to separate the common code.

I did attempt this a while back and have some patches in 
git://github.com/jamieiles/linux-2.6-ji.git (pc30xx branch) but David 
suggested that supporting device tree only 
(http://article.gmane.org/gmane.linux.drivers.mtd/35101) would be a 
better option and that makes sense to me.

Jamie
