Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164Mnh-00083Q-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2001 13:43:30 +0000
Date: Thu, 15 Nov 2001 14:51:38 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Erwin Authried <eauth@softsys.co.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Simon Barber <simon@barber.net>,
        linux-mtd@lists.infradead.org
Subject: Re: Bug in mtdblock_ro
Message-ID: <20011115145138.A2078@wohnheim.fh-wedel.de>
References: <20011105172238.A10542@wohnheim.fh-wedel.de> <20011106133944.A1828@wohnheim.fh-wedel.de> <000201c16bc4$dae53120$7f01010a@instant802.com> <20011113125222.A2490@wohnheim.fh-wedel.de> <003d01c16c58$71c0d7f0$7f01010a@instant802.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <003d01c16c58$71c0d7f0$7f01010a@instant802.com>; from simon@barber.net on Tue, Nov 13, 2001 at 07:32:42AM -0800
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

>>> the call in mtdblock_request to MTD_READ/WRITE passes nr_sectors, it
>>> should pass current_nr_sectors.
>>
>> Could you quickly add, what version has this problem? The filename
>> should be enough. When I get back from vacation (Thursday), I will
>> have a look at it.
>
> I'm travelling right now - so I can't, sorry - but it's a version I checked
> out from the anon CVS a few days (maybe 10) ago. With this bug fix it works
> great for me. Without the fix I get a kernel panic on trying to mount a
> mtd_ro partition as rootfs.

Erwin, this appears to be your code, if MODULE_AUTHOR is correct. Can
you have a look at it?
And David, Erwin, do you mind if I indent the request function to
Linus' beloved style? Makes reading so much easier.

Jörn

-- 
Every good work of software starts by 
scratching a developer's personal itch.
