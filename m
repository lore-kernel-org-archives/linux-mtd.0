Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQzUT-0002Y7-SD
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 08:05:32 +0000
Message-ID: <4A5D8DE5.2070900@nokia.com>
Date: Wed, 15 Jul 2009 11:05:57 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: naveen yadav <yad.naveen@gmail.com>
Subject: Re: open command fails in UBIFS when pass O_DIRECT Flag
References: <9bde694e0907140725t66f5361dlc10c511081462eb2@mail.gmail.com>
In-Reply-To: <9bde694e0907140725t66f5361dlc10c511081462eb2@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

naveen yadav wrote:
> I am using UBIFS file system, and i am able to read/write.
> But when i use O_DIRECT flag it fails in open command. will you pls
> let me know is it issue with UBIFS.

UBIFS does not support direct I/O, sorry.
