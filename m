Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTorE-00025C-Sk
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:29:41 +0000
Received: by eyh6 with SMTP id 6so1944114eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:29:38 -0700 (PDT)
Subject: Re: region info exposed via sysfs ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTi=EFZfoDAK7g-+8RMck5vneCOoKhA@mail.gmail.com>
References: <BANLkTi=EFZfoDAK7g-+8RMck5vneCOoKhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 08:25:21 +0300
Message-ID: <1307424321.11104.33.camel@localhost>
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

On Tue, 2011-06-07 at 01:24 -0400, Mike Frysinger wrote:
> i see that while MEMGETINFO and MEMGETREGIONCOUNT are accessible via
> sysfs, i cant find the equivalent for MEMGETREGIONINFO.  but i also
> dont have any devices here that have numeraseregions > 0 as both my
> physmap nor flashes and nand flashes all report numeraseregions == 0.
> 
> is it exposed via sysfs and i'm just not seeing it ?  or is this info
> only available via the ioctl ?

I think MEMGETREGIONINFO is not exposed via sysfs.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
