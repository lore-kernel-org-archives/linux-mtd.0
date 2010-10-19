Received: from mail.windriver.com ([147.11.1.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P814m-0002tI-R5
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2010 01:33:17 +0000
Message-ID: <4CBCF5C9.5070209@windriver.com>
Date: Tue, 19 Oct 2010 09:35:05 +0800
From: "tiejun.chen" <tiejun.chen@windriver.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/2] P4080/eLBC: Make Freescale elbc interrupt common
	to	elbc	devices
References: <1287386552-10647-1-git-send-email-tie-fei.zang@freescale.com>	<4CBC0B95.9010300@windriver.com>
	<20101018110631.22d6f081@udp111988uds.am.freescale.net>
In-Reply-To: <20101018110631.22d6f081@udp111988uds.am.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: B07421@freescale.com, dedekind1@gmail.com, B25806@freescale.com,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Scott Wood wrote:
> On Mon, 18 Oct 2010 16:55:49 +0800
> "tiejun.chen" <tiejun.chen@windriver.com> wrote:
> 
>> Looks you always iounmap(fsl_lbc_ctrl_dev->regs) on position 'err' but here
>> of_iomap() is already failed you should skip iounmap() fsl_lbc_ctrl_dev->regs
>> again. So you should improve that as the following on 'err', or layout 'err' in
>> gain.
>> ------
>> 	if(fsl_lbc_ctrl_dev->regs)
>> 		iounmap(fsl_lbc_ctrl_dev->regs);
>>
> 
> It looks like iounmap(NULL) is a no-op, just like kfree(NULL).
> 

Absolutely, I know what you mean :)

But I think we should take care of every line as one normal progress/rule. That
will make us understand easily, and maybe we also would benefit a little good
performance from those codes.

Tiejun

> -Scott
> 
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
> 
