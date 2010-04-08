Received: from mail-qy0-f183.google.com ([209.85.221.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NzuE1-0007LK-Eb
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 16:05:02 +0000
Received: by qyk13 with SMTP id 13so2738972qyk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Apr 2010 09:04:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791001060558u362f17baj5ee90e9b4adb72a7@mail.gmail.com>
References: <ce9ab5791001060558u362f17baj5ee90e9b4adb72a7@mail.gmail.com>
Date: Thu, 8 Apr 2010 08:58:00 -0700
Message-ID: <l2v5e088bd91004080858ub5dd068ci711a5399098ba0ee@mail.gmail.com>
Subject: Re: [PATCH 0/3][NAND][OMAP]: fixing omap nand driver issues
From: Steve Sakoman <sakoman@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 6, 2010 at 5:58 AM, Vimal Singh <vimal.newwork@gmail.com> wrote=
:
> From 3700088e8da8c890d9e4c6eb626e18287d149b97 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Tue, 5 Jan 2010 16:43:08 +0530
> Subject: [PATCH] fixing omap nand driver issues
>
> fixing omap nand driver issues.
>
> Vimal Singh (3):
> =A0Fixing compilation warning for 'nand/omap2.c'
> =A0NAND: OMAP: correct 'info' pointer in 'omap_nand_remove'
> =A0NAND: OMAP: Fixing issue in oamp nand driver in prefetch mode read

What is the status of this patch series?

I've been testing them on Overo and Beagle and they do indeed solve
the prefetch issue.  So if they are queued waiting an ack:

Acked-by: Steve Sakoman <steve@sakoman.com>
