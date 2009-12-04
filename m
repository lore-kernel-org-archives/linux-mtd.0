Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NGWV3-0000R2-6G
	for linux-mtd@lists.infradead.org; Fri, 04 Dec 2009 11:39:07 +0000
Message-ID: <4B18F4B7.9050709@nokia.com>
Date: Fri, 04 Dec 2009 13:38:31 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: twebb <taliaferro62@gmail.com>
Subject: Re: how to properly calculate max-leb-cnt and vol_size for ubifs
References: <dbdb2ea60912030930ncd06dcfjbb149545728fa5d6@mail.gmail.com>
In-Reply-To: <dbdb2ea60912030930ncd06dcfjbb149545728fa5d6@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

twebb wrote:
> I'm using ubifs for the first time and am confused about how to
> calculate two parameters:
> 
> "max-leb-cnt" for mkfs.ubifs
> "vol_size" for ubinize cfg file
> 
> How should "max-leb-cnt" be calculated?  In the examples, how is "-c
> 2047" determined?  Should the max-leb-cnt calculation somehow include
> the overhead calculated per the ubifs documentation page?  Should the
> reserved PEBs (1% default for NAND flash) be somehow taken into
> account?
> 
> How should "vol_size" be calculated?  Is it simply max-leb-cnt *
> LEB_size?  Should overhead somehow be included in this calculation
> also?

Have you read:

http://linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

http://linux-mtd.infradead.org/faq/ubi.html#L_ubi_mkimg

http://linux-mtd.infradead.org/doc/ubi.html#L_autoresize
