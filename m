Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7rIK-0000Ao-Qr
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 15:38:53 +0000
Received: by pwi8 with SMTP id 8so1104084pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 08:38:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Thu, 7 Apr 2011 17:38:50 +0200
Message-ID: <BANLkTimf4kr+2_AaU3Eo3j=6Pu5e1KgJOA@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Frans,

On Thu, Apr 7, 2011 at 5:04 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> +static int compare(unsigned char *src, unsigned char *dst, ssize_t len)
> +{
> + =A0 =A0 =A0 int rv =3D 0;
> + =A0 =A0 =A0 unsigned long long *sp =3D (unsigned long long *)src;
> + =A0 =A0 =A0 unsigned long long *dp =3D (unsigned long long *)dst;
> +

Dangerous on platforms that do not support non-natural alignments (ARM is o=
ne).

Unless the alignment rules are enforced elsewhere?

Regards,

Leon.
