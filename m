Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTy1k-0005Ht-Dh
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:17:09 +0000
Received: by fxm14 with SMTP id 14so4610456fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 08:17:06 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307430979.11104.50.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307430979.11104.50.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 11:16:46 -0400
Message-ID: <BANLkTinEya=-wOVrT-D_bQmF2jY857ijZA@mail.gmail.com>
Subject: Re: [PATCH 1/6] jffs2: make lzo optional at build time
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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

On Tue, Jun 7, 2011 at 03:16, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
>> +int jffs2_lzo_init(void)
>> +{
>> + =C2=A0 =C2=A0 return 0;
>> +}
>
> This function should return -1, I think, so that mkfs.jffs2 would fail
> if lzo was not compiled-in.

i didnt do that because the func is always called and i was afraid
that it'd prevent normal execution.  the runtime code should already
fail when lzo is requested because the compression routines are looked
up on the fly and when the requested compressor isnt found, it fails
at that time.  (at least that's my understanding of things)
-mike
