Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Egg3E-0000Lm-M8
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 05:16:04 -0500
Message-ID: <438AD8BF.8020905@yandex.ru>
Date: Mon, 28 Nov 2005 13:15:27 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>	<4386FC5F.9050305@yandex.ru>
	<4389AE3D.8000807@inf.u-szeged.hu> <4389B293.3020507@yandex.ru>
	<438A5023.4040503@inf.u-szeged.hu>
In-Reply-To: <438A5023.4040503@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> Be that as it may I have a NAND question, I think you know the answer 
> (NAND Guru Artem :) ):
> - if there is and erase block aready fulled, is there any possibility to 
> mark its pages as obsolated (individually)? Is it allowed to write to 
> OOB (or data) area one more? (or write OOB later than the data... or 
> similar trick?)

Yes, but this depends on NAND type. In the worst case, you may write at 
least once there. In case of some NANDs - more.

Note, JFFS2 writes clean marker to OOB area of the first page of a newly 
erased eraseblock. But it doesn't prohibit JFFS2 to write to this page 
later, and store ECC in OOB, even though this OOB already contains some 
data (the clean marker).


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
