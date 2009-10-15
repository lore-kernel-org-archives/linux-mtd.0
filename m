Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MyWbj-00057K-Ls
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 20:07:38 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	n9FK7Sig011804 for <linux-mtd@lists.infradead.org>;
	Thu, 15 Oct 2009 13:07:29 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id n9FK7Tmx009280
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Oct 2009 15:07:29 -0500 (CDT)
Message-ID: <4AD7811A.6040501@freescale.com>
Date: Thu, 15 Oct 2009 15:07:54 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Felix Radensky <felix@embedded-sol.com>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com>	<4AD5C5B4.3060303@nokia.com>	<4AD5D053.9000901@embedded-sol.com>	<4AD5FFE7.7080703@nokia.com>
	<4AD60EF4.4080306@embedded-sol.com>
	<4AD614E4.6030005@freescale.com>
In-Reply-To: <4AD614E4.6030005@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Scott Wood wrote:
> Felix Radensky wrote:
>> Yes, NAND and NOR are on the same local bus controller.
>>
>> Maybe powerpc folks can provide some insight here.
>> Is it possible that simultaneous access to NOR and NAND
>> on MPC8536 can result in NAND timeouts ?
> 
> I've heard other reports of such problems with eLBC, but was unable to 
> reproduce it myself last time I tried.  Could you reduce this down to a 
> minimal set of specific reproduction instructions (e.g. eliminate UBI if 
> possible, or else explain how to set up UBI)?

OK, I was able to reproduce the problem on mpc8572 simply by sticking a 
read to NOR flash inside fsl_elbc_run_command -- I'm not sure what 
happened last time I tried.

I suppose we'll need a special NOR mapping driver that does some sync 
with the NAND driver.

-Scott
