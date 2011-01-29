Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PjElJ-0004Ye-GT
	for linux-mtd@lists.infradead.org; Sat, 29 Jan 2011 17:39:02 +0000
Received: by fxm19 with SMTP id 19so5009125fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Jan 2011 09:38:59 -0800 (PST)
Subject: Re: ubifs_scan() error handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTi==-biDcaFozVvkHUwXMYqMWk4=mbD16_TJ1JOO@mail.gmail.com>
References: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
	<1278995289.16634.126.camel@localhost>
	<1278995528.16634.129.camel@localhost>
	<AANLkTi==-biDcaFozVvkHUwXMYqMWk4=mbD16_TJ1JOO@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 29 Jan 2011 19:38:18 +0200
Message-ID: <1296322698.2400.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-01-28 at 12:13 -0500, twebb wrote:
> It's been awhile but I wanted to reopen the discussion on this topic.
> Could you take a look at this proposed patch?  Essentially this change
> results in the LEB being cleaned/recovered regardless of whether
> is_last_write() is true or not.  There may be a better way to do this
> earlier in the same function, but I'm not familiar enough with it to
> know the significance of the is_last_write() call.

But I think I explained why this check is there. Why exactly it does not
work for your flash? I think you need to get better understanding what
is happening in your case. I am reluctant to take this patch because it
is more of a band-aid but not a proper solution.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
