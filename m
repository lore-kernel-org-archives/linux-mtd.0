Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTZjX-0004gq-1t
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:20:44 +0000
Received: by bwz1 with SMTP id 1so4682239bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 06:20:41 -0700 (PDT)
Subject: Re: [PATCHv2 2/6] nand/denali: annotate pci init/exit functions
	with correct section
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-3-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
	<1307097169-11744-3-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 16:16:24 +0300
Message-ID: <1307366184.3112.70.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 11:32 +0100, Jamie Iles wrote:
> The module init exit functions should be annotated with __init and
> __exit.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Would you please use "mtd: denali:" prefix?

I cannot apply this patch because it depends on the previous patch. You
could re-structure the code and make simpler patches like this go first,
then they could be taken quicker.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
