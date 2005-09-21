Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI7vt-0002q8-UI
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 12:59:13 -0400
Message-ID: <43319131.1080101@yandex.ru>
Date: Wed, 21 Sep 2005 20:58:25 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Andy Hawkins <a.hawkins@cabletime.com>
References: <003401c5becc$6795bf00$153335bf@cabletime.com>
In-Reply-To: <003401c5becc$6795bf00$153335bf@cabletime.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, support@mvista.com,
	linuxppc-embedded@ozlabs.org
Subject: Re: Slow read performance of NAND flash on PPC 405EP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy Hawkins wrote:
> Hi,
Hi Andy

> 
> We have a custom PPC-405EP based board, with a Samsumg 8Gbit flash
> (K9W8G08U1M) attached via EBC bank 2. When we read from this flash, we are
> only getting data rates of around 20 MBits/sec (this is using 'dd' to read
> direct from the linux /dev/mtd/x device). Our estimates show that the device
> should be capable of something like 100 MBits/sec.

Bah, 8Gbit! :-)

JFFS2 is not enough scalable to work with 8Gbit Flashes. The practical 
limit is about 1Gbit. I would suggest to forget about JFFS2 in your 
case. You will never feel comfortable with JFFS2 + 8Gbit flashes.

Try to make 500MB file and remount JFFS2, then open it. See how much 
time this will take. See how much memory will me used.

Also ypu may glance at the introduction chapters at 
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
