Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6KMg-0007Xd-U7
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 10:49:19 +0000
Received: by gyg13 with SMTP id 13so1199593gyg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 03:49:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201109211209.55411.ffainelli@freebox.fr>
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
	<201109211126.09072.ffainelli@freebox.fr>
	<CAFDOyVAjcnNQ==b53NYk2NSV0Ku47Tx5epan8j94QgccG_i6pg@mail.gmail.com>
	<201109211209.55411.ffainelli@freebox.fr>
Date: Wed, 21 Sep 2011 12:49:17 +0200
Message-ID: <CAFDOyVCsjJdKiaj=70MtJ8nyOe0vbFjB0jw4vi-gKZpnLiWb+w@mail.gmail.com>
Subject: Re: mount options for jffs2
From: Folkert van Heusden <folkert.van.heusden@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> And do you know which mount-options are supported?
>
> Depends on which filesystems you have enabled, as well as which filesystem-
> specific mount options are supported. Busybox is agnostic about this and tries
> to honor the mount options you provide it with, which does not mean it will
> succeed.

I meant for jffs2 (I was redirected to this list for jffs2 talk).
