Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBWQ2-0002dN-Cs
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 07:15:09 -0500
Message-ID: <43FB0424.1020309@yandex.ru>
Date: Tue, 21 Feb 2006 15:14:28 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>, tglx@linutronix.de
References: <43EB96DC.3030900@eptar.com>	<200602210942.38302.manningc2@actrix.gen.nz>	<1140471467.2480.793.camel@localhost.localdomain>
	<200602211140.30069.manningc2@actrix.gen.nz>
In-Reply-To: <200602211140.30069.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>, Vitaly Wool <vwool@ru.mvista.com>,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> Sorry Thomas I don't buy that argument. If a system has a NAND device that 
> does have spare OOB available then it does have spare OOB and I can rely on 
> that. If a NAND chip is soldered to a board, and the system exposes the OOB  
> it is there. YAFFS (or whatever) can then be used on this device.

I understand Thomas's point as as he is fighting for generalization. 
Indeed, this OOB stuff introduces a lot of mess.

Charles' point is - if OOB is there, why not to let users use it? Also 
sounds reasonable.

What I think would be nice to do is to get rid of OOB in MTD stuff, but 
add a possibility to access OOB via some NAND-specific interfaces from 
nand_base. Indeed, if one wants to work with a generalized flash device 
- please use MTD interface. If one still wants to access OOB, use 
lower-layer NAND interfaces. That's all about to have more then one 
layer of Generalization. And I believe this is the right way to go.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
