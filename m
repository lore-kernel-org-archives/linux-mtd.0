Received: from bobafett.staff.proxad.net ([213.228.1.121])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6J4e-0005ay-5F
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 09:26:36 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: mount options for jffs2
Date: Wed, 21 Sep 2011 11:26:09 +0200
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
In-Reply-To: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201109211126.09072.ffainelli@freebox.fr>
Cc: Folkert van Heusden <folkert.van.heusden@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wednesday 21 September 2011 11:19:18 Folkert van Heusden wrote:
> Hi,
> 
> While hunting a database (SQLite) corruption issue (on jffs2) I
> noticed that mount not only accepts barier=1 and data=journal but
> test123 and test456 as well.

This could rather be a bug in busybox (assuming you use it), which does not 
verify the various mount options provided. For instance, one also do the 
following: mount -o remount,rz / without getting an error from busybox's 
mount.

> So I was wondering what mount options are supported for jffs2? I use
> linux kernel version 2.6.19.
> Also: anyone got experience with sqlite on jffs2? If so: how did you
> solve these nasty corruptions?
> 
> 
> Folkert.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
