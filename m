Received: from py-out-1112.google.com ([64.233.166.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JG1th-0001wK-Dg
	for linux-mtd@lists.infradead.org; Sat, 19 Jan 2008 00:49:21 +0000
Received: by py-out-1112.google.com with SMTP id p76so2112573pyb.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 16:45:23 -0800 (PST)
Message-ID: <f383264b0801181645t73bd63f1ua9577309b05e36a9@mail.gmail.com>
Date: Fri, 18 Jan 2008 16:45:22 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Werner Almesberger" <werner@openmoko.org>
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
In-Reply-To: <20080117182634.GX14041@almesberger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080117182634.GX14041@almesberger.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jan 17, 2008 10:26 AM, Werner Almesberger <werner@openmoko.org> wrote:
> FYI, I've verified the S3C2410 ECC fix
> http://lists.infradead.org/pipermail/linux-mtd/2007-October/019586.html
> on the OpenMoko GTA01 (2410) and GTA02 (2442).
>
> For this, I've written a crude little program to tilt bits in Flash:
> http://svn.openmoko.org/developers/werner/nandtilt/

Great, thanks! That's useful.

Matt
