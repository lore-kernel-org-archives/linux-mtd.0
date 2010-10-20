Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8dNL-0007Bh-1r
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 18:26:59 +0000
Received: by eye13 with SMTP id 13so265564eye.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Oct 2010 11:26:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4CBEF6BA.8080103@gmail.com>
References: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
	<1287557125-2672-2-git-send-email-computersforpeace@gmail.com>
	<AANLkTikXF5CV8SFOC5Ygzw4fNBvgzbifQK2eeH7D1bbM@mail.gmail.com>
	<4CBEF6BA.8080103@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 20 Oct 2010 14:26:36 -0400
Message-ID: <AANLkTi=Viw6b8hhTWRc+TjrrgGuUV8dGnULqmhD0cGLH@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd-utils: nanddump: add 64-bit support,
	utilize libmtd
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 20, 2010 at 10:03, Brian Norris wrote:
> but do you have specifics on what you meant?

this patch is titled "nanddump", so you shouldnt be modifying files
outside of nanddump.  nor should you be replacing a call to an ioctl()
with 0 without any comment whatsoever as to why.
-mike
