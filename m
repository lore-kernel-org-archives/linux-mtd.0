Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mljzf-0003Hr-4A
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 13:47:27 +0000
Message-ID: <4AA90351.3050000@nokia.com>
Date: Thu, 10 Sep 2009 16:46:57 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: JerinJacob <jerin.jacob@maxim-ic.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com>
In-Reply-To: <4AA8F6E4.1090209@maxim-ic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/10/2009 03:53 PM, ext JerinJacob wrote:
> Hi Artem,
>
> Thanks for the support.
> We are using 2.6.30.

Well, we still have many UBI/UBIFS patches in the ubifs-v2.6.30
tree and you are always encouraged to update:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

However, it does not look like we have any thing which would be
related to your problem.

Also, please, describe your flash. It looks like you have a
large NAND flash, is it SLC?

And finally, could you please try to reproduce this problem with
nandsim:
http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
