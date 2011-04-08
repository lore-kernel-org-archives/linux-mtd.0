Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8EQA-0001w7-DY
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 16:20:30 +0000
Received: by ywe9 with SMTP id 9so1601368ywe.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 09:20:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302275249-11962-1-git-send-email-dedekind1@gmail.com>
References: <1302275249-11962-1-git-send-email-dedekind1@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 8 Apr 2011 12:20:09 -0400
Message-ID: <BANLkTi=NSasDOP=xSxD3zxQNCQEOc1dV6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd-utils: improve simple_strtoX usage commentary
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 8, 2011 at 11:07, Artem Bityutskiy wrote:
> + * num =3D simple_strtoul(str, &error);
> + * if (error || !is_valid_number(num))
> + * =C2=A0 =C2=A0 error_happened();

when i read this, it makes me think there is a "is_valid_number()"
function i should be calling.

maybe something like:
if (error || ... number is out of range for your need ...)
-mike
