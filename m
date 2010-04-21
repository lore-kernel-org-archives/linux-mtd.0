Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4d1w-0005S0-T4
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 16:44:05 +0000
Received: by fg-out-1718.google.com with SMTP id e21so3773281fga.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Apr 2010 09:44:03 -0700 (PDT)
Subject: Re: Data read/write request length in UBIFS!!!
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali N <nalajala.murali@gmail.com>
In-Reply-To: <r2u630851df1004210932u61ea3cf8hb3a1372512855079@mail.gmail.com>
References: <r2u630851df1004210932u61ea3cf8hb3a1372512855079@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Apr 2010 19:42:43 +0300
Message-Id: <1271868163.11751.1398.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-04-21 at 22:02 +0530, Murali N wrote:
> Hi,
> I have few basic doubt on UBIFS/UBI.
> 
> At present i am seeing some 64 bytes read request coming while doing
> the "ubiattach" on one of the MTD partition.

Why is this a problem?

> What's the typical read/write length request that come's from the UBIFS?

It depends of what is being read. Sometimes these are few bytes (reading
LPT or a direntry), sometimes 1-2 pages (reading file data), sometimes
whole eraseblock (GC-ing).

> In a normal scenario read/write requests to flash would be multiple of
> flash page size? or it could be of any size?

Any size.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
