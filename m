Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvth7-0006J5-Lj
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 16:19:18 +0000
Received: by wyh11 with SMTP id 11so266438wyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 09:19:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314081097.2645.65.camel@sauron>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
	<1313773676-12879-11-git-send-email-computersforpeace@gmail.com>
	<1314081097.2645.65.camel@sauron>
Date: Tue, 23 Aug 2011 09:19:14 -0700
Message-ID: <CAN8TOE_N5AG3D_OpY+j+tLvPWpqbSyPxkQR0ihCzTtfZvc=VMA@mail.gmail.com>
Subject: Re: [PATCH 10/10] nanddump: kill usages of MEMSETOOBSEL ioctl
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 11:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Should we kill the macro definition from the kernel as well?

Probably. To be extra safe, we just may want to ensure that we don't
reuse its number.
