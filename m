Received: from bobafett.staff.proxad.net ([213.228.1.121])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Jkx-000756-EU
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 10:10:19 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: mount options for jffs2
Date: Wed, 21 Sep 2011 12:09:55 +0200
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
	<201109211126.09072.ffainelli@freebox.fr>
	<CAFDOyVAjcnNQ==b53NYk2NSV0Ku47Tx5epan8j94QgccG_i6pg@mail.gmail.com>
In-Reply-To: <CAFDOyVAjcnNQ==b53NYk2NSV0Ku47Tx5epan8j94QgccG_i6pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201109211209.55411.ffainelli@freebox.fr>
Cc: Folkert van Heusden <folkert.van.heusden@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 21 September 2011 11:40:36 Folkert van Heusden wrote:
> >> While hunting a database (SQLite) corruption issue (on jffs2) I
> >> noticed that mount not only accepts barier=1 and data=journal but
> >> test123 and test456 as well.
> > 
> > This could rather be a bug in busybox (assuming you use it), which does
> > not verify the various mount options provided. For instance, one also do
> > the following: mount -o remount,rz / without getting an error from
> > busybox's mount.
> 
> Ah ok.
> And do you know which options are supported?

Depends on which filesystems you have enabled, as well as which filesystem-
specific mount options are supported. Busybox is agnostic about this and tries 
to honor the mount options you provide it with, which does not mean it will 
succeed.
--
Florian
