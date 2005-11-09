Received: from zproxy.gmail.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZqD9-0005TZ-CK
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 08:42:03 -0500
Received: by zproxy.gmail.com with SMTP id i11so227712nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Nov 2005 05:41:56 -0800 (PST)
Message-ID: <625fc13d0511090541w5961eaeel70921ae94dc9ca79@mail.gmail.com>
Date: Wed, 9 Nov 2005 07:41:56 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Bernhard Priewasser <priewasser@gmail.com>
In-Reply-To: <4371F867.6060301@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <436A3949.1000001@gmail.com> <436A3BBD.5040405@yandex.ru>
	<436F4CD5.6030909@gmail.com> <4370B6DC.4070203@yandex.ru>
	<4371F867.6060301@gmail.com>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GC operation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/9/05, Bernhard Priewasser <priewasser@gmail.com> wrote:
>
> >> jffs2_erase_pending_blocks(), am I right? When is it called? I can onl=
y
> >> find it in jffs2_write_super() with count=3D0 and jffs2_find_nextblock=
()
> >> with count=3D1.
> > So, you've answered your question :-)
> I meant the way it is called by kupdated (which I don't know at all).

The kupdated thread wakes up every 5 seconds or so and calls
sync_supers, which will eventually call jffs2_write_super() and hence
jffs2_erase_pending_blocks is called.

josh
