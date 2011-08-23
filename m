Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvk6L-00028D-1u
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 06:04:41 +0000
Received: by gxk2 with SMTP id 2so5091710gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 23:04:38 -0700 (PDT)
Subject: Re: [RFC 5/5] mtd: add MEMWRITEDATAOOB ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 09:06:26 +0300
In-Reply-To: <CAN8TOE9kZa5g9baQ63ojUYK7uqrwA9GEf_6oYz1S-kacZRq+5Q@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-6-git-send-email-computersforpeace@gmail.com>
	<1314003384.2644.85.camel@sauron>
	<CAN8TOE9kZa5g9baQ63ojUYK7uqrwA9GEf_6oYz1S-kacZRq+5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314079592.2645.57.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-22 at 17:04 -0700, Brian Norris wrote:
> > Let's add some reserved space for future improvements - I think it is
> > always a good idea to do for ioctls:
> >
> > + __u8 padding[8]
> 
> OK. Will consider for v2.

And add a comment that the user has to set them to 0. This way, when in
the future we want to use them, we'll know that 0 means "original"
behavior.

-- 
Best Regards,
Artem Bityutskiy
