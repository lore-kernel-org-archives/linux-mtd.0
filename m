Received: from mail-bw0-f14.google.com ([209.85.218.14])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPKVc-0008Sg-MA
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 17:35:31 +0000
Received: by bwz7 with SMTP id 7so78282bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jan 2009 09:35:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1232361760.22350.25.camel@localhost.localdomain>
References: <200901071022.46343.corentincj@iksaif.net>
	<alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
	<71cd59b00901180924t4b61a22cw325b18789dd953b2@mail.gmail.com>
	<71cd59b00901190138n1e21a769lb6afc28b02c5fb75@mail.gmail.com>
	<1232359769.22350.24.camel@localhost.localdomain>
	<1232361760.22350.25.camel@localhost.localdomain>
Date: Tue, 20 Jan 2009 18:34:11 +0100
Message-ID: <71cd59b00901200934t141db76axcec187f20f35d4cf@mail.gmail.com>
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, thanks for your comments.
We'll do that and send the result next week.

On Mon, Jan 19, 2009 at 11:42 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Mon, 2009-01-19 at 12:09 +0200, Artem Bityutskiy wrote:
>> Hi,
>>
>> Some obvious things are commented below.
>>
>
> Err, and also do not forget to zap the CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
> from UBI Kconfig.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>



--=20
Corentin Chary
http://xf.iksaif.net
