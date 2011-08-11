Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QrMxQ-0006t9-M6
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2011 04:33:25 +0000
Received: by bke17 with SMTP id 17so847902bke.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Aug 2011 21:33:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1312925806-15929-6-git-send-email-computersforpeace@gmail.com>
References: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
	<1312925806-15929-6-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 11 Aug 2011 00:33:03 -0400
Message-ID: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mtdinfo: consolidate help as display_help()
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: brian.foster@maxim-ic.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 9, 2011 at 17:36, Brian Norris wrote:
> +static void display_help(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 printf(
> +"%1$s version %2$s - a tool to print MTD information.\n"

please properly indent
<tab>printf(
<tab><tab>"..........."
-mike
