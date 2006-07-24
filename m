Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G4y9z-0005eV-0g
	for linux-mtd@lists.infradead.org; Mon, 24 Jul 2006 06:59:45 -0400
Subject: Re: can I use vfat filesystem on UBI layer?
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: falls huang <falls.huang@gmail.com>
In-Reply-To: <49eab5c80607230204k53cde2adm9ef7290ce90e465f@mail.gmail.com>
References: <49eab5c80607230204k53cde2adm9ef7290ce90e465f@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 24 Jul 2006 14:59:07 +0400
Message-Id: <1153738747.16170.26.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-07-23 at 17:04 +0800, falls huang wrote:
> Hello!
> 
>    as title .

Hi,

UBI can be considered as a block device with a large (=eraseblock) block
size. But it is barely practical to use a block device with such a large
eraseblock size.

To have a good block device, one have to build one more software layer
over UBI - a kind of UBI translation layer (UTL). A sane UTL would have
a Garbage collector. Of course, it is easier to build such a layer over
UBI then over bare MTD device.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
