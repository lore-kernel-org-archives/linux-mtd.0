Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PjDUN-00044e-Q3
	for linux-mtd@lists.infradead.org; Sat, 29 Jan 2011 16:17:28 +0000
Received: by fxm19 with SMTP id 19so4962116fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Jan 2011 08:17:25 -0800 (PST)
Subject: Re: Verify-after-write on sub-pages
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4D41949D.2030505@lambsys.com>
References: <4D41949D.2030505@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 29 Jan 2011 18:16:44 +0200
Message-ID: <1296317804.2400.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-01-27 at 09:51 -0600, David Lambert wrote:
> I am working on a project that requires high reliability of logged data 
> which is written to a UBI file system on NAND. I have observed one 
> hardware failure mode at elevated temperatures where some chips report 
> that a write was successful even though a subsequent read indicates that 
> this was not true. To mitigate this I enabled 
> CONFIG_MTD_NAND_VERIFY_WRITE. Unfortunately I found this does not work 
> on sub-pages which are used by UBI. As a workaround I have forced UBI 
> not to use sub-pages, but I was curious if either there were plans to 
> add this feature, or if anyone was working on implementing it?

Yes, CONFIG_MTD_NAND_VERIFY_WRITE is broken sub-pages for very long
time. I doubt anyone is fixing this, you have a chance to do this :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
