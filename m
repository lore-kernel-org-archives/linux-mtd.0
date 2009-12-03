Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NG6CO-0005U2-Q9
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 07:34:05 +0000
Subject: Re: Looks like a UBIFS bug... - Solved
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <iwo@call-direct.com.au>
In-Reply-To: <4B17550A.7010409@call-direct.com.au>
References: <4B173CEB.5050103@call-direct.com.au>
	<4B173FC4.5020901@call-direct.com.au>
	<4B17550A.7010409@call-direct.com.au>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 03 Dec 2009 09:33:41 +0200
Message-Id: <1259825621.10805.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-12-03 at 17:04 +1100, Iwo Mergler wrote:
> Iwo Mergler wrote:
> > Iwo Mergler wrote:
> >> Hi all,
> >>
> >> I've got some weird UBIFS-related behaviour. I'd welcome
> >> any suggestions.
> >>
> 
> Turns out that the same script that was erasing the partition,
> creating ubifs, etc. was invoked a second time in the background.
> 
> I can't blame UBIFS for not surviving some random FLASH erasure
> during operation. :-)
> 
> Sorry about the noise.

Yeah, UBI has protection for this, i.e. you cannot write anything
directly to the UBI device if it is mounted. MTD devices do not have any
protection, and you can do arbitrary modifications while FS is mounted.
This is flexible, but more error prone.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
